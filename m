From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 12 Nov 2013 23:24:10 +0100
Subject: [Buildroot] [PATCH 1/1] omniorb: add COS Naming Service
In-Reply-To: <9e8746c1-8e33-4c55-b4e2-b2b1e6181f86@email.android.com> (Thomas
 De Schampheleire's message of "Tue, 12 Nov 2013 21:54:50 +0100")
References: <1384288305-4945-1-git-send-email-mlweber1@rockwellcollins.com>
 <9e8746c1-8e33-4c55-b4e2-b2b1e6181f86@email.android.com>
Message-ID: <87txfh2r91.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

Hi,

>> +if BR2_PACKAGE_OMNIORB
>> +
>> +config BR2_PACKAGE_OMNIORB_WITH_SERVICES
>> +        bool "COS Naming Service"
>> +        default y
>> +        help
>> +          omniORB COS Naming Service
>> +endif
>> +
>> comment "omniORB needs a toolchain w/ C++"
>> depends on !BR2_INSTALL_LIBSTDCPP

> I think it makes more sense to keep this comment close to the config
> option it applies to, thus moving the new cos option below it.  I know
> that many packages do not follow this, but I'm planning on fixing
> that...

Careful, kconfig needs sub options to be directly under the main option,
otherwise they don't get indented correctly in menuconfig, so your
options are either:

- Comment before main option
- Comment after all the sub options

-- 
Bye, Peter Korsgaard
