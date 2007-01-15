From: andersen at uclibc.org <andersen@uclibc.org>
Date: Mon, 15 Jan 2007 14:33:55 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/xorg
Message-ID: <20070115223355.C2E894856D@busybox.net>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

Author: andersen
Date: 2007-01-15 14:33:55 -0800 (Mon, 15 Jan 2007)
New Revision: 17318

Log:
update xorg build a bit more, trim the default set of bitmapped
fonts, add in the DejaVu line of unicode supporting truetype fonts


Added:
   trunk/buildroot/package/xorg/Xserver
   trunk/buildroot/package/xorg/Xsession
   trunk/buildroot/package/xorg/fonts.alias
   trunk/buildroot/package/xorg/fonts.cache-1

Modified:
   trunk/buildroot/package/xorg/xorg.conf
   trunk/buildroot/package/xorg/xorg.mk


Changeset:
Added: trunk/buildroot/package/xorg/Xserver
===================================================================
--- trunk/buildroot/package/xorg/Xserver	                        (rev 0)
+++ trunk/buildroot/package/xorg/Xserver	2007-01-15 22:33:55 UTC (rev 17318)
@@ -0,0 +1,2 @@
+#!/bin/sh
+exec /usr/bin/X11/X -br dpms nologo -nolisten tcp


Property changes on: trunk/buildroot/package/xorg/Xserver
___________________________________________________________________
Name: svn:executable
   + *

Added: trunk/buildroot/package/xorg/Xsession
===================================================================
--- trunk/buildroot/package/xorg/Xsession	                        (rev 0)
+++ trunk/buildroot/package/xorg/Xsession	2007-01-15 22:33:55 UTC (rev 17318)
@@ -0,0 +1,5 @@
+#!/bin/sh
+export GDK_USE_XFT=1
+export LANG="en_US.UTF-8"
+export LC_ALL="en_US.UTF-8"
+/usr/bin/X11/rxvt -bg black -fg gray90


Property changes on: trunk/buildroot/package/xorg/Xsession
___________________________________________________________________
Name: svn:executable
   + *

Added: trunk/buildroot/package/xorg/fonts.alias
===================================================================
--- trunk/buildroot/package/xorg/fonts.alias	                        (rev 0)
+++ trunk/buildroot/package/xorg/fonts.alias	2007-01-15 22:33:55 UTC (rev 17318)
@@ -0,0 +1,6 @@
+fixed        -misc-fixed-medium-r-normal--14-130-75-75-c-70-iso8859-1
+variable     -*-helvetica-bold-r-normal-*-*-120-*-*-*-*-iso8859-1
+7x14         -misc-fixed-medium-r-normal--14-130-75-75-c-70-iso8859-1
+7x14bold     -misc-fixed-bold-r-normal--14-130-75-75-c-70-iso8859-1
+
+-misc-fixed-medium-r-normal--14-110-100-100-c-70-iso8859-1 -misc-fixed-medium-r-normal--14-130-75-75-c-70-iso8859-1

