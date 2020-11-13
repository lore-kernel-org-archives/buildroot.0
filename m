From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Fri, 13 Nov 2020 14:44:58 +0100
Subject: [Buildroot] [PATCH] package/rauc: fix host build with systemd
In-Reply-To: <20201113143302.4c3d87d6@windsurf.home>
References: <20201113122605.901352-1-b.bilas@grinn-global.com>
 <20201113140806.5f376fc4@windsurf.home>
 <3e457876-5396-1982-2cbb-8ef04cf1e064@grinn-global.com>
 <20201113143302.4c3d87d6@windsurf.home>
Message-ID: <70da8399-5c3c-473a-3c5e-c05dd07aefd9@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 13.11.2020 14:33, Thomas Petazzoni wrote:
> Hello,
>
> On Fri, 13 Nov 2020 14:28:01 +0100
> Bartosz Bilas <b.bilas@grinn-global.com> wrote:
>
>> ouch, I meant about HOST_DIR but I typed STAGING_DIR for some reason...
>> Shouldn't we pass the --prefix=/usr to configure and DESTDIR=$(HOST_DIR)
>> to make in that case?
> No. --prefix= is where the software will be executed from, so from host
> binaries it must be --prefix=$(HOST_DIR), and DESTDIR not used.
>
> It is when you're cross-compiling that there is a difference between
> where the software will be executed from (--prefix) and where you
> install it after the build (DESTDIR). That's why when cross-compiling
> you have --prefix=/usr, and DESTDIR=$(TARGET_DIR) or
> DESTDIR=$(STAGING_DIR). This means "at runtime the software will be in
> /usr, but for the installation please put it in TARGET_DIR/usr".
>
> Does that make sense ?
Yes, it does. Let's reject this patch then.
> Thomas 
Best
Bartek
