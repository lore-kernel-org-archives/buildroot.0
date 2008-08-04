From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Date: Mon, 04 Aug 2008 16:16:40 +0200
Subject: [Buildroot] C double type problem - at91sam9263
In-Reply-To: <223E6519BDCAC74695BEE9D163F8E6592306E8@oakleaf10.oakleafconsultancy.com>
References: <223E6519BDCAC74695BEE9D163F8E6592306E8@oakleaf10.oakleafconsultancy.com>
Message-ID: <48970F48.9020104@cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Richard Hardy wrote:
>> I see it too on cris architecture. I think it is uClibc related, at
> least
>> 0.9.29.
>> I'll try to reproduce on x86..
>> IMHO only printf is buggy, otherwise doubles and floats seem to have
>> correct value.
> 
> When you say "doubles and floats seem to have correct value" how are you
> testing them? 

I put a loop in your test program and expected correct number of iterations.
test = 100;
fprintf(stderr, "Test double = %f.\n", test);
while (test)
{
	fprintf(stderr, "Test double = %f.\n", test);
	test -= 2;
}

This spins 50-times.
On cris toolchain with gcc 4.3.1, uClibc 0.9.29:
Test double = 100000000.
Test double = 98000000.
Test double = 96000000.
Test double = 94000000.
Test double = 92000000.
Test double = 90000000.
Test double = 88000000.
Test double = 86000000.
Test double = 84000000.
Test double = 82000000.
Test double = 80000000.
Test double = 78000000.
Test double = 76000000.
Test double = 74000000.
Test double = 72000000.
Test double = 70000000.
Test double = 68000000.
Test double = 66000000.
Test double = 64000000.
Test double = 62000000.
Test double = 60000000.
Test double = 58000000.
Test double = 56000000.
Test double = 54000000.
Test double = 52000000.
Test double = 50000000.
Test double = 48000000.
Test double = 46000000.
Test double = 44000000.
Test double = 42000000.
Test double = 40000000.
Test double = 38000000.
Test double = 36000000.
Test double = 34000000.
Test double = 32000000.
Test double = 30000000.
Test double = 28000000.
Test double = 26000000.
Test double = 24000000.
Test double = 22000000.
Test double = 20000000.
Test double = 18000000.
Test double = 16000000.
Test double = 14000000.
Test double = 12000000.
Test double = 10000000.
Test double = 8000000.
Test double = 6000000.
Test double = 4000000.
Test double = 2000000.

On i386 toolchain with gcc 4.3.1, uClibc 0.9.29:
Test double = 100.000000.
Test double = 98.000000.
Test double = 96.000000.
Test double = 94.000000.
Test double = 92.000000.
Test double = 90.000000.
Test double = 88.000000.
Test double = 86.000000.
Test double = 84.000000.
Test double = 82.000000.
Test double = 80.000000.
Test double = 78.000000.
Test double = 76.000000.
Test double = 74.000000.
Test double = 72.000000.
Test double = 70.000000.
Test double = 68.000000.
Test double = 66.000000.
Test double = 64.000000.
Test double = 62.000000.
Test double = 60.000000.
Test double = 58.000000.
Test double = 56.000000.
Test double = 54.000000.
Test double = 52.000000.
Test double = 50.000000.
Test double = 48.000000.
Test double = 46.000000.
Test double = 44.000000.
Test double = 42.000000.
Test double = 40.000000.
Test double = 38.000000.
Test double = 36.000000.
Test double = 34.000000.
Test double = 32.000000.
Test double = 30.000000.
Test double = 28.000000.
Test double = 26.000000.
Test double = 24.000000.
Test double = 22.000000.
Test double = 20.000000.
Test double = 18.000000.
Test double = 16.000000.
Test double = 14.000000.
Test double = 12.000000.
Test double = 10.000000.
Test double = 8.000000.
Test double = 6.000000.
Test double = 4.000000.
Test double = 2.000000.

> I have tried using gdb to look at and set double values,
> but I seem to get weird results. This is what led me to try to fprintf
> the double values in the first place.
> 
> e.g. if I call a function with a double parameter set to "1.0", inside
> the called function, gdb reports that parameter to have a value of
> 35532351778122413e-313. If I try to use gdb to "set" a double value I
> get a segmentation fault. Integers seem to work ok.
> 

I'll do tests with gdb(server) tomorrow, I can run the test program under gdbserver
but it won't stop at breakpoints when I set them ?!?.

Regards,
Hinko

-- 
?ETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar at cetrtapot.si
Http: www.cetrtapot.si
