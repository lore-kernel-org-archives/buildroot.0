From: Simon Dawson <spdawson@gmail.com>
Date: Tue, 7 Jan 2014 11:20:48 +0000
Subject: [Buildroot] [PATCH] vlc: new package
In-Reply-To: <20140107142617.64f53ddc@skate>
References: <1389046142-12472-1-git-send-email-spdawson@gmail.com>
 <20140107142617.64f53ddc@skate>
Message-ID: <CAHt8ZCPBrzeWazPKTOy+JT7Bfu38VWYN29LFz-pUo5zuEmZx4Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas. Thanks for the feedback.

On 7 January 2014 06:26, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Maybe we should use positive logic everywhere, no? I.e invert all the
> conditions to be:
>
> ifeq ($(BR2_<foo>),y)
>   use the feature
> else
>   don't use the feature
> endif

Yes, that would make more sense I think.

>> +ifeq ($(BR2_PACKAGE_LIVE555),)
>> +VLC_CONF_OPT += --disable-live555
>> +else
>> +VLC_CONF_OPT += --disable-live555
>
> This should be --enable-live555

Oops. Will fix this, and all other occurrences of the same mistake.

>> +ifeq ($(BR2_PACKAGE_XLIB_LIBX11),)
>> +VLC_CONF_OPT += --without-x
>> +else
>> +VLC_CONF_OPT += --with-x
>> +VLC_DEPENDENCIES += xlib_libX11
>> +endif
>
> I wonder if this block shouldn't interact with the XCB block above.

I'm not so sure. I know xlib_libX11 selects libxcb, but I don't see
that mirroring this dependency will add any value to the vlc package
make file. That said, I'm quite happy to change it if you think that
the right thing to do.

Simon.
