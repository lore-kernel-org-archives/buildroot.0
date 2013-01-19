From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Jan 2013 14:51:19 +0100
Subject: [Buildroot] [PATCH 1/1] httping: new package
In-Reply-To: <87ehhnudd9.fsf@dell.be.48ers.dk>
References: <1358036972-10406-1-git-send-email-gilles.talis@gmail.com>
 <20130113120500.0ad7be3a@skate>
 <CAKcgs2xk-=iG-3Ezmc1upEPBjhSGcmgg9WSwn=1E3+OKDT05fg@mail.gmail.com>
 <CAKcgs2wLk-cOK7qUDJ23TidHSyESJF-vCoL+JezDSL2q0H1c0w@mail.gmail.com>
 <87ehhnudd9.fsf@dell.be.48ers.dk>
Message-ID: <50FAA4D7.10006@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/01/13 14:02, Peter Korsgaard wrote:
>>>>>> "Gilles" == Gilles Talis<gilles.talis@gmail.com>  writes:
>
>   Gilles>  I forgot to copy mailing list.
>   Gilles>  Sorry about that and thanks for your help.
>   Gilles>  Gilles.
>
>   Gilles>  2013/1/13 Gilles Talis<gilles.talis@gmail.com>
>
>   Gilles>      Dear Thomas,
>
>   Gilles>      I thought I knew Makefiles better than that. Well, I was wrong :-).
>   Gilles>      The reason why TARGET_CONFIGURE_OPTS does not work in this case is because
>   Gilles>      it overrides the original Makefile's CFLAGS variable (that should be kept
>   Gilles>      in order for target to compile). Apart from adding "override" in the
>   Gilles>      package Makefile, I actually do not see how to use TARGET_CONFIGURE_OPTS
>   Gilles>      and still keep Makefile CFLAGS. Any hint?
>   Gilles>      This will surely help me for future patches/projects.
>
> That's indeed how it is normally done.
>
> override CFLAGS += ..

  No.

  Normally CFLAGS should be assigned to either as

CFLAGS +=

  or

CFLAGS ?=

  and the user-settable CFLAGS are passed in the environment.


  I think most Makefiles follow that convention.


  Patch follows.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
