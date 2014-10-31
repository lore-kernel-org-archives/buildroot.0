From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 31 Oct 2014 11:53:18 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-10-30
In-Reply-To: <20141031073016.162E2100B71@stock.ovh.net>
References: <20141031073016.162E2100B71@stock.ovh.net>
Message-ID: <20141031095318.GB2453@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Gustavo,

On Fri, Oct 31, 2014 at 08:30:15AM +0100, Thomas Petazzoni wrote:
>          arm |                  nss-mdns-0.10 | NOK | http://autobuild.buildroot.net/results/7dba3a78013db577ddd17fc7db4b36ecea2bbc0b/
>         i686 |                  nss-mdns-0.10 | NOK | http://autobuild.buildroot.net/results/e390e383f6481c82b936d8a644784803a2536dad/

sed -r -i -e 's/^(hosts:[[:space:]]+).*/\1files mdns4_minimal [NOTFOUND=return] dns mdns4/' /home/buildroot/instance-1/output/target/etc/nsswitch.conf
sed: can't read /home/buildroot/instance-1/output/target/etc/nsswitch.conf: No such file or directory

This is caused by e1eba3d97c5d4 (system/skeleton: make nsswitch install 
conditional). nss-mdns expect nsswitch.conf to exist when it builds, while 
this commit postpones nsswitch.conf installation to target_finalize. Not sure 
what to do with that, though. Move it to an earlier hook?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
