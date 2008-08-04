From: Richard Hardy <richardh@oakleafconsultancy.com>
Date: Mon, 4 Aug 2008 14:58:42 +0100
Subject: [Buildroot] C double type problem - at91sam9263
Message-ID: <223E6519BDCAC74695BEE9D163F8E6592306E8@oakleaf10.oakleafconsultancy.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> I see it too on cris architecture. I think it is uClibc related, at
least
> 0.9.29.
> I'll try to reproduce on x86..
> IMHO only printf is buggy, otherwise doubles and floats seem to have
> correct value.

When you say "doubles and floats seem to have correct value" how are you
testing them? I have tried using gdb to look at and set double values,
but I seem to get weird results. This is what led me to try to fprintf
the double values in the first place.

e.g. if I call a function with a double parameter set to "1.0", inside
the called function, gdb reports that parameter to have a value of
35532351778122413e-313. If I try to use gdb to "set" a double value I
get a segmentation fault. Integers seem to work ok.

Thanks,
Richard.
