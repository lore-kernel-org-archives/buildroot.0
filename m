From: Alexjan Carraturo <axjslack@gmail.com>
Date: Mon, 25 Jul 2011 10:10:47 +0200
Subject: [Buildroot] [git commit] e2fsprogs: Add missing dependency of
	tst_uuid.o on uuid.h
In-Reply-To: <87d3gyu6x0.fsf@macbook.be.48ers.dk>
References: <20110724222706.574988B495@busybox.osuosl.org>
 <CACR8Qs_yv1OspsG_byHSTXm5pZ1UMgrMVj0GXf8Rvovk-4+Lpw@mail.gmail.com>
 <87pqkyu8gr.fsf@macbook.be.48ers.dk>
 <CACR8Qs_+2UPkMi4PLx-0m6sBtrSOtKa4Qwp_kju9Hmu+SmBgnQ@mail.gmail.com>
 <87d3gyu6x0.fsf@macbook.be.48ers.dk>
Message-ID: <CACR8Qs-Ck_eSKgG2BxSAGaDWkBzLusoiGphaJnmmgUN=4CFfrg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2011/7/25 Peter Korsgaard <jacmet@sunsite.dk>:
>>>>>> "Alexjan" == Alexjan Carraturo <axjslack@gmail.com> writes:
>
> ?>> Do you have a custom HOST_CFLAGS defined in your environment or on the
> ?>> make cmdline by any chance?
>
> ?Alexjan> No I doesn't define custum CFLAGS. I'm pretty sure about this. May I
> ?Alexjan> found some workaround about this?
>
> Well, could you send me the output of:
>
> set|grep CFLAGS
>
> And then apply this little patch:
>
> diff --git a/package/Makefile.in b/package/Makefile.in
> index c3af5d3..fa01d1b 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -140,6 +140,12 @@ HOST_CFLAGS ? ?= -O2
> ?HOST_CFLAGS ? += -I$(HOST_DIR)/include -I$(HOST_DIR)/usr/include
> ?HOST_CXXFLAGS += -I$(HOST_DIR)/include -I$(HOST_DIR)/usr/include
> ?HOST_LDFLAGS ?+= -L$(HOST_DIR)/lib -L$(HOST_DIR)/usr/lib -Wl,-rpath,$(HOST_DIR)
> +
> +debug:
> + ? ? ? @echo CFLAGS=$(HOST_CFLAGS)
> + ? ? ? @echo CXXFLAGS=$(HOST_CXXFLAGS)
> + ? ? ? @echo LDFLAGS=$(HOST_LDFLAGS)
> +
> ?HOST_PATH=$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(PATH)
>
> ?# hostcc version as an integer - E.G. 4.3.2 => 432
>
> And send me the output of make debug
>


set|grep CFLAGS

(null) no output


make debug (with your patch)

package/Makefile.in:144: *** separatore  assente.  Stop.


Note: Separatore assente means "missing separator"


Thanks and regards
Alexjan.


> --
> Bye, Peter Korsgaard
>



-- 
Alexjan Carraturo
--
Free Software User Group Italia administrator (http://www.fsugitalia.org)
Fedora/OpenSUSE Ambassador
member of FSFE Italian Team

Twitter/Facebook/Identica: axjslack
Blog: http://axjslack.wordpress.com
--