Added: trunk/buildroot/package/xorg/fonts.cache-1
===================================================================
--- trunk/buildroot/package/xorg/fonts.cache-1	                        (rev 0)
+++ trunk/buildroot/package/xorg/fonts.cache-1	2007-01-15 22:33:55 UTC (rev 17318)
@@ -0,0 +1,12 @@
+"DejaVuSans-BoldOblique.ttf" 0 "DejaVu Sans:familylang=en:style=Bold Oblique:stylelang=en:slant=110:weight=200:width=100:foundry=unknown:index=0:outline=True:scalable=True:charset=  |>^1!|>^1!P0oWQ |>^1!|>^1!|>^1!!!!%#|>^1!|>^1!|>^1!|>^1!|>^1!|>^1!|>^1!|>^1!!!!)$|>^1!|>^1!|>T)%|>^1!|>^1!|>^1!|>^1!!3Vg{!!!.%|>^1!|>^1!4w}6a;wnZM|>[gE|>^0{|>XZQ|>^1!!!!1&|>^1!|>^1!|>^1!|>^1!|>^/Q|>^1!|>XZQ#?>K%!!!4(!!.)!|>J~~{ma}P|>^0~!!!;)   !!#$D|97t]!!!V[(1+e+$h6vZyf*@@{{B$~  !!#(E|>^1!|>^1!|>^1!|>^1!(1+e4|>^1!|>^1!#?>K%!!#+F9Bx6P|>^1!^{M at P9WIli|>^1!|97t]w)J%tP+*+*!!#0G|>^1!|>T.!P0oWQ|<;7s!!&TQ!(LZY  !!#3HKWc2J$^09z|<ls#|>^1!|>T)4|>^1!|>^1!|>^1!!!#6I|>^1!9UgxA|>^0~|>^1!|>^1!!)RAf{{D?(|>9/f!!#9J!|?)&!!!;Q /?6HG !!$<j!!&TR !!#>K !!!!1 !!!1%    !!#AL    |>^1!|>^1!|>^1!|>^1!!!#DM|>^1!|>^1!|>^1!|>^1!/?6HF!!B7)  !!#GN|>]fO|>^+~Ow1gH|>^0~{~h at FP0fQP !!!T5!!#JO|>^0~|>^1!|>^1!|>^1!|>^1!|>^1!|>^1!|>^1!!!#MP      !)n<!!!!?+!!#PQ!!%|B  q~Ki^|>^1!$WSXE #xw^)!!#SR!#>r1       !!+Wr&0h?q P0oWR     !!+u{!ANVJ       !!.%!       /?6HG:lang=aa|ab|af|ast|ava|ay|az|ba|bam|be|bg|bi|bin|br|bs|bua|ca|ce|ch|chm|co|cs|cu|cv|cy|da|de|el|en|eo|es|et|eu|fi|fj|fo|fr|ful|fur|fy|ga|gd|gl|gn|gv|ha|haw|ho|hr|hu|hy|ia|ibo|id|ie|ik|io|is|it|kaa|ki|kk|kl|ku|kum|kv|kw|ky|la|lb|lez|lt|lv|mg|mh|mi|mk|mo|mt|nb|nds|nl|nn|no|ny|oc|om|os|pl|pt|rm|ro|ru|sah|sco|se|sel|sh|sk|sl|sm|sma|smj|smn|sms|so|sq|sr|sv|sw|tg|tk|tn|to|tr|ts|tt|tw|tyv|uk|uz|ven|vi|vo|vot|wa|wen|wo|xh|yap|yo|zu:fontversion=176947:fontformat=TrueType"
+"DejaVuSans-Bold.ttf" 0 "DejaVu Sans:familylang=en:style=Bold:stylelang=en:slant=0:weight=200:width=100:foundry=unknown:index=0:outline=True:scalable=True:charset=  |>^1!|>^1!P0oWQ |>^1!|>^1!|>^1!!!!%#|>^1!|>^1!|>^1!|>^1!|>^1!|>^1!|>^1!|>^1!!!!)$|>^1!|>^1!|>T)%|>^1!|>^1!|>^1!|>^1!!3Vg{!!!.%|>^1!|>^1!4xpki;wnZM|>[gE|>^0{|>XZQ|>^1!!!!1&|>^1!|>^1!|>^1!|>^1!|>^/Q|>^1!|>XZQ#?>K%!!!4(!!.)!|>J~~{ma}P|>^0~!!!;)   !!!7)Rim;3$WUr)#F+zm{ao04!FFpNQNVtK!!$qe#?3E%!!#$D|97t]!!!V[(1+e+$h6vZyf*@@{{B$~  !!#(E|>^1!|>^1!|>^1!|>^1!(1+e4|>^1!|>^1!#?>K%!!#+F9Bx6P|>^1!^{M at P9WIli|>^1!|97t]w)J%tP+*+*!!#0G|>^1!|>T.!P0oWQ|<;7s!!&TQ!(LZY  !!#3HKWc2J$^09z|<ls#|>^1!|>T)4|>^1!|>^1!|>^1!!!#6I|>^1!9UgxA|>^0~|>^1!|>^1!!)RAf{{D?(|>9/f!!#9J!|?)&!!!;Q /?6HG !!$<j!!&TR !!#>K !!!!1 !!!1%    !!#AL    |>^1!|>^1!|>^1!|>^1!!!#DM|>^1!|>^1!|>^1!|>^1!/?6HF!!B7)  !!#GN|>]fO|>^+~Ow1gH|>^0~{~h at FP0fQP !!!T5!!#JO|>^0~|>^1!|>^1!|>^1!|>^1!|>^1!|>^1!|>^1!!!#MP      !)n<!!!!?+!!#PQ!!%|B  q~Ki^|>^1!$WSXE #xw^)!!#SR!#>r1       !!+Wr&0h?q P0oWR     !!+u{!ANVJ |>6r||>^1!gm&i! #xw^)w0TUs!!+~~   |9.n]|>^1!|>^1!|>^1!ZK#{t!!.%!       /?6HG:lang=aa|ab|af|ar|ast|ava|ay|az|az-ir|ba|bam|be|bg|bi|bin|br|bs|bua|ca|ce|ch|chm|co|cs|cu|cv|cy|da|de|el|en|eo|es|et|eu|fa|fi|fj|fo|fr|ful|fur|fy|ga|gd|gl|gn|gv|ha|haw|ho|hr|hu|hy|ia|ibo|id|ie|ik|io|is|it|kaa|ki|kk|kl|ku|ku-ir|kum|kv|kw|ky|la|lb|lez|lt|lv|mg|mh|mi|mk|mo|mt|nb|nds|nl|nn|no|ny|oc|om|os|pl|pt|rm|ro|ru|sah|sco|se|sel|sh|sk|sl|sm|sma|smj|smn|sms|so|sq|sr|sv|sw|tg|tk|tn|to|tr|ts|tt|tw|tyv|ug|uk|uz|ven|vi|vo|vot|wa|wen|wo|xh|yap|yo|zu:fontversion=176947:fontformat=TrueType"
+"DejaVuSans-Oblique.ttf" 0 "DejaVu Sans:familylang=en:style=Oblique:stylelang=en:slant=110:weight=80:width=100:foundry=unknown:index=0:outline=True:scalable=True:charset=  |>^1!|>^1!P0oWQ |>^1!|>^1!|>^1!!!!%#|>^1!|>^1!|>^1!|>^1!|>^1!|>^1!|>^1!|>^1!!!!)$|>^1!|>^1!|>T)%|>^1!|>^1!|>^1!|>^1!!3Vg{!!!.%|>^1!|>^1!4wUxZ;wnZM|>[gE|>^0{|>XZQ|>^1!!!!1&|>^1!|>^1!|>^1!|>^1!|>^/Q|>^1!|>XZQ#?>K%!!!4(!!.)!|>J~~{ma}P|>^0~!!!;)   !!#$D|97t]!!!V[(1+e+$h6vZyf*@@{{B$~  !!#(E|>^1!|>^1!|>^1!|>^1!(1+e4|>^1!|>^1!#?>K%!!#+F9Bx6P|>^1!^{M at P9WIli|>^1!|97t]w)J%tP+*+*!!#0G|>^1!|>T.!P0oWQ|<;7s!!&TQ!(LZY  !!#3HKWc2J$^09z|<ls#|>^1!|>T)4|>^1!|>^1!|>^1!!!#6I|>^1!9UgxA|>^0~|>^1!|>^1!!)RAf{{D?(|>9/f!!#9J!|?)&!!!;Q /?6HG !!$<j!!&TR !!#>K !!!!1 !!!1%    !!#AL    |>^1!|>^1!|>^1!|>^1!!!#DM|>^1!|>^1!|>^1!|>^1!/?6HF!!B7)  !!#GN|>]fO|>^+~Ow1gH|>^0~{~h at FP0fQP !!!T5!!#JO|>^0~|>^1!|>^1!|>^1!|>^1!|>^1!|>^1!|>^1!!!#MP      !)n<!!!!?+!!#PQ!!%|B  q~Ki^|>^1!$WSXE #xw^)!!#SR!#>r1       !!+Wr&0h?q P0oWR     !!+u{!ANVJ       !!.%!       /?6HG:lang=aa|ab|af|ast|ava|ay|az|ba|bam|be|bg|bi|bin|br|bs|bua|ca|ce|ch|chm|co|cs|cu|cv|cy|da|de|el|en|eo|es|et|eu|fi|fj|fo|fr|ful|fur|fy|ga|gd|gl|gn|gv|ha|haw|ho|hr|hu|hy|ia|ibo|id|ie|ik|io|is|it|kaa|ki|kk|kl|ku|kum|kv|kw|ky|la|lb|lez|lt|lv|mg|mh|mi|mk|mo|mt|nb|nds|nl|nn|no|ny|oc|om|os|pl|pt|rm|ro|ru|sah|sco|se|sel|sh|sk|sl|sm|sma|smj|smn|sms|so|sq|sr|sv|sw|tg|tk|tn|to|tr|ts|tt|tw|tyv|uk|uz|ven|vi|vo|vot|wa|wen|wo|xh|yap|yo|zu:fontversion=176947:fontformat=TrueType"
+"DejaVuSans.ttf" 0 "DejaVu Sans:familylang=en:style=Book:stylelang=en:slant=0:weight=80:width=100:foundry=unknown:index=0:outline=True:scalable=True:charset=  |>^1!|>^1!P0oWQ |>^1!|>^1!|>^1!!!!%#|>^1!|>^1!|>^1!|>^1!|>^1!|>^1!|>^1!|>^1!!!!)$|>^1!|>^1!|>T)%|>^1!|>^1!|>^1!|>^1!!3Vg{!!!.%|>^1!|>^1!4xpki;wnZM|>[gE|>^0{|>XZQ|>^1!!!!1&|>^1!|>^1!|>^1!|>^1!|>^/Q|>^1!|>XZQ#?>K%!!!4(!!.)!|>J~~{ma}P|>^0~!!!;)   !!!7)Rim;3$WUr)#F+zm{ao04!FFpNQNVtK!!$qe#?3E%!!#$D|97t]!!!V[(1+e+$h6vZyf*@@{{B$~  !!#(E|>^1!|>^1!|>^1!|>^1!(1+e4|>^1!|>^1!#?>K%!!#+F9Bx6P|>^1!^{M at P9WIli|>^1!|97t]w)J%tP+*+*!!#0G|>^1!|>T.!P0oWQ|<;7s!!&TQ!(LZY  !!#3HKWc2J$^09z|<ls#|>^1!|>T)4|>^1!|>^1!|>^1!!!#6I|>^1!9UgxA|>^0~|>^1!|>^1!!)RAf{{D?(|>9/f!!#9J!|?)&!!!;Q /?6HG !!$<j!!&TR !!#>K !!!!1 !!!1%    !!#AL    |>^1!|>^1!|>^1!|>^1!!!#DM|>^1!|>^1!|>^1!|>^1!/?6HF!!B7)  !!#GN|>]fO|>^+~Ow1gH|>^0~{~h at FP0fQP !!!T5!!#JO|>^0~|>^1!|>^1!|>^1!|>^1!|>^1!|>^1!|>^1!!!#MP      !)n<!!!!?+!!#PQ!!%|B  q~Ki^|>^1!$WSXE #xw^)!!#SR!#>r1       !!+Wr&0h?q P0oWR     !!+u{!ANVJ |>6r||>^1!gm&i! #xw^)w0TUs!!+~~   |9.n]|>^1!|>^1!|>^1!ZK#{t!!.%!       /?6HG:lang=aa|ab|af|ar|ast|ava|ay|az|az-ir|ba|bam|be|bg|bi|bin|br|bs|bua|ca|ce|ch|chm|co|cs|cu|cv|cy|da|de|el|en|eo|es|et|eu|fa|fi|fj|fo|fr|ful|fur|fy|ga|gd|gl|gn|gv|ha|haw|ho|hr|hu|hy|ia|ibo|id|ie|ik|io|is|it|kaa|ki|kk|kl|ku|ku-ir|kum|kv|kw|ky|la|lb|lez|lt|lv|mg|mh|mi|mk|mo|mt|nb|nds|nl|nn|no|ny|oc|om|os|pl|pt|rm|ro|ru|sah|sco|se|sel|sh|sk|sl|sm|sma|smj|smn|sms|so|sq|sr|sv|sw|tg|tk|tn|to|tr|ts|tt|tw|tyv|ug|uk|uz|ven|vi|vo|vot|wa|wen|wo|xh|yap|yo|zu:fontversion=176947:fontformat=TrueType"
+"DejaVuSansMono-Bold.ttf" 0 "DejaVu Sans Mono:familylang=en:style=Bold:stylelang=en:slant=0:weight=200:width=100:spacing=100:foundry=unknown:index=0:outline=True:scalable=True:charset=  |>^1!|>^1!P0oWQ |>^1!|>^1!|>^1!!!!%#|>^1!|>^1!|>^1!|>^1!|>^0~NrU1Mgbm{d#%n|^!!!)$&olY4|>S8A|>T)%|>^1!|>^1!p(S.VOwzo@!!!1%!!!.%|>^1!|>^1!!BB.#;wnZH|>[gE|>^0{|>XZQ|>T)%!!!1&|>^1!|>^1!|>^1! &vR%x%t7&H|>T}3#?>K%!!#$Dr;]W3 (1+e+$h6vZyf*@@{{B$~  !!#(E!#GD|xJenK8LmtDgfW>$!!)o!5H<IZ!!$/f!}93i!!#+F9Bx6P|>^1!^{M at P9WIli|>^1!|97t]w)J%tP+*+*!!#0G|5epCB^iC}!!!/UQIPyG!!!1%!(/|R  !!#3H!)rmR!!!Kz|<lWx     !!#6ItMN$89;+8L|>^0~|>]1c|;$OI!!!!%z~FrD!!!1%!!#9J!^{K.!!!%& /?6HG !!$<j!!&TR !!#>K !!!!+      !!#AL    |>^1!|>^1!|>^1!|>^1!!!#DM|>^1!{{K.!|>^1!|>^1!/?+uU!!!!%  !!#GN    {}$35|>T(~ !!!!#!!#MP       !!!?+!!#SR!#>r1       !!+fv      !!!!G !!+u{!!!!)       !!.%!       /?6HG:lang=aa|af|ast|ava|ay|bam|be|bg|bi|bin|br|bs|bua|ca|ce|ch|co|cs|cv|cy|da|de|el|en|eo|es|et|eu|fi|fj|fo|fr|ful|fur|fy|gd|gl|gn|gv|ha|haw|ho|hr|hu|ia|id|ie|ik|io|is|it|kaa|ki|kk|kl|ku|kum|kv|kw|ky|la|lb|lez|lt|lv|mg|mh|mi|mk|mo|mt|nb|nds|nl|nn|no|ny|oc|om|os|pl|pt|rm|ro|ru|se|sel|sh|sk|sl|sm|sma|smj|smn|so|sq|sr|sv|sw|tn|to|tr|ts|tw|tyv|uk|uz|ven|vo|vot|wa|wen|wo|xh|yap|yo|zu:fontversion=176947:fontformat=TrueType"
+"DejaVuSansMono-BoldOblique.ttf" 0 "DejaVu Sans Mono:familylang=en:style=Bold Oblique:stylelang=en:slant=110:weight=200:width=100:spacing=100:foundry=unknown:index=0:outline=True:scalable=True:charset=  |>^1!|>^1!P0oWQ |>^1!|>^1!|>^1!!!!%#|>^1!|>^1!|>^1!|>^1!|>^0~NrU1Mgbm{d#%n|^!!!)$&olY4|>S8A|>T)%|>^1!|>^1!p(S.VOwzo@!!!1%!!!.%|>^1!|>^1!!BB.#;wnZH|>[gE|>^0{|>XZQ|>T)%!!!1&|>^1!|>^1!|>^1! &vR%x%t7&H|>T}3#?>K%!!#$Dr;]W3 (1+e+$h6vZyf*@@{{B$~  !!#(E!#GD|xJenK8LmtDgfW>$!!)o!5H<IZ!!$/f!}93i!!#+F9Bx6P|>^1!^{M at P9WIli|>^1!|97t]w)J%tP+*+*!!#0G|5epCB^iC}!!!/UQIPyG!!!1%!(/|R  !!#3H!)rmR!!!Kz|<lWx     !!#6ItMN$89;+8L|>^0~|>]1c|;$OI!!!!%z~FrD!!!1%!!#9J!^{K.!!!%& /?6HG !!$<j!!&TR !!#>K !!!!+      !!#AL    |>^1!|>^1!|>^1!|>^1!!!#DM!!!!#Z+ert!!!%!!!.$~    !!#GN       !!!!#!!#MP       !!!?+!!#SR!#>r1       !!+fv      !!!!G !!+u{!!!!)       !!.%!       /?6HG:lang=aa|af|ast|ava|ay|bam|be|bg|bi|bin|br|bs|bua|ca|ce|ch|co|cs|cv|cy|da|de|el|en|eo|es|et|eu|fi|fj|fo|fr|ful|fur|fy|gd|gl|gn|gv|ha|haw|ho|hr|hu|ia|id|ie|ik|io|is|it|kaa|ki|kk|kl|ku|kum|kv|kw|ky|la|lb|lez|lt|lv|mg|mh|mi|mk|mo|mt|nb|nds|nl|nn|no|ny|oc|om|os|pl|pt|rm|ro|ru|se|sel|sh|sk|sl|sm|sma|smj|smn|so|sq|sr|sv|sw|tn|to|tr|ts|tw|tyv|uk|uz|ven|vo|vot|wa|wen|wo|xh|yap|yo|zu:fontversion=176947:fontformat=TrueType"
+"DejaVuSansMono-Oblique.ttf" 0 "DejaVu Sans Mono:familylang=en:style=Oblique:stylelang=en:slant=110:weight=80:width=100:spacing=100:foundry=unknown:index=0:outline=True:scalable=True:charset=  |>^1!|>^1!P0oWQ |>^1!|>^1!|>^1!!!!%#|>^1!|>^1!|>^1!|>^1!|>^0~NrU1Mgbm{d#%n|^!!!)$&olY4|>S8A|>T)%|>^1!|>^1!p(S.VOwzo@!!!1%!!!.%|>^1!|>^1!!BB.#;wnZH|>[gE|>^0{|>XZQ|>T)%!!!1&|>^1!|>^1!|>^1! &vR%x%t7&H|>T}3#?>K%!!#$Dr;]W3 (1+e+$h6vZyf*@@{{B$~  !!#(E!#GD|xJenK8LmtDgfW>$!!)o!5H<IZ!!$/f!}93i!!#+F9Bx6P|>^1!^{M at P9WIli|>^1!|97t]w)J%tP+*+*!!#0G|5epCB^iC}!!!/UQIPyG!!!1%!(/|R  !!#3H!)rmR!!!Kz|<lWx     !!#6ItMN$89;+8L|>^0~|>]1c|;$OI!!!!%z~FrD!!!1%!!#9J!^{K.!!!%& /?6HG !!$<j!!&TR !!#>K !!!!+      !!#AL|>^1!|>^1!|>^1!|>^1!|>^1!|>^1!|>^1!|>^1!!!#DM!!!!#Z+ert!!!%!!!.$~    !!#GN       !!!!#!!#MP       !!!?+!!#SR!#>r1       !!+fv      !!!!G !!+u{!!!!)       !!.%!       /?6HG:lang=aa|af|ast|ava|ay|bam|be|bg|bi|bin|br|bs|bua|ca|ce|ch|co|cs|cv|cy|da|de|el|en|eo|es|et|eu|fi|fj|fo|fr|ful|fur|fy|gd|gl|gn|gv|ha|haw|ho|hr|hu|ia|id|ie|ik|io|is|it|kaa|ki|kk|kl|ku|kum|kv|kw|ky|la|lb|lez|lt|lv|mg|mh|mi|mk|mo|mt|nb|nds|nl|nn|no|ny|oc|om|os|pl|pt|rm|ro|ru|se|sel|sh|sk|sl|sm|sma|smj|smn|so|sq|sr|sv|sw|tn|to|tr|ts|tw|tyv|uk|uz|ven|vo|vot|wa|wen|wo|xh|yap|yo|zu:fontversion=176947:fontformat=TrueType"
+"DejaVuSansMono.ttf" 0 "DejaVu Sans Mono:familylang=en:style=Book:stylelang=en:slant=0:weight=80:width=100:spacing=100:foundry=unknown:index=0:outline=True:scalable=True:charset=  |>^1!|>^1!P0oWQ |>^1!|>^1!|>^1!!!!%#|>^1!|>^1!|>^1!|>^1!|>^0~NrU1Mgbm{d#%n|^!!!)$&olY4|>S8A|>T)%|>^1!|>^1!p(S.VOwzo@!!!1%!!!.%|>^1!|>^1!!BB.#;wnZH|>[gE|>^0{|>XZQ|>T)%!!!1&|>^1!|>^1!|>^1! &vR%x%t7&H|>T}3#?>K%!!#$Dr;]W3 (1+e+$h6vZyf*@@{{B$~  !!#(E!#GD|xJenK8LmtDgfW>$!!)o!5H<IZ!!$/f!}93i!!#+F9Bx6P|>^1!^{M at P9WIli|>^1!|97t]w)J%tP+*+*!!#0G|5epCB^iC}!!!/UQIPyG!!!1%!(/|R  !!#3H!)rmR!!!Kz|<lWx     !!#6ItMN$89;+8L|>^0~|>]1c|;$OI!!!!%z~FrD!!!1%!!#9J!^{K.!!!%& /?6HG !!$<j!!&TR !!#>K !!!!+      !!#AL|>^1!|>^1!|>^1!|>^1!|>^1!|>^1!|>^1!|>^1!!!#DM|>^1!{{K.!|>^1!|>^1!/?+uU!!!!%  !!#GN    {}$35P0fQP !!!!#!!#MP       !!!?+!!#SR!#>r1       !!+fv      !!!!G !!+u{!!!!)       !!.%!       /?6HG:lang=aa|af|ast|ava|ay|bam|be|bg|bi|bin|br|bs|bua|ca|ce|ch|co|cs|cv|cy|da|de|el|en|eo|es|et|eu|fi|fj|fo|fr|ful|fur|fy|gd|gl|gn|gv|ha|haw|ho|hr|hu|ia|id|ie|ik|io|is|it|kaa|ki|kk|kl|ku|kum|kv|kw|ky|la|lb|lez|lt|lv|mg|mh|mi|mk|mo|mt|nb|nds|nl|nn|no|ny|oc|om|os|pl|pt|rm|ro|ru|se|sel|sh|sk|sl|sm|sma|smj|smn|so|sq|sr|sv|sw|tn|to|tr|ts|tw|tyv|uk|uz|ven|vo|vot|wa|wen|wo|xh|yap|yo|zu:fontversion=176947:fontformat=TrueType"
+"DejaVuSerif-Bold.ttf" 0 "DejaVu Serif:familylang=en:style=Bold:stylelang=en:slant=0:weight=200:width=100:foundry=unknown:index=0:outline=True:scalable=True:charset=  |>^1!|>^1!P0oWQ |>^1!|>^1!|>^1!!!!%#|>^1!|>^1!|>^1!|>^1!|>^0~NrU1M|>^1!|.}*Q!!!)$lrC&L|>^0r|>T)%|>^1!|>^1!zDgQyOwyiz!!$Im!!!.%|>^1!|>^1!!BB.#;wnZH|>[gE|>^0{|>XZQ|>T)%!!!1&|>^1!|>^1!|>^1!!#>r?lZj+i&3p()|>T}3#?>K%!!#$Dr;]W3 (1+e+$h6vZyf*@@{{B$~  !!#(ElrC&L|>VCi|>T^4|>^.4(1+e49WI7i!|(G@#>r3p!!#+F9Bx6P|>^1!^{M at P9WIli|>^1!|97t]w)J%tP+*+*!!#0G|5n[;B^iC}!!!/UQIPyG!!!1%!(4R#  !!#3H!)rmR!!!Kz|<lWx !#Z(4   !!#6Is|M]|!!!Ue!!!%2!!!!Z    !!#9J!|>T/!!!%K /?6HG !!$<j!!&TR !!#>K !!!!+      !!#AL    |>^1!|>^1!|>^1!|>^1!!!#DM!!!!#Z+ert!!!%!!!.$~    !!#GN       !!!!#!!#MP       !!!?+!!#SR!#>r1       !!+fv      !#x>Y !!+u{!!!!)       !!.%!       /?6HG:lang=aa|af|ast|ava|ay|ba|bam|be|bg|bi|bin|br|bs|bua|ca|ce|ch|chm|co|cs|cv|cy|da|de|el|en|eo|es|et|eu|fi|fj|fo|fr|ful|fur|fy|ga|gd|gl|gn|gv|ha|haw|ho|hr|hu|ia|id|ie|ik|io|is|it|kaa|ki|kk|kl|ku|kum|kv|kw|ky|la|lb|lez|lt|lv|mg|mh|mi|mk|mo|mt|nb|nds|nl|nn|no|ny|oc|om|os|pl|pt|rm|ro|ru|sah|se|sel|sh|sk|sl|sm|sma|smj|smn|sms|so|sq|sr|sv|sw|tg|tn|to|tr|ts|tw|tyv|uk|uz|ven|vo|vot|wa|wen|wo|xh|yap|yo|zu:fontversion=176947:fontformat=TrueType"
+"DejaVuSerif-BoldOblique.ttf" 0 "DejaVu Serif:familylang=en:style=Bold Oblique:stylelang=en:slant=110:weight=200:width=100:foundry=unknown:index=0:outline=True:scalable=True:charset=  |>^1!|>^1!P0oWQ |>^1!|>^1!|>^1!!!!%#|>^1!|>^1!|>^1!|>^1!|>^0~NrU1M|>^1!|.}*Q!!!)$lrC&L|>^0r|>T)%|>^1!|>^1!zDgQyOwyiz!!$Im!!!.%|>^1!|>^1!!BB.#;wnZH|>[gE|>^0{|>XZQ|>T)%!!!1&|>^1!|>^1!|>^1!!#>r?lZj+i&3p()|>T}3#?>K%!!#$Dr;]W3 (1+e+$h6vZyf*@@{{B$~  !!#(ElrC&L|>VCi|>T^4|>^.4(1+e49WI7i!|(G@#>r3p!!#+F9Bx6P|>^1!^{M at P9WIli|>^1!|97t]w)J%tP+*+*!!#0G|5n[;B^iC}!!!/UQIPyG!!!1%!(4R#  !!#3H!)rmR!!!Kz|<lWx !#Z(4   !!#6Is|M]|!!!Ue!!!%2!!!!Z    !!#9J!|>T/!!!%K /?6HG !!$<j!!&TR !!#>K !!!!+      !!#AL    |>^1!|>^1!|>^1!|>^1!!!#DM!!!!#Z+ert!!!%!!!.$~    !!#GN       !!!!#!!#MP       !!!?+!!#SR!#>r1       !!+fv      !#x?D !!+u{!!!!)       !!.%!       /?6HG:lang=aa|af|ast|ava|ay|ba|bam|be|bg|bi|bin|br|bs|bua|ca|ce|ch|chm|co|cs|cv|cy|da|de|el|en|eo|es|et|eu|fi|fj|fo|fr|ful|fur|fy|ga|gd|gl|gn|gv|ha|haw|ho|hr|hu|ia|id|ie|ik|io|is|it|kaa|ki|kk|kl|ku|kum|kv|kw|ky|la|lb|lez|lt|lv|mg|mh|mi|mk|mo|mt|nb|nds|nl|nn|no|ny|oc|om|os|pl|pt|rm|ro|ru|sah|se|sel|sh|sk|sl|sm|sma|smj|smn|sms|so|sq|sr|sv|sw|tg|tn|to|tr|ts|tw|tyv|uk|uz|ven|vo|vot|wa|wen|wo|xh|yap|yo|zu:fontversion=176947:fontformat=TrueType"
+"DejaVuSerif-Oblique.ttf" 0 "DejaVu Serif:familylang=en:style=Oblique:stylelang=en:slant=110:weight=80:width=100:foundry=unknown:index=0:outline=True:scalable=True:charset=  |>^1!|>^1!P0oWQ |>^1!|>^1!|>^1!!!!%#|>^1!|>^1!|>^1!|>^1!|>^0~NrU1M|>^1!|.}*Q!!!)$lrC&L|>^0r|>T)%|>^1!|>^1!zDgQyOwyiz!!$Im!!!.%|>^1!|>^1!!BB.#;wnZH|>[gE|>^0{|>XZQ|>T)%!!!1&|>^1!|>^1!|>^1!!#>r?lZj+i&3p()|>T}3#?>K%!!#$Dr;]W3 (1+e+$h6vZyf*@@{{B$~  !!#(ElrC&L|>VCi|>T^4|>^.4(1+e49WI7i!|(G@#>r3p!!#+F9Bx6P|>^1!^{M at P9WIli|>^1!|97t]w)J%tP+*+*!!#0G|5n[;B^iC}!!!/UQIPyG!!!1%!(4R#  !!#3H!)rmR!!!Kz|<lWx !#Z(4   !!#6Is|M]|!!!Ue!!!%2!!!!Z    !!#9J!|>T/!!!%K /?6HG !!$<j!!&TR !!#>K !!!!+      !!#AL    |>^1!|>^1!|>^1!|>^1!!!#DM!!!!#Z+ert!!!%!!!.$~    !!#GN       !!!!#!!#MP       !!!?+!!#SR!#>r1       !!+fv      !#x?D !!+u{!!!!)       !!.%!       /?6HG:lang=aa|af|ast|ava|ay|ba|bam|be|bg|bi|bin|br|bs|bua|ca|ce|ch|chm|co|cs|cv|cy|da|de|el|en|eo|es|et|eu|fi|fj|fo|fr|ful|fur|fy|ga|gd|gl|gn|gv|ha|haw|ho|hr|hu|ia|id|ie|ik|io|is|it|kaa|ki|kk|kl|ku|kum|kv|kw|ky|la|lb|lez|lt|lv|mg|mh|mi|mk|mo|mt|nb|nds|nl|nn|no|ny|oc|om|os|pl|pt|rm|ro|ru|sah|se|sel|sh|sk|sl|sm|sma|smj|smn|sms|so|sq|sr|sv|sw|tg|tn|to|tr|ts|tw|tyv|uk|uz|ven|vo|vot|wa|wen|wo|xh|yap|yo|zu:fontversion=176947:fontformat=TrueType"
+"DejaVuSerif.ttf" 0 "DejaVu Serif:familylang=en:style=Book:stylelang=en:slant=0:weight=80:width=100:foundry=unknown:index=0:outline=True:scalable=True:charset=  |>^1!|>^1!P0oWQ |>^1!|>^1!|>^1!!!!%#|>^1!|>^1!|>^1!|>^1!|>^0~NrU1M|>^1!|.}*Q!!!)$lrC&L|>^0r|>T)%|>^1!|>^1!zDgQyOwyiz!!$Im!!!.%|>^1!|>^1!!BB.#;wnZH|>[gE|>^0{|>XZQ|>T)%!!!1&|>^1!|>^1!|>^1!!#>r?lZj+i&3p()|>T}3#?>K%!!#$Dr;]W3 (1+e+$h6vZyf*@@{{B$~  !!#(ElrC&L|>VCi|>T^4|>^.4(1+e49WI7i!|(G@#>r3p!!#+F9Bx6P|>^1!^{M at P9WIli|>^1!|97t]w)J%tP+*+*!!#0G|5n[;B^iC}!!!/UQIPyG!!!1%!(4R#  !!#3H!)rmR!!!Kz|<lWx !#Z(4   !!#6Is|M]|!!!Ue!!!%2!!!!Z    !!#9J!|>T/!!!%K /?6HG !!$<j!!&TR !!#>K !!!!+      !!#AL    |>^1!|>^1!|>^1!|>^1!!!#DM!!!!#Z+ert!!!%!!!.$~    !!#GN       !!!!#!!#MP       !!!?+!!#SR!#>r1       !!+fv      !#x>Y !!+u{!!!!)       !!.%!       /?6HG:lang=aa|af|ast|ava|ay|ba|bam|be|bg|bi|bin|br|bs|bua|ca|ce|ch|chm|co|cs|cv|cy|da|de|el|en|eo|es|et|eu|fi|fj|fo|fr|ful|fur|fy|ga|gd|gl|gn|gv|ha|haw|ho|hr|hu|ia|id|ie|ik|io|is|it|kaa|ki|kk|kl|ku|kum|kv|kw|ky|la|lb|lez|lt|lv|mg|mh|mi|mk|mo|mt|nb|nds|nl|nn|no|ny|oc|om|os|pl|pt|rm|ro|ru|sah|se|sel|sh|sk|sl|sm|sma|smj|smn|sms|so|sq|sr|sv|sw|tg|tn|to|tr|ts|tw|tyv|uk|uz|ven|vo|vot|wa|wen|wo|xh|yap|yo|zu:fontversion=176947:fontformat=TrueType"

