From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 06 Apr 2021 09:52:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/samba4: add required python
 deps for AD DC support
References: <20210404165823.954492-1-bernd.kuhls@t-online.de>
 <20210405110003.1965aa55@windsurf.home>
Message-ID: <djgtjhxcg5.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mon, 05 Apr 2021 11:00:03 +0200 schrieb Thomas Petazzoni:

> On Sun,  4 Apr 2021 18:58:23 +0200 Bernd Kuhls
> <bernd.kuhls@t-online.de> wrote:
> 
>>  ifeq ($(BR2_PACKAGE_SAMBA4_AD_DC),y)
>> -SAMBA4_DEPENDENCIES += jansson +SAMBA4_DEPENDENCIES += \ +	jansson \ 
+
>> host-python-dnspython \ +	host-python-markdown \
> 
> I'm curious: why are the host packages needed? Is it because the
> configuration stuff checks on the host that they are available, while in
> fact they are only needed on the target ?
> 
> Thomas

Hi Thomas,

yes, it seems to. The configure error could only be solved by also adding 
the host packages.

Regards, Bernd
