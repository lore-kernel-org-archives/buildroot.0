From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Nov 2013 20:52:33 +0100
Subject: [Buildroot] Qt5 puzzle
In-Reply-To: <CALo-6+g+cuLUjWi5+PC+Y1+MUcuENnv3etVT3FXrk3Yqf_vF5Q@mail.gmail.com>
References: <CALo-6+gmYsfcV1yU2oEAfkbCHCqi2YHSwp6CtvkTX8+bmfXYUw@mail.gmail.com>
 <CAAXf6LUaGLQh8h7Ujnpaciyq4dz3PM43S7spOcpi08Wd83PUtA@mail.gmail.com>
 <CALo-6+g+cuLUjWi5+PC+Y1+MUcuENnv3etVT3FXrk3Yqf_vF5Q@mail.gmail.com>
Message-ID: <20131106205233.28e38d06@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Charles Krinke,

On Wed, 6 Nov 2013 11:08:22 -0800, Charles Krinke wrote:

> I think I see what is going on. It looks like Qt sets USE_EABI_HARDFLOAT=0
> when I need it to be USE_EABI_HARDFLOAG=1.
> 
> This is done in qt5jsbackend-5.0.2/src/vi/v8.pri as a consequence of
> 
> config_hardfloat {
>   DEFINES += USE_EABI_HARDFLOAT=1
> } else {
>   DEFINES += USE_EABI_HARDFLOAT=0
> }
> 
> Where config_hardfloat is always undefined.

See my reply to your e-mail.

> This may bring up a larger question in that some embedded systems will wish
> to use softfloat and some hardfloat

I don't understand what you mean here. We have options in Buildroot to
allow the user to configure whether (s)he wants a soft float or hard
float system.

As I said in my other e-mail, what you should investigate is precisely
why the config_hardfloat test is returning the wrong result.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
