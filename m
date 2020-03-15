From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sun, 15 Mar 2020 23:07:57 +0300
Subject: [Buildroot] [PATCH 1/1] package/wpa_supplicant: disable TEAP
 for internal TLS implementation
In-Reply-To: <20200108190439.459316-1-geomatsi@gmail.com>
References: <20200108190439.459316-1-geomatsi@gmail.com>
Message-ID: <20200315200757.GA5880@curiosity>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 08, 2020 at 10:04:39PM +0300, Sergey Matyukevich wrote:
> EAP-TEAP support in hostapd/wpa_supplicant fails to build with internal
> TLS implementation. This patch disables TEAP support in wpa_supplicant
> when internal TLS implementation is selected. Similar fix for hostapd
> package has already been merged to Buildroot: see commit 47d14e3b1c20
> ("package/hostapd: disable TEAP for internal TLS implementation").
> 
> TEAP is still an experimental feature that is not recommmended for
> production use. Currently it should not be used for anything else
> than experimentation and interoperability testing. Those who needs
> experimenting with TEAP are encouraged to enable openssl in their
> buildroot configuration.
> 
> Fixes:
> http://autobuild.buildroot.net/results/e83613c06041a60f89da787f4ebf876245713cd2/

Also fixes similar recent autobuild failure:
http://autobuild.buildroot.net/results/c52dd7fbb74d8f7bdd0149ce0bd90f89caec5776/

Regards,
Sergey
