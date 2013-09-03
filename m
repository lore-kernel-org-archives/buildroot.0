From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 03 Sep 2013 18:28:01 +0200
Subject: [Buildroot] SVN process started at make
In-Reply-To: <87sixm558s.fsf@dell.be.48ers.dk>
References: <15AE5A936F5E3A42A9144E66875A0A8934DB3B@server1-derijp.CLB-Benelux.lokaal>
 <87sixm558s.fsf@dell.be.48ers.dk>
Message-ID: <52260E11.4090103@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/03/13 16:50, Peter Korsgaard wrote:
>>>>>> "Ruud" == Ruud Commandeur <RCommandeur@clb.nl> writes:
>
>   Ruud> Hi Everyone,
>   Ruud> Since today, all my 'make' commands in the buildroot dir take a very
>   Ruud> long time before they actually start doing something. It appears to be
>   Ruud> that on each make command, an svn process is started, that takes 5-10%
>   Ruud> CPU time for a couple of minutes. Once this process stops, the 'normal'
>   Ruud> make actions start.
>
>   Ruud> My sources have been under svn control for a long time by using
>   Ruud> SmartSVN, but since today I installed the commandline tool of
>   Ruud> subversion. This must have triggered this behaviour, but can anyone
>   Ruud> explain to me how I can prevent this? Is this someting in the
>   Ruud> Makefile(s)?
>
> Odd. Would it be because of ./support/scripts/setlocalversion?

  I think it is. I experienced that as well (not personally since I use 
git-svn when the customer stores his buildroot tree in svn, but my 
colleagues complained about it).

  Maybe we should put something like

LOCALVERSION ?= $(shell $(TOPDIR)/support/scripts/setlocalversion)
BR2_VERSION_FULL := $(BR2_VERSION)$(LOCALVERSION)

in the top-level Makefile.


  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
