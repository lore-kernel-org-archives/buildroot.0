From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Sat, 9 May 2020 10:28:11 +0200
Subject: [Buildroot] [PATCH 2/2] package/cegui: select libglu when libgl
 is detected
In-Reply-To: <ssa3ogxjat.ln2@ID-313208.user.individual.net>
References: <20200428195844.48124-1-b.bilas@grinn-global.com>
 <20200428195844.48124-2-b.bilas@grinn-global.com>
 <ssa3ogxjat.ln2@ID-313208.user.individual.net>
Message-ID: <8eb56c70-1c83-f1b3-f474-7178b5db7dcb@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi guys,

On 03.05.2020 19:16, Bernd Kuhls wrote:
> Am Tue, 28 Apr 2020 21:58:44 +0200 schrieb Bartosz Bilas:
>
>> Fixes:
>>    include/GL/glew.h:1205:14: fatal error: GL/glu.h: No such file or
>>    directory
> Cegui directly includes GL/glu.h:
>
> https://github.com/cegui/cegui/blob/master/cegui/include/CEGUI/
> RendererModules/OpenGL/GL.h#L49
>
> which makes libglu a hard dependency for this package even when
> -DGLEW_NO_GLU was added to CXXFLAGS.
>
> Reviewed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Thomas could you give some feedback with that patch then?
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
Best
Bartek
