From: Akshay Bhat <akshay.bhat@timesys.com>
Date: Sat, 28 Mar 2020 11:58:27 -0400
Subject: [Buildroot] [PATCH 1/1] package/lz4: annotate CVE-2014-4715
In-Reply-To: <CACrMeVCfVxi3BEUq5EgXV=OMF+36HtT6sDqwG=D8qMCD_Cs3GA@mail.gmail.com>
References: <20200328095138.959798-1-fontaine.fabrice@gmail.com>
 <20200328150827.64a9f714@windsurf.home>
 <CACrMeVCfVxi3BEUq5EgXV=OMF+36HtT6sDqwG=D8qMCD_Cs3GA@mail.gmail.com>
Message-ID: <CACrMeVAPvcafRDwNsDFcrgk2q_6hg08viDMH-8GFuZFT64P7TQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Mar 28, 2020 at 11:07 AM Akshay Bhat <akshay.bhat@timesys.com> wrote:
>
> Hi Thomas,
>
> On Sat, Mar 28, 2020 at 10:08 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > So I've applied this patch, but what can we do to fix this properly?
> > The NVD database says that versions < r118 are affected, but of course
> > with the project having changed its numbering scheme (current version
> > is 1.9.2), making comparisons is difficult.
> >
> > Indeed, after r131, the next version was v1.7.3. Can we ask the NVD
> > maintainers to indicate that versions earlier than v1.7.3 are
> > vulnerable ?
>
> Interesting case! The fix has been there since r118 (including).
> (Expand the tags in the github link:
> https://github.com/lz4/lz4/commit/140e6e72ddb6fc5f7cd28ce0c8ec3812ef4a9c08)
>
> Thankfully CVE-2014-4715 is the only CVE using the old version scheme.
> So the 2 easy options are:
> 1. Live with the patch from Fabrice for ignore CVEs since we don't
> expect this list to grow (OR)
> 2. Since there are only 2 tagged releases before r118, ask NVD to
> change the affected version:
>
> From
> cpe:2.3:a:yann_collet:lz4:*:*:*:*:*:*:*:*  Up to (including) r118
> To
> cpe:2.3:a:yann_collet:lz4:r116:*:*:*:*:*:*:*
> cpe:2.3:a:yann_collet:lz4:r117:*:*:*:*:*:*:*

Hmm digging deeper the first release is r105, looks like all the tags
were not carried over to github when it was migrated!
https://fossies.org/linux/lz4/NEWS

So if we were to ask NVD to update the versions then we have to list
all versions before r118.

Another option is to make the version compare tool more intelligent to
not treat the old scheme (eg: r118) greater than current scheme (eg:
1.9.2).