Modified: trunk/buildroot/package/xorg/xorg.conf
===================================================================
--- trunk/buildroot/package/xorg/xorg.conf	2007-01-15 21:28:15 UTC (rev 17317)
+++ trunk/buildroot/package/xorg/xorg.conf	2007-01-15 22:33:55 UTC (rev 17318)
@@ -100,6 +100,7 @@
 	Option		"StandbyTime" "15"
 	Option		"SuspendTime" "20"
 	Option		"OffTime" "30"
+	Option		"AllowMouseOpenFail" "true"
 EndSection
 
 Section "ServerLayout"

Modified: trunk/buildroot/package/xorg/xorg.mk
===================================================================
--- trunk/buildroot/package/xorg/xorg.mk	2007-01-15 21:28:15 UTC (rev 17317)
+++ trunk/buildroot/package/xorg/xorg.mk	2007-01-15 22:33:55 UTC (rev 17318)
@@ -12,8 +12,8 @@
 	mkfontscale/mkfontscale mkfontdir/mkfontdir \
 	#xterm/xterm
 
-XORG_LIBS:= Xft Xrender Xaw Xmu Xt \
-	SM ICE Xpm Xp Xext X11 Xmuu Xxf86misc
+XORG_LIBS:= Xft Xrender Xaw Xmu Xt Xcursor Xrandr Xi Xinerama Xfixes \
+	SM ICE Xpm Xp Xext X11 Xmuu Xxf86misc fontenc
 
 
 #############################################################
