From: Jeff Gray <jeff.gray@sato-global.com>
Date: Mon, 1 Feb 2016 11:02:52 +1100
Subject: [Buildroot] host-python link fails due to missing readline
In-Reply-To: <56AE95A3.8070701@mind.be>
References: <CAHb0ztk2fbycwTbct4gESVMVHuM==GaJsCVe1uVQiHVL5U84tA@mail.gmail.com>
 <56AE95A3.8070701@mind.be>
Message-ID: <CAHb0ztnG=fD611pxxGfHY6USYt7SjZGcRRSssPhPRk3bkeMcsg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for your reply - that helped push me in the right direction. I
wasn't sure that buildroot used my local system libraries - I thought maybe
it just used the files built in output/host/. But it does make sense that
it does.

I found that the local /usr/lib/libreadline.so was an ARM executable (the
only one in any system directory)... This is obviously not a good thing,
which is why it was telling me incompatible file.

I don't know for sure how this happened, but I suspect one of the previous
developers who used this system accidentally copied an ARM file to the
system lib and not his cross development lib & didn't realise it. So this
file has been sitting there for 2.5 years waiting to go off.

Sorry to waste your time - thanks for the help in finding it. I will now do
a clean make and see how it goes.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160201/c4320bd6/attachment.html>
