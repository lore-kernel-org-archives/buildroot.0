From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 03 Dec 2020 13:05:19 +0200
Subject: [Buildroot] Is it possible to have buildroot build the static
 versions of GStreamer & GStreamer plugins?
In-Reply-To: <8D8223CE-C315-454B-8E9F-F3F4742A293A@hxcore.ol>
References: <8D8223CE-C315-454B-8E9F-F3F4742A293A@hxcore.ol>
Message-ID: <87czzrno9c.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Reuven,

On Thu, Dec 03 2020, Reuven Wachtfogel wrote:
> GStreamer packages seem to ignore BR2_SHARED_STATIC_LIBS=y.
> Is there another way?

Try setting BR2_STATIC_LIBS (static only). Note that some plugins do not
support static build (!BR2_STATIC_LIBS dependency). In most cases this
is due to dependency on libraries that do not support static build.

Hope this helps,
baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
