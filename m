From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Wed, 26 Jan 2011 01:39:42 +0100
Subject: [Buildroot] [PATCH v2 2/4] Add CMAKETARGETS infrastructure for
 CMake packages
In-Reply-To: <20110126002516.662ad0c5@surf>
References: <1295124808-5649-1-git-send-email-bjorn.forsman@gmail.com>
	<1295124808-5649-3-git-send-email-bjorn.forsman@gmail.com>
	<20110126002516.662ad0c5@surf>
Message-ID: <AANLkTimPANZZiOu1jx03Q6wc3JNmqPkVadN21-nb36Kf@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26 January 2011 00:25, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Sat, 15 Jan 2011 21:53:26 +0100
> Bj?rn Forsman <bjorn.forsman@gmail.com> wrote:
>
>> +$(2)_INSTALL_HOST_OPT ? ? ? ? ? ? ? ??= DESTDIR=$$(HOST_DIR) install
>
> $(2)_INSTALL_HOST_OPT ? ? ? ? ? ?= install
>
> should be sufficient if:
>
>> + ? ? ? ? ? ? -DCMAKE_INSTALL_PREFIX="/usr" \
>
> is replaced by:
>
>> + ? ? ? ? ? ? -DCMAKE_INSTALL_PREFIX="$(HOST_DIR)/usr" \
>
> for host packages. I think, like for autotools packages, it is more
> technically correct to set the installation prefix to $(HOST_DIR)/usr
> rather than /usr.

Yes, I agree. I'll make this change in the next series.

Best regards,
Bj?rn Formsna
