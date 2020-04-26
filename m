From: Nicola Di Lieto <nicola.dilieto@gmail.com>
Date: Sun, 26 Apr 2020 18:07:26 +0200
Subject: [Buildroot] [PATCH v4,
 1/1] package/uacme: don't allow mbedtls with ualpn
In-Reply-To: <CAPi7W80pWfiaoxoC4rYKv8Bj87s9TU0URBGKwXYxDU-ssNNn_A@mail.gmail.com>
References: <20200426110534.1758730-1-fontaine.fabrice@gmail.com>
 <20200426113639.GA5035@scaer>
 <20200426141309.61837b4f@windsurf.home>
 <CAPi7W80pWfiaoxoC4rYKv8Bj87s9TU0URBGKwXYxDU-ssNNn_A@mail.gmail.com>
Message-ID: <20200426160726.wldkx25poeqttuxp@einstein.dilieto.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Apr 26, 2020 at 02:30:04PM +0200, Fabrice Fontaine wrote:
>> Do we need a choice in the first place ?
>v2 didn't add a choice but it was a bit too confusing so I made v3/v4
>upon Yann's request. I'll wait for your feedback before making a new
>iteration.

Hi Fabrice,

I think the idea of a backend choice menu is good, if you manage to sort 
out all the subtleties. There is a similar thing in libcurl which maybe 
you could have a look at:

https://git.busybox.net/buildroot/tree/package/libcurl/Config.in

As an aside, I filed a pull request with mbedTLS. If it gets accepted 
I'll be able to make ualpn work with mbedTLS without depending on 
MBEDTLS_X509_ALLOW_UNSUPPORTED_CRITICAL_EXTENSION:

https://github.com/ARMmbed/mbedtls/pull/3243

Take care,
Nicola
