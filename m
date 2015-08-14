From: Erico Nunes <nunes.erico@gmail.com>
Date: Fri, 14 Aug 2015 02:25:18 -0300
Subject: [Buildroot] [PATCH] kconfig: support read-only Buildroot source
	directories
In-Reply-To: <20150813224050.GE3522@free.fr>
References: <1439504572-20085-1-git-send-email-hollis_blanchard@mentor.com>
 <20150813224050.GE3522@free.fr>
Message-ID: <CAK4VdL3Ps94aMoq9RvBB0_FT9Pke+vfei7K_NgqK9m6ZJkBNyA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Hollis,

On Thu, Aug 13, 2015 at 7:40 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Hollis, All,
>
> On 2015-08-13 15:22 -0700, Hollis Blanchard spake thusly:
>> merge_config.sh currently tries to create a .tmp file in the top-level
>> Buildroot source tree. This fails when that directory is read-only, leading
>> to unexpected .config file contents (affecting the configuration of Buildroot
>> itself, Linux, and Busybox).
>>
>> Fix it by using mktemp --tmpdir to create the .tmp file in $TMPDIR or /tmp.
>>
>> Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>
>
> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Regards,
> Yann E. MORIN.
>

I mentioned on IRC the other day that I had reproduced the problem; I
have tested this patch and it works for me, so:

Tested-by: Erico Nunes <nunes.erico@gmail.com>
