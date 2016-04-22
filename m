From: =?UTF-8?Q?S=c3=a9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Fri, 22 Apr 2016 11:13:04 +0200
Subject: [Buildroot] [RPi3] Trying to test WiFi On Raspberr Pi 3
In-Reply-To: <CALtfCQZ9GAfL3qYuJK97XAETVhE4PNnr+R6aL-2JBC6UrRTn1w@mail.gmail.com>
References: <CALtfCQYZXSFWSv8m5y+BkwKx-iOPrgYpZypvmtk_i2MLZebeiw@mail.gmail.com>
 <CALtfCQZ9GAfL3qYuJK97XAETVhE4PNnr+R6aL-2JBC6UrRTn1w@mail.gmail.com>
Message-ID: <5719EB20.6090107@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 04/22/2016 09:57 AM, Oscar Gomez Fuente wrote:
> Hi everyone,
> 
> I've got updates in my WiFi issue. I had to install the following package:
> crda, iw & wireless-regdb, and now I've got another log kernel:
> 
> [    5.314552] bcm2835-wdt 3f100000.watchdog: Broadcom BCM2835 watchdog
> timer
> [    5.402552] cfg80211: Calling CRDA to update world regulatory domain
> [    5.531269] brcmfmac: brcmf_sdio_drivestrengthinit: No SDIO Drive
> strength init done for chip 43430 rev 1 pmurev 24
> [    5.542704] usbcore: registered new interface driver brcmfmac
> [    5.646701] cfg80211: World regulatory domain updated:
> [    5.651915] cfg80211:  DFS Master region: unset
> [    5.656271] cfg80211:   (start_freq - end_freq @ bandwidth),
> (max_antenna_gain, max_eirp), (dfs_cac_time)
> [    5.666112] cfg80211:   (2402000 KHz - 2472000 KHz @ 40000 KHz), (N/A,
> 2000 mBm), (N/A)
> [    5.674157] cfg80211:   (2457000 KHz - 2482000 KHz @ 20000 KHz, 92000
> KHz AUTO), (N/A, 2000 mBm), (N/A)
> [    5.683636] cfg80211:   (2474000 KHz - 2494000 KHz @ 20000 KHz), (N/A,
> 2000 mBm), (N/A)
> [    5.691672] cfg80211:   (5170000 KHz - 5250000 KHz @ 80000 KHz, 160000
> KHz AUTO), (N/A, 2000 mBm), (N/A)
> [    5.701197] cfg80211:   (5250000 KHz - 5330000 KHz @ 80000 KHz, 160000
> KHz AUTO), (N/A, 2000 mBm), (0 s)
> [    5.710708] cfg80211:   (5490000 KHz - 5730000 KHz @ 160000 KHz), (N/A,
> 2000 mBm), (0 s)
> [    5.718823] cfg80211:   (5735000 KHz - 5835000 KHz @ 80000 KHz), (N/A,
> 2000 mBm), (N/A)
> [    5.726882] cfg80211:   (57240000 KHz - 63720000 KHz @ 2160000 KHz),
> (N/A, 0 mBm), (N/A)
> [    6.282934] bcm2835-rng 3f104000.rng: hwrng registered
> [    6.287471] gpiomem-bcm2835 3f200000.gpiomem: Initialised: Registers at
> 0x3f20000
> [    6.297029] spi spi0.0: setting up native-CS0 as GPIO 8
> [    6.302858] spi spi0.1: setting up native-CS1 as GPIO 7
> [    6.353559] i2c /dev entries driver
> [    6.587009] brcmfmac: brcmf_sdio_htclk: HT Avail timeout (1000000):
> clkctl 0x50
> [    7.085459] NET: Registered protocol family 10
> [    7.597263] brcmfmac: brcmf_sdio_htclk: HT Avail timeout (1000000):
> clkctl 0x50
> [    8.607304] brcmfmac: brcmf_sdio_htclk: HT Avail timeout (1000000):
> clkctl 0x50
> 

I have the same issue with this chip on the board I'm working on. I have
found out that if I unload and reload the module it then works.

Regards,

-- 
S?bastien Szymanski
Software Engineer
Armadeus Systems - A new vision of the embedded world
sebastien.szymanski at armadeus.com
Tel: +33 (0)9 72 29 41 44
Fax: +33 (0)9 72 28 79 26
