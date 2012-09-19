From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 19 Sep 2012 09:40:27 +0300
Subject: [Buildroot] [PATCH] poco: fix parallel build failure
In-Reply-To: <87pq5ko3fq.fsf@macbook.be.48ers.dk>
References: <983f847ed905297a7f8e78b258e482c71b13232a.1346227179.git.baruch@tkos.co.il>
 <87pq5ko3fq.fsf@macbook.be.48ers.dk>
Message-ID: <20120919064026.GB26247@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Mon, Sep 17, 2012 at 09:27:21PM +0200, Peter Korsgaard wrote:
> >>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
>  Baruch> This added patch should fix
>  Baruch> http://autobuild.buildroot.net/results/1bf7e51ef30af9bbf5e423e80ef07212b83bdaf8/.
> 
>  Baruch> CROSSENV is now required also in the install stages to prevent
>  Baruch> a rebuild using the host native toolchain.
> 
> Sorry, this doesn't actually work. We now have
> 
> http://autobuild.buildroot.net/results/1cca8b4115674f12884bcbc0c680efed0fb939ae/
> 
> Which is because poco now gets rebuilt at the install staging/target
> steps, where we're not passing MYSQL_LIBDIR/INCDIR as all the .o targets
> are considered out of date because of the phony objdirs prerequisite.
> 
> I don't right away see a clean solution to it (you could use order-only
> ('|') rules, but it isn't really pretty), so I simply reverted this and
> just changed the build step to use MAKE1.
> 
> Feel free to submit a correct patch insted.

Thanks. I'll work on something better if I have time.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
