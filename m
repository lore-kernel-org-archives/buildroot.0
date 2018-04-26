From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Thu, 26 Apr 2018 17:55:17 +0200
Subject: [Buildroot] [PATCH v4 02/13] security hardening: add RELFO,
 FORTIFY options
In-Reply-To: <1516766992-48428-2-git-send-email-matthew.weber@rockwellcollins.com>
References: <1516766992-48428-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1516766992-48428-2-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <CAJtjsKb1+dDbkhYw5ZHoTzRSpRfxxygATWoHpjLQ=1ngZWG0fQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matt,

This is a late reply but we encounter a build failure in our system
due to changes in this patch, which I believe are wrong. See below.

On Wed, Jan 24, 2018 at 5:09 AM, Matt Weber
<matthew.weber@rockwellcollins.com> wrote:
> +
> +ifeq ($(BR2_SSP_REGULAR),y)
> +TARGET_CPPFLAGS += -fstack-protector
> +else ifeq ($(BR2_SSP_STRONG),y)
> +TARGET_CPPFLAGS += -fstack-protector-strong
> +else ifeq ($(BR2_SSP_ALL),y)
> +TARGET_CPPFLAGS += -fstack-protector-all
> +endif
...
>
> -ifeq ($(BR2_SSP_REGULAR),y)
> -TARGET_CFLAGS += -fstack-protector
> -TARGET_CXXFLAGS += -fstack-protector
> -TARGET_FCFLAGS += -fstack-protector
> -else ifeq ($(BR2_SSP_STRONG),y)
> -TARGET_CFLAGS += -fstack-protector-strong
> -TARGET_CXXFLAGS += -fstack-protector-strong
> -TARGET_FCFLAGS += -fstack-protector-strong
> -else ifeq ($(BR2_SSP_ALL),y)
> -TARGET_CFLAGS += -fstack-protector-all
> -TARGET_CXXFLAGS += -fstack-protector-all
> -TARGET_FCFLAGS += -fstack-protector-all
> -endif

I don't think -fstack-protector* flags belongs to the preprocessor flags.
Why did you move them from CFLAGS and CXXFLAGS? Your commit message
suggests this was an proposition from Arnout but I can't find his
email where he says that.

Best regards,
-- 
Johan
