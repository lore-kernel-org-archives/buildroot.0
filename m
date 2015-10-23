From: Will Wagner <will_wagner@carallon.com>
Date: Fri, 23 Oct 2015 08:55:49 +0100
Subject: [Buildroot] [PATCH 1/2] qt5base: add optional gstreamer1 support
In-Reply-To: <8737x2lku7.fsf@dell.be.48ers.dk>
References: <1445414790-16583-1-git-send-email-peter@korsgaard.com>
 <20151021134228.64da3709@free-electrons.com>
 <877fmgigrr.fsf@dell.be.48ers.dk>
 <0874644c-9a80-4da8-af8d-ea8cad036c35@MAIL-SINTERS-01.sinters-int.fr>
 <877fmelroe.fsf@dell.be.48ers.dk> <5629321A.50503@carallon.com>
 <8737x2lku7.fsf@dell.be.48ers.dk>
Message-ID: <5629E805.2050007@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/10/2015 21:17, Peter Korsgaard wrote:
>>>>>> "Will" == Will Wagner <will_wagner@carallon.com> writes:
> Hi,
>
>   > On 22/10/2015 18:49, Peter Korsgaard wrote:
>
>   >> Yes, but E.G. the gstreamer 0.10 support in qt5multimedia doesn't build,
>   >> whereas the 1.x support does, and we prefer 1.x over 0.10 elsewhere in
>   >> Buildroot.
>
>   > This is working fine for me. I have 0.10 building and working on a board.
>
> So you don't see these compile errors?
>
> https://patchwork.ozlabs.org/patch/533653/
>
> For one, I see
> src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.cpp calling
> gst_video_connector_get_type that isn't defined anywhere.

No I don't see that. I'll take a look and see what is happening.

>
>   >> Ok, but gstreamer1 pulls in host-pkgconf, so it should be available when
>   >> qt5base runs the configure step, right?
>
>   > host-pkgconfig is built already, but Qt5.5 just seems to be broken and
>   > ignores the passed in path to pkgconf. I've just not had the time to
>   > put together a proper patch and try to get it upstream, but it is
>   > still on my list.
>
> That can presumably be fixed by just ensuring that HOST_DIR/usr/bin is
> in the path (using TARGET_MAKE_ENV / TARGET_CONFIGURE_OPTS)?
>

I hadn't thought of that, but yes presumably that would work.

Regards
Will

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
