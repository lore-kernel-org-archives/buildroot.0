From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 19 Mar 2015 11:17:57 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-03-18
In-Reply-To: <20150319073018.35B45100D3A@stock.ovh.net>
References: <20150319073018.35B45100D3A@stock.ovh.net>
Message-ID: <550AA255.3060206@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,

On 19/03/15 08:30, Thomas Petazzoni wrote:
> Build statistics for 2015-03-18
> ===============================
>       mipsel |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/901c2d922ea4d126bf6cb1f4e36324601e3a4664/
>     mips64el |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/4d795b723facfde23792e5e2a0c170902d89c621/
>     mips64el |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/a97d1bda93b5fa9ce975145b82a752c957c24cab/
>       mipsel |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/f01e4aa07856db6b7bb63ca07eac1ed0987f3e7f/

The failure is actually in c-periphery. I have fixed it upstream...

https://github.com/vsergeev/c-periphery/commit/0fdfac3264f1dce32991f4ec30d084e34b35181d

...and since c-periphery is "git-cloned" into lua-periphery...

$ grep clone output/build/lua-periphery-1.0.4-1/lua-periphery/Makefile
	git clone git://github.com/vsergeev/c-periphery --depth 1 --branch v1.0.1

...then this problem is automatically fixed in Buildroot! :-)

>       mipsel | trinity-c8c41f99500b5854c20... | NOK | http://autobuild.buildroot.net/results/f9ef222ce1eee07406a7d2ce44412bf7ca017220/

I have fixed this upstream...

https://github.com/kernelslacker/trinity/commit/fb4a1adc4540f0702b84aa900f2b8ebed004885d

...and then in Buildroot...

https://patchwork.ozlabs.org/patch/451807/

Best regards,
--
Vincent
