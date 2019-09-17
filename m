From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 17 Sep 2019 08:40:45 +0300
Subject: [Buildroot] Adding build-time dependency on virtual package
In-Reply-To: <CAEEV9O3j8eDQpOAcjMoAn9VLTopOETjHb6V=2jaYMD7K_c4H6A@mail.gmail.com>
References: <CAEEV9O3j8eDQpOAcjMoAn9VLTopOETjHb6V=2jaYMD7K_c4H6A@mail.gmail.com>
Message-ID: <20190917054045.aqcxiqtej5xocczx@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mark,

On Mon, Sep 16, 2019 at 05:52:04PM -0500, Mark Hawthorne wrote:
> I am building a package which requires an implementation of libegl. The EGL
> library is specified as a virtual package. How do I add EGL as a build time
> dependency without specify the package which implements the virtual package?
> 
> For example, right now my package dependency variable looks like this:
> MY_PKG_DEPENDENCIES = ti-sgx-um
> 
> ...where ti-sgx-um provides the EGL library. However, this locks this
> package into a specific GPU library.

Just add libegl to your _DEPENDENCIES. See efl, kodi, libwpe, and more.

The manual doesn't mention that in section 17.11.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
