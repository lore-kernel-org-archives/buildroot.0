From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 7 Mar 2016 23:06:30 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-03-06
In-Reply-To: <20160307073022.D1A301013FB@stock.ovh.net>
References: <20160307073022.D1A301013FB@stock.ovh.net>
Message-ID: <56DDFB66.4020402@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 07/03/2016 08:30, Thomas Petazzoni wrote:

>          arc |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/305fdc8442cd2e8f51b90485be0dca83ffa36603/

Fails with:
  libpjmedia.so: undefined reference to `srtp_deinit'

Many other failures (not yet mentioned in today e-mail) like this one.
It's an issue with the detection of libsrtp.

>          arm |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/744431e1b47d22222c4d0b48d5d20649dfeed929/
>          arm |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/a10aca9139054502e055cb61f3925637fc515e12/

Needs threads.

I sent patches to fix these errors.

-- 
Luca
