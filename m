From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 23 May 2015 18:46:16 +0200
Subject: [Buildroot] [PATCH] package/efl/libelementary: disable on
 static lib only build
In-Reply-To: <20150523161837.GB19247@free.fr>
References: <1432389399-12671-1-git-send-email-s.martin49@gmail.com>
 <20150523161837.GB19247@free.fr>
Message-ID: <CAHXCMM+aQMnsVp9=T057eOWcz1kk7Y3LS3wrizGyaj5aJVJ9Aw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, all,

On Sat, May 23, 2015 at 6:18 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Samuel, All,
>
> On 2015-05-23 15:56 +0200, Samuel Martin spake thusly:
>> libelementary sources include dlfcn.h header when HAVE_FORK symbol is defined;
>> this is always the case because elf already depends on BR2_USE_MMU.
Ooops, sorry for the typo, i mean efl (not elf), and more specifically [1]:


>
> Although I understand the thechnical reason to require !STATIC, I fail
> to see the how this commit log describes the actual change.
>
> That is, I fail to see why "fork + ELF + MMU" implies we need to depend
> on !STATIC.
>
> Also, ELF requiring an MMU is absolutely wrong. You can run ELF files on
> MMU-less systems.
>
> Regards,
> Yann E. MORIN.
>

So, in the end, it is: MMU + efl enables fork support in efl; thus
libelementary includes dlfcn.h. So libelementary should depend on
!STATIC.


[1] http://git.buildroot.net/buildroot/tree/package/efl/Config.in#n5

Regards,

-- 
Samuel
