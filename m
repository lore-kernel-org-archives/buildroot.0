From: Jonathan Ben Avraham <yba@tkos.co.il>
Date: Sun, 24 Jan 2016 17:36:26 +0200 (IST)
Subject: [Buildroot] [PATCH v4 2/4] linux-pam: Enable NIS support if
 yp-tools selected
In-Reply-To: <20160124160949.00b03374@free-electrons.com>
References: <1453647303-3965-1-git-send-email-yba@tkos.co.il>
 <1453647303-3965-3-git-send-email-yba@tkos.co.il>
 <20160124160949.00b03374@free-electrons.com>
Message-ID: <alpine.DEB.2.11.1601241734061.4122@tanhuma.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 24 Jan 2016, Thomas Petazzoni wrote:

> Date: Sun, 24 Jan 2016 16:09:49 +0100
> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> To: Jonathan Ben-Avraham <yba@tkos.co.il>
> Cc: buildroot at busybox.net
> Subject: Re: [Buildroot] [PATCH v4 2/4] linux-pam: Enable NIS support if
>     yp-tools selected
> 
> Jonathan,
>
> On Sun, 24 Jan 2016 16:55:01 +0200, Jonathan Ben-Avraham wrote:
>
>> +ifeq ($(BR2_PACKAGE_YP_TOOLS),y)
>> +LINUX_PAM_CONF_OPTS += \
>> +	--enable-nis
>> +else
>> +LINUX_PAM_CONF_OPTS += \
>> +	--disable-nis
>> +endif
>
> This patch should come *after* the yp-tools package is added in the
> series.

Is this a rule defined in the documentation? I didn't notice it. What is 
the reasoning behind the rule?

  - yba


> Thanks!
>
> Thomas
>

-- 
  9590 8E58 D30D 1660 C349  673D B205 4FC4 B8F5 B7F9  ~. .~  Tk Open Systems
=}-------- Jonathan Ben-Avraham ("yba") ----------ooO--U--Ooo------------{=
mailto:yba at tkos.co.il tel:+972.52.486.3386 http://tkos.co.il skype:benavrhm
