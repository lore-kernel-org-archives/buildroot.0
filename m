From: Frederic Bassaler <frederic.bassaler@gmail.com>
Date: Thu, 11 Aug 2011 22:56:26 +0200
Subject: [Buildroot] Trying to package imlib2
In-Reply-To: <1313094934.731.11.camel@matias-lnx-host>
References: <20110811203541.3b238665@gmail.com>
 <1313091113.731.6.camel@matias-lnx-host>
 <20110811221808.51b334d7@gmail.com>
 <1313094934.731.11.camel@matias-lnx-host>
Message-ID: <20110811225626.2c1acf53@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 11 Aug 2011 16:35:34 -0400,
Matias Garcia <mgarcia@rossvideo.com> a ?crit :

> > And it builds further, then there's a different
> > error :
> > 
> > ...
> > Making all in modules
> > make[4]: entrant dans le r?pertoire
> > ? /home/fred/buildroot/output/build/imlib2-1.4.4/src/modules ?
> > Making all in loaders make[5]: entrant dans le r?pertoire
> > ? /home/fred/buildroot/output/build/imlib2-1.4.4/src/modules/loaders
> > ? CC     png_la-loader_png.lo CC     jpeg_la-loader_jpeg.lo
> > loader_png.c: In function 'load':
> > loader_png.c:61: error: dereferencing pointer to incomplete type
> > loader_png.c: In function 'save':
> > loader_png.c:268: error: dereferencing pointer to incomplete type
> > loader_png.c:280: error: dereferencing pointer to incomplete type
> > loader_png.c:289: error: dereferencing pointer to incomplete type
> > loader_png.c:300: error: dereferencing pointer to incomplete type
> > make[5]: *** [png_la-loader_png.lo] Erreur 1
> > make[5]: *** Attente des t?ches non termin?es....
> > make[5]: quittant le r?pertoire
> > ? /home/fred/buildroot/output/build/imlib2-1.4.4/src/modules/loaders
> > ? make[4]: *** [all-recursive] Erreur 1 make[4]: quittant le
> > r?pertoire
> > ? /home/fred/buildroot/output/build/imlib2-1.4.4/src/modules ?
> > make[3]: *** [all-recursive] Erreur 1 make[3]: quittant le
> > r?pertoire ? /home/fred/buildroot/output/build/imlib2-1.4.4/src ?
> > make[2]: *** [all-recursive] Erreur 1 make[2]: quittant le
> > r?pertoire ? /home/fred/buildroot/output/build/imlib2-1.4.4 ?
> > make[1]: *** [all] Erreur 2 make[1]: quittant le r?pertoire
> > ? /home/fred/buildroot/output/build/imlib2-1.4.4 ? make: ***
> > [/home/fred/buildroot/output/build/imlib2-1.4.4/.stamp_built]
> > Erreur 2
> > 
> > 
> > 
> > Maybe something is still missing?
> 
> Have you looked in loader_png.c? We had to patch that file in 1.4.0,
> changing a deprecated function:
> 
> -                png_set_gray_1_2_4_to_8(png_ptr);
> +                png_set_expand_gray_1_2_4_to_8(png_ptr);

this appears to have been corrected in imlib2 1.4.4 


> 
> But it doesn't look like that's your problem. Perhaps you're using a
> newer libpng? I haven't looked at those lines, so I can't tell.
> 
> Matias
> 

Yes, I had upgraded my libpng to 1.5.4.

Now I have tried with the libpng 1.4.8, and get the same error too :(
