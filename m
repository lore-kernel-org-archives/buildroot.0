From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 Aug 2020 16:15:19 +0200
Subject: [Buildroot] [PATCH v3 1/5]
 support/scripts/gen-bootlin-toolchains: add new script to support Bootlin
 toolchains
In-Reply-To: <16887404-57d2-0809-7f45-9e90f4321539@railnova.eu>
References: <20200814195235.986905-1-thomas.petazzoni@bootlin.com>
 <20200814195235.986905-2-thomas.petazzoni@bootlin.com>
 <16887404-57d2-0809-7f45-9e90f4321539@railnova.eu>
Message-ID: <20200829141519.GF14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Titouan, All,

On 2020-08-16 12:13 +0200, Titouan Christophe spake thusly:
> On 14/08/20 21:52, Thomas Petazzoni wrote:
> >https://toolchains.bootlin.com/ has been providing for a few years a
> >number of ready-to-use pre-built toolchains, for a wide range of
> >architectures (which it turns out, are all built using Buildroot).
[--SNIP--]
> >+def get_toolchains():
> >+    toolchains = list()
> >+    for arch, details in arches.items():
> >+        print(arch)
> >+        url = os.path.join(BASE_URL, arch, "available_toolchains")
> >+        page = requests.get(url).text
> >+        fnames = sorted(re.findall(r'<td><a href="(\w[^"]+)"', page))
> >+        print(fnames)
> This print(fnames) call should be removed. Besides this tiny remark,

I forgot to fixup that before pushing, so I pushed a followup commit.

> Reviewed-by: Titouan Christophe <titouan.christophe@railnova.eu>
> Tested-by: Titouan Christophe <titouan.christophe@railnova.eu>

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