@@ -36,6 +36,13 @@
 XORG_CF:=$(XORG_DIR)/config/cf/cross.def
 XORG_HOST_DEF:=$(XORG_DIR)/config/cf/host.def
 
+
+DEJAVU_VERSION=2.13
+DEJAVU_SOURCE=dejavu-ttf-$(DEJAVU_VERSION).tar.bz2
+DEJAVU_CAT:=$(BZCAT)
+DEJAVU_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/dejavu
+DEJAVU_DIR:=$(BUILD_DIR)/dejavu-ttf-$(DEJAVU_VERSION)
+
 # Install Xorg xserver
 XSERVER:=Xorg
 XORG_XSERVER:=$(XORG_DIR)/programs/Xserver/$(XSERVER)
@@ -126,15 +133,46 @@
 	cp -LRf $(XORG_DIR)/exports/lib/modules/ $(XORG_LIBX)/
 	( cd $(XORG_DIR)/fonts ; $(MAKE) \
 		DESTDIR=$(TARGET_DIR) install XCURSORGEN=xcursorgen MKFONTSCALE=mkfontscale )
-	cp -LRf $(XORG_DIR)/fonts/bdf/misc/*.bdf $(XORG_LIBX)/X11/fonts/misc/
+	cp -LRf $(XORG_DIR)/fonts/bdf/misc/7x14.bdf $(XORG_LIBX)/X11/fonts/misc/
+	cp -LRf $(XORG_DIR)/fonts/bdf/misc/7x14-L1.bdf $(XORG_LIBX)/X11/fonts/misc/
+	cp -LRf $(XORG_DIR)/fonts/bdf/misc/7x14B.bdf $(XORG_LIBX)/X11/fonts/misc/
+	cp -LRf $(XORG_DIR)/fonts/bdf/misc/7x14B-L1.bdf $(XORG_LIBX)/X11/fonts/misc/
+	cp -LRf $(XORG_DIR)/fonts/bdf/misc/cursor.bdf $(XORG_LIBX)/X11/fonts/misc/
+	cp -f package/xorg/fonts.alias $(XORG_LIBX)/X11/fonts/misc/
 	( cd $(XORG_LIBX)/X11/fonts/misc/; mkfontdir )
 	(cd $(TARGET_DIR)/usr/bin; ln -snf $(TARGET_BINX) X11)
 	mkdir -p $(TARGET_DIR)/etc/X11/
-	cp package/xorg/xorg.conf $(TARGET_DIR)/etc/X11/
-	cp -a $(STAGING_DIR)$(TARGET_LIBX)/X11/rgb* $(XORG_LIBX)/X11/
+	cp -LRf $(STAGING_DIR)$(TARGET_LIBX)/X11/rgb* $(XORG_LIBX)/X11/
+	$(SED) "s,^sysclientrc=.*,sysclientrc=/etc/X11/Xsession,g" $(XORG_BINX)/startx
+	$(SED) "s,^sysserverrc=.*,sysserverrc=/etc/X11/Xserver,g" $(XORG_BINX)/startx
+	cp -LRf package/xorg/xorg.conf $(TARGET_DIR)/etc/X11/
+	cp -LRf package/xorg/Xsession $(TARGET_DIR)/etc/X11/
+	cp -LRf package/xorg/Xserver $(TARGET_DIR)/etc/X11/
 	touch -c $(TARGET_XSERVER)
 
-$(XORG_LIBX)/libX11.so.6.2: $(TARGET_XSERVER)
+$(DL_DIR)/$(DEJAVU_SOURCE):
+	$(WGET) -P $(DL_DIR) $(DEJAVU_SITE)/$(DEJAVU_SOURCE)
+
+$(DEJAVU_DIR)/.unpacked: $(DL_DIR)/$(DEJAVU_SOURCE)
+	$(DEJAVU_CAT) $(DL_DIR)/$(DEJAVU_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	touch $(DEJAVU_DIR)/.unpacked
+
+$(XORG_LIBX)/X11/fonts/ttf-dejavu/DejaVuSansMono.ttf: $(DEJAVU_DIR)/.unpacked
+	mkdir -p $(XORG_LIBX)/X11/fonts/ttf-dejavu
+	rm $(DEJAVU_DIR)/*Condensed*.ttf
+	rm $(DEJAVU_DIR)/*ExtraLight*.ttf
+	cp -LRf $(DEJAVU_DIR)/DejaVu*-Bold.ttf $(XORG_LIBX)/X11/fonts/ttf-dejavu/
+	cp -LRf $(DEJAVU_DIR)/DejaVu*-BoldOblique.ttf $(XORG_LIBX)/X11/fonts/ttf-dejavu/
+	cp -LRf $(DEJAVU_DIR)/DejaVu*-Oblique.ttf $(XORG_LIBX)/X11/fonts/ttf-dejavu/
+	cp -LRf $(DEJAVU_DIR)/DejaVuSans.ttf $(XORG_LIBX)/X11/fonts/ttf-dejavu/
+	cp -LRf $(DEJAVU_DIR)/DejaVuSansMono.ttf $(XORG_LIBX)/X11/fonts/ttf-dejavu/
+	cp -LRf $(DEJAVU_DIR)/DejaVuSerif.ttf $(XORG_LIBX)/X11/fonts/ttf-dejavu/
+	cp -LRf $(DEJAVU_DIR)/DejaVuSerif.ttf $(XORG_LIBX)/X11/fonts/ttf-dejavu/
+	cp package/xorg/fonts.cache-1 $(XORG_LIBX)/X11/fonts/ttf-dejavu/
+	( cd $(XORG_LIBX)/X11/fonts/ttf-dejavu/; mkfontdir )
+	touch -c $(XORG_LIBX)/X11/fonts/ttf-dejavu/DejaVuSansMono.ttf
+
+$(XORG_LIBX)/libX11.so.6.2: $(TARGET_XSERVER) $(XORG_LIBX)/X11/fonts/ttf-dejavu/DejaVuSansMono.ttf
 	-mkdir -p $(XORG_LIBX)
 	set -e; for dirs in $(XORG_LIBS) ; do \
 		file=`find $(XORG_LDIR)/$$dirs -type f -iname "*$$dirs.so*"` ; \
@@ -150,14 +188,13 @@
 	fi;
 	touch -c $(XORG_LIBX)/libX11.so.6.2
 
-
 $(TARGET_DIR)/usr/bin/mcookie: package/xorg/mcookie.c
 	$(TARGET_CROSS)gcc -Wall -Os -s package/xorg/mcookie.c -o $(TARGET_DIR)/usr/bin/mcookie
 
 xorg: zlib png pkgconfig expat fontconfig $(STAGING_DIR)$(TARGET_LIBX)/libX11.so.6.2 \
 	$(XORG_LIBX)/libX11.so.6.2 $(TARGET_DIR)/usr/bin/mcookie
 
-xorg-source: $(DL_DIR)/$(XORG_SOURCE)
+xorg-source: $(DL_DIR)/$(XORG_SOURCE) $(DL_DIR)/$(DEJAVU_SOURCE)
 
 xorg-clean:
 	-rm -rf $(TARGET_DIR)/usr/X11R6
