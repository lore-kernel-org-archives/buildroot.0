From: Hebbar <gururajakr@sanyo.co.in>
Date: Mon, 16 Jul 2007 22:09:50 -0700 (PDT)
Subject: [Buildroot] error building toolchain with gettext /libintl
In-Reply-To: <1184576580.18357.4.camel@elrond.sweden.atmel.com>
References: <C03A3C267DDF184EA523BBAB577BF924C22CF4@blrexsr1.slti.sanyo.co.in>
	<1184576580.18357.4.camel@elrond.sweden.atmel.com>
Message-ID: <11643166.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Dear Ulf Samuelsson,

  Thnkx very much for the suggestion + patch + libxml2 update. i almost
solved that issue. but also i would like 2 mention 1 more thing that i
observed now. 

 while building fontconfig/freetype, i found that -lxml2 is taken from
system /usr/lib whereas it is suppose to take from staging_dir/usr/lib. when
it is checking for -lxml2 it 1st searched from system /usr/lib & gave error
as invalid file format. i renamed the one in system /usr/lib to
old_libxml2.so & then "make fontconfig"  went on taking -lxml2 from
staging_dir/usr/lib. so i doubt many files like this are taken from system
/usr/lib than from staging_dir/usr/lib. kindly let me know if i need any
changes/updates. 


Regards
Gururaja



Ulf Samuelsson-2 wrote:
> 
> m?n 2007-07-16 klockan 09:02 +0530 skrev Gururaja Hebbar K R:
>>  Hi all,
>> 
>> I am trying to build a ARM toolchain in buildroot for the 1st time with
>> below mentioned config. Everything goes fine till gettext building. when
>> make gettext-target is executed it halts with error saying
>> 
>> cp -dpf
>> /home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/u
>> sr/lib/libgettext*.so* \
> 
> I have noted this as well, and the problem is that 
> 
> "staging_dir/usr/lib/libgettext*.so* " was never created.
> 
> Instead "staging_dir/usr/lib/libgettext*.a" was created.
> 
> This problem has been around for a long time.
> 
> 
> I have yet to figure out how to make the ARM gcc build the 
> shared library instead of the static library
> 
> Is it possible to supply "--with-shared" or something 
> when configuring?
> 
> 
> Best Regards,
> Ulf Samuelsson
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
> 

-- 
View this message in context: http://www.nabble.com/error-building-toolchain-with-gettext--libintl-tf4084383.html#a11643166
Sent from the BuildRoot mailing list archive at Nabble.com.
