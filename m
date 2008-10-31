From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Fri, 31 Oct 2008 14:37:21 -0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/zlib
In-Reply-To: <20081031163150.304d9a3a@surf>
References: <20081031121011.6D91B3C7FE@busybox.net>
	<20081031163150.304d9a3a@surf>
Message-ID: <d6cda7730810310937m44a69060u7827d9180683dcf@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ops, my bad.

Should be ok in 23885.

On Fri, Oct 31, 2008 at 1:31 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Fri, 31 Oct 2008 05:10:11 -0700 (PDT),
> correa at uclibc.org a ?crit :
>
>>  $(STAGING_DIR)/usr/lib/libz.so: $(ZLIB_DIR)/libz.so
>> -     cp -dpf $(ZLIB_DIR)/libz.a $(STAGING_DIR)/usr/lib/
>> -     cp -dpf $(ZLIB_DIR)/zlib.h $(STAGING_DIR)/usr/include/
>> -     cp -dpf $(ZLIB_DIR)/zconf.h $(STAGING_DIR)/usr/include/
>> -     cp -dpf $(ZLIB_DIR)/libz.so* $(STAGING_DIR)/usr/lib/
>> +     $(INSTALL) -D $(ZLIB_DIR)/libz.a $(STAGING_DIR)/usr/lib/
>
> This doesn't work: even with the -D option, it doesn't create the
> intermediate directories. It should be:
>
> $(INSTALL) -D $(ZLIB_DIR)/libz.a $(STAGING_DIR)/usr/lib/libz.a
>
>> +     $(INSTALL) -D $(ZLIB_DIR)/zlib.h $(STAGING_DIR)/usr/include/
>
> Same thing here.
>
> Cheers,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers and embedded Linux development,
> consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
