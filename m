From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Tue, 14 Jan 2020 11:02:34 +0300
Subject: [Buildroot] [PATCH 1/1] package/wpa_supplicant: disable TEAP
 for internal TLS implementation
In-Reply-To: <17bdeec1-8e1f-9049-f285-853cb34fcfdc@mind.be>
References: <20200108190439.459316-1-geomatsi@gmail.com>
 <17bdeec1-8e1f-9049-f285-853cb34fcfdc@mind.be>
Message-ID: <20200114080234.lcyzcovnetczvw6i@bars>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> On 08/01/2020 20:04, Sergey Matyukevich wrote:
> > EAP-TEAP support in hostapd/wpa_supplicant fails to build with internal
> > TLS implementation. This patch disables TEAP support in wpa_supplicant
> > when internal TLS implementation is selected. Similar fix for hostapd
> > package has already been merged to Buildroot: see commit 47d14e3b1c20
> > ("package/hostapd: disable TEAP for internal TLS implementation").
> > 
> > TEAP is still an experimental feature that is not recommmended for
> > production use. Currently it should not be used for anything else
> > than experimentation and interoperability testing. Those who needs
> > experimenting with TEAP are encouraged to enable openssl in their
> > buildroot configuration.
> 
>  So then why don't we just unconditionally disable this feature? Preferably with
> a comment in the .mk file that it's disabled due to its experimental nature, so
> that someone who needs it a couple of years down the line can note that it's not
> longer experimental.

Well, this is another possible option. But I don't see why we should
disable it completely. TEAP does not build with internal hostapd TLSv1
implementation, which in its turn is also marked as experimental. On
the other hand, TEAP successfully builds if OpenSSL is selected as TLS
implementation. So why don't we just disable known broken combination,
leaving the choice between working combinations to the end user.

Regards,
Sergey
