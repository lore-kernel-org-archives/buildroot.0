From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Tue, 02 Dec 2014 14:24:27 +0100
Subject: [Buildroot] [PATCHv2 3/4] support/scripts: add size-stats script
In-Reply-To: <20141202132844.6288543a@free-electrons.com>
References: <1417470100-32657-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1429484.vXm9l0Ysfx@aquila> <20141202132844.6288543a@free-electrons.com>
Message-ID: <1602587.ZxeyJ4ikY4@aquila>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 02 December 2014 13:28:44 Thomas Petazzoni wrote:
> Dear J?r?me Pouiller,
> 
> On Tue, 02 Dec 2014 12:01:11 +0100, J?r?me Pouiller wrote:
[...]
> > > +            pkg = f[0]
> > > +            sz = os.stat(fullpath).st_size
> > > +            pkgdict[fpath] = { 'pkg': pkg, 'size': sz }
> > If pkgdict[fpath] is already defined, it means:
> >   a. pkg == pkgdict[fpath].pkg -> Package was reinstalled
> >   b. pkg != pkgdict[fpath].pkg -> File was overwritten by another package
> > 
> > You may emit a warning is second case?
> 
> Well, it depends on whether we consider overwritten files as normal or
> not. For now, the main case where we overwrite things in Buildroot is
> when a package such as coreutils, installs some commands that are
> "better" than the Busybox ones, in which case coreutils wins over
> Busybox. But since Busybox installs symlinks, and this tool doesn't
> track symlinks, we don't consider this as a file being overwritten.
> 
> So maybe I could have a warning here.
> 
> Regarding "package was reinstalled", this entire script/logic is meant
> to be used after a "make clean all" cycle. I don't think it is worth
> bothering with supporting package re-installation and other crazy things
> that can happen outside of a normal "make clean all" cycle.
Your current implementation seems to be resistant enough to package 
reinstall.


-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
