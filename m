From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 13 Dec 2011 07:34:15 +0200
Subject: [Buildroot] connman dowload failure
In-Reply-To: <87wra2t1q6.fsf@macbook.be.48ers.dk>
References: <20111212120653.GF4531@sapphire.tkos.co.il>
 <87wra2t1q6.fsf@macbook.be.48ers.dk>
Message-ID: <20111213053415.GA11676@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Mon, Dec 12, 2011 at 01:26:41PM +0100, Peter Korsgaard wrote:
> >>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
> 
>  Baruch> Hi Buildroot list,
>  Baruch> I'm trying to build connman for my platform, but the build fails at the source 
>  Baruch> download stage using both git and wget. This is the output of 'make V=1':
> 
>  >>>> connman 0.78 Downloading
> 
>  Baruch>  test -e /home/baruch/git/buildroot/output/dl/connman-0.78.tar.gz || (pushd /home/baruch/git/buildroot/output/dl > /dev/null && git clone clone --bare git://git.kernel.org/pub/scm/network/connman/connman.git connman-0.78 && pushd connman-0.78 > /dev/null && git clone archive --format=tar --prefix=connman-0.78/ 0.78 | gzip -c > /home/baruch/git/buildroot/output/dl/connman-0.78.tar.gz && popd > /dev/null && rm -rf /home/baruch/git/buildroot/output/dl/connman-0.78 && popd > /dev/null) && exit 
> 
> This is caused by cf71111b99ab951 (Cleanup the VCS commands
> configuration). The BR2_GIT variable changed from "git clone" to just
> "git". If you change that in your .config it should work again.

Thanks for the tip.

Eventually I had to manually clone connman.git with http, and generate a tar 
file because of a stupid firewall rule blocking the native git port :-(.

Can you put a connman tar file in http://sources.buildroot.net for others 
similarly unlucky, so that at least the wget fallback will succeed?

Thanks,
baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
