From: Christopher Taylor <chtaylo3@gmail.com>
Date: Tue, 5 Aug 2008 12:37:43 -0400
Subject: [Buildroot] C double type problem - at91sam9263
In-Reply-To: <223E6519BDCAC74695BEE9D163F8E6592306EE@oakleaf10.oakleafconsultancy.com>
References: <223E6519BDCAC74695BEE9D163F8E6592306EE@oakleaf10.oakleafconsultancy.com>
Message-ID: <2590773a0808050937u77a825d0od5801485e509a1ae@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Could this be related to how you are compiling the code, uclibc, and
the OS as far as endian-ness ?  big vs middle vs little endian?

just a thought.  I've been burned by the middle-endianness on the
arm9261.  Last I looked there were some defects in how buildroot took
your parameters and implemented them in uClibc and the kernel (I seem
to remeber there was a bug in uClibc that buildroot incorrectly worked
around, but I wouldn't swear to it)

-Chris

On Tue, Aug 5, 2008 at 6:51 AM, Richard Hardy
<richardh@oakleafconsultancy.com> wrote:
>
>
>> -----Original Message-----
>> From: Ulf Samuelsson [mailto:ulf.samuelsson at atmel.com]
>> Sent: 05 August 2008 12:21
>> To: Richard Hardy; buildroot at uclibc.org
>> Subject: Re: [Buildroot] C double type problem - at91sam9263
>>
>> ----- Original Message -----
>>
>>       From: Richard Hardy <mailto:richardh@oakleafconsultancy.com>
>>       To: buildroot at uclibc.org
>>       Sent: Monday, August 04, 2008 12:29 PM
>>       Subject: [Buildroot] C double type problem - at91sam9263
>>
>>
>>
>>       Hi Everyone,
>>
>>       I am quite new to using buildroot and embedded linux systems in
>> general. However, I have managed to use buildroot to get a (nearly)
>> working system up and running for an at91sam9263 board. (kernel v
> 2.6.22,
>> uClibc v 0.9.29)
>>
>>
>>
>>       I have one annoying problem though. One of the packages I am
>> compiling from source uses C's "double" type, and this does not seem
> to be
>> behaving as I need it to.
>>
>>
>>
>>       I have created a simple example program:
>>
>>
>>
>>       ...
>>
>>       int main (int argc, char *argv[])
>>
>>       {
>>
>>       double test;
>>
>>       test = 1;
>>
>>       fprintf(stderr, "Test double = %f.\n", test);
>>
>>       }
>>
>>
>>
>>
>>
>> Should you not be using "%lf" instead of "%f" ?
>>
>>    fprintf(stderr, "Test double = %lf.\n", test);
>>
>>    fprintf(stderr, "Test double = %f.\n", test);
>>
>> Best Regards
>> Ulf Samuelsson
>>
>
> Yes, you are right. But, it makes no difference to the output.
>
> Best regards,
> Richard.
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
