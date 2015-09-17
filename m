From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 17 Sep 2015 19:20:03 +0300
Subject: [Buildroot] [PATCH 1/2] Add dependency on bash to gzip for
 runtime
In-Reply-To: <alpine.DEB.2.02.1509171814510.13941@orcam81.orcam.lan>
References: <1442501193-6059-1-git-send-email-yba@tkos.co.il>
 <20150917150112.GR11632@tarshish>
 <alpine.DEB.2.02.1509171814510.13941@orcam81.orcam.lan>
Message-ID: <20150917162003.GT11632@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yonatan,

On Thu, Sep 17, 2015 at 06:16:42PM +0300, Jonathan Ben Avraham wrote:
> On Thu, 17 Sep 2015, Baruch Siach wrote:
> 
> >Date: Thu, 17 Sep 2015 18:01:12 +0300
> >From: Baruch Siach <baruch@tkos.co.il>
> >To: Jonathan Ben-Avraham <yba@tkos.co.il>
> >Cc: buildroot at buildroot.org
> >Subject: Re: [Buildroot] [PATCH 1/2] Add dependency on bash to gzip for
> >    runtime
> >
> >On Thu, Sep 17, 2015 at 05:46:32PM +0300, Jonathan Ben-Avraham wrote:
> >>From: Jonathan Ben Avraham <yba@tkos.co.il>
> >>
> >>The GNU gzip package provides eleven executable files, all but one of
> >>which are bash shell scripts. If we allow inclusion of gzip without
> >>bash, then on executing commands such as lxc-checkconfig that actually
> >>use these shell scripts, you will get errors like 'zgrep: not found',
> >>even though the zgrep executable is in PATH.
> >
> >Which /bin/sh shell show this problem?
> >
> >On my host the command
> >
> >  busybox sh /bin/zgrep pattern file.gz
> >
> >and also
> >
> >  dash /bin/zgrep pattern file.gz
> >
> >work as expected.
> 
> You tested *all* of the scripts or just this one?

I didn't test all of them. I'm just trying to reproduce the 'zgrep: not found' 
problem that you report in the commit log, to see what went wrong.

> What if ash breaks even *one*?

Then we should probably patch the problem and send upstream. gzip bundled 
scripts are pretty trivial, and AFAICS, should work under any POSIX-like 
shell.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
