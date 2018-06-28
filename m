From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 28 Jun 2018 11:15:36 +0200
Subject: [Buildroot] [PATCH 1/1] gnuradio: needs host-python2
In-Reply-To: <20180628102352.5a997e68@windsurf.home>
References: <20180626214326.27205-1-fontaine.fabrice@gmail.com>
 <20180627033622.23ouuvp2zvr4cw5y@sapphire.tkos.co.il>
 <CAPi7W82WL5MwxnQWri0dg5Ep92fHedomD3XJHLViLGUcr2JwXA@mail.gmail.com>
 <CAPi7W82zbZLPORsXG989MfnFVitVEFELC1FU1GDGk_0n19oMDA@mail.gmail.com>
 <20180628032558.b4bgdv2qdpzssean@tarshish>
 <CAGm1_kuvRh-wam8N-wOyuoyfROc7J_K7FY4SFA55b-Omivmo+g@mail.gmail.com>
 <20180628102352.5a997e68@windsurf.home>
Message-ID: <CAGm1_kufkaKQ_F=kWy2ihKXq9r6H7bOaNBHoRUfQE89N9-dWYQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Jun 28, 2018 at 10:23 AM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Hello Yegor,
>
> On Thu, 28 Jun 2018 09:58:21 +0200, Yegor Yefremov wrote:
>
>> This patch did it for me. I've made "make defconfig", select ARM for
>> A8 series, Linaro toolchain and python 2. Then I've just selected
>> gnuradio and its python support.
>>
>> In this case no host-python3 will be built because we select general
>> Python 2 support for the target (as gnuradio enforces) and hence only
>> host-python will be built.
>
> Did you test with python3 enabled for the target ?
>
> Then you will see the problem that Fabrice is facing.
>
> When python3 is enabled for the target, then the default host python
> version is python3. And due to this, all external host Python modules
> are installed for host python3, and not available for host python2.

You're right. Then for now I see only one quick and dirty hack -
install host versions of six and mako when installing host-python by
default.

Yegor
