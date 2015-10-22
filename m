From: Will Wagner <will_wagner@carallon.com>
Date: Thu, 22 Oct 2015 19:59:38 +0100
Subject: [Buildroot] [PATCH 1/2] qt5base: add optional gstreamer1 support
In-Reply-To: <877fmelroe.fsf@dell.be.48ers.dk>
References: <1445414790-16583-1-git-send-email-peter@korsgaard.com>
 <20151021134228.64da3709@free-electrons.com>
 <877fmgigrr.fsf@dell.be.48ers.dk>
 <0874644c-9a80-4da8-af8d-ea8cad036c35@MAIL-SINTERS-01.sinters-int.fr>
 <877fmelroe.fsf@dell.be.48ers.dk>
Message-ID: <5629321A.50503@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/10/2015 18:49, Peter Korsgaard wrote:
>>>>>> "Julien" == Julien CORJON <corjon.j@ecagroup.com> writes:
> Hi,
>
>>> So I've marked is as superseeded.
>   >>
>   >> And 504627 looks pretty much like my patch except that it adds gstreamer
>   >> 0.10 support which I think we shouldn't do (as qt5multimedia doesn't
>   >> build with it).
>
>   > Qt-5.5.0 announce support[1] for both gstreamer-0.10 & gstreamer-1.0.
>   > Also note that gstreamer-0.10 is still the Qt default version in case
>   > both are present.
>
> Yes, but E.G. the gstreamer 0.10 support in qt5multimedia doesn't build,
> whereas the 1.x support does, and we prefer 1.x over 0.10 elsewhere in
> Buildroot.

This is working fine for me. I have 0.10 building and working on a board.

>
>   >>
>   >> Once my patch is a applied I'll mark 504627 as superseeded. I wasn't
>   >> able to reproduce the pkg-config issue you mentioned.
>
>   > You probably missed that qt5base use host pkg-config to detect gstreamer
>   > version. As autobuild chroot environment have neither of them they both
>   > fail at qt5multimedia install time.
>
> Ok, but gstreamer1 pulls in host-pkgconf, so it should be available when
> qt5base runs the configure step, right?

host-pkgconfig is built already, but Qt5.5 just seems to be broken and 
ignores the passed in path to pkgconf. I've just not had the time to put 
together a proper patch and try to get it upstream, but it is still on 
my list.


-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
