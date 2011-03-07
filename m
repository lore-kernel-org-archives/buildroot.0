From: Krzysztof Kanas <k.kanas@kelvatek.com>
Date: Mon, 07 Mar 2011 14:03:38 +0100
Subject: [Buildroot] Qtopia 4.4.3 qmake build problem BR2_VERSION=0.10.0-svn
Message-ID: <4D74D7AA.4030500@kelvatek.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I am new here so I don't know if this problem occurred to anyone before.
I did some searching but haven't found anything similar to my case.

My version of buildroot is  BR2_VERSION=0.10.0-svn
My problem is somewhat related to custom package that my company made,
not going into details it is some like this

kelvatek_apps.mk
-------------------------
kelvatek_apps: uclibc qtopia4 libconfig sqlite boost-headers 
$(KELVATEK_APPS_DIR)/.installed


ifeq ($(strip $(BR2_PACKAGE_KELVATEK_APPS)),y)
TARGETS+=kelvatek_apps
endif

-------------------------

I created second package ( to achieve backward build compability ) 
included by first packed based on config setings

new_kelvatek_apps
-------------------------

kelvatek_apps-1: uclibc qtopia4 libconfig sqlite boost-headers 
$(KELVATEK_APPS_DIR)/.installed

ifeq ($(strip $(BR2_PACKAGE_KELVATEK_APPS_ALL_MAKE)),y)
TARGETS+=kelvatek_apps-1
endif

-------------------------
And I have problem with qtopa and qmake
When I use first package as result of qtopia compilation

build_arm/staging_dir/usr/bin/qmake
is created

When I use my newly created package ( new_kelvatek_apps )
build_arm/staging_dir/usr/bin/qmake is not created and some other build 
problems occurs (eg. fonts aren't copped to staging_dir)

There is something wrong with the either package I created or qtopia 
make or I don't relay know what else can it be.
I will  show more sources of either qtopia4.mk or 
kelvatek_apps.mk/new_kelvatek_apps
to get to the cause of my troubles.


-- 
Best regards,
Krzysztof Kanas

To err is human, but to really mess things up you need a computer.


--
Asylia ExchangeDefender Message Security: Click below to verify authenticity
http://www.exchangedefender.com/verify.asp?id=p27D3T8v001050&from=k.kanas at kelvatek.com
