From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Mon, 13 Aug 2012 12:57:50 -0400
Subject: [Buildroot] buildroot Digest, Vol 69, Issue 3
In-Reply-To: <CA+-urNRYJxMzLpRyMkZ=E5_T7KpkftvZA=ZeOTwmbJHnnLPkoA@mail.gmail.com>
References: <mailman.69642.1330589368.2942.buildroot@busybox.net>
 <CAPeX=+tj9qAj45rtFThuw+yReS31uXCTaAsf0C6MLNRkOdSxxw@mail.gmail.com>
 <CA+-urNRYJxMzLpRyMkZ=E5_T7KpkftvZA=ZeOTwmbJHnnLPkoA@mail.gmail.com>
Message-ID: <CA+-urNT6nsPZ9-uWPL5U7v07wr=G9P9yYVzgMh6FBUVU1hoThg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Ozgun,

On Mon, Aug 13, 2012 at 11:16 AM, Ozgun <ozgun.gunay@gmail.com> wrote:
> I have to use a gamepad with br linux. The gamepad is recognized by linux
> as a HID device and I can read hid commands form ?/dev/input/event6? with
> the evtest ( http://www.freedesktop.org/wiki/Evtest  ).
> Even if the interval of device is 1ms, I can read very few values form
> ?/dev/input/event6?. see below. (The gamepad produces signals with 1ms
> interval on windows.)

There's probably a better list for your question, since it really
concerns whatever gamepad that you have and the Linux kernel. I've
worked with a number of custom HID devices and haven't had an issue
with br. I'd suggest that you see how your gamepad performs with
desktop Linux. I would expect a similar report rate. My guess is that
there's a Windows device driver that enables the faster gamepad report
rate.

Also, the Linux input event system does try to suppress redundant
reports. I don't think that this is your problem from your trace.

> Do I have to configure libhid or chose another method?

I like the hidraw interface, but I'd check for a special command being
sent on Windows before changing anything.

Frank
