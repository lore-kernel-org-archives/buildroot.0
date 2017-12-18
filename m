From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 18 Dec 2017 08:17:23 +0200
Subject: [Buildroot] How to configure prefix in package-config files
In-Reply-To: <c79b43c3-e314-7283-d280-cafc5dbe8449@passivsystems.com>
References: <c79b43c3-e314-7283-d280-cafc5dbe8449@passivsystems.com>
Message-ID: <20171218061723.xgzil3et3pbomhgz@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi John,

On Sun, Dec 17, 2017 at 05:15:22PM +0000, John Parten wrote:
> Hello Everyone in the Buildroot Community,
> 
> I am a novice with Buildroot so I hope someone can easily help me.
> I have a requirement to build a cross compiled (x86->arm) toolchain, and
> then copy this to an independent path (eg /opt/XXX)
> I don't seem to be able to find the mechanism to adjust the prefix in the
> package-config (.pc) files that are generated for the libraries.
> I think I am looking for something in menuconfig, but perhaps that is where
> I am going wrong.
> When I attempt to compile a project using the new toolchain installed at
> /opt/XXX various header files cannot be found because the library package
> control files refer to /usr/bin instead of /opt/XXX

The newly introduced (since version 2017.08) 'sdk' make target (i.e. running 
'make sdk') should do this automatically as far as I understand. 
Unfortunately, this feature is not documented in the manual yet. See the 
2017.08-rc1 entry in the CHANGES file for little more details.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
