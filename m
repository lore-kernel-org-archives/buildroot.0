From: Mohamed Dawod <mhm.dawod@gmail.com>
Date: Thu, 4 Apr 2019 09:08:35 +0200
Subject: [Buildroot] [GSoC19] Motivation
In-Reply-To: <87v9zue2jn.fsf@dell.be.48ers.dk>
References: <CAGCTLNTuWB7E_txmWm9s+fOU5EJsyU1guWNOUM8c40B5WDOoog@mail.gmail.com>
 <20190401214416.1e265d6f@windsurf>
 <CAGCTLNQiJT9j3yxha=X3vm4pK33W82P=iemytFQ6ja7wJcKAag@mail.gmail.com>
 <CAGCTLNSv3LqM07UJ_Swg9-tXGDYEBTGbjw29gpNmeqSEdApu=Q@mail.gmail.com>
 <87v9zue2jn.fsf@dell.be.48ers.dk>
Message-ID: <CAGCTLNRDiCJXoNOintN_BayTD0SL3QSUZGBcTLHEWsO6wozkgw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
> >>>>> Peter Korsgaard <peter at korsgaard.com <mhm.dawod@gmail.com>> writes:
> > Sorry, I bumped wget yesterday:
>

No problem, I will find some other package to update.
But I noticed that my patch is slightly different of yours

This id my patch :

Signed-off-by: Mohamed Dawod <mhm.dawod@gmail.com>
> ---
> diff -Naur wget/wget.hash wget2/wget.hash
> --- a/package/wget.hash    2019-04-03 14:38:50.133423838 +0200
> +++ b/package/wget.hash    2019-04-03 15:09:44.834238846 +0200
> @@ -1,6 +1,6 @@
>  # Locally calculated after checking pgp signature
> -# https://ftp.gnu.org/gnu/wget/wget-1.20.1.tar.lz.sig
> +# https://ftp.gnu.org/gnu/wget/wget-1.20.2.tar.lz.sig
>  # with key 1CB27DBC98614B2D5841646D08302DB6A2670428
> -sha256 0f63e84dd23dc53ab3ab6f483c3afff8301e54c165783f772101cdd9b1c64928
> wget-1.20.1.tar.lz
> +sha256 e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
> wget-1.20.2.tar.lz
>  # Locally calculated
>  sha256 e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b
> COPYING
> diff -Naur wget/wget.mk wget2/wget.mk
> --- a/package/wget.mk    2019-04-03 14:38:50.133423838 +0200
> +++ b/package/wget.mk    2019-04-03 14:40:12.080507178 +0200
> @@ -4,7 +4,7 @@
>  #
>
>  ################################################################################
>
> -WGET_VERSION = 1.20.1
> +WGET_VERSION = 1.20.2
>  WGET_SOURCE = wget-$(WGET_VERSION).tar.lz
>  WGET_SITE = $(BR2_GNU_MIRROR)/wget
>  WGET_DEPENDENCIES = host-pkgconf
>


The difference is new sha256sum of the new package.
I downloaded the new package from the link "
https://ftp.gnu.org/gnu/wget/wget-1.20.2.tar.lz"
then I run the command $sha256sum wget-1.20.2.tar.lz
how can the checksum be different ?




On Thu, Apr 4, 2019 at 7:56 AM Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Mohamed" == Mohamed Dawod <mhm.dawod@gmail.com> writes:
>
>  > Hi all,
>  > I submitted my Draft Proposal document with buildroot organization to
>  > review my proposal document.
>  > I am looking forward to read your comments and feedback.
>
>  > About the contribution task,
>  > I read about buildroot and how to patch new packages.
>  > Buildroot is powerful and really more easier than Yocto project. I loved
>  > buildroot very much :-D
>  > I checked the list of packages and I chose wget package to update it.
>  > I successfully prepared the patch file but still not tested.
>  > I hope to test it before the end of this week_before the starting of
>  > midterm exams_ to submit it to the the main list.
>
> Sorry, I bumped wget yesterday:
>
>
> https://git.buildroot.net/buildroot/commit/?id=c21d440c8a79a6af284ec5793481d1b8a0b298ca
>
> --
> Bye, Peter Korsgaard
>


-- 

Mohamed Dawod
Computer Engineering Department
Faculty of Engineering
Cairo University
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190404/aad30d74/attachment.html>
