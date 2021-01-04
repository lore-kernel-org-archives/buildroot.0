From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Jan 2021 21:18:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/wqy-zenhei: new package
In-Reply-To: <12678409-b5dc-71fa-f0d1-9caf625f75c5@linux.vnet.ibm.com>
References: <20201204141737.27942-1-klaus@linux.vnet.ibm.com>
 <20210102184224.13096374@windsurf>
 <12678409-b5dc-71fa-f0d1-9caf625f75c5@linux.vnet.ibm.com>
Message-ID: <20210104211827.762fa2b8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Klaus,

On Mon, 4 Jan 2021 16:42:39 -0300
Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com> wrote:

> > Indeed for consistency reason, we try to only use the lower-case
> > package name as the short prompt for packags.  
> 
> I was puzzled by this comment so I looked at the commit and I think you
> meant to say that you removed the "(Free Chinese-capable fonts)" from the bool.
> That makes sense, thanks!

Gah, absolutely. I made a bogus copy/paste which made my whole
explanation confusing indeed, but it seems you understood what I meant
anyway :-)

> > Indicating the URL from which the tarball is downloaded and then the
> > hash calculated locally is not very useful. Also, SourceForge provides
> > md5 and sha1 hashes, and the hash of the license file was missing. So,
> > I've changed to:  
> 
> I understand the md5 and sha1 hashes that I completely missed, but couldn't decode why the locally computed/calculated
> sha256 is not useful.

The locally computed sha256 is useful. What was not is the comment:

# locally calculated from http://.....tar.gz

because it's obvious from where it has been calculated, so we tend to say just:

# locally calculated

or, if indeed there was another verification method:

# locally calculated, after checking the signature with ...

Does that make sense? But really, this is very tiny minor detail.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
