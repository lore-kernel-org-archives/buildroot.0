From: Matthew Weber <matt@thewebers.ws>
Date: Wed, 30 Mar 2016 20:42:33 -0500
Subject: [Buildroot] [PATCH 1/1] buildroot-test: enable toolchains based
 on hostarch
In-Reply-To: <20160331033011.5c85f77f@free-electrons.com>
References: <1459302445-1256-1-git-send-email-matt@thewebers.ws>
 <20160330165525.4378cef8@free-electrons.com>
 <CAFt09wOZO-VodhttV3qsc5s_z0D7JzGij6ShPxYz1F0iyv-uMg@mail.gmail.com>
 <20160331030047.339bd480@free-electrons.com>
 <CAFt09wMJ7KssVQczosB9PfhX5m2Ez8HrLH9NM22QiFsUgyByxQ@mail.gmail.com>
 <CAFt09wPAQQBFHUq+EMZr1S3Ap6TeJ3vKyZg6nZayRuQLPyD8fg@mail.gmail.com>
 <20160331033011.5c85f77f@free-electrons.com>
Message-ID: <CAFt09wOUA2nM6HA=i2tObe7VN-PtOMK02TGNr94Xw=Y-5W=FTA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Wed, Mar 30, 2016 at 8:30 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Wed, 30 Mar 2016 20:24:49 -0500, Matthew Weber wrote:
>
<snip>

> Sounds good, but the conditions look complicated. What about something
> like:
>
>         keep = False
>
>         # Keep all toolchain configs that work regardless of the host
>         # architecture
>         if config['hostarch'] == "any":
>                 keep = True
>
>         # Keep all toolchain configs that can work on the current host
>         # architecture
>         if hostarch == config["hostarch"]:
>                 keep = True
>
>         # Assume that x86 32 bits toolchains work on x86_64 build
>         # machines
>         if hostarch == 'x86_64' and config["hostarch"] == "x86":
>                 keep = True
>
>         if not keep:
>                 continue
>

Appreciate the feedback.  I've pulled that in and will let things run
for the next day with all the changes we've discussed.


-- 
Thanks,
Matt
