From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 25 Sep 2020 11:57:56 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2020-09-24
In-Reply-To: <20200925071202.077EA86CCD@whitealder.osuosl.org>
References: <20200925071202.077EA86CCD@whitealder.osuosl.org>
Message-ID: <878scy8c8b.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Xogium,

On Fri, Sep 25 2020, Thomas Petazzoni wrote:
> Autobuild statistics for 2020-09-24
> ===================================

[...]

>     arm      |         libpcap-1.9.1          | NOK | http://autobuild.buildroot.net/results/058e8ec90da3c06e31b31eb94541331cced44db3 |     

Your autobuilder reported this error several times over the last few
days:

  http://autobuild.buildroot.net/?reason=libpcap-1.9.1

checking for bison... bison -y
checking for capable yacc/bison... insufficient
configure: error: bison -y is insufficient to compile libpcap.
 libpcap requires Bison, a newer version of Berkeley YACC with support
 for reentrant parsers, or another YACC compatible with them.

This is most likely triggered by the recent bison version bump (commit
f4c89374eaec306). For some reason libpcap does not like host-bison on
your machine.

Can you take a look?

Thanks,
baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
