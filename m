From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun,  2 Mar 2014 19:21:42 +0100
Subject: [Buildroot] [PATCH 2/4] website: Add Bootstrap and JQuery framework
In-Reply-To: <1393784504-11327-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1393784504-11327-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1393784504-11327-3-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

Add Bootstrap framework, along with JQuery.

Theses files were downloaded from:
  - http://getbootstrap.com
  - http://jquery.com/

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 docs/css/bootstrap-responsive.css          | 1092 +++++
 docs/css/bootstrap-responsive.min.css      |    9 +
 docs/css/bootstrap.css                     | 6039 ++++++++++++++++++++++++++++
 docs/css/bootstrap.min.css                 |  882 ++++
 docs/css/bootswatch.less                   |  181 +
 docs/css/variables.less                    |  301 ++
 docs/images/glyphicons-halflings-white.png |  Bin 0 -> 8777 bytes
 docs/images/glyphicons-halflings.png       |  Bin 0 -> 12799 bytes
 docs/images/menuconfig.png                 |  Bin 9087 -> 8604 bytes
 docs/js/bootstrap.js                       | 2159 ++++++++++
 docs/js/bootstrap.min.js                   |    6 +
 docs/js/jquery-1.10.2.min.js               |    6 +
 12 files changed, 10675 insertions(+)
 create mode 100644 docs/css/bootstrap-responsive.css
 create mode 100644 docs/css/bootstrap-responsive.min.css
 create mode 100644 docs/css/bootstrap.css
 create mode 100644 docs/css/bootstrap.min.css
 create mode 100644 docs/css/bootswatch.less
 create mode 100644 docs/css/variables.less
 create mode 100644 docs/images/glyphicons-halflings-white.png
 create mode 100644 docs/images/glyphicons-halflings.png
 create mode 100644 docs/js/bootstrap.js
 create mode 100644 docs/js/bootstrap.min.js
 create mode 100644 docs/js/jquery-1.10.2.min.js

diff --git a/docs/css/bootstrap-responsive.css b/docs/css/bootstrap-responsive.css
new file mode 100644
index 0000000..a3352d7
--- /dev/null
+++ b/docs/css/bootstrap-responsive.css
@@ -0,0 +1,1092 @@
+/*!
+ * Bootstrap Responsive v2.2.2
+ *
+ * Copyright 2012 Twitter, Inc
+ * Licensed under the Apache License v2.0
+ * http://www.apache.org/licenses/LICENSE-2.0
+ *
+ * Designed and built with all the love in the world @twitter by @mdo and @fat.
+ */
+
+ at -ms-viewport {
+  width: device-width;
+}
+
+.clearfix {
+  *zoom: 1;
+}
+
+.clearfix:before,
+.clearfix:after {
+  display: table;
+  line-height: 0;
+  content: "";
+}
+
+.clearfix:after {
+  clear: both;
+}
+
+.hide-text {
+  font: 0/0 a;
+  color: transparent;
+  text-shadow: none;
+  background-color: transparent;
+  border: 0;
+}
+
+.input-block-level {
+  display: block;
+  width: 100%;
+  min-height: 30px;
+  -webkit-box-sizing: border-box;
+     -moz-box-sizing: border-box;
+          box-sizing: border-box;
+}
+
+.hidden {
+  display: none;
+  visibility: hidden;
+}
+
+.visible-phone {
+  display: none !important;
+}
+
+.visible-tablet {
+  display: none !important;
+}
+
+.hidden-desktop {
+  display: none !important;
+}
+
+.visible-desktop {
+  display: inherit !important;
+}
+
+ at media (min-width: 768px) and (max-width: 979px) {
+  .hidden-desktop {
+    display: inherit !important;
+  }
+  .visible-desktop {
+    display: none !important ;
+  }
+  .visible-tablet {
+    display: inherit !important;
+  }
+  .hidden-tablet {
+    display: none !important;
+  }
+}
+
+ at media (max-width: 767px) {
+  .hidden-desktop {
+    display: inherit !important;
+  }
+  .visible-desktop {
+    display: none !important;
+  }
+  .visible-phone {
+    display: inherit !important;
+  }
+  .hidden-phone {
+    display: none !important;
+  }
+}
+
+ at media (min-width: 1200px) {
+  .row {
+    margin-left: -30px;
+    *zoom: 1;
+  }
+  .row:before,
+  .row:after {
+    display: table;
+    line-height: 0;
+    content: "";
+  }
+  .row:after {
+    clear: both;
+  }
+  [class*="span"] {
+    float: left;
+    min-height: 1px;
+    margin-left: 30px;
+  }
+  .container,
+  .navbar-static-top .container,
+  .navbar-fixed-top .container,
+  .navbar-fixed-bottom .container {
+    width: 1170px;
+  }
+  .span12 {
+    width: 1170px;
+  }
+  .span11 {
+    width: 1070px;
+  }
+  .span10 {
+    width: 970px;
+  }
+  .span9 {
+    width: 870px;
+  }
+  .span8 {
+    width: 770px;
+  }
+  .span7 {
+    width: 670px;
+  }
+  .span6 {
+    width: 570px;
+  }
+  .span5 {
+    width: 470px;
+  }
+  .span4 {
+    width: 370px;
+  }
+  .span3 {
+    width: 270px;
+  }
+  .span2 {
+    width: 170px;
+  }
+  .span1 {
+    width: 70px;
+  }
+  .offset12 {
+    margin-left: 1230px;
+  }
+  .offset11 {
+    margin-left: 1130px;
+  }
+  .offset10 {
+    margin-left: 1030px;
+  }
+  .offset9 {
+    margin-left: 930px;
+  }
+  .offset8 {
+    margin-left: 830px;
+  }
+  .offset7 {
+    margin-left: 730px;
+  }
+  .offset6 {
+    margin-left: 630px;
+  }
+  .offset5 {
+    margin-left: 530px;
+  }
+  .offset4 {
+    margin-left: 430px;
+  }
+  .offset3 {
+    margin-left: 330px;
+  }
+  .offset2 {
+    margin-left: 230px;
+  }
+  .offset1 {
+    margin-left: 130px;
+  }
+  .row-fluid {
+    width: 100%;
+    *zoom: 1;
+  }
+  .row-fluid:before,
+  .row-fluid:after {
+    display: table;
+    line-height: 0;
+    content: "";
+  }
+  .row-fluid:after {
+    clear: both;
+  }
+  .row-fluid [class*="span"] {
+    display: block;
+    float: left;
+    width: 100%;
+    min-height: 30px;
+    margin-left: 2.564102564102564%;
+    *margin-left: 2.5109110747408616%;
+    -webkit-box-sizing: border-box;
+       -moz-box-sizing: border-box;
+            box-sizing: border-box;
+  }
+  .row-fluid [class*="span"]:first-child {
+    margin-left: 0;
+  }
+  .row-fluid .controls-row [class*="span"] + [class*="span"] {
+    margin-left: 2.564102564102564%;
+  }
+  .row-fluid .span12 {
+    width: 100%;
+    *width: 99.94680851063829%;
+  }
+  .row-fluid .span11 {
+    width: 91.45299145299145%;
+    *width: 91.39979996362975%;
+  }
+  .row-fluid .span10 {
+    width: 82.90598290598291%;
+    *width: 82.8527914166212%;
+  }
+  .row-fluid .span9 {
+    width: 74.35897435897436%;
+    *width: 74.30578286961266%;
+  }
+  .row-fluid .span8 {
+    width: 65.81196581196582%;
+    *width: 65.75877432260411%;
+  }
+  .row-fluid .span7 {
+    width: 57.26495726495726%;
+    *width: 57.21176577559556%;
+  }
+  .row-fluid .span6 {
+    width: 48.717948717948715%;
+    *width: 48.664757228587014%;
+  }
+  .row-fluid .span5 {
+    width: 40.17094017094017%;
+    *width: 40.11774868157847%;
+  }
+  .row-fluid .span4 {
+    width: 31.623931623931625%;
+    *width: 31.570740134569924%;
+  }
+  .row-fluid .span3 {
+    width: 23.076923076923077%;
+    *width: 23.023731587561375%;
+  }
+  .row-fluid .span2 {
+    width: 14.52991452991453%;
+    *width: 14.476723040552828%;
+  }
+  .row-fluid .span1 {
+    width: 5.982905982905983%;
+    *width: 5.929714493544281%;
+  }
+  .row-fluid .offset12 {
+    margin-left: 105.12820512820512%;
+    *margin-left: 105.02182214948171%;
+  }
+  .row-fluid .offset12:first-child {
+    margin-left: 102.56410256410257%;
+    *margin-left: 102.45771958537915%;
+  }
+  .row-fluid .offset11 {
+    margin-left: 96.58119658119658%;
+    *margin-left: 96.47481360247316%;
+  }
+  .row-fluid .offset11:first-child {
+    margin-left: 94.01709401709402%;
+    *margin-left: 93.91071103837061%;
+  }
+  .row-fluid .offset10 {
+    margin-left: 88.03418803418803%;
+    *margin-left: 87.92780505546462%;
+  }
+  .row-fluid .offset10:first-child {
+    margin-left: 85.47008547008548%;
+    *margin-left: 85.36370249136206%;
+  }
+  .row-fluid .offset9 {
+    margin-left: 79.48717948717949%;
+    *margin-left: 79.38079650845607%;
+  }
+  .row-fluid .offset9:first-child {
+    margin-left: 76.92307692307693%;
+    *margin-left: 76.81669394435352%;
+  }
+  .row-fluid .offset8 {
+    margin-left: 70.94017094017094%;
+    *margin-left: 70.83378796144753%;
+  }
+  .row-fluid .offset8:first-child {
+    margin-left: 68.37606837606839%;
+    *margin-left: 68.26968539734497%;
+  }
+  .row-fluid .offset7 {
+    margin-left: 62.393162393162385%;
+    *margin-left: 62.28677941443899%;
+  }
+  .row-fluid .offset7:first-child {
+    margin-left: 59.82905982905982%;
+    *margin-left: 59.72267685033642%;
+  }
+  .row-fluid .offset6 {
+    margin-left: 53.84615384615384%;
+    *margin-left: 53.739770867430444%;
+  }
+  .row-fluid .offset6:first-child {
+    margin-left: 51.28205128205128%;
+    *margin-left: 51.175668303327875%;
+  }
+  .row-fluid .offset5 {
+    margin-left: 45.299145299145295%;
+    *margin-left: 45.1927623204219%;
+  }
+  .row-fluid .offset5:first-child {
+    margin-left: 42.73504273504273%;
+    *margin-left: 42.62865975631933%;
+  }
+  .row-fluid .offset4 {
+    margin-left: 36.75213675213675%;
+    *margin-left: 36.645753773413354%;
+  }
+  .row-fluid .offset4:first-child {
+    margin-left: 34.18803418803419%;
+    *margin-left: 34.081651209310785%;
+  }
+  .row-fluid .offset3 {
+    margin-left: 28.205128205128204%;
+    *margin-left: 28.0987452264048%;
+  }
+  .row-fluid .offset3:first-child {
+    margin-left: 25.641025641025642%;
+    *margin-left: 25.53464266230224%;
+  }
+  .row-fluid .offset2 {
+    margin-left: 19.65811965811966%;
+    *margin-left: 19.551736679396257%;
+  }
+  .row-fluid .offset2:first-child {
+    margin-left: 17.094017094017094%;
+    *margin-left: 16.98763411529369%;
+  }
+  .row-fluid .offset1 {
+    margin-left: 11.11111111111111%;
+    *margin-left: 11.004728132387708%;
+  }
+  .row-fluid .offset1:first-child {
+    margin-left: 8.547008547008547%;
+    *margin-left: 8.440625568285142%;
+  }
+  input,
+  textarea,
+  .uneditable-input {
+    margin-left: 0;
+  }
+  .controls-row [class*="span"] + [class*="span"] {
+    margin-left: 30px;
+  }
+  input.span12,
+  textarea.span12,
+  .uneditable-input.span12 {
+    width: 1156px;
+  }
+  input.span11,
+  textarea.span11,
+  .uneditable-input.span11 {
+    width: 1056px;
+  }
+  input.span10,
+  textarea.span10,
+  .uneditable-input.span10 {
+    width: 956px;
+  }
+  input.span9,
+  textarea.span9,
+  .uneditable-input.span9 {
+    width: 856px;
+  }
+  input.span8,
+  textarea.span8,
+  .uneditable-input.span8 {
+    width: 756px;
+  }
+  input.span7,
+  textarea.span7,
+  .uneditable-input.span7 {
+    width: 656px;
+  }
+  input.span6,
+  textarea.span6,
+  .uneditable-input.span6 {
+    width: 556px;
+  }
+  input.span5,
+  textarea.span5,
+  .uneditable-input.span5 {
+    width: 456px;
+  }
+  input.span4,
+  textarea.span4,
+  .uneditable-input.span4 {
+    width: 356px;
+  }
+  input.span3,
+  textarea.span3,
+  .uneditable-input.span3 {
+    width: 256px;
+  }
+  input.span2,
+  textarea.span2,
+  .uneditable-input.span2 {
+    width: 156px;
+  }
+  input.span1,
+  textarea.span1,
+  .uneditable-input.span1 {
+    width: 56px;
+  }
+  .thumbnails {
+    margin-left: -30px;
+  }
+  .thumbnails > li {
+    margin-left: 30px;
+  }
+  .row-fluid .thumbnails {
+    margin-left: 0;
+  }
+}
+
+ at media (min-width: 768px) and (max-width: 979px) {
+  .row {
+    margin-left: -20px;
+    *zoom: 1;
+  }
+  .row:before,
+  .row:after {
+    display: table;
+    line-height: 0;
+    content: "";
+  }
+  .row:after {
+    clear: both;
+  }
+  [class*="span"] {
+    float: left;
+    min-height: 1px;
+    margin-left: 20px;
+  }
+  .container,
+  .navbar-static-top .container,
+  .navbar-fixed-top .container,
+  .navbar-fixed-bottom .container {
+    width: 724px;
+  }
+  .span12 {
+    width: 724px;
+  }
+  .span11 {
+    width: 662px;
+  }
+  .span10 {
+    width: 600px;
+  }
+  .span9 {
+    width: 538px;
+  }
+  .span8 {
+    width: 476px;
+  }
+  .span7 {
+    width: 414px;
+  }
+  .span6 {
+    width: 352px;
+  }
+  .span5 {
+    width: 290px;
+  }
+  .span4 {
+    width: 228px;
+  }
+  .span3 {
+    width: 166px;
+  }
+  .span2 {
+    width: 104px;
+  }
+  .span1 {
+    width: 42px;
+  }
+  .offset12 {
+    margin-left: 764px;
+  }
+  .offset11 {
+    margin-left: 702px;
+  }
+  .offset10 {
+    margin-left: 640px;
+  }
+  .offset9 {
+    margin-left: 578px;
+  }
+  .offset8 {
+    margin-left: 516px;
+  }
+  .offset7 {
+    margin-left: 454px;
+  }
+  .offset6 {
+    margin-left: 392px;
+  }
+  .offset5 {
+    margin-left: 330px;
+  }
+  .offset4 {
+    margin-left: 268px;
+  }
+  .offset3 {
+    margin-left: 206px;
+  }
+  .offset2 {
+    margin-left: 144px;
+  }
+  .offset1 {
+    margin-left: 82px;
+  }
+  .row-fluid {
+    width: 100%;
+    *zoom: 1;
+  }
+  .row-fluid:before,
+  .row-fluid:after {
+    display: table;
+    line-height: 0;
+    content: "";
+  }
+  .row-fluid:after {
+    clear: both;
+  }
+  .row-fluid [class*="span"] {
+    display: block;
+    float: left;
+    width: 100%;
+    min-height: 30px;
+    margin-left: 2.7624309392265194%;
+    *margin-left: 2.709239449864817%;
+    -webkit-box-sizing: border-box;
+       -moz-box-sizing: border-box;
+            box-sizing: border-box;
+  }
+  .row-fluid [class*="span"]:first-child {
+    margin-left: 0;
+  }
+  .row-fluid .controls-row [class*="span"] + [class*="span"] {
+    margin-left: 2.7624309392265194%;
+  }
+  .row-fluid .span12 {
+    width: 100%;
+    *width: 99.94680851063829%;
+  }
+  .row-fluid .span11 {
+    width: 91.43646408839778%;
+    *width: 91.38327259903608%;
+  }
+  .row-fluid .span10 {
+    width: 82.87292817679558%;
+    *width: 82.81973668743387%;
+  }
+  .row-fluid .span9 {
+    width: 74.30939226519337%;
+    *width: 74.25620077583166%;
+  }
+  .row-fluid .span8 {
+    width: 65.74585635359117%;
+    *width: 65.69266486422946%;
+  }
+  .row-fluid .span7 {
+    width: 57.18232044198895%;
+    *width: 57.12912895262725%;
+  }
+  .row-fluid .span6 {
+    width: 48.61878453038674%;
+    *width: 48.56559304102504%;
+  }
+  .row-fluid .span5 {
+    width: 40.05524861878453%;
+    *width: 40.00205712942283%;
+  }
+  .row-fluid .span4 {
+    width: 31.491712707182323%;
+    *width: 31.43852121782062%;
+  }
+  .row-fluid .span3 {
+    width: 22.92817679558011%;
+    *width: 22.87498530621841%;
+  }
+  .row-fluid .span2 {
+    width: 14.3646408839779%;
+    *width: 14.311449394616199%;
+  }
+  .row-fluid .span1 {
+    width: 5.801104972375691%;
+    *width: 5.747913483013988%;
+  }
+  .row-fluid .offset12 {
+    margin-left: 105.52486187845304%;
+    *margin-left: 105.41847889972962%;
+  }
+  .row-fluid .offset12:first-child {
+    margin-left: 102.76243093922652%;
+    *margin-left: 102.6560479605031%;
+  }
+  .row-fluid .offset11 {
+    margin-left: 96.96132596685082%;
+    *margin-left: 96.8549429881274%;
+  }
+  .row-fluid .offset11:first-child {
+    margin-left: 94.1988950276243%;
+    *margin-left: 94.09251204890089%;
+  }
+  .row-fluid .offset10 {
+    margin-left: 88.39779005524862%;
+    *margin-left: 88.2914070765252%;
+  }
+  .row-fluid .offset10:first-child {
+    margin-left: 85.6353591160221%;
+    *margin-left: 85.52897613729868%;
+  }
+  .row-fluid .offset9 {
+    margin-left: 79.8342541436464%;
+    *margin-left: 79.72787116492299%;
+  }
+  .row-fluid .offset9:first-child {
+    margin-left: 77.07182320441989%;
+    *margin-left: 76.96544022569647%;
+  }
+  .row-fluid .offset8 {
+    margin-left: 71.2707182320442%;
+    *margin-left: 71.16433525332079%;
+  }
+  .row-fluid .offset8:first-child {
+    margin-left: 68.50828729281768%;
+    *margin-left: 68.40190431409427%;
+  }
+  .row-fluid .offset7 {
+    margin-left: 62.70718232044199%;
+    *margin-left: 62.600799341718584%;
+  }
+  .row-fluid .offset7:first-child {
+    margin-left: 59.94475138121547%;
+    *margin-left: 59.838368402492065%;
+  }
+  .row-fluid .offset6 {
+    margin-left: 54.14364640883978%;
+    *margin-left: 54.037263430116376%;
+  }
+  .row-fluid .offset6:first-child {
+    margin-left: 51.38121546961326%;
+    *margin-left: 51.27483249088986%;
+  }
+  .row-fluid .offset5 {
+    margin-left: 45.58011049723757%;
+    *margin-left: 45.47372751851417%;
+  }
+  .row-fluid .offset5:first-child {
+    margin-left: 42.81767955801105%;
+    *margin-left: 42.71129657928765%;
+  }
+  .row-fluid .offset4 {
+    margin-left: 37.01657458563536%;
+    *margin-left: 36.91019160691196%;
+  }
+  .row-fluid .offset4:first-child {
+    margin-left: 34.25414364640884%;
+    *margin-left: 34.14776066768544%;
+  }
+  .row-fluid .offset3 {
+    margin-left: 28.45303867403315%;
+    *margin-left: 28.346655695309746%;
+  }
+  .row-fluid .offset3:first-child {
+    margin-left: 25.69060773480663%;
+    *margin-left: 25.584224756083227%;
+  }
+  .row-fluid .offset2 {
+    margin-left: 19.88950276243094%;
+    *margin-left: 19.783119783707537%;
+  }
+  .row-fluid .offset2:first-child {
+    margin-left: 17.12707182320442%;
+    *margin-left: 17.02068884448102%;
+  }
+  .row-fluid .offset1 {
+    margin-left: 11.32596685082873%;
+    *margin-left: 11.219583872105325%;
+  }
+  .row-fluid .offset1:first-child {
+    margin-left: 8.56353591160221%;
+    *margin-left: 8.457152932878806%;
+  }
+  input,
+  textarea,
+  .uneditable-input {
+    margin-left: 0;
+  }
+  .controls-row [class*="span"] + [class*="span"] {
+    margin-left: 20px;
+  }
+  input.span12,
+  textarea.span12,
+  .uneditable-input.span12 {
+    width: 710px;
+  }
+  input.span11,
+  textarea.span11,
+  .uneditable-input.span11 {
+    width: 648px;
+  }
+  input.span10,
+  textarea.span10,
+  .uneditable-input.span10 {
+    width: 586px;
+  }
+  input.span9,
+  textarea.span9,
+  .uneditable-input.span9 {
+    width: 524px;
+  }
+  input.span8,
+  textarea.span8,
+  .uneditable-input.span8 {
+    width: 462px;
+  }
+  input.span7,
+  textarea.span7,
+  .uneditable-input.span7 {
+    width: 400px;
+  }
+  input.span6,
+  textarea.span6,
+  .uneditable-input.span6 {
+    width: 338px;
+  }
+  input.span5,
+  textarea.span5,
+  .uneditable-input.span5 {
+    width: 276px;
+  }
+  input.span4,
+  textarea.span4,
+  .uneditable-input.span4 {
+    width: 214px;
+  }
+  input.span3,
+  textarea.span3,
+  .uneditable-input.span3 {
+    width: 152px;
+  }
+  input.span2,
+  textarea.span2,
+  .uneditable-input.span2 {
+    width: 90px;
+  }
+  input.span1,
+  textarea.span1,
+  .uneditable-input.span1 {
+    width: 28px;
+  }
+}
+
+ at media (max-width: 767px) {
+  body {
+    padding-right: 20px;
+    padding-left: 20px;
+  }
+  .navbar-fixed-top,
+  .navbar-fixed-bottom,
+  .navbar-static-top {
+    margin-right: -20px;
+    margin-left: -20px;
+  }
+  .container-fluid {
+    padding: 0;
+  }
+  .dl-horizontal dt {
+    float: none;
+    width: auto;
+    clear: none;
+    text-align: left;
+  }
+  .dl-horizontal dd {
+    margin-left: 0;
+  }
+  .container {
+    width: auto;
+  }
+  .row-fluid {
+    width: 100%;
+  }
+  .row,
+  .thumbnails {
+    margin-left: 0;
+  }
+  .thumbnails > li {
+    float: none;
+    margin-left: 0;
+  }
+  [class*="span"],
+  .uneditable-input[class*="span"],
+  .row-fluid [class*="span"] {
+    display: block;
+    float: none;
+    width: 100%;
+    margin-left: 0;
+    -webkit-box-sizing: border-box;
+       -moz-box-sizing: border-box;
+            box-sizing: border-box;
+  }
+  .span12,
+  .row-fluid .span12 {
+    width: 100%;
+    -webkit-box-sizing: border-box;
+       -moz-box-sizing: border-box;
+            box-sizing: border-box;
+  }
+  .row-fluid [class*="offset"]:first-child {
+    margin-left: 0;
+  }
+  .input-large,
+  .input-xlarge,
+  .input-xxlarge,
+  input[class*="span"],
+  select[class*="span"],
+  textarea[class*="span"],
+  .uneditable-input {
+    display: block;
+    width: 100%;
+    min-height: 30px;
+    -webkit-box-sizing: border-box;
+       -moz-box-sizing: border-box;
+            box-sizing: border-box;
+  }
+  .input-prepend input,
+  .input-append input,
+  .input-prepend input[class*="span"],
+  .input-append input[class*="span"] {
+    display: inline-block;
+    width: auto;
+  }
+  .controls-row [class*="span"] + [class*="span"] {
+    margin-left: 0;
+  }
+  .modal {
+    position: fixed;
+    top: 20px;
+    right: 20px;
+    left: 20px;
+    width: auto;
+    margin: 0;
+  }
+  .modal.fade {
+    top: -100px;
+  }
+  .modal.fade.in {
+    top: 20px;
+  }
+}
+
+ at media (max-width: 480px) {
+  .nav-collapse {
+    -webkit-transform: translate3d(0, 0, 0);
+  }
+  .page-header h1 small {
+    display: block;
+    line-height: 20px;
+  }
+  input[type="checkbox"],
+  input[type="radio"] {
+    border: 1px solid #ccc;
+  }
+  .form-horizontal .control-label {
+    float: none;
+    width: auto;
+    padding-top: 0;
+    text-align: left;
+  }
+  .form-horizontal .controls {
+    margin-left: 0;
+  }
+  .form-horizontal .control-list {
+    padding-top: 0;
+  }
+  .form-horizontal .form-actions {
+    padding-right: 10px;
+    padding-left: 10px;
+  }
+  .media .pull-left,
+  .media .pull-right {
+    display: block;
+    float: none;
+    margin-bottom: 10px;
+  }
+  .media-object {
+    margin-right: 0;
+    margin-left: 0;
+  }
+  .modal {
+    top: 10px;
+    right: 10px;
+    left: 10px;
+  }
+  .modal-header .close {
+    padding: 10px;
+    margin: -10px;
+  }
+  .carousel-caption {
+    position: static;
+  }
+}
+
+ at media (max-width: 979px) {
+  body {
+    padding-top: 0;
+  }
+  .navbar-fixed-top,
+  .navbar-fixed-bottom {
+    position: static;
+  }
+  .navbar-fixed-top {
+    margin-bottom: 20px;
+  }
+  .navbar-fixed-bottom {
+    margin-top: 20px;
+  }
+  .navbar-fixed-top .navbar-inner,
+  .navbar-fixed-bottom .navbar-inner {
+    padding: 5px;
+  }
+  .navbar .container {
+    width: auto;
+    padding: 0;
+  }
+  .navbar .brand {
+    padding-right: 10px;
+    padding-left: 10px;
+    margin: 0 0 0 -5px;
+  }
+  .nav-collapse {
+    clear: both;
+  }
+  .nav-collapse .nav {
+    float: none;
+    margin: 0 0 10px;
+  }
+  .nav-collapse .nav > li {
+    float: none;
+  }
+  .nav-collapse .nav > li > a {
+    margin-bottom: 2px;
+  }
+  .nav-collapse .nav > .divider-vertical {
+    display: none;
+  }
+  .nav-collapse .nav .nav-header {
+    color: #777777;
+    text-shadow: none;
+  }
+  .nav-collapse .nav > li > a,
+  .nav-collapse .dropdown-menu a {
+    padding: 9px 15px;
+    font-weight: bold;
+    color: #777777;
+    -webkit-border-radius: 3px;
+       -moz-border-radius: 3px;
+            border-radius: 3px;
+  }
+  .nav-collapse .btn {
+    padding: 4px 10px 4px;
+    font-weight: normal;
+    -webkit-border-radius: 4px;
+       -moz-border-radius: 4px;
+            border-radius: 4px;
+  }
+  .nav-collapse .dropdown-menu li + li a {
+    margin-bottom: 2px;
+  }
+  .nav-collapse .nav > li > a:hover,
+  .nav-collapse .dropdown-menu a:hover {
+    background-color: #f2f2f2;
+  }
+  .navbar-inverse .nav-collapse .nav > li > a,
+  .navbar-inverse .nav-collapse .dropdown-menu a {
+    color: #999999;
+  }
+  .navbar-inverse .nav-collapse .nav > li > a:hover,
+  .navbar-inverse .nav-collapse .dropdown-menu a:hover {
+    background-color: #111111;
+  }
+  .nav-collapse.in .btn-group {
+    padding: 0;
+    margin-top: 5px;
+  }
+  .nav-collapse .dropdown-menu {
+    position: static;
+    top: auto;
+    left: auto;
+    display: none;
+    float: none;
+    max-width: none;
+    padding: 0;
+    margin: 0 15px;
+    background-color: transparent;
+    border: none;
+    -webkit-border-radius: 0;
+       -moz-border-radius: 0;
+            border-radius: 0;
+    -webkit-box-shadow: none;
+       -moz-box-shadow: none;
+            box-shadow: none;
+  }
+  .nav-collapse .open > .dropdown-menu {
+    display: block;
+  }
+  .nav-collapse .dropdown-menu:before,
+  .nav-collapse .dropdown-menu:after {
+    display: none;
+  }
+  .nav-collapse .dropdown-menu .divider {
+    display: none;
+  }
+  .nav-collapse .nav > li > .dropdown-menu:before,
+  .nav-collapse .nav > li > .dropdown-menu:after {
+    display: none;
+  }
+  .nav-collapse .navbar-form,
+  .nav-collapse .navbar-search {
+    float: none;
+    padding: 10px 15px;
+    margin: 10px 0;
+    border-top: 1px solid #f2f2f2;
+    border-bottom: 1px solid #f2f2f2;
+    -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.1), 0 1px 0 rgba(255, 255, 255, 0.1);
+       -moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.1), 0 1px 0 rgba(255, 255, 255, 0.1);
+            box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.1), 0 1px 0 rgba(255, 255, 255, 0.1);
+  }
+  .navbar-inverse .nav-collapse .navbar-form,
+  .navbar-inverse .nav-collapse .navbar-search {
+    border-top-color: #111111;
+    border-bottom-color: #111111;
+  }
+  .navbar .nav-collapse .nav.pull-right {
+    float: none;
+    margin-left: 0;
+  }
+  .nav-collapse,
+  .nav-collapse.collapse {
+    height: 0;
+    overflow: hidden;
+  }
+  .navbar .btn-navbar {
+    display: block;
+  }
+  .navbar-static .navbar-inner {
+    padding-right: 10px;
+    padding-left: 10px;
+  }
+}
+
+ at media (min-width: 980px) {
+  .nav-collapse.collapse {
+    height: auto !important;
+    overflow: visible !important;
+  }
+}
diff --git a/docs/css/bootstrap-responsive.min.css b/docs/css/bootstrap-responsive.min.css
new file mode 100644
index 0000000..5cb833f
--- /dev/null
+++ b/docs/css/bootstrap-responsive.min.css
@@ -0,0 +1,9 @@
+/*!
+ * Bootstrap Responsive v2.2.2
+ *
+ * Copyright 2012 Twitter, Inc
+ * Licensed under the Apache License v2.0
+ * http://www.apache.org/licenses/LICENSE-2.0
+ *
+ * Designed and built with all the love in the world @twitter by @mdo and @fat.
+ */@-ms-viewport{width:device-width}.clearfix{*zoom:1}.clearfix:before,.clearfix:after{display:table;line-height:0;content:""}.clearfix:after{clear:both}.hide-text{font:0/0 a;color:transparent;text-shadow:none;background-color:transparent;border:0}.input-block-level{display:block;width:100%;min-height:30px;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}.hidden{display:none;visibility:hidden}.visible-phone{display:none!important}.visible-tablet{display:none!important}.hidden-desktop{display:none!important}.visible-desktop{display:inherit!important}@media(min-width:768px) and (max-width:979px){.hidden-desktop{display:inherit!important}.visible-desktop{display:none!important}.visible-tablet{display:inherit!important}.hidden-tablet{display:none!important}}@media(max-width:767px){.hidden-desktop{display:inherit!important}.visible-desktop{display:none!important}.visible-phone{display:inherit!important}.hidden-phone{display:none!important}}@media(min
 -width:1200px){.row{margin-left:-30px;*zoom:1}.row:before,.row:after{display:table;line-height:0;content:""}.row:after{clear:both}[class*="span"]{float:left;min-height:1px;margin-left:30px}.container,.navbar-static-top .container,.navbar-fixed-top .container,.navbar-fixed-bottom .container{width:1170px}.span12{width:1170px}.span11{width:1070px}.span10{width:970px}.span9{width:870px}.span8{width:770px}.span7{width:670px}.span6{width:570px}.span5{width:470px}.span4{width:370px}.span3{width:270px}.span2{width:170px}.span1{width:70px}.offset12{margin-left:1230px}.offset11{margin-left:1130px}.offset10{margin-left:1030px}.offset9{margin-left:930px}.offset8{margin-left:830px}.offset7{margin-left:730px}.offset6{margin-left:630px}.offset5{margin-left:530px}.offset4{margin-left:430px}.offset3{margin-left:330px}.offset2{margin-left:230px}.offset1{margin-left:130px}.row-fluid{width:100%;*zoom:1}.row-fluid:before,.row-fluid:after{display:table;line-height:0;content:""}.row-fluid:after{cl
 ear:both}.row-fluid [class*="span"]{display:block;float:left;width:100%;min-height:30px;margin-left:2.564102564102564%;*margin-left:2.5109110747408616%;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}.row-fluid [class*="span"]:first-child{margin-left:0}.row-fluid .controls-row [class*="span"]+[class*="span"]{margin-left:2.564102564102564%}.row-fluid .span12{width:100%;*width:99.94680851063829%}.row-fluid .span11{width:91.45299145299145%;*width:91.39979996362975%}.row-fluid .span10{width:82.90598290598291%;*width:82.8527914166212%}.row-fluid .span9{width:74.35897435897436%;*width:74.30578286961266%}.row-fluid .span8{width:65.81196581196582%;*width:65.75877432260411%}.row-fluid .span7{width:57.26495726495726%;*width:57.21176577559556%}.row-fluid .span6{width:48.717948717948715%;*width:48.664757228587014%}.row-fluid .span5{width:40.17094017094017%;*width:40.11774868157847%}.row-fluid .span4{width:31.623931623931625%;*width:31.570740134569924%}.row
 -fluid .span3{width:23.076923076923077%;*width:23.023731587561375%}.row-fluid .span2{width:14.52991452991453%;*width:14.476723040552828%}.row-fluid .span1{width:5.982905982905983%;*width:5.929714493544281%}.row-fluid .offset12{margin-left:105.12820512820512%;*margin-left:105.02182214948171%}.row-fluid .offset12:first-child{margin-left:102.56410256410257%;*margin-left:102.45771958537915%}.row-fluid .offset11{margin-left:96.58119658119658%;*margin-left:96.47481360247316%}.row-fluid .offset11:first-child{margin-left:94.01709401709402%;*margin-left:93.91071103837061%}.row-fluid .offset10{margin-left:88.03418803418803%;*margin-left:87.92780505546462%}.row-fluid .offset10:first-child{margin-left:85.47008547008548%;*margin-left:85.36370249136206%}.row-fluid .offset9{margin-left:79.48717948717949%;*margin-left:79.38079650845607%}.row-fluid .offset9:first-child{margin-left:76.92307692307693%;*margin-left:76.81669394435352%}.row-fluid .offset8{margin-left:70.94017094017094%;*margin-le
 ft:70.83378796144753%}.row-fluid .offset8:first-child{margin-left:68.37606837606839%;*margin-left:68.26968539734497%}.row-fluid .offset7{margin-left:62.393162393162385%;*margin-left:62.28677941443899%}.row-fluid .offset7:first-child{margin-left:59.82905982905982%;*margin-left:59.72267685033642%}.row-fluid .offset6{margin-left:53.84615384615384%;*margin-left:53.739770867430444%}.row-fluid .offset6:first-child{margin-left:51.28205128205128%;*margin-left:51.175668303327875%}.row-fluid .offset5{margin-left:45.299145299145295%;*margin-left:45.1927623204219%}.row-fluid .offset5:first-child{margin-left:42.73504273504273%;*margin-left:42.62865975631933%}.row-fluid .offset4{margin-left:36.75213675213675%;*margin-left:36.645753773413354%}.row-fluid .offset4:first-child{margin-left:34.18803418803419%;*margin-left:34.081651209310785%}.row-fluid .offset3{margin-left:28.205128205128204%;*margin-left:28.0987452264048%}.row-fluid .offset3:first-child{margin-left:25.641025641025642%;*margin-
 left:25.53464266230224%}.row-fluid .offset2{margin-left:19.65811965811966%;*margin-left:19.551736679396257%}.row-fluid .offset2:first-child{margin-left:17.094017094017094%;*margin-left:16.98763411529369%}.row-fluid .offset1{margin-left:11.11111111111111%;*margin-left:11.004728132387708%}.row-fluid .offset1:first-child{margin-left:8.547008547008547%;*margin-left:8.440625568285142%}input,textarea,.uneditable-input{margin-left:0}.controls-row [class*="span"]+[class*="span"]{margin-left:30px}input.span12,textarea.span12,.uneditable-input.span12{width:1156px}input.span11,textarea.span11,.uneditable-input.span11{width:1056px}input.span10,textarea.span10,.uneditable-input.span10{width:956px}input.span9,textarea.span9,.uneditable-input.span9{width:856px}input.span8,textarea.span8,.uneditable-input.span8{width:756px}input.span7,textarea.span7,.uneditable-input.span7{width:656px}input.span6,textarea.span6,.uneditable-input.span6{width:556px}input.span5,textarea.span5,.uneditable-input
 .span5{width:456px}input.span4,textarea.span4,.uneditable-input.span4{width:356px}input.span3,textarea.span3,.uneditable-input.span3{width:256px}input.span2,textarea.span2,.uneditable-input.span2{width:156px}input.span1,textarea.span1,.uneditable-input.span1{width:56px}.thumbnails{margin-left:-30px}.thumbnails>li{margin-left:30px}.row-fluid .thumbnails{margin-left:0}}@media(min-width:768px) and (max-width:979px){.row{margin-left:-20px;*zoom:1}.row:before,.row:after{display:table;line-height:0;content:""}.row:after{clear:both}[class*="span"]{float:left;min-height:1px;margin-left:20px}.container,.navbar-static-top .container,.navbar-fixed-top .container,.navbar-fixed-bottom .container{width:724px}.span12{width:724px}.span11{width:662px}.span10{width:600px}.span9{width:538px}.span8{width:476px}.span7{width:414px}.span6{width:352px}.span5{width:290px}.span4{width:228px}.span3{width:166px}.span2{width:104px}.span1{width:42px}.offset12{margin-left:764px}.offset11{margin-left:702px
 }.offset10{margin-left:640px}.offset9{margin-left:578px}.offset8{margin-left:516px}.offset7{margin-left:454px}.offset6{margin-left:392px}.offset5{margin-left:330px}.offset4{margin-left:268px}.offset3{margin-left:206px}.offset2{margin-left:144px}.offset1{margin-left:82px}.row-fluid{width:100%;*zoom:1}.row-fluid:before,.row-fluid:after{display:table;line-height:0;content:""}.row-fluid:after{clear:both}.row-fluid [class*="span"]{display:block;float:left;width:100%;min-height:30px;margin-left:2.7624309392265194%;*margin-left:2.709239449864817%;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}.row-fluid [class*="span"]:first-child{margin-left:0}.row-fluid .controls-row [class*="span"]+[class*="span"]{margin-left:2.7624309392265194%}.row-fluid .span12{width:100%;*width:99.94680851063829%}.row-fluid .span11{width:91.43646408839778%;*width:91.38327259903608%}.row-fluid .span10{width:82.87292817679558%;*width:82.81973668743387%}.row-fluid .span9{width:74
 .30939226519337%;*width:74.25620077583166%}.row-fluid .span8{width:65.74585635359117%;*width:65.69266486422946%}.row-fluid .span7{width:57.18232044198895%;*width:57.12912895262725%}.row-fluid .span6{width:48.61878453038674%;*width:48.56559304102504%}.row-fluid .span5{width:40.05524861878453%;*width:40.00205712942283%}.row-fluid .span4{width:31.491712707182323%;*width:31.43852121782062%}.row-fluid .span3{width:22.92817679558011%;*width:22.87498530621841%}.row-fluid .span2{width:14.3646408839779%;*width:14.311449394616199%}.row-fluid .span1{width:5.801104972375691%;*width:5.747913483013988%}.row-fluid .offset12{margin-left:105.52486187845304%;*margin-left:105.41847889972962%}.row-fluid .offset12:first-child{margin-left:102.76243093922652%;*margin-left:102.6560479605031%}.row-fluid .offset11{margin-left:96.96132596685082%;*margin-left:96.8549429881274%}.row-fluid .offset11:first-child{margin-left:94.1988950276243%;*margin-left:94.09251204890089%}.row-fluid .offset10{margin-left
 :88.39779005524862%;*margin-left:88.2914070765252%}.row-fluid .offset10:first-child{margin-left:85.6353591160221%;*margin-left:85.52897613729868%}.row-fluid .offset9{margin-left:79.8342541436464%;*margin-left:79.72787116492299%}.row-fluid .offset9:first-child{margin-left:77.07182320441989%;*margin-left:76.96544022569647%}.row-fluid .offset8{margin-left:71.2707182320442%;*margin-left:71.16433525332079%}.row-fluid .offset8:first-child{margin-left:68.50828729281768%;*margin-left:68.40190431409427%}.row-fluid .offset7{margin-left:62.70718232044199%;*margin-left:62.600799341718584%}.row-fluid .offset7:first-child{margin-left:59.94475138121547%;*margin-left:59.838368402492065%}.row-fluid .offset6{margin-left:54.14364640883978%;*margin-left:54.037263430116376%}.row-fluid .offset6:first-child{margin-left:51.38121546961326%;*margin-left:51.27483249088986%}.row-fluid .offset5{margin-left:45.58011049723757%;*margin-left:45.47372751851417%}.row-fluid .offset5:first-child{margin-left:42.
 81767955801105%;*margin-left:42.71129657928765%}.row-fluid .offset4{margin-left:37.01657458563536%;*margin-left:36.91019160691196%}.row-fluid .offset4:first-child{margin-left:34.25414364640884%;*margin-left:34.14776066768544%}.row-fluid .offset3{margin-left:28.45303867403315%;*margin-left:28.346655695309746%}.row-fluid .offset3:first-child{margin-left:25.69060773480663%;*margin-left:25.584224756083227%}.row-fluid .offset2{margin-left:19.88950276243094%;*margin-left:19.783119783707537%}.row-fluid .offset2:first-child{margin-left:17.12707182320442%;*margin-left:17.02068884448102%}.row-fluid .offset1{margin-left:11.32596685082873%;*margin-left:11.219583872105325%}.row-fluid .offset1:first-child{margin-left:8.56353591160221%;*margin-left:8.457152932878806%}input,textarea,.uneditable-input{margin-left:0}.controls-row [class*="span"]+[class*="span"]{margin-left:20px}input.span12,textarea.span12,.uneditable-input.span12{width:710px}input.span11,textarea.span11,.uneditable-input.spa
 n11{width:648px}input.span10,textarea.span10,.uneditable-input.span10{width:586px}input.span9,textarea.span9,.uneditable-input.span9{width:524px}input.span8,textarea.span8,.uneditable-input.span8{width:462px}input.span7,textarea.span7,.uneditable-input.span7{width:400px}input.span6,textarea.span6,.uneditable-input.span6{width:338px}input.span5,textarea.span5,.uneditable-input.span5{width:276px}input.span4,textarea.span4,.uneditable-input.span4{width:214px}input.span3,textarea.span3,.uneditable-input.span3{width:152px}input.span2,textarea.span2,.uneditable-input.span2{width:90px}input.span1,textarea.span1,.uneditable-input.span1{width:28px}}@media(max-width:767px){body{padding-right:20px;padding-left:20px}.navbar-fixed-top,.navbar-fixed-bottom,.navbar-static-top{margin-right:-20px;margin-left:-20px}.container-fluid{padding:0}.dl-horizontal dt{float:none;width:auto;clear:none;text-align:left}.dl-horizontal dd{margin-left:0}.container{width:auto}.row-fluid{width:100%}.row,.thum
 bnails{margin-left:0}.thumbnails>li{float:none;margin-left:0}[class*="span"],.uneditable-input[class*="span"],.row-fluid [class*="span"]{display:block;float:none;width:100%;margin-left:0;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}.span12,.row-fluid .span12{width:100%;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}.row-fluid [class*="offset"]:first-child{margin-left:0}.input-large,.input-xlarge,.input-xxlarge,input[class*="span"],select[class*="span"],textarea[class*="span"],.uneditable-input{display:block;width:100%;min-height:30px;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}.input-prepend input,.input-append input,.input-prepend input[class*="span"],.input-append input[class*="span"]{display:inline-block;width:auto}.controls-row [class*="span"]+[class*="span"]{margin-left:0}.modal{position:fixed;top:20px;right:20px;left:20px;width:auto;margin:0}.modal.fade{top:-100px}.moda
 l.fade.in{top:20px}}@media(max-width:480px){.nav-collapse{-webkit-transform:translate3d(0,0,0)}.page-header h1 small{display:block;line-height:20px}input[type="checkbox"],input[type="radio"]{border:1px solid #ccc}.form-horizontal .control-label{float:none;width:auto;padding-top:0;text-align:left}.form-horizontal .controls{margin-left:0}.form-horizontal .control-list{padding-top:0}.form-horizontal .form-actions{padding-right:10px;padding-left:10px}.media .pull-left,.media .pull-right{display:block;float:none;margin-bottom:10px}.media-object{margin-right:0;margin-left:0}.modal{top:10px;right:10px;left:10px}.modal-header .close{padding:10px;margin:-10px}.carousel-caption{position:static}}@media(max-width:979px){body{padding-top:0}.navbar-fixed-top,.navbar-fixed-bottom{position:static}.navbar-fixed-top{margin-bottom:20px}.navbar-fixed-bottom{margin-top:20px}.navbar-fixed-top .navbar-inner,.navbar-fixed-bottom .navbar-inner{padding:5px}.navbar .container{width:auto;padding:0}.nav
 bar .brand{padding-right:10px;padding-left:10px;margin:0 0 0 -5px}.nav-collapse{clear:both}.nav-collapse .nav{float:none;margin:0 0 10px}.nav-collapse .nav>li{float:none}.nav-collapse .nav>li>a{margin-bottom:2px}.nav-collapse .nav>.divider-vertical{display:none}.nav-collapse .nav .nav-header{color:#777;text-shadow:none}.nav-collapse .nav>li>a,.nav-collapse .dropdown-menu a{padding:9px 15px;font-weight:bold;color:#777;-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px}.nav-collapse .btn{padding:4px 10px 4px;font-weight:normal;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px}.nav-collapse .dropdown-menu li+li a{margin-bottom:2px}.nav-collapse .nav>li>a:hover,.nav-collapse .dropdown-menu a:hover{background-color:#f2f2f2}.navbar-inverse .nav-collapse .nav>li>a,.navbar-inverse .nav-collapse .dropdown-menu a{color:#999}.navbar-inverse .nav-collapse .nav>li>a:hover,.navbar-inverse .nav-collapse .dropdown-menu a:hover{background-color:#111}.nav-coll
 apse.in .btn-group{padding:0;margin-top:5px}.nav-collapse .dropdown-menu{position:static;top:auto;left:auto;display:none;float:none;max-width:none;padding:0;margin:0 15px;background-color:transparent;border:0;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0;-webkit-box-shadow:none;-moz-box-shadow:none;box-shadow:none}.nav-collapse .open>.dropdown-menu{display:block}.nav-collapse .dropdown-menu:before,.nav-collapse .dropdown-menu:after{display:none}.nav-collapse .dropdown-menu .divider{display:none}.nav-collapse .nav>li>.dropdown-menu:before,.nav-collapse .nav>li>.dropdown-menu:after{display:none}.nav-collapse .navbar-form,.nav-collapse .navbar-search{float:none;padding:10px 15px;margin:10px 0;border-top:1px solid #f2f2f2;border-bottom:1px solid #f2f2f2;-webkit-box-shadow:inset 0 1px 0 rgba(255,255,255,0.1),0 1px 0 rgba(255,255,255,0.1);-moz-box-shadow:inset 0 1px 0 rgba(255,255,255,0.1),0 1px 0 rgba(255,255,255,0.1);box-shadow:inset 0 1px 0 rgba(255,255,255,0.1),
 0 1px 0 rgba(255,255,255,0.1)}.navbar-inverse .nav-collapse .navbar-form,.navbar-inverse .nav-collapse .navbar-search{border-top-color:#111;border-bottom-color:#111}.navbar .nav-collapse .nav.pull-right{float:none;margin-left:0}.nav-collapse,.nav-collapse.collapse{height:0;overflow:hidden}.navbar .btn-navbar{display:block}.navbar-static .navbar-inner{padding-right:10px;padding-left:10px}}@media(min-width:980px){.nav-collapse.collapse{height:auto!important;overflow:visible!important}}
diff --git a/docs/css/bootstrap.css b/docs/css/bootstrap.css
new file mode 100644
index 0000000..294b08a
--- /dev/null
+++ b/docs/css/bootstrap.css
@@ -0,0 +1,6039 @@
+/*!
+ * Bootstrap v2.2.2
+ *
+ * Copyright 2012 Twitter, Inc
+ * Licensed under the Apache License v2.0
+ * http://www.apache.org/licenses/LICENSE-2.0
+ *
+ * Designed and built with all the love in the world @twitter by @mdo and @fat.
+ */
+
+article,
+aside,
+details,
+figcaption,
+figure,
+footer,
+header,
+hgroup,
+nav,
+section {
+  display: block;
+}
+
+audio,
+canvas,
+video {
+  display: inline-block;
+  *display: inline;
+  *zoom: 1;
+}
+
+audio:not([controls]) {
+  display: none;
+}
+
+html {
+  font-size: 100%;
+  -webkit-text-size-adjust: 100%;
+      -ms-text-size-adjust: 100%;
+}
+
+a:focus {
+  outline: thin dotted #333;
+  outline: 5px auto -webkit-focus-ring-color;
+  outline-offset: -2px;
+}
+
+a:hover,
+a:active {
+  outline: 0;
+}
+
+sub,
+sup {
+  position: relative;
+  font-size: 75%;
+  line-height: 0;
+  vertical-align: baseline;
+}
+
+sup {
+  top: -0.5em;
+}
+
+sub {
+  bottom: -0.25em;
+}
+
+img {
+  width: auto\9;
+  height: auto;
+  max-width: 100%;
+  vertical-align: middle;
+  border: 0;
+  -ms-interpolation-mode: bicubic;
+}
+
+#map_canvas img,
+.google-maps img {
+  max-width: none;
+}
+
+button,
+input,
+select,
+textarea {
+  margin: 0;
+  font-size: 100%;
+  vertical-align: middle;
+}
+
+button,
+input {
+  *overflow: visible;
+  line-height: normal;
+}
+
+button::-moz-focus-inner,
+input::-moz-focus-inner {
+  padding: 0;
+  border: 0;
+}
+
+button,
+html input[type="button"],
+input[type="reset"],
+input[type="submit"] {
+  cursor: pointer;
+  -webkit-appearance: button;
+}
+
+label,
+select,
+button,
+input[type="button"],
+input[type="reset"],
+input[type="submit"],
+input[type="radio"],
+input[type="checkbox"] {
+  cursor: pointer;
+}
+
+input[type="search"] {
+  -webkit-box-sizing: content-box;
+     -moz-box-sizing: content-box;
+          box-sizing: content-box;
+  -webkit-appearance: textfield;
+}
+
+input[type="search"]::-webkit-search-decoration,
+input[type="search"]::-webkit-search-cancel-button {
+  -webkit-appearance: none;
+}
+
+textarea {
+  overflow: auto;
+  vertical-align: top;
+}
+
+ at media print {
+  * {
+    color: #000 !important;
+    text-shadow: none !important;
+    background: transparent !important;
+    box-shadow: none !important;
+  }
+  a,
+  a:visited {
+    text-decoration: underline;
+  }
+  a[href]:after {
+    content: " (" attr(href) ")";
+  }
+  abbr[title]:after {
+    content: " (" attr(title) ")";
+  }
+  .ir a:after,
+  a[href^="javascript:"]:after,
+  a[href^="#"]:after {
+    content: "";
+  }
+  pre,
+  blockquote {
+    border: 1px solid #999;
+    page-break-inside: avoid;
+  }
+  thead {
+    display: table-header-group;
+  }
+  tr,
+  img {
+    page-break-inside: avoid;
+  }
+  img {
+    max-width: 100% !important;
+  }
+  @page  {
+    margin: 0.5cm;
+  }
+  p,
+  h2,
+  h3 {
+    orphans: 3;
+    widows: 3;
+  }
+  h2,
+  h3 {
+    page-break-after: avoid;
+  }
+}
+
+.clearfix {
+  *zoom: 1;
+}
+
+.clearfix:before,
+.clearfix:after {
+  display: table;
+  line-height: 0;
+  content: "";
+}
+
+.clearfix:after {
+  clear: both;
+}
+
+.hide-text {
+  font: 0/0 a;
+  color: transparent;
+  text-shadow: none;
+  background-color: transparent;
+  border: 0;
+}
+
+.input-block-level {
+  display: block;
+  width: 100%;
+  min-height: 30px;
+  -webkit-box-sizing: border-box;
+     -moz-box-sizing: border-box;
+          box-sizing: border-box;
+}
+
+body {
+  margin: 0;
+  font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
+  font-size: 14px;
+  line-height: 20px;
+  color: #333333;
+  background-color: #ffffff;
+}
+
+a {
+  color: #0088cc;
+  text-decoration: none;
+}
+
+a:hover {
+  color: #005580;
+  text-decoration: underline;
+}
+
+.img-rounded {
+  -webkit-border-radius: 6px;
+     -moz-border-radius: 6px;
+          border-radius: 6px;
+}
+
+.img-polaroid {
+  padding: 4px;
+  background-color: #fff;
+  border: 1px solid #ccc;
+  border: 1px solid rgba(0, 0, 0, 0.2);
+  -webkit-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
+     -moz-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
+          box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
+}
+
+.img-circle {
+  -webkit-border-radius: 500px;
+     -moz-border-radius: 500px;
+          border-radius: 500px;
+}
+
+.row {
+  margin-left: -20px;
+  *zoom: 1;
+}
+
+.row:before,
+.row:after {
+  display: table;
+  line-height: 0;
+  content: "";
+}
+
+.row:after {
+  clear: both;
+}
+
+[class*="span"] {
+  float: left;
+  min-height: 1px;
+  margin-left: 20px;
+}
+
+.container,
+.navbar-static-top .container,
+.navbar-fixed-top .container,
+.navbar-fixed-bottom .container {
+  width: 940px;
+}
+
+.span12 {
+  width: 940px;
+}
+
+.span11 {
+  width: 860px;
+}
+
+.span10 {
+  width: 780px;
+}
+
+.span9 {
+  width: 700px;
+}
+
+.span8 {
+  width: 620px;
+}
+
+.span7 {
+  width: 540px;
+}
+
+.span6 {
+  width: 460px;
+}
+
+.span5 {
+  width: 380px;
+}
+
+.span4 {
+  width: 300px;
+}
+
+.span3 {
+  width: 220px;
+}
+
+.span2 {
+  width: 140px;
+}
+
+.span1 {
+  width: 60px;
+}
+
+.offset12 {
+  margin-left: 980px;
+}
+
+.offset11 {
+  margin-left: 900px;
+}
+
+.offset10 {
+  margin-left: 820px;
+}
+
+.offset9 {
+  margin-left: 740px;
+}
+
+.offset8 {
+  margin-left: 660px;
+}
+
+.offset7 {
+  margin-left: 580px;
+}
+
+.offset6 {
+  margin-left: 500px;
+}
+
+.offset5 {
+  margin-left: 420px;
+}
+
+.offset4 {
+  margin-left: 340px;
+}
+
+.offset3 {
+  margin-left: 260px;
+}
+
+.offset2 {
+  margin-left: 180px;
+}
+
+.offset1 {
+  margin-left: 100px;
+}
+
+.row-fluid {
+  width: 100%;
+  *zoom: 1;
+}
+
+.row-fluid:before,
+.row-fluid:after {
+  display: table;
+  line-height: 0;
+  content: "";
+}
+
+.row-fluid:after {
+  clear: both;
+}
+
+.row-fluid [class*="span"] {
+  display: block;
+  float: left;
+  width: 100%;
+  min-height: 30px;
+  margin-left: 2.127659574468085%;
+  *margin-left: 2.074468085106383%;
+  -webkit-box-sizing: border-box;
+     -moz-box-sizing: border-box;
+          box-sizing: border-box;
+}
+
+.row-fluid [class*="span"]:first-child {
+  margin-left: 0;
+}
+
+.row-fluid .controls-row [class*="span"] + [class*="span"] {
+  margin-left: 2.127659574468085%;
+}
+
+.row-fluid .span12 {
+  width: 100%;
+  *width: 99.94680851063829%;
+}
+
+.row-fluid .span11 {
+  width: 91.48936170212765%;
+  *width: 91.43617021276594%;
+}
+
+.row-fluid .span10 {
+  width: 82.97872340425532%;
+  *width: 82.92553191489361%;
+}
+
+.row-fluid .span9 {
+  width: 74.46808510638297%;
+  *width: 74.41489361702126%;
+}
+
+.row-fluid .span8 {
+  width: 65.95744680851064%;
+  *width: 65.90425531914893%;
+}
+
+.row-fluid .span7 {
+  width: 57.44680851063829%;
+  *width: 57.39361702127659%;
+}
+
+.row-fluid .span6 {
+  width: 48.93617021276595%;
+  *width: 48.88297872340425%;
+}
+
+.row-fluid .span5 {
+  width: 40.42553191489362%;
+  *width: 40.37234042553192%;
+}
+
+.row-fluid .span4 {
+  width: 31.914893617021278%;
+  *width: 31.861702127659576%;
+}
+
+.row-fluid .span3 {
+  width: 23.404255319148934%;
+  *width: 23.351063829787233%;
+}
+
+.row-fluid .span2 {
+  width: 14.893617021276595%;
+  *width: 14.840425531914894%;
+}
+
+.row-fluid .span1 {
+  width: 6.382978723404255%;
+  *width: 6.329787234042553%;
+}
+
+.row-fluid .offset12 {
+  margin-left: 104.25531914893617%;
+  *margin-left: 104.14893617021275%;
+}
+
+.row-fluid .offset12:first-child {
+  margin-left: 102.12765957446808%;
+  *margin-left: 102.02127659574467%;
+}
+
+.row-fluid .offset11 {
+  margin-left: 95.74468085106382%;
+  *margin-left: 95.6382978723404%;
+}
+
+.row-fluid .offset11:first-child {
+  margin-left: 93.61702127659574%;
+  *margin-left: 93.51063829787232%;
+}
+
+.row-fluid .offset10 {
+  margin-left: 87.23404255319149%;
+  *margin-left: 87.12765957446807%;
+}
+
+.row-fluid .offset10:first-child {
+  margin-left: 85.1063829787234%;
+  *margin-left: 84.99999999999999%;
+}
+
+.row-fluid .offset9 {
+  margin-left: 78.72340425531914%;
+  *margin-left: 78.61702127659572%;
+}
+
+.row-fluid .offset9:first-child {
+  margin-left: 76.59574468085106%;
+  *margin-left: 76.48936170212764%;
+}
+
+.row-fluid .offset8 {
+  margin-left: 70.2127659574468%;
+  *margin-left: 70.10638297872339%;
+}
+
+.row-fluid .offset8:first-child {
+  margin-left: 68.08510638297872%;
+  *margin-left: 67.9787234042553%;
+}
+
+.row-fluid .offset7 {
+  margin-left: 61.70212765957446%;
+  *margin-left: 61.59574468085106%;
+}
+
+.row-fluid .offset7:first-child {
+  margin-left: 59.574468085106375%;
+  *margin-left: 59.46808510638297%;
+}
+
+.row-fluid .offset6 {
+  margin-left: 53.191489361702125%;
+  *margin-left: 53.085106382978715%;
+}
+
+.row-fluid .offset6:first-child {
+  margin-left: 51.063829787234035%;
+  *margin-left: 50.95744680851063%;
+}
+
+.row-fluid .offset5 {
+  margin-left: 44.68085106382979%;
+  *margin-left: 44.57446808510638%;
+}
+
+.row-fluid .offset5:first-child {
+  margin-left: 42.5531914893617%;
+  *margin-left: 42.4468085106383%;
+}
+
+.row-fluid .offset4 {
+  margin-left: 36.170212765957444%;
+  *margin-left: 36.06382978723405%;
+}
+
+.row-fluid .offset4:first-child {
+  margin-left: 34.04255319148936%;
+  *margin-left: 33.93617021276596%;
+}
+
+.row-fluid .offset3 {
+  margin-left: 27.659574468085104%;
+  *margin-left: 27.5531914893617%;
+}
+
+.row-fluid .offset3:first-child {
+  margin-left: 25.53191489361702%;
+  *margin-left: 25.425531914893618%;
+}
+
+.row-fluid .offset2 {
+  margin-left: 19.148936170212764%;
+  *margin-left: 19.04255319148936%;
+}
+
+.row-fluid .offset2:first-child {
+  margin-left: 17.02127659574468%;
+  *margin-left: 16.914893617021278%;
+}
+
+.row-fluid .offset1 {
+  margin-left: 10.638297872340425%;
+  *margin-left: 10.53191489361702%;
+}
+
+.row-fluid .offset1:first-child {
+  margin-left: 8.51063829787234%;
+  *margin-left: 8.404255319148938%;
+}
+
+[class*="span"].hide,
+.row-fluid [class*="span"].hide {
+  display: none;
+}
+
+[class*="span"].pull-right,
+.row-fluid [class*="span"].pull-right {
+  float: right;
+}
+
+.container {
+  margin-right: auto;
+  margin-left: auto;
+  *zoom: 1;
+}
+
+.container:before,
+.container:after {
+  display: table;
+  line-height: 0;
+  content: "";
+}
+
+.container:after {
+  clear: both;
+}
+
+.container-fluid {
+  padding-right: 20px;
+  padding-left: 20px;
+  *zoom: 1;
+}
+
+.container-fluid:before,
+.container-fluid:after {
+  display: table;
+  line-height: 0;
+  content: "";
+}
+
+.container-fluid:after {
+  clear: both;
+}
+
+p {
+  margin: 0 0 10px;
+}
+
+.lead {
+  margin-bottom: 20px;
+  font-size: 21px;
+  font-weight: 200;
+  line-height: 30px;
+}
+
+small {
+  font-size: 85%;
+}
+
+strong {
+  font-weight: bold;
+}
+
+em {
+  font-style: italic;
+}
+
+cite {
+  font-style: normal;
+}
+
+.muted {
+  color: #999999;
+}
+
+a.muted:hover {
+  color: #808080;
+}
+
+.text-warning {
+  color: #c09853;
+}
+
+a.text-warning:hover {
+  color: #a47e3c;
+}
+
+.text-error {
+  color: #b94a48;
+}
+
+a.text-error:hover {
+  color: #953b39;
+}
+
+.text-info {
+  color: #3a87ad;
+}
+
+a.text-info:hover {
+  color: #2d6987;
+}
+
+.text-success {
+  color: #468847;
+}
+
+a.text-success:hover {
+  color: #356635;
+}
+
+h1,
+h2,
+h3,
+h4,
+h5,
+h6 {
+  margin: 10px 0;
+  font-family: inherit;
+  font-weight: bold;
+  line-height: 20px;
+  color: inherit;
+  text-rendering: optimizelegibility;
+}
+
+h1 small,
+h2 small,
+h3 small,
+h4 small,
+h5 small,
+h6 small {
+  font-weight: normal;
+  line-height: 1;
+  color: #999999;
+}
+
+h1,
+h2,
+h3 {
+  line-height: 40px;
+}
+
+h1 {
+  font-size: 38.5px;
+}
+
+h2 {
+  font-size: 31.5px;
+}
+
+h3 {
+  font-size: 24.5px;
+}
+
+h4 {
+  font-size: 17.5px;
+}
+
+h5 {
+  font-size: 14px;
+}
+
+h6 {
+  font-size: 11.9px;
+}
+
+h1 small {
+  font-size: 24.5px;
+}
+
+h2 small {
+  font-size: 17.5px;
+}
+
+h3 small {
+  font-size: 14px;
+}
+
+h4 small {
+  font-size: 14px;
+}
+
+.page-header {
+  padding-bottom: 9px;
+  margin: 20px 0 30px;
+  border-bottom: 1px solid #eeeeee;
+}
+
+ul,
+ol {
+  padding: 0;
+  margin: 0 0 10px 25px;
+}
+
+ul ul,
+ul ol,
+ol ol,
+ol ul {
+  margin-bottom: 0;
+}
+
+li {
+  line-height: 20px;
+}
+
+ul.unstyled,
+ol.unstyled {
+  margin-left: 0;
+  list-style: none;
+}
+
+ul.inline,
+ol.inline {
+  margin-left: 0;
+  list-style: none;
+}
+
+ul.inline > li,
+ol.inline > li {
+  display: inline-block;
+  padding-right: 5px;
+  padding-left: 5px;
+}
+
+dl {
+  margin-bottom: 20px;
+}
+
+dt,
+dd {
+  line-height: 20px;
+}
+
+dt {
+  font-weight: bold;
+}
+
+dd {
+  margin-left: 10px;
+}
+
+.dl-horizontal {
+  *zoom: 1;
+}
+
+.dl-horizontal:before,
+.dl-horizontal:after {
+  display: table;
+  line-height: 0;
+  content: "";
+}
+
+.dl-horizontal:after {
+  clear: both;
+}
+
+.dl-horizontal dt {
+  float: left;
+  width: 160px;
+  overflow: hidden;
+  clear: left;
+  text-align: right;
+  text-overflow: ellipsis;
+  white-space: nowrap;
+}
+
+.dl-horizontal dd {
+  margin-left: 180px;
+}
+
+hr {
+  margin: 20px 0;
+  border: 0;
+  border-top: 1px solid #eeeeee;
+  border-bottom: 1px solid #ffffff;
+}
+
+abbr[title],
+abbr[data-original-title] {
+  cursor: help;
+  border-bottom: 1px dotted #999999;
+}
+
+abbr.initialism {
+  font-size: 90%;
+  text-transform: uppercase;
+}
+
+blockquote {
+  padding: 0 0 0 15px;
+  margin: 0 0 20px;
+  border-left: 5px solid #eeeeee;
+}
+
+blockquote p {
+  margin-bottom: 0;
+  font-size: 16px;
+  font-weight: 300;
+  line-height: 25px;
+}
+
+blockquote small {
+  display: block;
+  line-height: 20px;
+  color: #999999;
+}
+
+blockquote small:before {
+  content: '\2014 \00A0';
+}
+
+blockquote.pull-right {
+  float: right;
+  padding-right: 15px;
+  padding-left: 0;
+  border-right: 5px solid #eeeeee;
+  border-left: 0;
+}
+
+blockquote.pull-right p,
+blockquote.pull-right small {
+  text-align: right;
+}
+
+blockquote.pull-right small:before {
+  content: '';
+}
+
+blockquote.pull-right small:after {
+  content: '\00A0 \2014';
+}
+
+q:before,
+q:after,
+blockquote:before,
+blockquote:after {
+  content: "";
+}
+
+address {
+  display: block;
+  margin-bottom: 20px;
+  font-style: normal;
+  line-height: 20px;
+}
+
+code,
+pre {
+  padding: 0 3px 2px;
+  font-family: Monaco, Menlo, Consolas, "Courier New", monospace;
+  font-size: 12px;
+  color: #333333;
+  -webkit-border-radius: 3px;
+     -moz-border-radius: 3px;
+          border-radius: 3px;
+}
+
+code {
+  padding: 2px 4px;
+  color: #d14;
+  white-space: nowrap;
+  background-color: #f7f7f9;
+  border: 1px solid #e1e1e8;
+}
+
+pre {
+  display: block;
+  padding: 9.5px;
+  margin: 0 0 10px;
+  font-size: 13px;
+  line-height: 20px;
+  word-break: break-all;
+  word-wrap: break-word;
+  white-space: pre;
+  white-space: pre-wrap;
+  background-color: #f5f5f5;
+  border: 1px solid #ccc;
+  border: 1px solid rgba(0, 0, 0, 0.15);
+  -webkit-border-radius: 4px;
+     -moz-border-radius: 4px;
+          border-radius: 4px;
+}
+
+pre.prettyprint {
+  margin-bottom: 20px;
+}
+
+pre code {
+  padding: 0;
+  color: inherit;
+  white-space: pre;
+  white-space: pre-wrap;
+  background-color: transparent;
+  border: 0;
+}
+
+.pre-scrollable {
+  max-height: 340px;
+  overflow-y: scroll;
+}
+
+form {
+  margin: 0 0 20px;
+}
+
+fieldset {
+  padding: 0;
+  margin: 0;
+  border: 0;
+}
+
+legend {
+  display: block;
+  width: 100%;
+  padding: 0;
+  margin-bottom: 20px;
+  font-size: 21px;
+  line-height: 40px;
+  color: #333333;
+  border: 0;
+  border-bottom: 1px solid #e5e5e5;
+}
+
+legend small {
+  font-size: 15px;
+  color: #999999;
+}
+
+label,
+input,
+button,
+select,
+textarea {
+  font-size: 14px;
+  font-weight: normal;
+  line-height: 20px;
+}
+
+input,
+button,
+select,
+textarea {
+  font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
+}
+
+label {
+  display: block;
+  margin-bottom: 5px;
+}
+
+select,
+textarea,
+input[type="text"],
+input[type="password"],
+input[type="datetime"],
+input[type="datetime-local"],
+input[type="date"],
+input[type="month"],
+input[type="time"],
+input[type="week"],
+input[type="number"],
+input[type="email"],
+input[type="url"],
+input[type="search"],
+input[type="tel"],
+input[type="color"],
+.uneditable-input {
+  display: inline-block;
+  height: 20px;
+  padding: 4px 6px;
+  margin-bottom: 10px;
+  font-size: 14px;
+  line-height: 20px;
+  color: #555555;
+  vertical-align: middle;
+  -webkit-border-radius: 4px;
+     -moz-border-radius: 4px;
+          border-radius: 4px;
+}
+
+input,
+textarea,
+.uneditable-input {
+  width: 206px;
+}
+
+textarea {
+  height: auto;
+}
+
+textarea,
+input[type="text"],
+input[type="password"],
+input[type="datetime"],
+input[type="datetime-local"],
+input[type="date"],
+input[type="month"],
+input[type="time"],
+input[type="week"],
+input[type="number"],
+input[type="email"],
+input[type="url"],
+input[type="search"],
+input[type="tel"],
+input[type="color"],
+.uneditable-input {
+  background-color: #ffffff;
+  border: 1px solid #cccccc;
+  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
+     -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
+          box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
+  -webkit-transition: border linear 0.2s, box-shadow linear 0.2s;
+     -moz-transition: border linear 0.2s, box-shadow linear 0.2s;
+       -o-transition: border linear 0.2s, box-shadow linear 0.2s;
+          transition: border linear 0.2s, box-shadow linear 0.2s;
+}
+
+textarea:focus,
+input[type="text"]:focus,
+input[type="password"]:focus,
+input[type="datetime"]:focus,
+input[type="datetime-local"]:focus,
+input[type="date"]:focus,
+input[type="month"]:focus,
+input[type="time"]:focus,
+input[type="week"]:focus,
+input[type="number"]:focus,
+input[type="email"]:focus,
+input[type="url"]:focus,
+input[type="search"]:focus,
+input[type="tel"]:focus,
+input[type="color"]:focus,
+.uneditable-input:focus {
+  border-color: rgba(82, 168, 236, 0.8);
+  outline: 0;
+  outline: thin dotted \9;
+  /* IE6-9 */
+
+  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(82, 168, 236, 0.6);
+     -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(82, 168, 236, 0.6);
+          box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(82, 168, 236, 0.6);
+}
+
+input[type="radio"],
+input[type="checkbox"] {
+  margin: 4px 0 0;
+  margin-top: 1px \9;
+  *margin-top: 0;
+  line-height: normal;
+}
+
+input[type="file"],
+input[type="image"],
+input[type="submit"],
+input[type="reset"],
+input[type="button"],
+input[type="radio"],
+input[type="checkbox"] {
+  width: auto;
+}
+
+select,
+input[type="file"] {
+  height: 30px;
+  /* In IE7, the height of the select element cannot be changed by height, only font-size */
+
+  *margin-top: 4px;
+  /* For IE7, add top margin to align select with labels */
+
+  line-height: 30px;
+}
+
+select {
+  width: 220px;
+  background-color: #ffffff;
+  border: 1px solid #cccccc;
+}
+
+select[multiple],
+select[size] {
+  height: auto;
+}
+
+select:focus,
+input[type="file"]:focus,
+input[type="radio"]:focus,
+input[type="checkbox"]:focus {
+  outline: thin dotted #333;
+  outline: 5px auto -webkit-focus-ring-color;
+  outline-offset: -2px;
+}
+
+.uneditable-input,
+.uneditable-textarea {
+  color: #999999;
+  cursor: not-allowed;
+  background-color: #fcfcfc;
+  border-color: #cccccc;
+  -webkit-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.025);
+     -moz-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.025);
+          box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.025);
+}
+
+.uneditable-input {
+  overflow: hidden;
+  white-space: nowrap;
+}
+
+.uneditable-textarea {
+  width: auto;
+  height: auto;
+}
+
+input:-moz-placeholder,
+textarea:-moz-placeholder {
+  color: #999999;
+}
+
+input:-ms-input-placeholder,
+textarea:-ms-input-placeholder {
+  color: #999999;
+}
+
+input::-webkit-input-placeholder,
+textarea::-webkit-input-placeholder {
+  color: #999999;
+}
+
+.radio,
+.checkbox {
+  min-height: 20px;
+  padding-left: 20px;
+}
+
+.radio input[type="radio"],
+.checkbox input[type="checkbox"] {
+  float: left;
+  margin-left: -20px;
+}
+
+.controls > .radio:first-child,
+.controls > .checkbox:first-child {
+  padding-top: 5px;
+}
+
+.radio.inline,
+.checkbox.inline {
+  display: inline-block;
+  padding-top: 5px;
+  margin-bottom: 0;
+  vertical-align: middle;
+}
+
+.radio.inline + .radio.inline,
+.checkbox.inline + .checkbox.inline {
+  margin-left: 10px;
+}
+
+.input-mini {
+  width: 60px;
+}
+
+.input-small {
+  width: 90px;
+}
+
+.input-medium {
+  width: 150px;
+}
+
+.input-large {
+  width: 210px;
+}
+
+.input-xlarge {
+  width: 270px;
+}
+
+.input-xxlarge {
+  width: 530px;
+}
+
+input[class*="span"],
+select[class*="span"],
+textarea[class*="span"],
+.uneditable-input[class*="span"],
+.row-fluid input[class*="span"],
+.row-fluid select[class*="span"],
+.row-fluid textarea[class*="span"],
+.row-fluid .uneditable-input[class*="span"] {
+  float: none;
+  margin-left: 0;
+}
+
+.input-append input[class*="span"],
+.input-append .uneditable-input[class*="span"],
+.input-prepend input[class*="span"],
+.input-prepend .uneditable-input[class*="span"],
+.row-fluid input[class*="span"],
+.row-fluid select[class*="span"],
+.row-fluid textarea[class*="span"],
+.row-fluid .uneditable-input[class*="span"],
+.row-fluid .input-prepend [class*="span"],
+.row-fluid .input-append [class*="span"] {
+  display: inline-block;
+}
+
+input,
+textarea,
+.uneditable-input {
+  margin-left: 0;
+}
+
+.controls-row [class*="span"] + [class*="span"] {
+  margin-left: 20px;
+}
+
+input.span12,
+textarea.span12,
+.uneditable-input.span12 {
+  width: 926px;
+}
+
+input.span11,
+textarea.span11,
+.uneditable-input.span11 {
+  width: 846px;
+}
+
+input.span10,
+textarea.span10,
+.uneditable-input.span10 {
+  width: 766px;
+}
+
+input.span9,
+textarea.span9,
+.uneditable-input.span9 {
+  width: 686px;
+}
+
+input.span8,
+textarea.span8,
+.uneditable-input.span8 {
+  width: 606px;
+}
+
+input.span7,
+textarea.span7,
+.uneditable-input.span7 {
+  width: 526px;
+}
+
+input.span6,
+textarea.span6,
+.uneditable-input.span6 {
+  width: 446px;
+}
+
+input.span5,
+textarea.span5,
+.uneditable-input.span5 {
+  width: 366px;
+}
+
+input.span4,
+textarea.span4,
+.uneditable-input.span4 {
+  width: 286px;
+}
+
+input.span3,
+textarea.span3,
+.uneditable-input.span3 {
+  width: 206px;
+}
+
+input.span2,
+textarea.span2,
+.uneditable-input.span2 {
+  width: 126px;
+}
+
+input.span1,
+textarea.span1,
+.uneditable-input.span1 {
+  width: 46px;
+}
+
+.controls-row {
+  *zoom: 1;
+}
+
+.controls-row:before,
+.controls-row:after {
+  display: table;
+  line-height: 0;
+  content: "";
+}
+
+.controls-row:after {
+  clear: both;
+}
+
+.controls-row [class*="span"],
+.row-fluid .controls-row [class*="span"] {
+  float: left;
+}
+
+.controls-row .checkbox[class*="span"],
+.controls-row .radio[class*="span"] {
+  padding-top: 5px;
+}
+
+input[disabled],
+select[disabled],
+textarea[disabled],
+input[readonly],
+select[readonly],
+textarea[readonly] {
+  cursor: not-allowed;
+  background-color: #eeeeee;
+}
+
+input[type="radio"][disabled],
+input[type="checkbox"][disabled],
+input[type="radio"][readonly],
+input[type="checkbox"][readonly] {
+  background-color: transparent;
+}
+
+.control-group.warning .control-label,
+.control-group.warning .help-block,
+.control-group.warning .help-inline {
+  color: #c09853;
+}
+
+.control-group.warning .checkbox,
+.control-group.warning .radio,
+.control-group.warning input,
+.control-group.warning select,
+.control-group.warning textarea {
+  color: #c09853;
+}
+
+.control-group.warning input,
+.control-group.warning select,
+.control-group.warning textarea {
+  border-color: #c09853;
+  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
+     -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
+          box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
+}
+
+.control-group.warning input:focus,
+.control-group.warning select:focus,
+.control-group.warning textarea:focus {
+  border-color: #a47e3c;
+  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #dbc59e;
+     -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #dbc59e;
+          box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #dbc59e;
+}
+
+.control-group.warning .input-prepend .add-on,
+.control-group.warning .input-append .add-on {
+  color: #c09853;
+  background-color: #fcf8e3;
+  border-color: #c09853;
+}
+
+.control-group.error .control-label,
+.control-group.error .help-block,
+.control-group.error .help-inline {
+  color: #b94a48;
+}
+
+.control-group.error .checkbox,
+.control-group.error .radio,
+.control-group.error input,
+.control-group.error select,
+.control-group.error textarea {
+  color: #b94a48;
+}
+
+.control-group.error input,
+.control-group.error select,
+.control-group.error textarea {
+  border-color: #b94a48;
+  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
+     -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
+          box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
+}
+
+.control-group.error input:focus,
+.control-group.error select:focus,
+.control-group.error textarea:focus {
+  border-color: #953b39;
+  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #d59392;
+     -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #d59392;
+          box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #d59392;
+}
+
+.control-group.error .input-prepend .add-on,
+.control-group.error .input-append .add-on {
+  color: #b94a48;
+  background-color: #f2dede;
+  border-color: #b94a48;
+}
+
+.control-group.success .control-label,
+.control-group.success .help-block,
+.control-group.success .help-inline {
+  color: #468847;
+}
+
+.control-group.success .checkbox,
+.control-group.success .radio,
+.control-group.success input,
+.control-group.success select,
+.control-group.success textarea {
+  color: #468847;
+}
+
+.control-group.success input,
+.control-group.success select,
+.control-group.success textarea {
+  border-color: #468847;
+  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
+     -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
+          box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
+}
+
+.control-group.success input:focus,
+.control-group.success select:focus,
+.control-group.success textarea:focus {
+  border-color: #356635;
+  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #7aba7b;
+     -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #7aba7b;
+          box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #7aba7b;
+}
+
+.control-group.success .input-prepend .add-on,
+.control-group.success .input-append .add-on {
+  color: #468847;
+  background-color: #dff0d8;
+  border-color: #468847;
+}
+
+.control-group.info .control-label,
+.control-group.info .help-block,
+.control-group.info .help-inline {
+  color: #3a87ad;
+}
+
+.control-group.info .checkbox,
+.control-group.info .radio,
+.control-group.info input,
+.control-group.info select,
+.control-group.info textarea {
+  color: #3a87ad;
+}
+
+.control-group.info input,
+.control-group.info select,
+.control-group.info textarea {
+  border-color: #3a87ad;
+  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
+     -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
+          box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
+}
+
+.control-group.info input:focus,
+.control-group.info select:focus,
+.control-group.info textarea:focus {
+  border-color: #2d6987;
+  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #7ab5d3;
+     -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #7ab5d3;
+          box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #7ab5d3;
+}
+
+.control-group.info .input-prepend .add-on,
+.control-group.info .input-append .add-on {
+  color: #3a87ad;
+  background-color: #d9edf7;
+  border-color: #3a87ad;
+}
+
+input:focus:invalid,
+textarea:focus:invalid,
+select:focus:invalid {
+  color: #b94a48;
+  border-color: #ee5f5b;
+}
+
+input:focus:invalid:focus,
+textarea:focus:invalid:focus,
+select:focus:invalid:focus {
+  border-color: #e9322d;
+  -webkit-box-shadow: 0 0 6px #f8b9b7;
+     -moz-box-shadow: 0 0 6px #f8b9b7;
+          box-shadow: 0 0 6px #f8b9b7;
+}
+
+.form-actions {
+  padding: 19px 20px 20px;
+  margin-top: 20px;
+  margin-bottom: 20px;
+  background-color: #f5f5f5;
+  border-top: 1px solid #e5e5e5;
+  *zoom: 1;
+}
+
+.form-actions:before,
+.form-actions:after {
+  display: table;
+  line-height: 0;
+  content: "";
+}
+
+.form-actions:after {
+  clear: both;
+}
+
+.help-block,
+.help-inline {
+  color: #595959;
+}
+
+.help-block {
+  display: block;
+  margin-bottom: 10px;
+}
+
+.help-inline {
+  display: inline-block;
+  *display: inline;
+  padding-left: 5px;
+  vertical-align: middle;
+  *zoom: 1;
+}
+
+.input-append,
+.input-prepend {
+  margin-bottom: 5px;
+  font-size: 0;
+  white-space: nowrap;
+}
+
+.input-append input,
+.input-prepend input,
+.input-append select,
+.input-prepend select,
+.input-append .uneditable-input,
+.input-prepend .uneditable-input,
+.input-append .dropdown-menu,
+.input-prepend .dropdown-menu {
+  font-size: 14px;
+}
+
+.input-append input,
+.input-prepend input,
+.input-append select,
+.input-prepend select,
+.input-append .uneditable-input,
+.input-prepend .uneditable-input {
+  position: relative;
+  margin-bottom: 0;
+  *margin-left: 0;
+  vertical-align: top;
+  -webkit-border-radius: 0 4px 4px 0;
+     -moz-border-radius: 0 4px 4px 0;
+          border-radius: 0 4px 4px 0;
+}
+
+.input-append input:focus,
+.input-prepend input:focus,
+.input-append select:focus,
+.input-prepend select:focus,
+.input-append .uneditable-input:focus,
+.input-prepend .uneditable-input:focus {
+  z-index: 2;
+}
+
+.input-append .add-on,
+.input-prepend .add-on {
+  display: inline-block;
+  width: auto;
+  height: 20px;
+  min-width: 16px;
+  padding: 4px 5px;
+  font-size: 14px;
+  font-weight: normal;
+  line-height: 20px;
+  text-align: center;
+  text-shadow: 0 1px 0 #ffffff;
+  background-color: #eeeeee;
+  border: 1px solid #ccc;
+}
+
+.input-append .add-on,
+.input-prepend .add-on,
+.input-append .btn,
+.input-prepend .btn,
+.input-append .btn-group > .dropdown-toggle,
+.input-prepend .btn-group > .dropdown-toggle {
+  vertical-align: top;
+  -webkit-border-radius: 0;
+     -moz-border-radius: 0;
+          border-radius: 0;
+}
+
+.input-append .active,
+.input-prepend .active {
+  background-color: #a9dba9;
+  border-color: #46a546;
+}
+
+.input-prepend .add-on,
+.input-prepend .btn {
+  margin-right: -1px;
+}
+
+.input-prepend .add-on:first-child,
+.input-prepend .btn:first-child {
+  -webkit-border-radius: 4px 0 0 4px;
+     -moz-border-radius: 4px 0 0 4px;
+          border-radius: 4px 0 0 4px;
+}
+
+.input-append input,
+.input-append select,
+.input-append .uneditable-input {
+  -webkit-border-radius: 4px 0 0 4px;
+     -moz-border-radius: 4px 0 0 4px;
+          border-radius: 4px 0 0 4px;
+}
+
+.input-append input + .btn-group .btn:last-child,
+.input-append select + .btn-group .btn:last-child,
+.input-append .uneditable-input + .btn-group .btn:last-child {
+  -webkit-border-radius: 0 4px 4px 0;
+     -moz-border-radius: 0 4px 4px 0;
+          border-radius: 0 4px 4px 0;
+}
+
+.input-append .add-on,
+.input-append .btn,
+.input-append .btn-group {
+  margin-left: -1px;
+}
+
+.input-append .add-on:last-child,
+.input-append .btn:last-child,
+.input-append .btn-group:last-child > .dropdown-toggle {
+  -webkit-border-radius: 0 4px 4px 0;
+     -moz-border-radius: 0 4px 4px 0;
+          border-radius: 0 4px 4px 0;
+}
+
+.input-prepend.input-append input,
+.input-prepend.input-append select,
+.input-prepend.input-append .uneditable-input {
+  -webkit-border-radius: 0;
+     -moz-border-radius: 0;
+          border-radius: 0;
+}
+
+.input-prepend.input-append input + .btn-group .btn,
+.input-prepend.input-append select + .btn-group .btn,
+.input-prepend.input-append .uneditable-input + .btn-group .btn {
+  -webkit-border-radius: 0 4px 4px 0;
+     -moz-border-radius: 0 4px 4px 0;
+          border-radius: 0 4px 4px 0;
+}
+
+.input-prepend.input-append .add-on:first-child,
+.input-prepend.input-append .btn:first-child {
+  margin-right: -1px;
+  -webkit-border-radius: 4px 0 0 4px;
+     -moz-border-radius: 4px 0 0 4px;
+          border-radius: 4px 0 0 4px;
+}
+
+.input-prepend.input-append .add-on:last-child,
+.input-prepend.input-append .btn:last-child {
+  margin-left: -1px;
+  -webkit-border-radius: 0 4px 4px 0;
+     -moz-border-radius: 0 4px 4px 0;
+          border-radius: 0 4px 4px 0;
+}
+
+.input-prepend.input-append .btn-group:first-child {
+  margin-left: 0;
+}
+
+input.search-query {
+  padding-right: 14px;
+  padding-right: 4px \9;
+  padding-left: 14px;
+  padding-left: 4px \9;
+  /* IE7-8 doesn't have border-radius, so don't indent the padding */
+
+  margin-bottom: 0;
+  -webkit-border-radius: 15px;
+     -moz-border-radius: 15px;
+          border-radius: 15px;
+}
+
+/* Allow for input prepend/append in search forms */
+
+.form-search .input-append .search-query,
+.form-search .input-prepend .search-query {
+  -webkit-border-radius: 0;
+     -moz-border-radius: 0;
+          border-radius: 0;
+}
+
+.form-search .input-append .search-query {
+  -webkit-border-radius: 14px 0 0 14px;
+     -moz-border-radius: 14px 0 0 14px;
+          border-radius: 14px 0 0 14px;
+}
+
+.form-search .input-append .btn {
+  -webkit-border-radius: 0 14px 14px 0;
+     -moz-border-radius: 0 14px 14px 0;
+          border-radius: 0 14px 14px 0;
+}
+
+.form-search .input-prepend .search-query {
+  -webkit-border-radius: 0 14px 14px 0;
+     -moz-border-radius: 0 14px 14px 0;
+          border-radius: 0 14px 14px 0;
+}
+
+.form-search .input-prepend .btn {
+  -webkit-border-radius: 14px 0 0 14px;
+     -moz-border-radius: 14px 0 0 14px;
+          border-radius: 14px 0 0 14px;
+}
+
+.form-search input,
+.form-inline input,
+.form-horizontal input,
+.form-search textarea,
+.form-inline textarea,
+.form-horizontal textarea,
+.form-search select,
+.form-inline select,
+.form-horizontal select,
+.form-search .help-inline,
+.form-inline .help-inline,
+.form-horizontal .help-inline,
+.form-search .uneditable-input,
+.form-inline .uneditable-input,
+.form-horizontal .uneditable-input,
+.form-search .input-prepend,
+.form-inline .input-prepend,
+.form-horizontal .input-prepend,
+.form-search .input-append,
+.form-inline .input-append,
+.form-horizontal .input-append {
+  display: inline-block;
+  *display: inline;
+  margin-bottom: 0;
+  vertical-align: middle;
+  *zoom: 1;
+}
+
+.form-search .hide,
+.form-inline .hide,
+.form-horizontal .hide {
+  display: none;
+}
+
+.form-search label,
+.form-inline label,
+.form-search .btn-group,
+.form-inline .btn-group {
+  display: inline-block;
+}
+
+.form-search .input-append,
+.form-inline .input-append,
+.form-search .input-prepend,
+.form-inline .input-prepend {
+  margin-bottom: 0;
+}
+
+.form-search .radio,
+.form-search .checkbox,
+.form-inline .radio,
+.form-inline .checkbox {
+  padding-left: 0;
+  margin-bottom: 0;
+  vertical-align: middle;
+}
+
+.form-search .radio input[type="radio"],
+.form-search .checkbox input[type="checkbox"],
+.form-inline .radio input[type="radio"],
+.form-inline .checkbox input[type="checkbox"] {
+  float: left;
+  margin-right: 3px;
+  margin-left: 0;
+}
+
+.control-group {
+  margin-bottom: 10px;
+}
+
+legend + .control-group {
+  margin-top: 20px;
+  -webkit-margin-top-collapse: separate;
+}
+
+.form-horizontal .control-group {
+  margin-bottom: 20px;
+  *zoom: 1;
+}
+
+.form-horizontal .control-group:before,
+.form-horizontal .control-group:after {
+  display: table;
+  line-height: 0;
+  content: "";
+}
+
+.form-horizontal .control-group:after {
+  clear: both;
+}
+
+.form-horizontal .control-label {
+  float: left;
+  width: 160px;
+  padding-top: 5px;
+  text-align: right;
+}
+
+.form-horizontal .controls {
+  *display: inline-block;
+  *padding-left: 20px;
+  margin-left: 180px;
+  *margin-left: 0;
+}
+
+.form-horizontal .controls:first-child {
+  *padding-left: 180px;
+}
+
+.form-horizontal .help-block {
+  margin-bottom: 0;
+}
+
+.form-horizontal input + .help-block,
+.form-horizontal select + .help-block,
+.form-horizontal textarea + .help-block,
+.form-horizontal .uneditable-input + .help-block,
+.form-horizontal .input-prepend + .help-block,
+.form-horizontal .input-append + .help-block {
+  margin-top: 10px;
+}
+
+.form-horizontal .form-actions {
+  padding-left: 180px;
+}
+
+table {
+  max-width: 100%;
+  background-color: transparent;
+  border-collapse: collapse;
+  border-spacing: 0;
+}
+
+.table {
+  width: 100%;
+  margin-bottom: 20px;
+}
+
+.table th,
+.table td {
+  padding: 8px;
+  line-height: 20px;
+  text-align: left;
+  vertical-align: top;
+  border-top: 1px solid #dddddd;
+}
+
+.table th {
+  font-weight: bold;
+}
+
+.table thead th {
+  vertical-align: bottom;
+}
+
+.table caption + thead tr:first-child th,
+.table caption + thead tr:first-child td,
+.table colgroup + thead tr:first-child th,
+.table colgroup + thead tr:first-child td,
+.table thead:first-child tr:first-child th,
+.table thead:first-child tr:first-child td {
+  border-top: 0;
+}
+
+.table tbody + tbody {
+  border-top: 2px solid #dddddd;
+}
+
+.table .table {
+  background-color: #ffffff;
+}
+
+.table-condensed th,
+.table-condensed td {
+  padding: 4px 5px;
+}
+
+.table-bordered {
+  border: 1px solid #dddddd;
+  border-collapse: separate;
+  *border-collapse: collapse;
+  border-left: 0;
+  -webkit-border-radius: 4px;
+     -moz-border-radius: 4px;
+          border-radius: 4px;
+}
+
+.table-bordered th,
+.table-bordered td {
+  border-left: 1px solid #dddddd;
+}
+
+.table-bordered caption + thead tr:first-child th,
+.table-bordered caption + tbody tr:first-child th,
+.table-bordered caption + tbody tr:first-child td,
+.table-bordered colgroup + thead tr:first-child th,
+.table-bordered colgroup + tbody tr:first-child th,
+.table-bordered colgroup + tbody tr:first-child td,
+.table-bordered thead:first-child tr:first-child th,
+.table-bordered tbody:first-child tr:first-child th,
+.table-bordered tbody:first-child tr:first-child td {
+  border-top: 0;
+}
+
+.table-bordered thead:first-child tr:first-child > th:first-child,
+.table-bordered tbody:first-child tr:first-child > td:first-child {
+  -webkit-border-top-left-radius: 4px;
+          border-top-left-radius: 4px;
+  -moz-border-radius-topleft: 4px;
+}
+
+.table-bordered thead:first-child tr:first-child > th:last-child,
+.table-bordered tbody:first-child tr:first-child > td:last-child {
+  -webkit-border-top-right-radius: 4px;
+          border-top-right-radius: 4px;
+  -moz-border-radius-topright: 4px;
+}
+
+.table-bordered thead:last-child tr:last-child > th:first-child,
+.table-bordered tbody:last-child tr:last-child > td:first-child,
+.table-bordered tfoot:last-child tr:last-child > td:first-child {
+  -webkit-border-bottom-left-radius: 4px;
+          border-bottom-left-radius: 4px;
+  -moz-border-radius-bottomleft: 4px;
+}
+
+.table-bordered thead:last-child tr:last-child > th:last-child,
+.table-bordered tbody:last-child tr:last-child > td:last-child,
+.table-bordered tfoot:last-child tr:last-child > td:last-child {
+  -webkit-border-bottom-right-radius: 4px;
+          border-bottom-right-radius: 4px;
+  -moz-border-radius-bottomright: 4px;
+}
+
+.table-bordered tfoot + tbody:last-child tr:last-child td:first-child {
+  -webkit-border-bottom-left-radius: 0;
+          border-bottom-left-radius: 0;
+  -moz-border-radius-bottomleft: 0;
+}
+
+.table-bordered tfoot + tbody:last-child tr:last-child td:last-child {
+  -webkit-border-bottom-right-radius: 0;
+          border-bottom-right-radius: 0;
+  -moz-border-radius-bottomright: 0;
+}
+
+.table-bordered caption + thead tr:first-child th:first-child,
+.table-bordered caption + tbody tr:first-child td:first-child,
+.table-bordered colgroup + thead tr:first-child th:first-child,
+.table-bordered colgroup + tbody tr:first-child td:first-child {
+  -webkit-border-top-left-radius: 4px;
+          border-top-left-radius: 4px;
+  -moz-border-radius-topleft: 4px;
+}
+
+.table-bordered caption + thead tr:first-child th:last-child,
+.table-bordered caption + tbody tr:first-child td:last-child,
+.table-bordered colgroup + thead tr:first-child th:last-child,
+.table-bordered colgroup + tbody tr:first-child td:last-child {
+  -webkit-border-top-right-radius: 4px;
+          border-top-right-radius: 4px;
+  -moz-border-radius-topright: 4px;
+}
+
+.table-striped tbody > tr:nth-child(odd) > td,
+.table-striped tbody > tr:nth-child(odd) > th {
+  background-color: #f9f9f9;
+}
+
+.table-hover tbody tr:hover td,
+.table-hover tbody tr:hover th {
+  background-color: #f5f5f5;
+}
+
+table td[class*="span"],
+table th[class*="span"],
+.row-fluid table td[class*="span"],
+.row-fluid table th[class*="span"] {
+  display: table-cell;
+  float: none;
+  margin-left: 0;
+}
+
+.table td.span1,
+.table th.span1 {
+  float: none;
+  width: 44px;
+  margin-left: 0;
+}
+
+.table td.span2,
+.table th.span2 {
+  float: none;
+  width: 124px;
+  margin-left: 0;
+}
+
+.table td.span3,
+.table th.span3 {
+  float: none;
+  width: 204px;
+  margin-left: 0;
+}
+
+.table td.span4,
+.table th.span4 {
+  float: none;
+  width: 284px;
+  margin-left: 0;
+}
+
+.table td.span5,
+.table th.span5 {
+  float: none;
+  width: 364px;
+  margin-left: 0;
+}
+
+.table td.span6,
+.table th.span6 {
+  float: none;
+  width: 444px;
+  margin-left: 0;
+}
+
+.table td.span7,
+.table th.span7 {
+  float: none;
+  width: 524px;
+  margin-left: 0;
+}
+
+.table td.span8,
+.table th.span8 {
+  float: none;
+  width: 604px;
+  margin-left: 0;
+}
+
+.table td.span9,
+.table th.span9 {
+  float: none;
+  width: 684px;
+  margin-left: 0;
+}
+
+.table td.span10,
+.table th.span10 {
+  float: none;
+  width: 764px;
+  margin-left: 0;
+}
+
+.table td.span11,
+.table th.span11 {
+  float: none;
+  width: 844px;
+  margin-left: 0;
+}
+
+.table td.span12,
+.table th.span12 {
+  float: none;
+  width: 924px;
+  margin-left: 0;
+}
+
+.table tbody tr.success td {
+  background-color: #dff0d8;
+}
+
+.table tbody tr.error td {
+  background-color: #f2dede;
+}
+
+.table tbody tr.warning td {
+  background-color: #fcf8e3;
+}
+
+.table tbody tr.info td {
+  background-color: #d9edf7;
+}
+
+.table-hover tbody tr.success:hover td {
+  background-color: #d0e9c6;
+}
+
+.table-hover tbody tr.error:hover td {
+  background-color: #ebcccc;
+}
+
+.table-hover tbody tr.warning:hover td {
+  background-color: #faf2cc;
+}
+
+.table-hover tbody tr.info:hover td {
+  background-color: #c4e3f3;
+}
+
+[class^="icon-"],
+[class*=" icon-"] {
+  display: inline-block;
+  width: 14px;
+  height: 14px;
+  margin-top: 1px;
+  *margin-right: .3em;
+  line-height: 14px;
+  vertical-align: text-top;
+  background-image: url("../images/glyphicons-halflings.png");
+  background-position: 14px 14px;
+  background-repeat: no-repeat;
+}
+
+/* White icons with optional class, or on hover/active states of certain elements */
+
+.icon-white,
+.nav-pills > .active > a > [class^="icon-"],
+.nav-pills > .active > a > [class*=" icon-"],
+.nav-list > .active > a > [class^="icon-"],
+.nav-list > .active > a > [class*=" icon-"],
+.navbar-inverse .nav > .active > a > [class^="icon-"],
+.navbar-inverse .nav > .active > a > [class*=" icon-"],
+.dropdown-menu > li > a:hover > [class^="icon-"],
+.dropdown-menu > li > a:hover > [class*=" icon-"],
+.dropdown-menu > .active > a > [class^="icon-"],
+.dropdown-menu > .active > a > [class*=" icon-"],
+.dropdown-submenu:hover > a > [class^="icon-"],
+.dropdown-submenu:hover > a > [class*=" icon-"] {
+  background-image: url("../images/glyphicons-halflings-white.png");
+}
+
+.icon-glass {
+  background-position: 0      0;
+}
+
+.icon-music {
+  background-position: -24px 0;
+}
+
+.icon-search {
+  background-position: -48px 0;
+}
+
+.icon-envelope {
+  background-position: -72px 0;
+}
+
+.icon-heart {
+  background-position: -96px 0;
+}
+
+.icon-star {
+  background-position: -120px 0;
+}
+
+.icon-star-empty {
+  background-position: -144px 0;
+}
+
+.icon-user {
+  background-position: -168px 0;
+}
+
+.icon-film {
+  background-position: -192px 0;
+}
+
+.icon-th-large {
+  background-position: -216px 0;
+}
+
+.icon-th {
+  background-position: -240px 0;
+}
+
+.icon-th-list {
+  background-position: -264px 0;
+}
+
+.icon-ok {
+  background-position: -288px 0;
+}
+
+.icon-remove {
+  background-position: -312px 0;
+}
+
+.icon-zoom-in {
+  background-position: -336px 0;
+}
+
+.icon-zoom-out {
+  background-position: -360px 0;
+}
+
+.icon-off {
+  background-position: -384px 0;
+}
+
+.icon-signal {
+  background-position: -408px 0;
+}
+
+.icon-cog {
+  background-position: -432px 0;
+}
+
+.icon-trash {
+  background-position: -456px 0;
+}
+
+.icon-home {
+  background-position: 0 -24px;
+}
+
+.icon-file {
+  background-position: -24px -24px;
+}
+
+.icon-time {
+  background-position: -48px -24px;
+}
+
+.icon-road {
+  background-position: -72px -24px;
+}
+
+.icon-download-alt {
+  background-position: -96px -24px;
+}
+
+.icon-download {
+  background-position: -120px -24px;
+}
+
+.icon-upload {
+  background-position: -144px -24px;
+}
+
+.icon-inbox {
+  background-position: -168px -24px;
+}
+
+.icon-play-circle {
+  background-position: -192px -24px;
+}
+
+.icon-repeat {
+  background-position: -216px -24px;
+}
+
+.icon-refresh {
+  background-position: -240px -24px;
+}
+
+.icon-list-alt {
+  background-position: -264px -24px;
+}
+
+.icon-lock {
+  background-position: -287px -24px;
+}
+
+.icon-flag {
+  background-position: -312px -24px;
+}
+
+.icon-headphones {
+  background-position: -336px -24px;
+}
+
+.icon-volume-off {
+  background-position: -360px -24px;
+}
+
+.icon-volume-down {
+  background-position: -384px -24px;
+}
+
+.icon-volume-up {
+  background-position: -408px -24px;
+}
+
+.icon-qrcode {
+  background-position: -432px -24px;
+}
+
+.icon-barcode {
+  background-position: -456px -24px;
+}
+
+.icon-tag {
+  background-position: 0 -48px;
+}
+
+.icon-tags {
+  background-position: -25px -48px;
+}
+
+.icon-book {
+  background-position: -48px -48px;
+}
+
+.icon-bookmark {
+  background-position: -72px -48px;
+}
+
+.icon-print {
+  background-position: -96px -48px;
+}
+
+.icon-camera {
+  background-position: -120px -48px;
+}
+
+.icon-font {
+  background-position: -144px -48px;
+}
+
+.icon-bold {
+  background-position: -167px -48px;
+}
+
+.icon-italic {
+  background-position: -192px -48px;
+}
+
+.icon-text-height {
+  background-position: -216px -48px;
+}
+
+.icon-text-width {
+  background-position: -240px -48px;
+}
+
+.icon-align-left {
+  background-position: -264px -48px;
+}
+
+.icon-align-center {
+  background-position: -288px -48px;
+}
+
+.icon-align-right {
+  background-position: -312px -48px;
+}
+
+.icon-align-justify {
+  background-position: -336px -48px;
+}
+
+.icon-list {
+  background-position: -360px -48px;
+}
+
+.icon-indent-left {
+  background-position: -384px -48px;
+}
+
+.icon-indent-right {
+  background-position: -408px -48px;
+}
+
+.icon-facetime-video {
+  background-position: -432px -48px;
+}
+
+.icon-picture {
+  background-position: -456px -48px;
+}
+
+.icon-pencil {
+  background-position: 0 -72px;
+}
+
+.icon-map-marker {
+  background-position: -24px -72px;
+}
+
+.icon-adjust {
+  background-position: -48px -72px;
+}
+
+.icon-tint {
+  background-position: -72px -72px;
+}
+
+.icon-edit {
+  background-position: -96px -72px;
+}
+
+.icon-share {
+  background-position: -120px -72px;
+}
+
+.icon-check {
+  background-position: -144px -72px;
+}
+
+.icon-move {
+  background-position: -168px -72px;
+}
+
+.icon-step-backward {
+  background-position: -192px -72px;
+}
+
+.icon-fast-backward {
+  background-position: -216px -72px;
+}
+
+.icon-backward {
+  background-position: -240px -72px;
+}
+
+.icon-play {
+  background-position: -264px -72px;
+}
+
+.icon-pause {
+  background-position: -288px -72px;
+}
+
+.icon-stop {
+  background-position: -312px -72px;
+}
+
+.icon-forward {
+  background-position: -336px -72px;
+}
+
+.icon-fast-forward {
+  background-position: -360px -72px;
+}
+
+.icon-step-forward {
+  background-position: -384px -72px;
+}
+
+.icon-eject {
+  background-position: -408px -72px;
+}
+
+.icon-chevron-left {
+  background-position: -432px -72px;
+}
+
+.icon-chevron-right {
+  background-position: -456px -72px;
+}
+
+.icon-plus-sign {
+  background-position: 0 -96px;
+}
+
+.icon-minus-sign {
+  background-position: -24px -96px;
+}
+
+.icon-remove-sign {
+  background-position: -48px -96px;
+}
+
+.icon-ok-sign {
+  background-position: -72px -96px;
+}
+
+.icon-question-sign {
+  background-position: -96px -96px;
+}
+
+.icon-info-sign {
+  background-position: -120px -96px;
+}
+
+.icon-screenshot {
+  background-position: -144px -96px;
+}
+
+.icon-remove-circle {
+  background-position: -168px -96px;
+}
+
+.icon-ok-circle {
+  background-position: -192px -96px;
+}
+
+.icon-ban-circle {
+  background-position: -216px -96px;
+}
+
+.icon-arrow-left {
+  background-position: -240px -96px;
+}
+
+.icon-arrow-right {
+  background-position: -264px -96px;
+}
+
+.icon-arrow-up {
+  background-position: -289px -96px;
+}
+
+.icon-arrow-down {
+  background-position: -312px -96px;
+}
+
+.icon-share-alt {
+  background-position: -336px -96px;
+}
+
+.icon-resize-full {
+  background-position: -360px -96px;
+}
+
+.icon-resize-small {
+  background-position: -384px -96px;
+}
+
+.icon-plus {
+  background-position: -408px -96px;
+}
+
+.icon-minus {
+  background-position: -433px -96px;
+}
+
+.icon-asterisk {
+  background-position: -456px -96px;
+}
+
+.icon-exclamation-sign {
+  background-position: 0 -120px;
+}
+
+.icon-gift {
+  background-position: -24px -120px;
+}
+
+.icon-leaf {
+  background-position: -48px -120px;
+}
+
+.icon-fire {
+  background-position: -72px -120px;
+}
+
+.icon-eye-open {
+  background-position: -96px -120px;
+}
+
+.icon-eye-close {
+  background-position: -120px -120px;
+}
+
+.icon-warning-sign {
+  background-position: -144px -120px;
+}
+
+.icon-plane {
+  background-position: -168px -120px;
+}
+
+.icon-calendar {
+  background-position: -192px -120px;
+}
+
+.icon-random {
+  width: 16px;
+  background-position: -216px -120px;
+}
+
+.icon-comment {
+  background-position: -240px -120px;
+}
+
+.icon-magnet {
+  background-position: -264px -120px;
+}
+
+.icon-chevron-up {
+  background-position: -288px -120px;
+}
+
+.icon-chevron-down {
+  background-position: -313px -119px;
+}
+
+.icon-retweet {
+  background-position: -336px -120px;
+}
+
+.icon-shopping-cart {
+  background-position: -360px -120px;
+}
+
+.icon-folder-close {
+  background-position: -384px -120px;
+}
+
+.icon-folder-open {
+  width: 16px;
+  background-position: -408px -120px;
+}
+
+.icon-resize-vertical {
+  background-position: -432px -119px;
+}
+
+.icon-resize-horizontal {
+  background-position: -456px -118px;
+}
+
+.icon-hdd {
+  background-position: 0 -144px;
+}
+
+.icon-bullhorn {
+  background-position: -24px -144px;
+}
+
+.icon-bell {
+  background-position: -48px -144px;
+}
+
+.icon-certificate {
+  background-position: -72px -144px;
+}
+
+.icon-thumbs-up {
+  background-position: -96px -144px;
+}
+
+.icon-thumbs-down {
+  background-position: -120px -144px;
+}
+
+.icon-hand-right {
+  background-position: -144px -144px;
+}
+
+.icon-hand-left {
+  background-position: -168px -144px;
+}
+
+.icon-hand-up {
+  background-position: -192px -144px;
+}
+
+.icon-hand-down {
+  background-position: -216px -144px;
+}
+
+.icon-circle-arrow-right {
+  background-position: -240px -144px;
+}
+
+.icon-circle-arrow-left {
+  background-position: -264px -144px;
+}
+
+.icon-circle-arrow-up {
+  background-position: -288px -144px;
+}
+
+.icon-circle-arrow-down {
+  background-position: -312px -144px;
+}
+
+.icon-globe {
+  background-position: -336px -144px;
+}
+
+.icon-wrench {
+  background-position: -360px -144px;
+}
+
+.icon-tasks {
+  background-position: -384px -144px;
+}
+
+.icon-filter {
+  background-position: -408px -144px;
+}
+
+.icon-briefcase {
+  background-position: -432px -144px;
+}
+
+.icon-fullscreen {
+  background-position: -456px -144px;
+}
+
+.dropup,
+.dropdown {
+  position: relative;
+}
+
+.dropdown-toggle {
+  *margin-bottom: -3px;
+}
+
+.dropdown-toggle:active,
+.open .dropdown-toggle {
+  outline: 0;
+}
+
+.caret {
+  display: inline-block;
+  width: 0;
+  height: 0;
+  vertical-align: top;
+  border-top: 4px solid #000000;
+  border-right: 4px solid transparent;
+  border-left: 4px solid transparent;
+  content: "";
+}
+
+.dropdown .caret {
+  margin-top: 8px;
+  margin-left: 2px;
+}
+
+.dropdown-menu {
+  position: absolute;
+  top: 100%;
+  left: 0;
+  z-index: 1000;
+  display: none;
+  float: left;
+  min-width: 160px;
+  padding: 5px 0;
+  margin: 2px 0 0;
+  list-style: none;
+  background-color: #ffffff;
+  border: 1px solid #ccc;
+  border: 1px solid rgba(0, 0, 0, 0.2);
+  *border-right-width: 2px;
+  *border-bottom-width: 2px;
+  -webkit-border-radius: 6px;
+     -moz-border-radius: 6px;
+          border-radius: 6px;
+  -webkit-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
+     -moz-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
+          box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
+  -webkit-background-clip: padding-box;
+     -moz-background-clip: padding;
+          background-clip: padding-box;
+}
+
+.dropdown-menu.pull-right {
+  right: 0;
+  left: auto;
+}
+
+.dropdown-menu .divider {
+  *width: 100%;
+  height: 1px;
+  margin: 9px 1px;
+  *margin: -5px 0 5px;
+  overflow: hidden;
+  background-color: #e5e5e5;
+  border-bottom: 1px solid #ffffff;
+}
+
+.dropdown-menu li > a {
+  display: block;
+  padding: 3px 20px;
+  clear: both;
+  font-weight: normal;
+  line-height: 20px;
+  color: #333333;
+  white-space: nowrap;
+}
+
+.dropdown-menu li > a:hover,
+.dropdown-menu li > a:focus,
+.dropdown-submenu:hover > a {
+  color: #ffffff;
+  text-decoration: none;
+  background-color: #0081c2;
+  background-image: -moz-linear-gradient(top, #0088cc, #0077b3);
+  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#0088cc), to(#0077b3));
+  background-image: -webkit-linear-gradient(top, #0088cc, #0077b3);
+  background-image: -o-linear-gradient(top, #0088cc, #0077b3);
+  background-image: linear-gradient(to bottom, #0088cc, #0077b3);
+  background-repeat: repeat-x;
+  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff0088cc', endColorstr='#ff0077b3', GradientType=0);
+}
+
+.dropdown-menu .active > a,
+.dropdown-menu .active > a:hover {
+  color: #ffffff;
+  text-decoration: none;
+  background-color: #0081c2;
+  background-image: -moz-linear-gradient(top, #0088cc, #0077b3);
+  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#0088cc), to(#0077b3));
+  background-image: -webkit-linear-gradient(top, #0088cc, #0077b3);
+  background-image: -o-linear-gradient(top, #0088cc, #0077b3);
+  background-image: linear-gradient(to bottom, #0088cc, #0077b3);
+  background-repeat: repeat-x;
+  outline: 0;
+  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff0088cc', endColorstr='#ff0077b3', GradientType=0);
+}
+
+.dropdown-menu .disabled > a,
+.dropdown-menu .disabled > a:hover {
+  color: #999999;
+}
+
+.dropdown-menu .disabled > a:hover {
+  text-decoration: none;
+  cursor: default;
+  background-color: transparent;
+  background-image: none;
+  filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
+}
+
+.open {
+  *z-index: 1000;
+}
+
+.open > .dropdown-menu {
+  display: block;
+}
+
+.pull-right > .dropdown-menu {
+  right: 0;
+  left: auto;
+}
+
+.dropup .caret,
+.navbar-fixed-bottom .dropdown .caret {
+  border-top: 0;
+  border-bottom: 4px solid #000000;
+  content: "";
+}
+
+.dropup .dropdown-menu,
+.navbar-fixed-bottom .dropdown .dropdown-menu {
+  top: auto;
+  bottom: 100%;
+  margin-bottom: 1px;
+}
+
+.dropdown-submenu {
+  position: relative;
+}
+
+.dropdown-submenu > .dropdown-menu {
+  top: 0;
+  left: 100%;
+  margin-top: -6px;
+  margin-left: -1px;
+  -webkit-border-radius: 0 6px 6px 6px;
+     -moz-border-radius: 0 6px 6px 6px;
+          border-radius: 0 6px 6px 6px;
+}
+
+.dropdown-submenu:hover > .dropdown-menu {
+  display: block;
+}
+
+.dropup .dropdown-submenu > .dropdown-menu {
+  top: auto;
+  bottom: 0;
+  margin-top: 0;
+  margin-bottom: -2px;
+  -webkit-border-radius: 5px 5px 5px 0;
+     -moz-border-radius: 5px 5px 5px 0;
+          border-radius: 5px 5px 5px 0;
+}
+
+.dropdown-submenu > a:after {
+  display: block;
+  float: right;
+  width: 0;
+  height: 0;
+  margin-top: 5px;
+  margin-right: -10px;
+  border-color: transparent;
+  border-left-color: #cccccc;
+  border-style: solid;
+  border-width: 5px 0 5px 5px;
+  content: " ";
+}
+
+.dropdown-submenu:hover > a:after {
+  border-left-color: #ffffff;
+}
+
+.dropdown-submenu.pull-left {
+  float: none;
+}
+
+.dropdown-submenu.pull-left > .dropdown-menu {
+  left: -100%;
+  margin-left: 10px;
+  -webkit-border-radius: 6px 0 6px 6px;
+     -moz-border-radius: 6px 0 6px 6px;
+          border-radius: 6px 0 6px 6px;
+}
+
+.dropdown .dropdown-menu .nav-header {
+  padding-right: 20px;
+  padding-left: 20px;
+}
+
+.typeahead {
+  z-index: 1051;
+  margin-top: 2px;
+  -webkit-border-radius: 4px;
+     -moz-border-radius: 4px;
+          border-radius: 4px;
+}
+
+.well {
+  min-height: 20px;
+  padding: 19px;
+  margin-bottom: 20px;
+  background-color: #f5f5f5;
+  border: 1px solid #e3e3e3;
+  -webkit-border-radius: 4px;
+     -moz-border-radius: 4px;
+          border-radius: 4px;
+  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);
+     -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);
+          box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);
+}
+
+.well blockquote {
+  border-color: #ddd;
+  border-color: rgba(0, 0, 0, 0.15);
+}
+
+.well-large {
+  padding: 24px;
+  -webkit-border-radius: 6px;
+     -moz-border-radius: 6px;
+          border-radius: 6px;
+}
+
+.well-small {
+  padding: 9px;
+  -webkit-border-radius: 3px;
+     -moz-border-radius: 3px;
+          border-radius: 3px;
+}
+
+.fade {
+  opacity: 0;
+  -webkit-transition: opacity 0.15s linear;
+     -moz-transition: opacity 0.15s linear;
+       -o-transition: opacity 0.15s linear;
+          transition: opacity 0.15s linear;
+}
+
+.fade.in {
+  opacity: 1;
+}
+
+.collapse {
+  position: relative;
+  height: 0;
+  overflow: hidden;
+  -webkit-transition: height 0.35s ease;
+     -moz-transition: height 0.35s ease;
+       -o-transition: height 0.35s ease;
+          transition: height 0.35s ease;
+}
+
+.collapse.in {
+  height: auto;
+}
+
+.close {
+  float: right;
+  font-size: 20px;
+  font-weight: bold;
+  line-height: 20px;
+  color: #000000;
+  text-shadow: 0 1px 0 #ffffff;
+  opacity: 0.2;
+  filter: alpha(opacity=20);
+}
+
+.close:hover {
+  color: #000000;
+  text-decoration: none;
+  cursor: pointer;
+  opacity: 0.4;
+  filter: alpha(opacity=40);
+}
+
+button.close {
+  padding: 0;
+  cursor: pointer;
+  background: transparent;
+  border: 0;
+  -webkit-appearance: none;
+}
+
+.btn {
+  display: inline-block;
+  *display: inline;
+  padding: 4px 12px;
+  margin-bottom: 0;
+  *margin-left: .3em;
+  font-size: 14px;
+  line-height: 20px;
+  color: #333333;
+  text-align: center;
+  text-shadow: 0 1px 1px rgba(255, 255, 255, 0.75);
+  vertical-align: middle;
+  cursor: pointer;
+  background-color: #f5f5f5;
+  *background-color: #e6e6e6;
+  background-image: -moz-linear-gradient(top, #ffffff, #e6e6e6);
+  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#ffffff), to(#e6e6e6));
+  background-image: -webkit-linear-gradient(top, #ffffff, #e6e6e6);
+  background-image: -o-linear-gradient(top, #ffffff, #e6e6e6);
+  background-image: linear-gradient(to bottom, #ffffff, #e6e6e6);
+  background-repeat: repeat-x;
+  border: 1px solid #bbbbbb;
+  *border: 0;
+  border-color: #e6e6e6 #e6e6e6 #bfbfbf;
+  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
+  border-bottom-color: #a2a2a2;
+  -webkit-border-radius: 4px;
+     -moz-border-radius: 4px;
+          border-radius: 4px;
+  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff', endColorstr='#ffe6e6e6', GradientType=0);
+  filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
+  *zoom: 1;
+  -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
+     -moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
+          box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
+}
+
+.btn:hover,
+.btn:active,
+.btn.active,
+.btn.disabled,
+.btn[disabled] {
+  color: #333333;
+  background-color: #e6e6e6;
+  *background-color: #d9d9d9;
+}
+
+.btn:active,
+.btn.active {
+  background-color: #cccccc \9;
+}
+
+.btn:first-child {
+  *margin-left: 0;
+}
+
+.btn:hover {
+  color: #333333;
+  text-decoration: none;
+  background-position: 0 -15px;
+  -webkit-transition: background-position 0.1s linear;
+     -moz-transition: background-position 0.1s linear;
+       -o-transition: background-position 0.1s linear;
+          transition: background-position 0.1s linear;
+}
+
+.btn:focus {
+  outline: thin dotted #333;
+  outline: 5px auto -webkit-focus-ring-color;
+  outline-offset: -2px;
+}
+
+.btn.active,
+.btn:active {
+  background-image: none;
+  outline: 0;
+  -webkit-box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
+     -moz-box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
+          box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
+}
+
+.btn.disabled,
+.btn[disabled] {
+  cursor: default;
+  background-image: none;
+  opacity: 0.65;
+  filter: alpha(opacity=65);
+  -webkit-box-shadow: none;
+     -moz-box-shadow: none;
+          box-shadow: none;
+}
+
+.btn-large {
+  padding: 11px 19px;
+  font-size: 17.5px;
+  -webkit-border-radius: 6px;
+     -moz-border-radius: 6px;
+          border-radius: 6px;
+}
+
+.btn-large [class^="icon-"],
+.btn-large [class*=" icon-"] {
+  margin-top: 4px;
+}
+
+.btn-small {
+  padding: 2px 10px;
+  font-size: 11.9px;
+  -webkit-border-radius: 3px;
+     -moz-border-radius: 3px;
+          border-radius: 3px;
+}
+
+.btn-small [class^="icon-"],
+.btn-small [class*=" icon-"] {
+  margin-top: 0;
+}
+
+.btn-mini [class^="icon-"],
+.btn-mini [class*=" icon-"] {
+  margin-top: -1px;
+}
+
+.btn-mini {
+  padding: 0 6px;
+  font-size: 10.5px;
+  -webkit-border-radius: 3px;
+     -moz-border-radius: 3px;
+          border-radius: 3px;
+}
+
+.btn-block {
+  display: block;
+  width: 100%;
+  padding-right: 0;
+  padding-left: 0;
+  -webkit-box-sizing: border-box;
+     -moz-box-sizing: border-box;
+          box-sizing: border-box;
+}
+
+.btn-block + .btn-block {
+  margin-top: 5px;
+}
+
+input[type="submit"].btn-block,
+input[type="reset"].btn-block,
+input[type="button"].btn-block {
+  width: 100%;
+}
+
+.btn-primary.active,
+.btn-warning.active,
+.btn-danger.active,
+.btn-success.active,
+.btn-info.active,
+.btn-inverse.active {
+  color: rgba(255, 255, 255, 0.75);
+}
+
+.btn {
+  border-color: #c5c5c5;
+  border-color: rgba(0, 0, 0, 0.15) rgba(0, 0, 0, 0.15) rgba(0, 0, 0, 0.25);
+}
+
+.btn-primary {
+  color: #ffffff;
+  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
+  background-color: #006dcc;
+  *background-color: #0044cc;
+  background-image: -moz-linear-gradient(top, #0088cc, #0044cc);
+  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#0088cc), to(#0044cc));
+  background-image: -webkit-linear-gradient(top, #0088cc, #0044cc);
+  background-image: -o-linear-gradient(top, #0088cc, #0044cc);
+  background-image: linear-gradient(to bottom, #0088cc, #0044cc);
+  background-repeat: repeat-x;
+  border-color: #0044cc #0044cc #002a80;
+  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
+  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff0088cc', endColorstr='#ff0044cc', GradientType=0);
+  filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
+}
+
+.btn-primary:hover,
+.btn-primary:active,
+.btn-primary.active,
+.btn-primary.disabled,
+.btn-primary[disabled] {
+  color: #ffffff;
+  background-color: #0044cc;
+  *background-color: #003bb3;
+}
+
+.btn-primary:active,
+.btn-primary.active {
+  background-color: #003399 \9;
+}
+
+.btn-warning {
+  color: #ffffff;
+  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
+  background-color: #faa732;
+  *background-color: #f89406;
+  background-image: -moz-linear-gradient(top, #fbb450, #f89406);
+  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#fbb450), to(#f89406));
+  background-image: -webkit-linear-gradient(top, #fbb450, #f89406);
+  background-image: -o-linear-gradient(top, #fbb450, #f89406);
+  background-image: linear-gradient(to bottom, #fbb450, #f89406);
+  background-repeat: repeat-x;
+  border-color: #f89406 #f89406 #ad6704;
+  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
+  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#fffbb450', endColorstr='#fff89406', GradientType=0);
+  filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
+}
+
+.btn-warning:hover,
+.btn-warning:active,
+.btn-warning.active,
+.btn-warning.disabled,
+.btn-warning[disabled] {
+  color: #ffffff;
+  background-color: #f89406;
+  *background-color: #df8505;
+}
+
+.btn-warning:active,
+.btn-warning.active {
+  background-color: #c67605 \9;
+}
+
+.btn-danger {
+  color: #ffffff;
+  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
+  background-color: #da4f49;
+  *background-color: #bd362f;
+  background-image: -moz-linear-gradient(top, #ee5f5b, #bd362f);
+  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#ee5f5b), to(#bd362f));
+  background-image: -webkit-linear-gradient(top, #ee5f5b, #bd362f);
+  background-image: -o-linear-gradient(top, #ee5f5b, #bd362f);
+  background-image: linear-gradient(to bottom, #ee5f5b, #bd362f);
+  background-repeat: repeat-x;
+  border-color: #bd362f #bd362f #802420;
+  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
+  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffee5f5b', endColorstr='#ffbd362f', GradientType=0);
+  filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
+}
+
+.btn-danger:hover,
+.btn-danger:active,
+.btn-danger.active,
+.btn-danger.disabled,
+.btn-danger[disabled] {
+  color: #ffffff;
+  background-color: #bd362f;
+  *background-color: #a9302a;
+}
+
+.btn-danger:active,
+.btn-danger.active {
+  background-color: #942a25 \9;
+}
+
+.btn-success {
+  color: #ffffff;
+  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
+  background-color: #5bb75b;
+  *background-color: #51a351;
+  background-image: -moz-linear-gradient(top, #62c462, #51a351);
+  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#62c462), to(#51a351));
+  background-image: -webkit-linear-gradient(top, #62c462, #51a351);
+  background-image: -o-linear-gradient(top, #62c462, #51a351);
+  background-image: linear-gradient(to bottom, #62c462, #51a351);
+  background-repeat: repeat-x;
+  border-color: #51a351 #51a351 #387038;
+  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
+  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff62c462', endColorstr='#ff51a351', GradientType=0);
+  filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
+}
+
+.btn-success:hover,
+.btn-success:active,
+.btn-success.active,
+.btn-success.disabled,
+.btn-success[disabled] {
+  color: #ffffff;
+  background-color: #51a351;
+  *background-color: #499249;
+}
+
+.btn-success:active,
+.btn-success.active {
+  background-color: #408140 \9;
+}
+
+.btn-info {
+  color: #ffffff;
+  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
+  background-color: #49afcd;
+  *background-color: #2f96b4;
+  background-image: -moz-linear-gradient(top, #5bc0de, #2f96b4);
+  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#5bc0de), to(#2f96b4));
+  background-image: -webkit-linear-gradient(top, #5bc0de, #2f96b4);
+  background-image: -o-linear-gradient(top, #5bc0de, #2f96b4);
+  background-image: linear-gradient(to bottom, #5bc0de, #2f96b4);
+  background-repeat: repeat-x;
+  border-color: #2f96b4 #2f96b4 #1f6377;
+  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
+  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff5bc0de', endColorstr='#ff2f96b4', GradientType=0);
+  filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
+}
+
+.btn-info:hover,
+.btn-info:active,
+.btn-info.active,
+.btn-info.disabled,
+.btn-info[disabled] {
+  color: #ffffff;
+  background-color: #2f96b4;
+  *background-color: #2a85a0;
+}
+
+.btn-info:active,
+.btn-info.active {
+  background-color: #24748c \9;
+}
+
+.btn-inverse {
+  color: #ffffff;
+  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
+  background-color: #363636;
+  *background-color: #222222;
+  background-image: -moz-linear-gradient(top, #444444, #222222);
+  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#444444), to(#222222));
+  background-image: -webkit-linear-gradient(top, #444444, #222222);
+  background-image: -o-linear-gradient(top, #444444, #222222);
+  background-image: linear-gradient(to bottom, #444444, #222222);
+  background-repeat: repeat-x;
+  border-color: #222222 #222222 #000000;
+  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
+  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff444444', endColorstr='#ff222222', GradientType=0);
+  filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
+}
+
+.btn-inverse:hover,
+.btn-inverse:active,
+.btn-inverse.active,
+.btn-inverse.disabled,
+.btn-inverse[disabled] {
+  color: #ffffff;
+  background-color: #222222;
+  *background-color: #151515;
+}
+
+.btn-inverse:active,
+.btn-inverse.active {
+  background-color: #080808 \9;
+}
+
+button.btn,
+input[type="submit"].btn {
+  *padding-top: 3px;
+  *padding-bottom: 3px;
+}
+
+button.btn::-moz-focus-inner,
+input[type="submit"].btn::-moz-focus-inner {
+  padding: 0;
+  border: 0;
+}
+
+button.btn.btn-large,
+input[type="submit"].btn.btn-large {
+  *padding-top: 7px;
+  *padding-bottom: 7px;
+}
+
+button.btn.btn-small,
+input[type="submit"].btn.btn-small {
+  *padding-top: 3px;
+  *padding-bottom: 3px;
+}
+
+button.btn.btn-mini,
+input[type="submit"].btn.btn-mini {
+  *padding-top: 1px;
+  *padding-bottom: 1px;
+}
+
+.btn-link,
+.btn-link:active,
+.btn-link[disabled] {
+  background-color: transparent;
+  background-image: none;
+  -webkit-box-shadow: none;
+     -moz-box-shadow: none;
+          box-shadow: none;
+}
+
+.btn-link {
+  color: #0088cc;
+  cursor: pointer;
+  border-color: transparent;
+  -webkit-border-radius: 0;
+     -moz-border-radius: 0;
+          border-radius: 0;
+}
+
+.btn-link:hover {
+  color: #005580;
+  text-decoration: underline;
+  background-color: transparent;
+}
+
+.btn-link[disabled]:hover {
+  color: #333333;
+  text-decoration: none;
+}
+
+.btn-group {
+  position: relative;
+  display: inline-block;
+  *display: inline;
+  *margin-left: .3em;
+  font-size: 0;
+  white-space: nowrap;
+  vertical-align: middle;
+  *zoom: 1;
+}
+
+.btn-group:first-child {
+  *margin-left: 0;
+}
+
+.btn-group + .btn-group {
+  margin-left: 5px;
+}
+
+.btn-toolbar {
+  margin-top: 10px;
+  margin-bottom: 10px;
+  font-size: 0;
+}
+
+.btn-toolbar > .btn + .btn,
+.btn-toolbar > .btn-group + .btn,
+.btn-toolbar > .btn + .btn-group {
+  margin-left: 5px;
+}
+
+.btn-group > .btn {
+  position: relative;
+  -webkit-border-radius: 0;
+     -moz-border-radius: 0;
+          border-radius: 0;
+}
+
+.btn-group > .btn + .btn {
+  margin-left: -1px;
+}
+
+.btn-group > .btn,
+.btn-group > .dropdown-menu,
+.btn-group > .popover {
+  font-size: 14px;
+}
+
+.btn-group > .btn-mini {
+  font-size: 10.5px;
+}
+
+.btn-group > .btn-small {
+  font-size: 11.9px;
+}
+
+.btn-group > .btn-large {
+  font-size: 17.5px;
+}
+
+.btn-group > .btn:first-child {
+  margin-left: 0;
+  -webkit-border-bottom-left-radius: 4px;
+          border-bottom-left-radius: 4px;
+  -webkit-border-top-left-radius: 4px;
+          border-top-left-radius: 4px;
+  -moz-border-radius-bottomleft: 4px;
+  -moz-border-radius-topleft: 4px;
+}
+
+.btn-group > .btn:last-child,
+.btn-group > .dropdown-toggle {
+  -webkit-border-top-right-radius: 4px;
+          border-top-right-radius: 4px;
+  -webkit-border-bottom-right-radius: 4px;
+          border-bottom-right-radius: 4px;
+  -moz-border-radius-topright: 4px;
+  -moz-border-radius-bottomright: 4px;
+}
+
+.btn-group > .btn.large:first-child {
+  margin-left: 0;
+  -webkit-border-bottom-left-radius: 6px;
+          border-bottom-left-radius: 6px;
+  -webkit-border-top-left-radius: 6px;
+          border-top-left-radius: 6px;
+  -moz-border-radius-bottomleft: 6px;
+  -moz-border-radius-topleft: 6px;
+}
+
+.btn-group > .btn.large:last-child,
+.btn-group > .large.dropdown-toggle {
+  -webkit-border-top-right-radius: 6px;
+          border-top-right-radius: 6px;
+  -webkit-border-bottom-right-radius: 6px;
+          border-bottom-right-radius: 6px;
+  -moz-border-radius-topright: 6px;
+  -moz-border-radius-bottomright: 6px;
+}
+
+.btn-group > .btn:hover,
+.btn-group > .btn:focus,
+.btn-group > .btn:active,
+.btn-group > .btn.active {
+  z-index: 2;
+}
+
+.btn-group .dropdown-toggle:active,
+.btn-group.open .dropdown-toggle {
+  outline: 0;
+}
+
+.btn-group > .btn + .dropdown-toggle {
+  *padding-top: 5px;
+  padding-right: 8px;
+  *padding-bottom: 5px;
+  padding-left: 8px;
+  -webkit-box-shadow: inset 1px 0 0 rgba(255, 255, 255, 0.125), inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
+     -moz-box-shadow: inset 1px 0 0 rgba(255, 255, 255, 0.125), inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
+          box-shadow: inset 1px 0 0 rgba(255, 255, 255, 0.125), inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
+}
+
+.btn-group > .btn-mini + .dropdown-toggle {
+  *padding-top: 2px;
+  padding-right: 5px;
+  *padding-bottom: 2px;
+  padding-left: 5px;
+}
+
+.btn-group > .btn-small + .dropdown-toggle {
+  *padding-top: 5px;
+  *padding-bottom: 4px;
+}
+
+.btn-group > .btn-large + .dropdown-toggle {
+  *padding-top: 7px;
+  padding-right: 12px;
+  *padding-bottom: 7px;
+  padding-left: 12px;
+}
+
+.btn-group.open .dropdown-toggle {
+  background-image: none;
+  -webkit-box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
+     -moz-box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
+          box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
+}
+
+.btn-group.open .btn.dropdown-toggle {
+  background-color: #e6e6e6;
+}
+
+.btn-group.open .btn-primary.dropdown-toggle {
+  background-color: #0044cc;
+}
+
+.btn-group.open .btn-warning.dropdown-toggle {
+  background-color: #f89406;
+}
+
+.btn-group.open .btn-danger.dropdown-toggle {
+  background-color: #bd362f;
+}
+
+.btn-group.open .btn-success.dropdown-toggle {
+  background-color: #51a351;
+}
+
+.btn-group.open .btn-info.dropdown-toggle {
+  background-color: #2f96b4;
+}
+
+.btn-group.open .btn-inverse.dropdown-toggle {
+  background-color: #222222;
+}
+
+.btn .caret {
+  margin-top: 8px;
+  margin-left: 0;
+}
+
+.btn-mini .caret,
+.btn-small .caret,
+.btn-large .caret {
+  margin-top: 6px;
+}
+
+.btn-large .caret {
+  border-top-width: 5px;
+  border-right-width: 5px;
+  border-left-width: 5px;
+}
+
+.dropup .btn-large .caret {
+  border-bottom-width: 5px;
+}
+
+.btn-primary .caret,
+.btn-warning .caret,
+.btn-danger .caret,
+.btn-info .caret,
+.btn-success .caret,
+.btn-inverse .caret {
+  border-top-color: #ffffff;
+  border-bottom-color: #ffffff;
+}
+
+.btn-group-vertical {
+  display: inline-block;
+  *display: inline;
+  /* IE7 inline-block hack */
+
+  *zoom: 1;
+}
+
+.btn-group-vertical > .btn {
+  display: block;
+  float: none;
+  max-width: 100%;
+  -webkit-border-radius: 0;
+     -moz-border-radius: 0;
+          border-radius: 0;
+}
+
+.btn-group-vertical > .btn + .btn {
+  margin-top: -1px;
+  margin-left: 0;
+}
+
+.btn-group-vertical > .btn:first-child {
+  -webkit-border-radius: 4px 4px 0 0;
+     -moz-border-radius: 4px 4px 0 0;
+          border-radius: 4px 4px 0 0;
+}
+
+.btn-group-vertical > .btn:last-child {
+  -webkit-border-radius: 0 0 4px 4px;
+     -moz-border-radius: 0 0 4px 4px;
+          border-radius: 0 0 4px 4px;
+}
+
+.btn-group-vertical > .btn-large:first-child {
+  -webkit-border-radius: 6px 6px 0 0;
+     -moz-border-radius: 6px 6px 0 0;
+          border-radius: 6px 6px 0 0;
+}
+
+.btn-group-vertical > .btn-large:last-child {
+  -webkit-border-radius: 0 0 6px 6px;
+     -moz-border-radius: 0 0 6px 6px;
+          border-radius: 0 0 6px 6px;
+}
+
+.alert {
+  padding: 8px 35px 8px 14px;
+  margin-bottom: 20px;
+  text-shadow: 0 1px 0 rgba(255, 255, 255, 0.5);
+  background-color: #fcf8e3;
+  border: 1px solid #fbeed5;
+  -webkit-border-radius: 4px;
+     -moz-border-radius: 4px;
+          border-radius: 4px;
+}
+
+.alert,
+.alert h4 {
+  color: #c09853;
+}
+
+.alert h4 {
+  margin: 0;
+}
+
+.alert .close {
+  position: relative;
+  top: -2px;
+  right: -21px;
+  line-height: 20px;
+}
+
+.alert-success {
+  color: #468847;
+  background-color: #dff0d8;
+  border-color: #d6e9c6;
+}
+
+.alert-success h4 {
+  color: #468847;
+}
+
+.alert-danger,
+.alert-error {
+  color: #b94a48;
+  background-color: #f2dede;
+  border-color: #eed3d7;
+}
+
+.alert-danger h4,
+.alert-error h4 {
+  color: #b94a48;
+}
+
+.alert-info {
+  color: #3a87ad;
+  background-color: #d9edf7;
+  border-color: #bce8f1;
+}
+
+.alert-info h4 {
+  color: #3a87ad;
+}
+
+.alert-block {
+  padding-top: 14px;
+  padding-bottom: 14px;
+}
+
+.alert-block > p,
+.alert-block > ul {
+  margin-bottom: 0;
+}
+
+.alert-block p + p {
+  margin-top: 5px;
+}
+
+.nav {
+  margin-bottom: 20px;
+  margin-left: 0;
+  list-style: none;
+}
+
+.nav > li > a {
+  display: block;
+}
+
+.nav > li > a:hover {
+  text-decoration: none;
+  background-color: #eeeeee;
+}
+
+.nav > li > a > img {
+  max-width: none;
+}
+
+.nav > .pull-right {
+  float: right;
+}
+
+.nav-header {
+  display: block;
+  padding: 3px 15px;
+  font-size: 11px;
+  font-weight: bold;
+  line-height: 20px;
+  color: #999999;
+  text-shadow: 0 1px 0 rgba(255, 255, 255, 0.5);
+  text-transform: uppercase;
+}
+
+.nav li + .nav-header {
+  margin-top: 9px;
+}
+
+.nav-list {
+  padding-right: 15px;
+  padding-left: 15px;
+  margin-bottom: 0;
+}
+
+.nav-list > li > a,
+.nav-list .nav-header {
+  margin-right: -15px;
+  margin-left: -15px;
+  text-shadow: 0 1px 0 rgba(255, 255, 255, 0.5);
+}
+
+.nav-list > li > a {
+  padding: 3px 15px;
+}
+
+.nav-list > .active > a,
+.nav-list > .active > a:hover {
+  color: #ffffff;
+  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.2);
+  background-color: #0088cc;
+}
+
+.nav-list [class^="icon-"],
+.nav-list [class*=" icon-"] {
+  margin-right: 2px;
+}
+
+.nav-list .divider {
+  *width: 100%;
+  height: 1px;
+  margin: 9px 1px;
+  *margin: -5px 0 5px;
+  overflow: hidden;
+  background-color: #e5e5e5;
+  border-bottom: 1px solid #ffffff;
+}
+
+.nav-tabs,
+.nav-pills {
+  *zoom: 1;
+}
+
+.nav-tabs:before,
+.nav-pills:before,
+.nav-tabs:after,
+.nav-pills:after {
+  display: table;
+  line-height: 0;
+  content: "";
+}
+
+.nav-tabs:after,
+.nav-pills:after {
+  clear: both;
+}
+
+.nav-tabs > li,
+.nav-pills > li {
+  float: left;
+}
+
+.nav-tabs > li > a,
+.nav-pills > li > a {
+  padding-right: 12px;
+  padding-left: 12px;
+  margin-right: 2px;
+  line-height: 14px;
+}
+
+.nav-tabs {
+  border-bottom: 1px solid #ddd;
+}
+
+.nav-tabs > li {
+  margin-bottom: -1px;
+}
+
+.nav-tabs > li > a {
+  padding-top: 8px;
+  padding-bottom: 8px;
+  line-height: 20px;
+  border: 1px solid transparent;
+  -webkit-border-radius: 4px 4px 0 0;
+     -moz-border-radius: 4px 4px 0 0;
+          border-radius: 4px 4px 0 0;
+}
+
+.nav-tabs > li > a:hover {
+  border-color: #eeeeee #eeeeee #dddddd;
+}
+
+.nav-tabs > .active > a,
+.nav-tabs > .active > a:hover {
+  color: #555555;
+  cursor: default;
+  background-color: #ffffff;
+  border: 1px solid #ddd;
+  border-bottom-color: transparent;
+}
+
+.nav-pills > li > a {
+  padding-top: 8px;
+  padding-bottom: 8px;
+  margin-top: 2px;
+  margin-bottom: 2px;
+  -webkit-border-radius: 5px;
+     -moz-border-radius: 5px;
+          border-radius: 5px;
+}
+
+.nav-pills > .active > a,
+.nav-pills > .active > a:hover {
+  color: #ffffff;
+  background-color: #0088cc;
+}
+
+.nav-stacked > li {
+  float: none;
+}
+
+.nav-stacked > li > a {
+  margin-right: 0;
+}
+
+.nav-tabs.nav-stacked {
+  border-bottom: 0;
+}
+
+.nav-tabs.nav-stacked > li > a {
+  border: 1px solid #ddd;
+  -webkit-border-radius: 0;
+     -moz-border-radius: 0;
+          border-radius: 0;
+}
+
+.nav-tabs.nav-stacked > li:first-child > a {
+  -webkit-border-top-right-radius: 4px;
+          border-top-right-radius: 4px;
+  -webkit-border-top-left-radius: 4px;
+          border-top-left-radius: 4px;
+  -moz-border-radius-topright: 4px;
+  -moz-border-radius-topleft: 4px;
+}
+
+.nav-tabs.nav-stacked > li:last-child > a {
+  -webkit-border-bottom-right-radius: 4px;
+          border-bottom-right-radius: 4px;
+  -webkit-border-bottom-left-radius: 4px;
+          border-bottom-left-radius: 4px;
+  -moz-border-radius-bottomright: 4px;
+  -moz-border-radius-bottomleft: 4px;
+}
+
+.nav-tabs.nav-stacked > li > a:hover {
+  z-index: 2;
+  border-color: #ddd;
+}
+
+.nav-pills.nav-stacked > li > a {
+  margin-bottom: 3px;
+}
+
+.nav-pills.nav-stacked > li:last-child > a {
+  margin-bottom: 1px;
+}
+
+.nav-tabs .dropdown-menu {
+  -webkit-border-radius: 0 0 6px 6px;
+     -moz-border-radius: 0 0 6px 6px;
+          border-radius: 0 0 6px 6px;
+}
+
+.nav-pills .dropdown-menu {
+  -webkit-border-radius: 6px;
+     -moz-border-radius: 6px;
+          border-radius: 6px;
+}
+
+.nav .dropdown-toggle .caret {
+  margin-top: 6px;
+  border-top-color: #0088cc;
+  border-bottom-color: #0088cc;
+}
+
+.nav .dropdown-toggle:hover .caret {
+  border-top-color: #005580;
+  border-bottom-color: #005580;
+}
+
+/* move down carets for tabs */
+
+.nav-tabs .dropdown-toggle .caret {
+  margin-top: 8px;
+}
+
+.nav .active .dropdown-toggle .caret {
+  border-top-color: #fff;
+  border-bottom-color: #fff;
+}
+
+.nav-tabs .active .dropdown-toggle .caret {
+  border-top-color: #555555;
+  border-bottom-color: #555555;
+}
+
+.nav > .dropdown.active > a:hover {
+  cursor: pointer;
+}
+
+.nav-tabs .open .dropdown-toggle,
+.nav-pills .open .dropdown-toggle,
+.nav > li.dropdown.open.active > a:hover {
+  color: #ffffff;
+  background-color: #999999;
+  border-color: #999999;
+}
+
+.nav li.dropdown.open .caret,
+.nav li.dropdown.open.active .caret,
+.nav li.dropdown.open a:hover .caret {
+  border-top-color: #ffffff;
+  border-bottom-color: #ffffff;
+  opacity: 1;
+  filter: alpha(opacity=100);
+}
+
+.tabs-stacked .open > a:hover {
+  border-color: #999999;
+}
+
+.tabbable {
+  *zoom: 1;
+}
+
+.tabbable:before,
+.tabbable:after {
+  display: table;
+  line-height: 0;
+  content: "";
+}
+
+.tabbable:after {
+  clear: both;
+}
+
+.tab-content {
+  overflow: auto;
+}
+
+.tabs-below > .nav-tabs,
+.tabs-right > .nav-tabs,
+.tabs-left > .nav-tabs {
+  border-bottom: 0;
+}
+
+.tab-content > .tab-pane,
+.pill-content > .pill-pane {
+  display: none;
+}
+
+.tab-content > .active,
+.pill-content > .active {
+  display: block;
+}
+
+.tabs-below > .nav-tabs {
+  border-top: 1px solid #ddd;
+}
+
+.tabs-below > .nav-tabs > li {
+  margin-top: -1px;
+  margin-bottom: 0;
+}
+
+.tabs-below > .nav-tabs > li > a {
+  -webkit-border-radius: 0 0 4px 4px;
+     -moz-border-radius: 0 0 4px 4px;
+          border-radius: 0 0 4px 4px;
+}
+
+.tabs-below > .nav-tabs > li > a:hover {
+  border-top-color: #ddd;
+  border-bottom-color: transparent;
+}
+
+.tabs-below > .nav-tabs > .active > a,
+.tabs-below > .nav-tabs > .active > a:hover {
+  border-color: transparent #ddd #ddd #ddd;
+}
+
+.tabs-left > .nav-tabs > li,
+.tabs-right > .nav-tabs > li {
+  float: none;
+}
+
+.tabs-left > .nav-tabs > li > a,
+.tabs-right > .nav-tabs > li > a {
+  min-width: 74px;
+  margin-right: 0;
+  margin-bottom: 3px;
+}
+
+.tabs-left > .nav-tabs {
+  float: left;
+  margin-right: 19px;
+  border-right: 1px solid #ddd;
+}
+
+.tabs-left > .nav-tabs > li > a {
+  margin-right: -1px;
+  -webkit-border-radius: 4px 0 0 4px;
+     -moz-border-radius: 4px 0 0 4px;
+          border-radius: 4px 0 0 4px;
+}
+
+.tabs-left > .nav-tabs > li > a:hover {
+  border-color: #eeeeee #dddddd #eeeeee #eeeeee;
+}
+
+.tabs-left > .nav-tabs .active > a,
+.tabs-left > .nav-tabs .active > a:hover {
+  border-color: #ddd transparent #ddd #ddd;
+  *border-right-color: #ffffff;
+}
+
+.tabs-right > .nav-tabs {
+  float: right;
+  margin-left: 19px;
+  border-left: 1px solid #ddd;
+}
+
+.tabs-right > .nav-tabs > li > a {
+  margin-left: -1px;
+  -webkit-border-radius: 0 4px 4px 0;
+     -moz-border-radius: 0 4px 4px 0;
+          border-radius: 0 4px 4px 0;
+}
+
+.tabs-right > .nav-tabs > li > a:hover {
+  border-color: #eeeeee #eeeeee #eeeeee #dddddd;
+}
+
+.tabs-right > .nav-tabs .active > a,
+.tabs-right > .nav-tabs .active > a:hover {
+  border-color: #ddd #ddd #ddd transparent;
+  *border-left-color: #ffffff;
+}
+
+.nav > .disabled > a {
+  color: #999999;
+}
+
+.nav > .disabled > a:hover {
+  text-decoration: none;
+  cursor: default;
+  background-color: transparent;
+}
+
+.navbar {
+  *position: relative;
+  *z-index: 2;
+  margin-bottom: 20px;
+  overflow: visible;
+}
+
+.navbar-inner {
+  min-height: 40px;
+  padding-right: 20px;
+  padding-left: 20px;
+  background-color: #fafafa;
+  background-image: -moz-linear-gradient(top, #ffffff, #f2f2f2);
+  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#ffffff), to(#f2f2f2));
+  background-image: -webkit-linear-gradient(top, #ffffff, #f2f2f2);
+  background-image: -o-linear-gradient(top, #ffffff, #f2f2f2);
+  background-image: linear-gradient(to bottom, #ffffff, #f2f2f2);
+  background-repeat: repeat-x;
+  border: 1px solid #d4d4d4;
+  -webkit-border-radius: 4px;
+     -moz-border-radius: 4px;
+          border-radius: 4px;
+  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff', endColorstr='#fff2f2f2', GradientType=0);
+  *zoom: 1;
+  -webkit-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.065);
+     -moz-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.065);
+          box-shadow: 0 1px 4px rgba(0, 0, 0, 0.065);
+}
+
+.navbar-inner:before,
+.navbar-inner:after {
+  display: table;
+  line-height: 0;
+  content: "";
+}
+
+.navbar-inner:after {
+  clear: both;
+}
+
+.navbar .container {
+  width: auto;
+}
+
+.nav-collapse.collapse {
+  height: auto;
+  overflow: visible;
+}
+
+.navbar .brand {
+  display: block;
+  float: left;
+  padding: 10px 20px 10px;
+  margin-left: -20px;
+  font-size: 20px;
+  font-weight: 200;
+  color: #777777;
+  text-shadow: 0 1px 0 #ffffff;
+}
+
+.navbar .brand:hover {
+  text-decoration: none;
+}
+
+.navbar-text {
+  margin-bottom: 0;
+  line-height: 40px;
+  color: #777777;
+}
+
+.navbar-link {
+  color: #777777;
+}
+
+.navbar-link:hover {
+  color: #333333;
+}
+
+.navbar .divider-vertical {
+  height: 40px;
+  margin: 0 9px;
+  border-right: 1px solid #ffffff;
+  border-left: 1px solid #f2f2f2;
+}
+
+.navbar .btn,
+.navbar .btn-group {
+  margin-top: 5px;
+}
+
+.navbar .btn-group .btn,
+.navbar .input-prepend .btn,
+.navbar .input-append .btn {
+  margin-top: 0;
+}
+
+.navbar-form {
+  margin-bottom: 0;
+  *zoom: 1;
+}
+
+.navbar-form:before,
+.navbar-form:after {
+  display: table;
+  line-height: 0;
+  content: "";
+}
+
+.navbar-form:after {
+  clear: both;
+}
+
+.navbar-form input,
+.navbar-form select,
+.navbar-form .radio,
+.navbar-form .checkbox {
+  margin-top: 5px;
+}
+
+.navbar-form input,
+.navbar-form select,
+.navbar-form .btn {
+  display: inline-block;
+  margin-bottom: 0;
+}
+
+.navbar-form input[type="image"],
+.navbar-form input[type="checkbox"],
+.navbar-form input[type="radio"] {
+  margin-top: 3px;
+}
+
+.navbar-form .input-append,
+.navbar-form .input-prepend {
+  margin-top: 5px;
+  white-space: nowrap;
+}
+
+.navbar-form .input-append input,
+.navbar-form .input-prepend input {
+  margin-top: 0;
+}
+
+.navbar-search {
+  position: relative;
+  float: left;
+  margin-top: 5px;
+  margin-bottom: 0;
+}
+
+.navbar-search .search-query {
+  padding: 4px 14px;
+  margin-bottom: 0;
+  font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
+  font-size: 13px;
+  font-weight: normal;
+  line-height: 1;
+  -webkit-border-radius: 15px;
+     -moz-border-radius: 15px;
+          border-radius: 15px;
+}
+
+.navbar-static-top {
+  position: static;
+  margin-bottom: 0;
+}
+
+.navbar-static-top .navbar-inner {
+  -webkit-border-radius: 0;
+     -moz-border-radius: 0;
+          border-radius: 0;
+}
+
+.navbar-fixed-top,
+.navbar-fixed-bottom {
+  position: fixed;
+  right: 0;
+  left: 0;
+  z-index: 1030;
+  margin-bottom: 0;
+}
+
+.navbar-fixed-top .navbar-inner,
+.navbar-static-top .navbar-inner {
+  border-width: 0 0 1px;
+}
+
+.navbar-fixed-bottom .navbar-inner {
+  border-width: 1px 0 0;
+}
+
+.navbar-fixed-top .navbar-inner,
+.navbar-fixed-bottom .navbar-inner {
+  padding-right: 0;
+  padding-left: 0;
+  -webkit-border-radius: 0;
+     -moz-border-radius: 0;
+          border-radius: 0;
+}
+
+.navbar-static-top .container,
+.navbar-fixed-top .container,
+.navbar-fixed-bottom .container {
+  width: 940px;
+}
+
+.navbar-fixed-top {
+  top: 0;
+}
+
+.navbar-fixed-top .navbar-inner,
+.navbar-static-top .navbar-inner {
+  -webkit-box-shadow: 0 1px 10px rgba(0, 0, 0, 0.1);
+     -moz-box-shadow: 0 1px 10px rgba(0, 0, 0, 0.1);
+          box-shadow: 0 1px 10px rgba(0, 0, 0, 0.1);
+}
+
+.navbar-fixed-bottom {
+  bottom: 0;
+}
+
+.navbar-fixed-bottom .navbar-inner {
+  -webkit-box-shadow: 0 -1px 10px rgba(0, 0, 0, 0.1);
+     -moz-box-shadow: 0 -1px 10px rgba(0, 0, 0, 0.1);
+          box-shadow: 0 -1px 10px rgba(0, 0, 0, 0.1);
+}
+
+.navbar .nav {
+  position: relative;
+  left: 0;
+  display: block;
+  float: left;
+  margin: 0 10px 0 0;
+}
+
+.navbar .nav.pull-right {
+  float: right;
+  margin-right: 0;
+}
+
+.navbar .nav > li {
+  float: left;
+}
+
+.navbar .nav > li > a {
+  float: none;
+  padding: 10px 15px 10px;
+  color: #777777;
+  text-decoration: none;
+  text-shadow: 0 1px 0 #ffffff;
+}
+
+.navbar .nav .dropdown-toggle .caret {
+  margin-top: 8px;
+}
+
+.navbar .nav > li > a:focus,
+.navbar .nav > li > a:hover {
+  color: #333333;
+  text-decoration: none;
+  background-color: transparent;
+}
+
+.navbar .nav > .active > a,
+.navbar .nav > .active > a:hover,
+.navbar .nav > .active > a:focus {
+  color: #555555;
+  text-decoration: none;
+  background-color: #e5e5e5;
+  -webkit-box-shadow: inset 0 3px 8px rgba(0, 0, 0, 0.125);
+     -moz-box-shadow: inset 0 3px 8px rgba(0, 0, 0, 0.125);
+          box-shadow: inset 0 3px 8px rgba(0, 0, 0, 0.125);
+}
+
+.navbar .btn-navbar {
+  display: none;
+  float: right;
+  padding: 7px 10px;
+  margin-right: 5px;
+  margin-left: 5px;
+  color: #ffffff;
+  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
+  background-color: #ededed;
+  *background-color: #e5e5e5;
+  background-image: -moz-linear-gradient(top, #f2f2f2, #e5e5e5);
+  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#f2f2f2), to(#e5e5e5));
+  background-image: -webkit-linear-gradient(top, #f2f2f2, #e5e5e5);
+  background-image: -o-linear-gradient(top, #f2f2f2, #e5e5e5);
+  background-image: linear-gradient(to bottom, #f2f2f2, #e5e5e5);
+  background-repeat: repeat-x;
+  border-color: #e5e5e5 #e5e5e5 #bfbfbf;
+  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
+  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#fff2f2f2', endColorstr='#ffe5e5e5', GradientType=0);
+  filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
+  -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.1), 0 1px 0 rgba(255, 255, 255, 0.075);
+     -moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.1), 0 1px 0 rgba(255, 255, 255, 0.075);
+          box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.1), 0 1px 0 rgba(255, 255, 255, 0.075);
+}
+
+.navbar .btn-navbar:hover,
+.navbar .btn-navbar:active,
+.navbar .btn-navbar.active,
+.navbar .btn-navbar.disabled,
+.navbar .btn-navbar[disabled] {
+  color: #ffffff;
+  background-color: #e5e5e5;
+  *background-color: #d9d9d9;
+}
+
+.navbar .btn-navbar:active,
+.navbar .btn-navbar.active {
+  background-color: #cccccc \9;
+}
+
+.navbar .btn-navbar .icon-bar {
+  display: block;
+  width: 18px;
+  height: 2px;
+  background-color: #f5f5f5;
+  -webkit-border-radius: 1px;
+     -moz-border-radius: 1px;
+          border-radius: 1px;
+  -webkit-box-shadow: 0 1px 0 rgba(0, 0, 0, 0.25);
+     -moz-box-shadow: 0 1px 0 rgba(0, 0, 0, 0.25);
+          box-shadow: 0 1px 0 rgba(0, 0, 0, 0.25);
+}
+
+.btn-navbar .icon-bar + .icon-bar {
+  margin-top: 3px;
+}
+
+.navbar .nav > li > .dropdown-menu:before {
+  position: absolute;
+  top: -7px;
+  left: 9px;
+  display: inline-block;
+  border-right: 7px solid transparent;
+  border-bottom: 7px solid #ccc;
+  border-left: 7px solid transparent;
+  border-bottom-color: rgba(0, 0, 0, 0.2);
+  content: '';
+}
+
+.navbar .nav > li > .dropdown-menu:after {
+  position: absolute;
+  top: -6px;
+  left: 10px;
+  display: inline-block;
+  border-right: 6px solid transparent;
+  border-bottom: 6px solid #ffffff;
+  border-left: 6px solid transparent;
+  content: '';
+}
+
+.navbar-fixed-bottom .nav > li > .dropdown-menu:before {
+  top: auto;
+  bottom: -7px;
+  border-top: 7px solid #ccc;
+  border-bottom: 0;
+  border-top-color: rgba(0, 0, 0, 0.2);
+}
+
+.navbar-fixed-bottom .nav > li > .dropdown-menu:after {
+  top: auto;
+  bottom: -6px;
+  border-top: 6px solid #ffffff;
+  border-bottom: 0;
+}
+
+.navbar .nav li.dropdown > a:hover .caret {
+  border-top-color: #555555;
+  border-bottom-color: #555555;
+}
+
+.navbar .nav li.dropdown.open > .dropdown-toggle,
+.navbar .nav li.dropdown.active > .dropdown-toggle,
+.navbar .nav li.dropdown.open.active > .dropdown-toggle {
+  color: #555555;
+  background-color: #e5e5e5;
+}
+
+.navbar .nav li.dropdown > .dropdown-toggle .caret {
+  border-top-color: #777777;
+  border-bottom-color: #777777;
+}
+
+.navbar .nav li.dropdown.open > .dropdown-toggle .caret,
+.navbar .nav li.dropdown.active > .dropdown-toggle .caret,
+.navbar .nav li.dropdown.open.active > .dropdown-toggle .caret {
+  border-top-color: #555555;
+  border-bottom-color: #555555;
+}
+
+.navbar .pull-right > li > .dropdown-menu,
+.navbar .nav > li > .dropdown-menu.pull-right {
+  right: 0;
+  left: auto;
+}
+
+.navbar .pull-right > li > .dropdown-menu:before,
+.navbar .nav > li > .dropdown-menu.pull-right:before {
+  right: 12px;
+  left: auto;
+}
+
+.navbar .pull-right > li > .dropdown-menu:after,
+.navbar .nav > li > .dropdown-menu.pull-right:after {
+  right: 13px;
+  left: auto;
+}
+
+.navbar .pull-right > li > .dropdown-menu .dropdown-menu,
+.navbar .nav > li > .dropdown-menu.pull-right .dropdown-menu {
+  right: 100%;
+  left: auto;
+  margin-right: -1px;
+  margin-left: 0;
+  -webkit-border-radius: 6px 0 6px 6px;
+     -moz-border-radius: 6px 0 6px 6px;
+          border-radius: 6px 0 6px 6px;
+}
+
+.navbar-inverse .navbar-inner {
+  background-color: #1b1b1b;
+  background-image: -moz-linear-gradient(top, #222222, #111111);
+  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#222222), to(#111111));
+  background-image: -webkit-linear-gradient(top, #222222, #111111);
+  background-image: -o-linear-gradient(top, #222222, #111111);
+  background-image: linear-gradient(to bottom, #222222, #111111);
+  background-repeat: repeat-x;
+  border-color: #252525;
+  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff222222', endColorstr='#ff111111', GradientType=0);
+}
+
+.navbar-inverse .brand,
+.navbar-inverse .nav > li > a {
+  color: #999999;
+  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
+}
+
+.navbar-inverse .brand:hover,
+.navbar-inverse .nav > li > a:hover {
+  color: #ffffff;
+}
+
+.navbar-inverse .brand {
+  color: #999999;
+}
+
+.navbar-inverse .navbar-text {
+  color: #999999;
+}
+
+.navbar-inverse .nav > li > a:focus,
+.navbar-inverse .nav > li > a:hover {
+  color: #ffffff;
+  background-color: transparent;
+}
+
+.navbar-inverse .nav .active > a,
+.navbar-inverse .nav .active > a:hover,
+.navbar-inverse .nav .active > a:focus {
+  color: #ffffff;
+  background-color: #111111;
+}
+
+.navbar-inverse .navbar-link {
+  color: #999999;
+}
+
+.navbar-inverse .navbar-link:hover {
+  color: #ffffff;
+}
+
+.navbar-inverse .divider-vertical {
+  border-right-color: #222222;
+  border-left-color: #111111;
+}
+
+.navbar-inverse .nav li.dropdown.open > .dropdown-toggle,
+.navbar-inverse .nav li.dropdown.active > .dropdown-toggle,
+.navbar-inverse .nav li.dropdown.open.active > .dropdown-toggle {
+  color: #ffffff;
+  background-color: #111111;
+}
+
+.navbar-inverse .nav li.dropdown > a:hover .caret {
+  border-top-color: #ffffff;
+  border-bottom-color: #ffffff;
+}
+
+.navbar-inverse .nav li.dropdown > .dropdown-toggle .caret {
+  border-top-color: #999999;
+  border-bottom-color: #999999;
+}
+
+.navbar-inverse .nav li.dropdown.open > .dropdown-toggle .caret,
+.navbar-inverse .nav li.dropdown.active > .dropdown-toggle .caret,
+.navbar-inverse .nav li.dropdown.open.active > .dropdown-toggle .caret {
+  border-top-color: #ffffff;
+  border-bottom-color: #ffffff;
+}
+
+.navbar-inverse .navbar-search .search-query {
+  color: #ffffff;
+  background-color: #515151;
+  border-color: #111111;
+  -webkit-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1), 0 1px 0 rgba(255, 255, 255, 0.15);
+     -moz-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1), 0 1px 0 rgba(255, 255, 255, 0.15);
+          box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1), 0 1px 0 rgba(255, 255, 255, 0.15);
+  -webkit-transition: none;
+     -moz-transition: none;
+       -o-transition: none;
+          transition: none;
+}
+
+.navbar-inverse .navbar-search .search-query:-moz-placeholder {
+  color: #cccccc;
+}
+
+.navbar-inverse .navbar-search .search-query:-ms-input-placeholder {
+  color: #cccccc;
+}
+
+.navbar-inverse .navbar-search .search-query::-webkit-input-placeholder {
+  color: #cccccc;
+}
+
+.navbar-inverse .navbar-search .search-query:focus,
+.navbar-inverse .navbar-search .search-query.focused {
+  padding: 5px 15px;
+  color: #333333;
+  text-shadow: 0 1px 0 #ffffff;
+  background-color: #ffffff;
+  border: 0;
+  outline: 0;
+  -webkit-box-shadow: 0 0 3px rgba(0, 0, 0, 0.15);
+     -moz-box-shadow: 0 0 3px rgba(0, 0, 0, 0.15);
+          box-shadow: 0 0 3px rgba(0, 0, 0, 0.15);
+}
+
+.navbar-inverse .btn-navbar {
+  color: #ffffff;
+  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
+  background-color: #0e0e0e;
+  *background-color: #040404;
+  background-image: -moz-linear-gradient(top, #151515, #040404);
+  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#151515), to(#040404));
+  background-image: -webkit-linear-gradient(top, #151515, #040404);
+  background-image: -o-linear-gradient(top, #151515, #040404);
+  background-image: linear-gradient(to bottom, #151515, #040404);
+  background-repeat: repeat-x;
+  border-color: #040404 #040404 #000000;
+  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
+  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff151515', endColorstr='#ff040404', GradientType=0);
+  filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
+}
+
+.navbar-inverse .btn-navbar:hover,
+.navbar-inverse .btn-navbar:active,
+.navbar-inverse .btn-navbar.active,
+.navbar-inverse .btn-navbar.disabled,
+.navbar-inverse .btn-navbar[disabled] {
+  color: #ffffff;
+  background-color: #040404;
+  *background-color: #000000;
+}
+
+.navbar-inverse .btn-navbar:active,
+.navbar-inverse .btn-navbar.active {
+  background-color: #000000 \9;
+}
+
+.breadcrumb {
+  padding: 8px 15px;
+  margin: 0 0 20px;
+  list-style: none;
+  background-color: #f5f5f5;
+  -webkit-border-radius: 4px;
+     -moz-border-radius: 4px;
+          border-radius: 4px;
+}
+
+.breadcrumb > li {
+  display: inline-block;
+  *display: inline;
+  text-shadow: 0 1px 0 #ffffff;
+  *zoom: 1;
+}
+
+.breadcrumb > li > .divider {
+  padding: 0 5px;
+  color: #ccc;
+}
+
+.breadcrumb > .active {
+  color: #999999;
+}
+
+.pagination {
+  margin: 20px 0;
+}
+
+.pagination ul {
+  display: inline-block;
+  *display: inline;
+  margin-bottom: 0;
+  margin-left: 0;
+  -webkit-border-radius: 4px;
+     -moz-border-radius: 4px;
+          border-radius: 4px;
+  *zoom: 1;
+  -webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
+     -moz-box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
+          box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
+}
+
+.pagination ul > li {
+  display: inline;
+}
+
+.pagination ul > li > a,
+.pagination ul > li > span {
+  float: left;
+  padding: 4px 12px;
+  line-height: 20px;
+  text-decoration: none;
+  background-color: #ffffff;
+  border: 1px solid #dddddd;
+  border-left-width: 0;
+}
+
+.pagination ul > li > a:hover,
+.pagination ul > .active > a,
+.pagination ul > .active > span {
+  background-color: #f5f5f5;
+}
+
+.pagination ul > .active > a,
+.pagination ul > .active > span {
+  color: #999999;
+  cursor: default;
+}
+
+.pagination ul > .disabled > span,
+.pagination ul > .disabled > a,
+.pagination ul > .disabled > a:hover {
+  color: #999999;
+  cursor: default;
+  background-color: transparent;
+}
+
+.pagination ul > li:first-child > a,
+.pagination ul > li:first-child > span {
+  border-left-width: 1px;
+  -webkit-border-bottom-left-radius: 4px;
+          border-bottom-left-radius: 4px;
+  -webkit-border-top-left-radius: 4px;
+          border-top-left-radius: 4px;
+  -moz-border-radius-bottomleft: 4px;
+  -moz-border-radius-topleft: 4px;
+}
+
+.pagination ul > li:last-child > a,
+.pagination ul > li:last-child > span {
+  -webkit-border-top-right-radius: 4px;
+          border-top-right-radius: 4px;
+  -webkit-border-bottom-right-radius: 4px;
+          border-bottom-right-radius: 4px;
+  -moz-border-radius-topright: 4px;
+  -moz-border-radius-bottomright: 4px;
+}
+
+.pagination-centered {
+  text-align: center;
+}
+
+.pagination-right {
+  text-align: right;
+}
+
+.pagination-large ul > li > a,
+.pagination-large ul > li > span {
+  padding: 11px 19px;
+  font-size: 17.5px;
+}
+
+.pagination-large ul > li:first-child > a,
+.pagination-large ul > li:first-child > span {
+  -webkit-border-bottom-left-radius: 6px;
+          border-bottom-left-radius: 6px;
+  -webkit-border-top-left-radius: 6px;
+          border-top-left-radius: 6px;
+  -moz-border-radius-bottomleft: 6px;
+  -moz-border-radius-topleft: 6px;
+}
+
+.pagination-large ul > li:last-child > a,
+.pagination-large ul > li:last-child > span {
+  -webkit-border-top-right-radius: 6px;
+          border-top-right-radius: 6px;
+  -webkit-border-bottom-right-radius: 6px;
+          border-bottom-right-radius: 6px;
+  -moz-border-radius-topright: 6px;
+  -moz-border-radius-bottomright: 6px;
+}
+
+.pagination-mini ul > li:first-child > a,
+.pagination-small ul > li:first-child > a,
+.pagination-mini ul > li:first-child > span,
+.pagination-small ul > li:first-child > span {
+  -webkit-border-bottom-left-radius: 3px;
+          border-bottom-left-radius: 3px;
+  -webkit-border-top-left-radius: 3px;
+          border-top-left-radius: 3px;
+  -moz-border-radius-bottomleft: 3px;
+  -moz-border-radius-topleft: 3px;
+}
+
+.pagination-mini ul > li:last-child > a,
+.pagination-small ul > li:last-child > a,
+.pagination-mini ul > li:last-child > span,
+.pagination-small ul > li:last-child > span {
+  -webkit-border-top-right-radius: 3px;
+          border-top-right-radius: 3px;
+  -webkit-border-bottom-right-radius: 3px;
+          border-bottom-right-radius: 3px;
+  -moz-border-radius-topright: 3px;
+  -moz-border-radius-bottomright: 3px;
+}
+
+.pagination-small ul > li > a,
+.pagination-small ul > li > span {
+  padding: 2px 10px;
+  font-size: 11.9px;
+}
+
+.pagination-mini ul > li > a,
+.pagination-mini ul > li > span {
+  padding: 0 6px;
+  font-size: 10.5px;
+}
+
+.pager {
+  margin: 20px 0;
+  text-align: center;
+  list-style: none;
+  *zoom: 1;
+}
+
+.pager:before,
+.pager:after {
+  display: table;
+  line-height: 0;
+  content: "";
+}
+
+.pager:after {
+  clear: both;
+}
+
+.pager li {
+  display: inline;
+}
+
+.pager li > a,
+.pager li > span {
+  display: inline-block;
+  padding: 5px 14px;
+  background-color: #fff;
+  border: 1px solid #ddd;
+  -webkit-border-radius: 15px;
+     -moz-border-radius: 15px;
+          border-radius: 15px;
+}
+
+.pager li > a:hover {
+  text-decoration: none;
+  background-color: #f5f5f5;
+}
+
+.pager .next > a,
+.pager .next > span {
+  float: right;
+}
+
+.pager .previous > a,
+.pager .previous > span {
+  float: left;
+}
+
+.pager .disabled > a,
+.pager .disabled > a:hover,
+.pager .disabled > span {
+  color: #999999;
+  cursor: default;
+  background-color: #fff;
+}
+
+.modal-backdrop {
+  position: fixed;
+  top: 0;
+  right: 0;
+  bottom: 0;
+  left: 0;
+  z-index: 1040;
+  background-color: #000000;
+}
+
+.modal-backdrop.fade {
+  opacity: 0;
+}
+
+.modal-backdrop,
+.modal-backdrop.fade.in {
+  opacity: 0.8;
+  filter: alpha(opacity=80);
+}
+
+.modal {
+  position: fixed;
+  top: 10%;
+  left: 50%;
+  z-index: 1050;
+  width: 560px;
+  margin-left: -280px;
+  background-color: #ffffff;
+  border: 1px solid #999;
+  border: 1px solid rgba(0, 0, 0, 0.3);
+  *border: 1px solid #999;
+  -webkit-border-radius: 6px;
+     -moz-border-radius: 6px;
+          border-radius: 6px;
+  outline: none;
+  -webkit-box-shadow: 0 3px 7px rgba(0, 0, 0, 0.3);
+     -moz-box-shadow: 0 3px 7px rgba(0, 0, 0, 0.3);
+          box-shadow: 0 3px 7px rgba(0, 0, 0, 0.3);
+  -webkit-background-clip: padding-box;
+     -moz-background-clip: padding-box;
+          background-clip: padding-box;
+}
+
+.modal.fade {
+  top: -25%;
+  -webkit-transition: opacity 0.3s linear, top 0.3s ease-out;
+     -moz-transition: opacity 0.3s linear, top 0.3s ease-out;
+       -o-transition: opacity 0.3s linear, top 0.3s ease-out;
+          transition: opacity 0.3s linear, top 0.3s ease-out;
+}
+
+.modal.fade.in {
+  top: 10%;
+}
+
+.modal-header {
+  padding: 9px 15px;
+  border-bottom: 1px solid #eee;
+}
+
+.modal-header .close {
+  margin-top: 2px;
+}
+
+.modal-header h3 {
+  margin: 0;
+  line-height: 30px;
+}
+
+.modal-body {
+  position: relative;
+  max-height: 400px;
+  padding: 15px;
+  overflow-y: auto;
+}
+
+.modal-form {
+  margin-bottom: 0;
+}
+
+.modal-footer {
+  padding: 14px 15px 15px;
+  margin-bottom: 0;
+  text-align: right;
+  background-color: #f5f5f5;
+  border-top: 1px solid #ddd;
+  -webkit-border-radius: 0 0 6px 6px;
+     -moz-border-radius: 0 0 6px 6px;
+          border-radius: 0 0 6px 6px;
+  *zoom: 1;
+  -webkit-box-shadow: inset 0 1px 0 #ffffff;
+     -moz-box-shadow: inset 0 1px 0 #ffffff;
+          box-shadow: inset 0 1px 0 #ffffff;
+}
+
+.modal-footer:before,
+.modal-footer:after {
+  display: table;
+  line-height: 0;
+  content: "";
+}
+
+.modal-footer:after {
+  clear: both;
+}
+
+.modal-footer .btn + .btn {
+  margin-bottom: 0;
+  margin-left: 5px;
+}
+
+.modal-footer .btn-group .btn + .btn {
+  margin-left: -1px;
+}
+
+.modal-footer .btn-block + .btn-block {
+  margin-left: 0;
+}
+
+.tooltip {
+  position: absolute;
+  z-index: 1030;
+  display: block;
+  padding: 5px;
+  font-size: 11px;
+  opacity: 0;
+  filter: alpha(opacity=0);
+  visibility: visible;
+}
+
+.tooltip.in {
+  opacity: 0.8;
+  filter: alpha(opacity=80);
+}
+
+.tooltip.top {
+  margin-top: -3px;
+}
+
+.tooltip.right {
+  margin-left: 3px;
+}
+
+.tooltip.bottom {
+  margin-top: 3px;
+}
+
+.tooltip.left {
+  margin-left: -3px;
+}
+
+.tooltip-inner {
+  max-width: 200px;
+  padding: 3px 8px;
+  color: #ffffff;
+  text-align: center;
+  text-decoration: none;
+  background-color: #000000;
+  -webkit-border-radius: 4px;
+     -moz-border-radius: 4px;
+          border-radius: 4px;
+}
+
+.tooltip-arrow {
+  position: absolute;
+  width: 0;
+  height: 0;
+  border-color: transparent;
+  border-style: solid;
+}
+
+.tooltip.top .tooltip-arrow {
+  bottom: 0;
+  left: 50%;
+  margin-left: -5px;
+  border-top-color: #000000;
+  border-width: 5px 5px 0;
+}
+
+.tooltip.right .tooltip-arrow {
+  top: 50%;
+  left: 0;
+  margin-top: -5px;
+  border-right-color: #000000;
+  border-width: 5px 5px 5px 0;
+}
+
+.tooltip.left .tooltip-arrow {
+  top: 50%;
+  right: 0;
+  margin-top: -5px;
+  border-left-color: #000000;
+  border-width: 5px 0 5px 5px;
+}
+
+.tooltip.bottom .tooltip-arrow {
+  top: 0;
+  left: 50%;
+  margin-left: -5px;
+  border-bottom-color: #000000;
+  border-width: 0 5px 5px;
+}
+
+.popover {
+  position: absolute;
+  top: 0;
+  left: 0;
+  z-index: 1010;
+  display: none;
+  width: 236px;
+  padding: 1px;
+  text-align: left;
+  white-space: normal;
+  background-color: #ffffff;
+  border: 1px solid #ccc;
+  border: 1px solid rgba(0, 0, 0, 0.2);
+  -webkit-border-radius: 6px;
+     -moz-border-radius: 6px;
+          border-radius: 6px;
+  -webkit-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
+     -moz-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
+          box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
+  -webkit-background-clip: padding-box;
+     -moz-background-clip: padding;
+          background-clip: padding-box;
+}
+
+.popover.top {
+  margin-top: -10px;
+}
+
+.popover.right {
+  margin-left: 10px;
+}
+
+.popover.bottom {
+  margin-top: 10px;
+}
+
+.popover.left {
+  margin-left: -10px;
+}
+
+.popover-title {
+  padding: 8px 14px;
+  margin: 0;
+  font-size: 14px;
+  font-weight: normal;
+  line-height: 18px;
+  background-color: #f7f7f7;
+  border-bottom: 1px solid #ebebeb;
+  -webkit-border-radius: 5px 5px 0 0;
+     -moz-border-radius: 5px 5px 0 0;
+          border-radius: 5px 5px 0 0;
+}
+
+.popover-content {
+  padding: 9px 14px;
+}
+
+.popover .arrow,
+.popover .arrow:after {
+  position: absolute;
+  display: block;
+  width: 0;
+  height: 0;
+  border-color: transparent;
+  border-style: solid;
+}
+
+.popover .arrow {
+  border-width: 11px;
+}
+
+.popover .arrow:after {
+  border-width: 10px;
+  content: "";
+}
+
+.popover.top .arrow {
+  bottom: -11px;
+  left: 50%;
+  margin-left: -11px;
+  border-top-color: #999;
+  border-top-color: rgba(0, 0, 0, 0.25);
+  border-bottom-width: 0;
+}
+
+.popover.top .arrow:after {
+  bottom: 1px;
+  margin-left: -10px;
+  border-top-color: #ffffff;
+  border-bottom-width: 0;
+}
+
+.popover.right .arrow {
+  top: 50%;
+  left: -11px;
+  margin-top: -11px;
+  border-right-color: #999;
+  border-right-color: rgba(0, 0, 0, 0.25);
+  border-left-width: 0;
+}
+
+.popover.right .arrow:after {
+  bottom: -10px;
+  left: 1px;
+  border-right-color: #ffffff;
+  border-left-width: 0;
+}
+
+.popover.bottom .arrow {
+  top: -11px;
+  left: 50%;
+  margin-left: -11px;
+  border-bottom-color: #999;
+  border-bottom-color: rgba(0, 0, 0, 0.25);
+  border-top-width: 0;
+}
+
+.popover.bottom .arrow:after {
+  top: 1px;
+  margin-left: -10px;
+  border-bottom-color: #ffffff;
+  border-top-width: 0;
+}
+
+.popover.left .arrow {
+  top: 50%;
+  right: -11px;
+  margin-top: -11px;
+  border-left-color: #999;
+  border-left-color: rgba(0, 0, 0, 0.25);
+  border-right-width: 0;
+}
+
+.popover.left .arrow:after {
+  right: 1px;
+  bottom: -10px;
+  border-left-color: #ffffff;
+  border-right-width: 0;
+}
+
+.thumbnails {
+  margin-left: -20px;
+  list-style: none;
+  *zoom: 1;
+}
+
+.thumbnails:before,
+.thumbnails:after {
+  display: table;
+  line-height: 0;
+  content: "";
+}
+
+.thumbnails:after {
+  clear: both;
+}
+
+.row-fluid .thumbnails {
+  margin-left: 0;
+}
+
+.thumbnails > li {
+  float: left;
+  margin-bottom: 20px;
+  margin-left: 20px;
+}
+
+.thumbnail {
+  display: block;
+  padding: 4px;
+  line-height: 20px;
+  border: 1px solid #ddd;
+  -webkit-border-radius: 4px;
+     -moz-border-radius: 4px;
+          border-radius: 4px;
+  -webkit-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.055);
+     -moz-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.055);
+          box-shadow: 0 1px 3px rgba(0, 0, 0, 0.055);
+  -webkit-transition: all 0.2s ease-in-out;
+     -moz-transition: all 0.2s ease-in-out;
+       -o-transition: all 0.2s ease-in-out;
+          transition: all 0.2s ease-in-out;
+}
+
+a.thumbnail:hover {
+  border-color: #0088cc;
+  -webkit-box-shadow: 0 1px 4px rgba(0, 105, 214, 0.25);
+     -moz-box-shadow: 0 1px 4px rgba(0, 105, 214, 0.25);
+          box-shadow: 0 1px 4px rgba(0, 105, 214, 0.25);
+}
+
+.thumbnail > img {
+  display: block;
+  max-width: 100%;
+  margin-right: auto;
+  margin-left: auto;
+}
+
+.thumbnail .caption {
+  padding: 9px;
+  color: #555555;
+}
+
+.media,
+.media-body {
+  overflow: hidden;
+  *overflow: visible;
+  zoom: 1;
+}
+
+.media,
+.media .media {
+  margin-top: 15px;
+}
+
+.media:first-child {
+  margin-top: 0;
+}
+
+.media-object {
+  display: block;
+}
+
+.media-heading {
+  margin: 0 0 5px;
+}
+
+.media .pull-left {
+  margin-right: 10px;
+}
+
+.media .pull-right {
+  margin-left: 10px;
+}
+
+.media-list {
+  margin-left: 0;
+  list-style: none;
+}
+
+.label,
+.badge {
+  display: inline-block;
+  padding: 2px 4px;
+  font-size: 11.844px;
+  font-weight: bold;
+  line-height: 14px;
+  color: #ffffff;
+  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
+  white-space: nowrap;
+  vertical-align: baseline;
+  background-color: #999999;
+}
+
+.label {
+  -webkit-border-radius: 3px;
+     -moz-border-radius: 3px;
+          border-radius: 3px;
+}
+
+.badge {
+  padding-right: 9px;
+  padding-left: 9px;
+  -webkit-border-radius: 9px;
+     -moz-border-radius: 9px;
+          border-radius: 9px;
+}
+
+.label:empty,
+.badge:empty {
+  display: none;
+}
+
+a.label:hover,
+a.badge:hover {
+  color: #ffffff;
+  text-decoration: none;
+  cursor: pointer;
+}
+
+.label-important,
+.badge-important {
+  background-color: #b94a48;
+}
+
+.label-important[href],
+.badge-important[href] {
+  background-color: #953b39;
+}
+
+.label-warning,
+.badge-warning {
+  background-color: #f89406;
+}
+
+.label-warning[href],
+.badge-warning[href] {
+  background-color: #c67605;
+}
+
+.label-success,
+.badge-success {
+  background-color: #468847;
+}
+
+.label-success[href],
+.badge-success[href] {
+  background-color: #356635;
+}
+
+.label-info,
+.badge-info {
+  background-color: #3a87ad;
+}
+
+.label-info[href],
+.badge-info[href] {
+  background-color: #2d6987;
+}
+
+.label-inverse,
+.badge-inverse {
+  background-color: #333333;
+}
+
+.label-inverse[href],
+.badge-inverse[href] {
+  background-color: #1a1a1a;
+}
+
+.btn .label,
+.btn .badge {
+  position: relative;
+  top: -1px;
+}
+
+.btn-mini .label,
+.btn-mini .badge {
+  top: 0;
+}
+
+ at -webkit-keyframes progress-bar-stripes {
+  from {
+    background-position: 40px 0;
+  }
+  to {
+    background-position: 0 0;
+  }
+}
+
+ at -moz-keyframes progress-bar-stripes {
+  from {
+    background-position: 40px 0;
+  }
+  to {
+    background-position: 0 0;
+  }
+}
+
+ at -ms-keyframes progress-bar-stripes {
+  from {
+    background-position: 40px 0;
+  }
+  to {
+    background-position: 0 0;
+  }
+}
+
+ at -o-keyframes progress-bar-stripes {
+  from {
+    background-position: 0 0;
+  }
+  to {
+    background-position: 40px 0;
+  }
+}
+
+ at keyframes progress-bar-stripes {
+  from {
+    background-position: 40px 0;
+  }
+  to {
+    background-position: 0 0;
+  }
+}
+
+.progress {
+  height: 20px;
+  margin-bottom: 20px;
+  overflow: hidden;
+  background-color: #f7f7f7;
+  background-image: -moz-linear-gradient(top, #f5f5f5, #f9f9f9);
+  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#f5f5f5), to(#f9f9f9));
+  background-image: -webkit-linear-gradient(top, #f5f5f5, #f9f9f9);
+  background-image: -o-linear-gradient(top, #f5f5f5, #f9f9f9);
+  background-image: linear-gradient(to bottom, #f5f5f5, #f9f9f9);
+  background-repeat: repeat-x;
+  -webkit-border-radius: 4px;
+     -moz-border-radius: 4px;
+          border-radius: 4px;
+  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#fff5f5f5', endColorstr='#fff9f9f9', GradientType=0);
+  -webkit-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
+     -moz-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
+          box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
+}
+
+.progress .bar {
+  float: left;
+  width: 0;
+  height: 100%;
+  font-size: 12px;
+  color: #ffffff;
+  text-align: center;
+  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
+  background-color: #0e90d2;
+  background-image: -moz-linear-gradient(top, #149bdf, #0480be);
+  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#149bdf), to(#0480be));
+  background-image: -webkit-linear-gradient(top, #149bdf, #0480be);
+  background-image: -o-linear-gradient(top, #149bdf, #0480be);
+  background-image: linear-gradient(to bottom, #149bdf, #0480be);
+  background-repeat: repeat-x;
+  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff149bdf', endColorstr='#ff0480be', GradientType=0);
+  -webkit-box-shadow: inset 0 -1px 0 rgba(0, 0, 0, 0.15);
+     -moz-box-shadow: inset 0 -1px 0 rgba(0, 0, 0, 0.15);
+          box-shadow: inset 0 -1px 0 rgba(0, 0, 0, 0.15);
+  -webkit-box-sizing: border-box;
+     -moz-box-sizing: border-box;
+          box-sizing: border-box;
+  -webkit-transition: width 0.6s ease;
+     -moz-transition: width 0.6s ease;
+       -o-transition: width 0.6s ease;
+          transition: width 0.6s ease;
+}
+
+.progress .bar + .bar {
+  -webkit-box-shadow: inset 1px 0 0 rgba(0, 0, 0, 0.15), inset 0 -1px 0 rgba(0, 0, 0, 0.15);
+     -moz-box-shadow: inset 1px 0 0 rgba(0, 0, 0, 0.15), inset 0 -1px 0 rgba(0, 0, 0, 0.15);
+          box-shadow: inset 1px 0 0 rgba(0, 0, 0, 0.15), inset 0 -1px 0 rgba(0, 0, 0, 0.15);
+}
+
+.progress-striped .bar {
+  background-color: #149bdf;
+  background-image: -webkit-gradient(linear, 0 100%, 100% 0, color-stop(0.25, rgba(255, 255, 255, 0.15)), color-stop(0.25, transparent), color-stop(0.5, transparent), color-stop(0.5, rgba(255, 255, 255, 0.15)), color-stop(0.75, rgba(255, 255, 255, 0.15)), color-stop(0.75, transparent), to(transparent));
+  background-image: -webkit-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
+  background-image: -moz-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
+  background-image: -o-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
+  background-image: linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
+  -webkit-background-size: 40px 40px;
+     -moz-background-size: 40px 40px;
+       -o-background-size: 40px 40px;
+          background-size: 40px 40px;
+}
+
+.progress.active .bar {
+  -webkit-animation: progress-bar-stripes 2s linear infinite;
+     -moz-animation: progress-bar-stripes 2s linear infinite;
+      -ms-animation: progress-bar-stripes 2s linear infinite;
+       -o-animation: progress-bar-stripes 2s linear infinite;
+          animation: progress-bar-stripes 2s linear infinite;
+}
+
+.progress-danger .bar,
+.progress .bar-danger {
+  background-color: #dd514c;
+  background-image: -moz-linear-gradient(top, #ee5f5b, #c43c35);
+  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#ee5f5b), to(#c43c35));
+  background-image: -webkit-linear-gradient(top, #ee5f5b, #c43c35);
+  background-image: -o-linear-gradient(top, #ee5f5b, #c43c35);
+  background-image: linear-gradient(to bottom, #ee5f5b, #c43c35);
+  background-repeat: repeat-x;
+  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffee5f5b', endColorstr='#ffc43c35', GradientType=0);
+}
+
+.progress-danger.progress-striped .bar,
+.progress-striped .bar-danger {
+  background-color: #ee5f5b;
+  background-image: -webkit-gradient(linear, 0 100%, 100% 0, color-stop(0.25, rgba(255, 255, 255, 0.15)), color-stop(0.25, transparent), color-stop(0.5, transparent), color-stop(0.5, rgba(255, 255, 255, 0.15)), color-stop(0.75, rgba(255, 255, 255, 0.15)), color-stop(0.75, transparent), to(transparent));
+  background-image: -webkit-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
+  background-image: -moz-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
+  background-image: -o-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
+  background-image: linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
+}
+
+.progress-success .bar,
+.progress .bar-success {
+  background-color: #5eb95e;
+  background-image: -moz-linear-gradient(top, #62c462, #57a957);
+  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#62c462), to(#57a957));
+  background-image: -webkit-linear-gradient(top, #62c462, #57a957);
+  background-image: -o-linear-gradient(top, #62c462, #57a957);
+  background-image: linear-gradient(to bottom, #62c462, #57a957);
+  background-repeat: repeat-x;
+  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff62c462', endColorstr='#ff57a957', GradientType=0);
+}
+
+.progress-success.progress-striped .bar,
+.progress-striped .bar-success {
+  background-color: #62c462;
+  background-image: -webkit-gradient(linear, 0 100%, 100% 0, color-stop(0.25, rgba(255, 255, 255, 0.15)), color-stop(0.25, transparent), color-stop(0.5, transparent), color-stop(0.5, rgba(255, 255, 255, 0.15)), color-stop(0.75, rgba(255, 255, 255, 0.15)), color-stop(0.75, transparent), to(transparent));
+  background-image: -webkit-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
+  background-image: -moz-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
+  background-image: -o-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
+  background-image: linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
+}
+
+.progress-info .bar,
+.progress .bar-info {
+  background-color: #4bb1cf;
+  background-image: -moz-linear-gradient(top, #5bc0de, #339bb9);
+  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#5bc0de), to(#339bb9));
+  background-image: -webkit-linear-gradient(top, #5bc0de, #339bb9);
+  background-image: -o-linear-gradient(top, #5bc0de, #339bb9);
+  background-image: linear-gradient(to bottom, #5bc0de, #339bb9);
+  background-repeat: repeat-x;
+  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff5bc0de', endColorstr='#ff339bb9', GradientType=0);
+}
+
+.progress-info.progress-striped .bar,
+.progress-striped .bar-info {
+  background-color: #5bc0de;
+  background-image: -webkit-gradient(linear, 0 100%, 100% 0, color-stop(0.25, rgba(255, 255, 255, 0.15)), color-stop(0.25, transparent), color-stop(0.5, transparent), color-stop(0.5, rgba(255, 255, 255, 0.15)), color-stop(0.75, rgba(255, 255, 255, 0.15)), color-stop(0.75, transparent), to(transparent));
+  background-image: -webkit-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
+  background-image: -moz-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
+  background-image: -o-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
+  background-image: linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
+}
+
+.progress-warning .bar,
+.progress .bar-warning {
+  background-color: #faa732;
+  background-image: -moz-linear-gradient(top, #fbb450, #f89406);
+  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#fbb450), to(#f89406));
+  background-image: -webkit-linear-gradient(top, #fbb450, #f89406);
+  background-image: -o-linear-gradient(top, #fbb450, #f89406);
+  background-image: linear-gradient(to bottom, #fbb450, #f89406);
+  background-repeat: repeat-x;
+  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#fffbb450', endColorstr='#fff89406', GradientType=0);
+}
+
+.progress-warning.progress-striped .bar,
+.progress-striped .bar-warning {
+  background-color: #fbb450;
+  background-image: -webkit-gradient(linear, 0 100%, 100% 0, color-stop(0.25, rgba(255, 255, 255, 0.15)), color-stop(0.25, transparent), color-stop(0.5, transparent), color-stop(0.5, rgba(255, 255, 255, 0.15)), color-stop(0.75, rgba(255, 255, 255, 0.15)), color-stop(0.75, transparent), to(transparent));
+  background-image: -webkit-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
+  background-image: -moz-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
+  background-image: -o-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
+  background-image: linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
+}
+
+.accordion {
+  margin-bottom: 20px;
+}
+
+.accordion-group {
+  margin-bottom: 2px;
+  border: 1px solid #e5e5e5;
+  -webkit-border-radius: 4px;
+     -moz-border-radius: 4px;
+          border-radius: 4px;
+}
+
+.accordion-heading {
+  border-bottom: 0;
+}
+
+.accordion-heading .accordion-toggle {
+  display: block;
+  padding: 8px 15px;
+}
+
+.accordion-toggle {
+  cursor: pointer;
+}
+
+.accordion-inner {
+  padding: 9px 15px;
+  border-top: 1px solid #e5e5e5;
+}
+
+.carousel {
+  position: relative;
+  margin-bottom: 20px;
+  line-height: 1;
+}
+
+.carousel-inner {
+  position: relative;
+  width: 100%;
+  overflow: hidden;
+}
+
+.carousel-inner > .item {
+  position: relative;
+  display: none;
+  -webkit-transition: 0.6s ease-in-out left;
+     -moz-transition: 0.6s ease-in-out left;
+       -o-transition: 0.6s ease-in-out left;
+          transition: 0.6s ease-in-out left;
+}
+
+.carousel-inner > .item > img {
+  display: block;
+  line-height: 1;
+}
+
+.carousel-inner > .active,
+.carousel-inner > .next,
+.carousel-inner > .prev {
+  display: block;
+}
+
+.carousel-inner > .active {
+  left: 0;
+}
+
+.carousel-inner > .next,
+.carousel-inner > .prev {
+  position: absolute;
+  top: 0;
+  width: 100%;
+}
+
+.carousel-inner > .next {
+  left: 100%;
+}
+
+.carousel-inner > .prev {
+  left: -100%;
+}
+
+.carousel-inner > .next.left,
+.carousel-inner > .prev.right {
+  left: 0;
+}
+
+.carousel-inner > .active.left {
+  left: -100%;
+}
+
+.carousel-inner > .active.right {
+  left: 100%;
+}
+
+.carousel-control {
+  position: absolute;
+  top: 40%;
+  left: 15px;
+  width: 40px;
+  height: 40px;
+  margin-top: -20px;
+  font-size: 60px;
+  font-weight: 100;
+  line-height: 30px;
+  color: #ffffff;
+  text-align: center;
+  background: #222222;
+  border: 3px solid #ffffff;
+  -webkit-border-radius: 23px;
+     -moz-border-radius: 23px;
+          border-radius: 23px;
+  opacity: 0.5;
+  filter: alpha(opacity=50);
+}
+
+.carousel-control.right {
+  right: 15px;
+  left: auto;
+}
+
+.carousel-control:hover {
+  color: #ffffff;
+  text-decoration: none;
+  opacity: 0.9;
+  filter: alpha(opacity=90);
+}
+
+.carousel-caption {
+  position: absolute;
+  right: 0;
+  bottom: 0;
+  left: 0;
+  padding: 15px;
+  background: #333333;
+  background: rgba(0, 0, 0, 0.75);
+}
+
+.carousel-caption h4,
+.carousel-caption p {
+  line-height: 20px;
+  color: #ffffff;
+}
+
+.carousel-caption h4 {
+  margin: 0 0 5px;
+}
+
+.carousel-caption p {
+  margin-bottom: 0;
+}
+
+.hero-unit {
+  padding: 60px;
+  margin-bottom: 30px;
+  font-size: 18px;
+  font-weight: 200;
+  line-height: 30px;
+  color: inherit;
+  background-color: #eeeeee;
+  -webkit-border-radius: 6px;
+     -moz-border-radius: 6px;
+          border-radius: 6px;
+}
+
+.hero-unit h1 {
+  margin-bottom: 0;
+  font-size: 60px;
+  line-height: 1;
+  letter-spacing: -1px;
+  color: inherit;
+}
+
+.hero-unit li {
+  line-height: 30px;
+}
+
+.pull-right {
+  float: right;
+}
+
+.pull-left {
+  float: left;
+}
+
+.hide {
+  display: none;
+}
+
+.show {
+  display: block;
+}
+
+.invisible {
+  visibility: hidden;
+}
+
+.affix {
+  position: fixed;
+}
diff --git a/docs/css/bootstrap.min.css b/docs/css/bootstrap.min.css
new file mode 100644
index 0000000..0a54023
--- /dev/null
+++ b/docs/css/bootstrap.min.css
@@ -0,0 +1,882 @@
+ at import url(//fonts.googleapis.com/css?family=Telex);
+article,aside,details,figcaption,figure,footer,header,hgroup,nav,section{display:block;}
+footer{line-height:3px;font-size:80%;}
+audio,canvas,video{display:inline-block;*display:inline;*zoom:1;}
+audio:not([controls]){display:none;}
+html{font-size:100%;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%;}
+a:focus{outline:thin dotted #333;outline:5px auto -webkit-focus-ring-color;outline-offset:-2px;}
+a:hover,a:active{outline:0;}
+sub,sup{position:relative;font-size:75%;line-height:0;vertical-align:baseline;}
+sup{top:-0.5em;}
+sub{bottom:-0.25em;}
+img{max-width:100%;width:auto\9;height:auto;vertical-align:middle;border:0;-ms-interpolation-mode:bicubic;}
+#map_canvas img,.google-maps img{max-width:none;}
+button,input,select,textarea{margin:0;font-size:100%;vertical-align:middle;}
+button,input{*overflow:visible;line-height:normal;}
+button::-moz-focus-inner,input::-moz-focus-inner{padding:0;border:0;}
+button,html input[type="button"],input[type="reset"],input[type="submit"]{-webkit-appearance:button;cursor:pointer;}
+label,select,button,input[type="button"],input[type="reset"],input[type="submit"],input[type="radio"],input[type="checkbox"]{cursor:pointer;}
+input[type="search"]{-webkit-box-sizing:content-box;-moz-box-sizing:content-box;box-sizing:content-box;-webkit-appearance:textfield;}
+input[type="search"]::-webkit-search-decoration,input[type="search"]::-webkit-search-cancel-button{-webkit-appearance:none;}
+textarea{overflow:auto;vertical-align:top;}
+ at media print{*{text-shadow:none !important;color:#000 !important;background:transparent !important;box-shadow:none !important;} a,a:visited{text-decoration:underline;} a[href]:after{content:" (" attr(href) ")";} abbr[title]:after{content:" (" attr(title) ")";} .ir a:after,a[href^="javascript:"]:after,a[href^="#"]:after{content:"";} pre,blockquote{border:1px solid #999;page-break-inside:avoid;} thead{display:table-header-group;} tr,img{page-break-inside:avoid;} img{max-width:100% !important;} @page {margin:0.5cm;}p,h2,h3{orphans:3;widows:3;} h2,h3{page-break-after:avoid;}}.clearfix{*zoom:1;}.clearfix:before,.clearfix:after{display:table;content:"";line-height:0;}
+.clearfix:after{clear:both;}
+.hide-text{font:0/0 a;color:transparent;text-shadow:none;background-color:transparent;border:0;}
+.input-block-level{display:block;width:100%;min-height:30px;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;}
+body{margin:0;font-family:"Helvetica Neue",Helvetica,Arial,sans-serif;font-size:14px;line-height:20px;color:#555555;background-color:#ffffff;}
+a{color:#2fa4e7;text-decoration:none;}
+a:hover{color:#157ab5;text-decoration:underline;}
+.img-rounded{-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px;}
+.img-polaroid{padding:4px;background-color:#fff;border:1px solid #ccc;border:1px solid rgba(0, 0, 0, 0.2);-webkit-box-shadow:0 1px 3px rgba(0, 0, 0, 0.1);-moz-box-shadow:0 1px 3px rgba(0, 0, 0, 0.1);box-shadow:0 1px 3px rgba(0, 0, 0, 0.1);}
+.img-circle{-webkit-border-radius:500px;-moz-border-radius:500px;border-radius:500px;}
+.row{margin-left:-20px;*zoom:1;}.row:before,.row:after{display:table;content:"";line-height:0;}
+.row:after{clear:both;}
+[class*="span"]{float:left;min-height:1px;margin-left:20px;}
+.container,.navbar-static-top .container,.navbar-fixed-top .container,.navbar-fixed-bottom .container{width:940px;}
+.span12{width:940px;}
+.span11{width:860px;}
+.span10{width:780px;}
+.span9{width:700px;}
+.span8{width:620px;}
+.span7{width:540px;}
+.span6{width:460px;}
+.span5{width:380px;}
+.span4{width:300px;}
+.span3{width:220px;}
+.span2{width:140px;}
+.span1{width:60px;}
+.offset12{margin-left:980px;}
+.offset11{margin-left:900px;}
+.offset10{margin-left:820px;}
+.offset9{margin-left:740px;}
+.offset8{margin-left:660px;}
+.offset7{margin-left:580px;}
+.offset6{margin-left:500px;}
+.offset5{margin-left:420px;}
+.offset4{margin-left:340px;}
+.offset3{margin-left:260px;}
+.offset2{margin-left:180px;}
+.offset1{margin-left:100px;}
+.row-fluid{width:100%;*zoom:1;}.row-fluid:before,.row-fluid:after{display:table;content:"";line-height:0;}
+.row-fluid:after{clear:both;}
+.row-fluid [class*="span"]{display:block;width:100%;min-height:30px;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;float:left;margin-left:2.127659574468085%;*margin-left:2.074468085106383%;}
+.row-fluid [class*="span"]:first-child{margin-left:0;}
+.row-fluid .controls-row [class*="span"]+[class*="span"]{margin-left:2.127659574468085%;}
+.row-fluid .span12{width:100%;*width:99.94680851063829%;}
+.row-fluid .span11{width:91.48936170212765%;*width:91.43617021276594%;}
+.row-fluid .span10{width:82.97872340425532%;*width:82.92553191489361%;}
+.row-fluid .span9{width:74.46808510638297%;*width:74.41489361702126%;}
+.row-fluid .span8{width:65.95744680851064%;*width:65.90425531914893%;}
+.row-fluid .span7{width:57.44680851063829%;*width:57.39361702127659%;}
+.row-fluid .span6{width:48.93617021276595%;*width:48.88297872340425%;}
+.row-fluid .span5{width:40.42553191489362%;*width:40.37234042553192%;}
+.row-fluid .span4{width:31.914893617021278%;*width:31.861702127659576%;}
+.row-fluid .span3{width:23.404255319148934%;*width:23.351063829787233%;}
+.row-fluid .span2{width:14.893617021276595%;*width:14.840425531914894%;}
+.row-fluid .span1{width:6.382978723404255%;*width:6.329787234042553%;}
+.row-fluid .offset12{margin-left:104.25531914893617%;*margin-left:104.14893617021275%;}
+.row-fluid .offset12:first-child{margin-left:102.12765957446808%;*margin-left:102.02127659574467%;}
+.row-fluid .offset11{margin-left:95.74468085106382%;*margin-left:95.6382978723404%;}
+.row-fluid .offset11:first-child{margin-left:93.61702127659574%;*margin-left:93.51063829787232%;}
+.row-fluid .offset10{margin-left:87.23404255319149%;*margin-left:87.12765957446807%;}
+.row-fluid .offset10:first-child{margin-left:85.1063829787234%;*margin-left:84.99999999999999%;}
+.row-fluid .offset9{margin-left:78.72340425531914%;*margin-left:78.61702127659572%;}
+.row-fluid .offset9:first-child{margin-left:76.59574468085106%;*margin-left:76.48936170212764%;}
+.row-fluid .offset8{margin-left:70.2127659574468%;*margin-left:70.10638297872339%;}
+.row-fluid .offset8:first-child{margin-left:68.08510638297872%;*margin-left:67.9787234042553%;}
+.row-fluid .offset7{margin-left:61.70212765957446%;*margin-left:61.59574468085106%;}
+.row-fluid .offset7:first-child{margin-left:59.574468085106375%;*margin-left:59.46808510638297%;}
+.row-fluid .offset6{margin-left:53.191489361702125%;*margin-left:53.085106382978715%;}
+.row-fluid .offset6:first-child{margin-left:51.063829787234035%;*margin-left:50.95744680851063%;}
+.row-fluid .offset5{margin-left:44.68085106382979%;*margin-left:44.57446808510638%;}
+.row-fluid .offset5:first-child{margin-left:42.5531914893617%;*margin-left:42.4468085106383%;}
+.row-fluid .offset4{margin-left:36.170212765957444%;*margin-left:36.06382978723405%;}
+.row-fluid .offset4:first-child{margin-left:34.04255319148936%;*margin-left:33.93617021276596%;}
+.row-fluid .offset3{margin-left:27.659574468085104%;*margin-left:27.5531914893617%;}
+.row-fluid .offset3:first-child{margin-left:25.53191489361702%;*margin-left:25.425531914893618%;}
+.row-fluid .offset2{margin-left:19.148936170212764%;*margin-left:19.04255319148936%;}
+.row-fluid .offset2:first-child{margin-left:17.02127659574468%;*margin-left:16.914893617021278%;}
+.row-fluid .offset1{margin-left:10.638297872340425%;*margin-left:10.53191489361702%;}
+.row-fluid .offset1:first-child{margin-left:8.51063829787234%;*margin-left:8.404255319148938%;}
+[class*="span"].hide,.row-fluid [class*="span"].hide{display:none;}
+[class*="span"].pull-right,.row-fluid [class*="span"].pull-right{float:right;}
+.container{margin-right:auto;margin-left:auto;*zoom:1;}.container:before,.container:after{display:table;content:"";line-height:0;}
+.container:after{clear:both;}
+.container-fluid{padding-right:20px;padding-left:20px;*zoom:1;}.container-fluid:before,.container-fluid:after{display:table;content:"";line-height:0;}
+.container-fluid:after{clear:both;}
+p{margin:0 0 10px;}
+.lead{margin-bottom:20px;font-size:21px;font-weight:200;line-height:30px;}
+small{font-size:85%;}
+strong{font-weight:bold;}
+em{font-style:italic;}
+cite{font-style:normal;}
+.muted{color:#999999;}
+a.muted:hover{color:#808080;}
+.text-warning{color:#dd5600;}
+a.text-warning:hover{color:#aa4200;}
+.text-error{color:#bd4247;}
+a.text-error:hover{color:#983538;}
+.text-info{color:#817b58;}
+a.text-info:hover{color:#625e43;}
+.text-success{color:#669533;}
+a.text-success:hover{color:#4c6f26;}
+h1,h2,h3,h4,h5,h6{margin:10px 0;font-family:'Telex',sans-serif;font-weight:bold;line-height:20px;color:#317eac;text-rendering:optimizelegibility;}h1 small,h2 small,h3 small,h4 small,h5 small,h6 small{font-weight:normal;line-height:1;color:#999999;}
+h1,h2,h3{line-height:40px;}
+h1{font-size:38.5px;}
+h2{font-size:31.5px;}
+h3{font-size:24.5px;}
+h4{font-size:17.5px;}
+h5{font-size:14px;}
+h6{font-size:11.9px;}
+h1 small{font-size:24.5px;}
+h2 small{font-size:17.5px;}
+h3 small{font-size:14px;}
+h4 small{font-size:14px;}
+.page-header{padding-bottom:9px;margin:20px 0 30px;border-bottom:1px solid #f5f5f5;}
+ul,ol{padding:0;margin:0 0 10px 25px;}
+ul ul,ul ol,ol ol,ol ul{margin-bottom:0;}
+li{line-height:20px;}
+ul.unstyled,ol.unstyled{margin-left:0;list-style:none;}
+ul.inline,ol.inline{margin-left:0;list-style:none;}ul.inline >li,ol.inline >li{display:inline-block;padding-left:5px;padding-right:5px;}
+dl{margin-bottom:20px;}
+dt,dd{line-height:20px;}
+dt{font-weight:bold;}
+dd{margin-left:10px;}
+.dl-horizontal{*zoom:1;}.dl-horizontal:before,.dl-horizontal:after{display:table;content:"";line-height:0;}
+.dl-horizontal:after{clear:both;}
+.dl-horizontal dt{float:left;width:160px;clear:left;text-align:right;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;}
+.dl-horizontal dd{margin-left:180px;}
+hr{margin:20px 0;border:0;border-top:1px solid #f5f5f5;border-bottom:1px solid #ffffff;}
+abbr[title],abbr[data-original-title]{cursor:help;border-bottom:1px dotted #999999;}
+abbr.initialism{font-size:90%;text-transform:uppercase;}
+blockquote{padding:0 0 0 15px;margin:0 0 20px;border-left:5px solid #f5f5f5;}blockquote p{margin-bottom:0;font-size:16px;font-weight:300;line-height:25px;}
+blockquote small{display:block;line-height:20px;color:#999999;}blockquote small:before{content:'\2014 \00A0';}
+blockquote.pull-right{float:right;padding-right:15px;padding-left:0;border-right:5px solid #f5f5f5;border-left:0;}blockquote.pull-right p,blockquote.pull-right small{text-align:right;}
+blockquote.pull-right small:before{content:'';}
+blockquote.pull-right small:after{content:'\00A0 \2014';}
+q:before,q:after,blockquote:before,blockquote:after{content:"";}
+address{display:block;margin-bottom:20px;font-style:normal;line-height:20px;}
+code,pre{padding:0 3px 2px;font-family:Menlo,Monaco,Consolas,"Courier New",monospace;font-size:12px;color:#333333;-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px;}
+code{padding:2px 4px;color:#d14;background-color:#f7f7f9;border:1px solid #e1e1e8;white-space:nowrap;}
+pre{display:block;padding:9.5px;margin:0 0 10px;font-size:13px;line-height:20px;word-break:break-all;word-wrap:break-word;white-space:pre;white-space:pre-wrap;background-color:#f5f5f5;border:1px solid #ccc;border:1px solid rgba(0, 0, 0, 0.15);-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;}pre.prettyprint{margin-bottom:20px;}
+pre code{padding:0;color:inherit;white-space:pre;white-space:pre-wrap;background-color:transparent;border:0;}
+.pre-scrollable{max-height:340px;overflow-y:scroll;}
+form{margin:0 0 20px;}
+fieldset{padding:0;margin:0;border:0;}
+legend{display:block;width:100%;padding:0;margin-bottom:20px;font-size:21px;line-height:40px;color:#333333;border:0;border-bottom:1px solid #e5e5e5;}legend small{font-size:15px;color:#999999;}
+label,input,button,select,textarea{font-size:14px;font-weight:normal;line-height:20px;}
+input,button,select,textarea{font-family:"Helvetica Neue",Helvetica,Arial,sans-serif;}
+label{display:block;margin-bottom:5px;}
+select,textarea,input[type="text"],input[type="password"],input[type="datetime"],input[type="datetime-local"],input[type="date"],input[type="month"],input[type="time"],input[type="week"],input[type="number"],input[type="email"],input[type="url"],input[type="search"],input[type="tel"],input[type="color"],.uneditable-input{display:inline-block;height:20px;padding:4px 6px;margin-bottom:10px;font-size:14px;line-height:20px;color:#555555;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;vertical-align:middle;}
+input,textarea,.uneditable-input{width:206px;}
+textarea{height:auto;}
+textarea,input[type="text"],input[type="password"],input[type="datetime"],input[type="datetime-local"],input[type="date"],input[type="month"],input[type="time"],input[type="week"],input[type="number"],input[type="email"],input[type="url"],input[type="search"],input[type="tel"],input[type="color"],.uneditable-input{background-color:#ffffff;border:1px solid #cccccc;-webkit-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075);-moz-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075);box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075);-webkit-transition:border linear .2s, box-shadow linear .2s;-moz-transition:border linear .2s, box-shadow linear .2s;-o-transition:border linear .2s, box-shadow linear .2s;transition:border linear .2s, box-shadow linear .2s;}textarea:focus,input[type="text"]:focus,input[type="password"]:focus,input[type="datetime"]:focus,input[type="datetime-local"]:focus,input[type="date"]:focus,input[type="month"]:focus,input[type="time"]:focus,input[type="week"]:focus,input[t
 ype="number"]:focus,input[type="email"]:focus,input[type="url"]:focus,input[type="search"]:focus,input[type="tel"]:focus,input[type="color"]:focus,.uneditable-input:focus{border-color:rgba(82, 168, 236, 0.8);outline:0;outline:thin dotted \9;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(82,168,236,.6);-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(82,168,236,.6);box-shadow:inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(82,168,236,.6);}
+input[type="radio"],input[type="checkbox"]{margin:4px 0 0;*margin-top:0;margin-top:1px \9;line-height:normal;}
+input[type="file"],input[type="image"],input[type="submit"],input[type="reset"],input[type="button"],input[type="radio"],input[type="checkbox"]{width:auto;}
+select,input[type="file"]{height:30px;*margin-top:4px;line-height:30px;}
+select{width:220px;border:1px solid #cccccc;background-color:#ffffff;}
+select[multiple],select[size]{height:auto;}
+select:focus,input[type="file"]:focus,input[type="radio"]:focus,input[type="checkbox"]:focus{outline:thin dotted #333;outline:5px auto -webkit-focus-ring-color;outline-offset:-2px;}
+.uneditable-input,.uneditable-textarea{color:#999999;background-color:#fcfcfc;border-color:#cccccc;-webkit-box-shadow:inset 0 1px 2px rgba(0, 0, 0, 0.025);-moz-box-shadow:inset 0 1px 2px rgba(0, 0, 0, 0.025);box-shadow:inset 0 1px 2px rgba(0, 0, 0, 0.025);cursor:not-allowed;}
+.uneditable-input{overflow:hidden;white-space:nowrap;}
+.uneditable-textarea{width:auto;height:auto;}
+input:-moz-placeholder,textarea:-moz-placeholder{color:#999999;}
+input:-ms-input-placeholder,textarea:-ms-input-placeholder{color:#999999;}
+input::-webkit-input-placeholder,textarea::-webkit-input-placeholder{color:#999999;}
+.radio,.checkbox{min-height:20px;padding-left:20px;}
+.radio input[type="radio"],.checkbox input[type="checkbox"]{float:left;margin-left:-20px;}
+.controls>.radio:first-child,.controls>.checkbox:first-child{padding-top:5px;}
+.radio.inline,.checkbox.inline{display:inline-block;padding-top:5px;margin-bottom:0;vertical-align:middle;}
+.radio.inline+.radio.inline,.checkbox.inline+.checkbox.inline{margin-left:10px;}
+.input-mini{width:60px;}
+.input-small{width:90px;}
+.input-medium{width:150px;}
+.input-large{width:210px;}
+.input-xlarge{width:270px;}
+.input-xxlarge{width:530px;}
+input[class*="span"],select[class*="span"],textarea[class*="span"],.uneditable-input[class*="span"],.row-fluid input[class*="span"],.row-fluid select[class*="span"],.row-fluid textarea[class*="span"],.row-fluid .uneditable-input[class*="span"]{float:none;margin-left:0;}
+.input-append input[class*="span"],.input-append .uneditable-input[class*="span"],.input-prepend input[class*="span"],.input-prepend .uneditable-input[class*="span"],.row-fluid input[class*="span"],.row-fluid select[class*="span"],.row-fluid textarea[class*="span"],.row-fluid .uneditable-input[class*="span"],.row-fluid .input-prepend [class*="span"],.row-fluid .input-append [class*="span"]{display:inline-block;}
+input,textarea,.uneditable-input{margin-left:0;}
+.controls-row [class*="span"]+[class*="span"]{margin-left:20px;}
+input.span12, textarea.span12, .uneditable-input.span12{width:926px;}
+input.span11, textarea.span11, .uneditable-input.span11{width:846px;}
+input.span10, textarea.span10, .uneditable-input.span10{width:766px;}
+input.span9, textarea.span9, .uneditable-input.span9{width:686px;}
+input.span8, textarea.span8, .uneditable-input.span8{width:606px;}
+input.span7, textarea.span7, .uneditable-input.span7{width:526px;}
+input.span6, textarea.span6, .uneditable-input.span6{width:446px;}
+input.span5, textarea.span5, .uneditable-input.span5{width:366px;}
+input.span4, textarea.span4, .uneditable-input.span4{width:286px;}
+input.span3, textarea.span3, .uneditable-input.span3{width:206px;}
+input.span2, textarea.span2, .uneditable-input.span2{width:126px;}
+input.span1, textarea.span1, .uneditable-input.span1{width:46px;}
+.controls-row{*zoom:1;}.controls-row:before,.controls-row:after{display:table;content:"";line-height:0;}
+.controls-row:after{clear:both;}
+.controls-row [class*="span"],.row-fluid .controls-row [class*="span"]{float:left;}
+.controls-row .checkbox[class*="span"],.controls-row .radio[class*="span"]{padding-top:5px;}
+input[disabled],select[disabled],textarea[disabled],input[readonly],select[readonly],textarea[readonly]{cursor:not-allowed;background-color:#f5f5f5;}
+input[type="radio"][disabled],input[type="checkbox"][disabled],input[type="radio"][readonly],input[type="checkbox"][readonly]{background-color:transparent;}
+.control-group.warning .control-label,.control-group.warning .help-block,.control-group.warning .help-inline{color:#dd5600;}
+.control-group.warning .checkbox,.control-group.warning .radio,.control-group.warning input,.control-group.warning select,.control-group.warning textarea{color:#dd5600;}
+.control-group.warning input,.control-group.warning select,.control-group.warning textarea{border-color:#dd5600;-webkit-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075);-moz-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075);box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075);}.control-group.warning input:focus,.control-group.warning select:focus,.control-group.warning textarea:focus{border-color:#aa4200;-webkit-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075),0 0 6px #ff8d44;-moz-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075),0 0 6px #ff8d44;box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075),0 0 6px #ff8d44;}
+.control-group.warning .input-prepend .add-on,.control-group.warning .input-append .add-on{color:#dd5600;background-color:#f1ceab;border-color:#dd5600;}
+.control-group.error .control-label,.control-group.error .help-block,.control-group.error .help-inline{color:#bd4247;}
+.control-group.error .checkbox,.control-group.error .radio,.control-group.error input,.control-group.error select,.control-group.error textarea{color:#bd4247;}
+.control-group.error input,.control-group.error select,.control-group.error textarea{border-color:#bd4247;-webkit-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075);-moz-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075);box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075);}.control-group.error input:focus,.control-group.error select:focus,.control-group.error textarea:focus{border-color:#983538;-webkit-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075),0 0 6px #d88e90;-moz-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075),0 0 6px #d88e90;box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075),0 0 6px #d88e90;}
+.control-group.error .input-prepend .add-on,.control-group.error .input-append .add-on{color:#bd4247;background-color:#f2bdb1;border-color:#bd4247;}
+.control-group.success .control-label,.control-group.success .help-block,.control-group.success .help-inline{color:#669533;}
+.control-group.success .checkbox,.control-group.success .radio,.control-group.success input,.control-group.success select,.control-group.success textarea{color:#669533;}
+.control-group.success input,.control-group.success select,.control-group.success textarea{border-color:#669533;-webkit-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075);-moz-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075);box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075);}.control-group.success input:focus,.control-group.success select:focus,.control-group.success textarea:focus{border-color:#4c6f26;-webkit-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075),0 0 6px #99ca63;-moz-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075),0 0 6px #99ca63;box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075),0 0 6px #99ca63;}
+.control-group.success .input-prepend .add-on,.control-group.success .input-append .add-on{color:#669533;background-color:#d5ecbf;border-color:#669533;}
+.control-group.info .control-label,.control-group.info .help-block,.control-group.info .help-inline{color:#817b58;}
+.control-group.info .checkbox,.control-group.info .radio,.control-group.info input,.control-group.info select,.control-group.info textarea{color:#817b58;}
+.control-group.info input,.control-group.info select,.control-group.info textarea{border-color:#817b58;-webkit-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075);-moz-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075);box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075);}.control-group.info input:focus,.control-group.info select:focus,.control-group.info textarea:focus{border-color:#625e43;-webkit-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075),0 0 6px #b1ad8d;-moz-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075),0 0 6px #b1ad8d;box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075),0 0 6px #b1ad8d;}
+.control-group.info .input-prepend .add-on,.control-group.info .input-append .add-on{color:#817b58;background-color:#a7dff1;border-color:#817b58;}
+input:focus:invalid,textarea:focus:invalid,select:focus:invalid{color:#b94a48;border-color:#ee5f5b;}input:focus:invalid:focus,textarea:focus:invalid:focus,select:focus:invalid:focus{border-color:#e9322d;-webkit-box-shadow:0 0 6px #f8b9b7;-moz-box-shadow:0 0 6px #f8b9b7;box-shadow:0 0 6px #f8b9b7;}
+.form-actions{padding:19px 20px 20px;margin-top:20px;margin-bottom:20px;background-color:#f5f5f5;border-top:1px solid #e5e5e5;*zoom:1;}.form-actions:before,.form-actions:after{display:table;content:"";line-height:0;}
+.form-actions:after{clear:both;}
+.help-block,.help-inline{color:#7b7b7b;}
+.help-block{display:block;margin-bottom:10px;}
+.help-inline{display:inline-block;*display:inline;*zoom:1;vertical-align:middle;padding-left:5px;}
+.input-append,.input-prepend{margin-bottom:5px;font-size:0;white-space:nowrap;}.input-append input,.input-prepend input,.input-append select,.input-prepend select,.input-append .uneditable-input,.input-prepend .uneditable-input,.input-append .dropdown-menu,.input-prepend .dropdown-menu{font-size:14px;}
+.input-append input,.input-prepend input,.input-append select,.input-prepend select,.input-append .uneditable-input,.input-prepend .uneditable-input{position:relative;margin-bottom:0;*margin-left:0;vertical-align:top;-webkit-border-radius:0 4px 4px 0;-moz-border-radius:0 4px 4px 0;border-radius:0 4px 4px 0;}.input-append input:focus,.input-prepend input:focus,.input-append select:focus,.input-prepend select:focus,.input-append .uneditable-input:focus,.input-prepend .uneditable-input:focus{z-index:2;}
+.input-append .add-on,.input-prepend .add-on{display:inline-block;width:auto;height:20px;min-width:16px;padding:4px 5px;font-size:14px;font-weight:normal;line-height:20px;text-align:center;text-shadow:0 1px 0 #ffffff;background-color:#f5f5f5;border:1px solid #ccc;}
+.input-append .add-on,.input-prepend .add-on,.input-append .btn,.input-prepend .btn,.input-append .btn-group>.dropdown-toggle,.input-prepend .btn-group>.dropdown-toggle{vertical-align:top;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0;}
+.input-append .active,.input-prepend .active{background-color:#bede9c;border-color:#73a839;}
+.input-prepend .add-on,.input-prepend .btn{margin-right:-1px;}
+.input-prepend .add-on:first-child,.input-prepend .btn:first-child{-webkit-border-radius:4px 0 0 4px;-moz-border-radius:4px 0 0 4px;border-radius:4px 0 0 4px;}
+.input-append input,.input-append select,.input-append .uneditable-input{-webkit-border-radius:4px 0 0 4px;-moz-border-radius:4px 0 0 4px;border-radius:4px 0 0 4px;}.input-append input+.btn-group .btn:last-child,.input-append select+.btn-group .btn:last-child,.input-append .uneditable-input+.btn-group .btn:last-child{-webkit-border-radius:0 4px 4px 0;-moz-border-radius:0 4px 4px 0;border-radius:0 4px 4px 0;}
+.input-append .add-on,.input-append .btn,.input-append .btn-group{margin-left:-1px;}
+.input-append .add-on:last-child,.input-append .btn:last-child,.input-append .btn-group:last-child>.dropdown-toggle{-webkit-border-radius:0 4px 4px 0;-moz-border-radius:0 4px 4px 0;border-radius:0 4px 4px 0;}
+.input-prepend.input-append input,.input-prepend.input-append select,.input-prepend.input-append .uneditable-input{-webkit-border-radius:0;-moz-border-radius:0;border-radius:0;}.input-prepend.input-append input+.btn-group .btn,.input-prepend.input-append select+.btn-group .btn,.input-prepend.input-append .uneditable-input+.btn-group .btn{-webkit-border-radius:0 4px 4px 0;-moz-border-radius:0 4px 4px 0;border-radius:0 4px 4px 0;}
+.input-prepend.input-append .add-on:first-child,.input-prepend.input-append .btn:first-child{margin-right:-1px;-webkit-border-radius:4px 0 0 4px;-moz-border-radius:4px 0 0 4px;border-radius:4px 0 0 4px;}
+.input-prepend.input-append .add-on:last-child,.input-prepend.input-append .btn:last-child{margin-left:-1px;-webkit-border-radius:0 4px 4px 0;-moz-border-radius:0 4px 4px 0;border-radius:0 4px 4px 0;}
+.input-prepend.input-append .btn-group:first-child{margin-left:0;}
+input.search-query{padding-right:14px;padding-right:4px \9;padding-left:14px;padding-left:4px \9;margin-bottom:0;-webkit-border-radius:15px;-moz-border-radius:15px;border-radius:15px;}
+.form-search .input-append .search-query,.form-search .input-prepend .search-query{-webkit-border-radius:0;-moz-border-radius:0;border-radius:0;}
+.form-search .input-append .search-query{-webkit-border-radius:14px 0 0 14px;-moz-border-radius:14px 0 0 14px;border-radius:14px 0 0 14px;}
+.form-search .input-append .btn{-webkit-border-radius:0 14px 14px 0;-moz-border-radius:0 14px 14px 0;border-radius:0 14px 14px 0;}
+.form-search .input-prepend .search-query{-webkit-border-radius:0 14px 14px 0;-moz-border-radius:0 14px 14px 0;border-radius:0 14px 14px 0;}
+.form-search .input-prepend .btn{-webkit-border-radius:14px 0 0 14px;-moz-border-radius:14px 0 0 14px;border-radius:14px 0 0 14px;}
+.form-search input,.form-inline input,.form-horizontal input,.form-search textarea,.form-inline textarea,.form-horizontal textarea,.form-search select,.form-inline select,.form-horizontal select,.form-search .help-inline,.form-inline .help-inline,.form-horizontal .help-inline,.form-search .uneditable-input,.form-inline .uneditable-input,.form-horizontal .uneditable-input,.form-search .input-prepend,.form-inline .input-prepend,.form-horizontal .input-prepend,.form-search .input-append,.form-inline .input-append,.form-horizontal .input-append{display:inline-block;*display:inline;*zoom:1;margin-bottom:0;vertical-align:middle;}
+.form-search .hide,.form-inline .hide,.form-horizontal .hide{display:none;}
+.form-search label,.form-inline label,.form-search .btn-group,.form-inline .btn-group{display:inline-block;}
+.form-search .input-append,.form-inline .input-append,.form-search .input-prepend,.form-inline .input-prepend{margin-bottom:0;}
+.form-search .radio,.form-search .checkbox,.form-inline .radio,.form-inline .checkbox{padding-left:0;margin-bottom:0;vertical-align:middle;}
+.form-search .radio input[type="radio"],.form-search .checkbox input[type="checkbox"],.form-inline .radio input[type="radio"],.form-inline .checkbox input[type="checkbox"]{float:left;margin-right:3px;margin-left:0;}
+.control-group{margin-bottom:10px;}
+legend+.control-group{margin-top:20px;-webkit-margin-top-collapse:separate;}
+.form-horizontal .control-group{margin-bottom:20px;*zoom:1;}.form-horizontal .control-group:before,.form-horizontal .control-group:after{display:table;content:"";line-height:0;}
+.form-horizontal .control-group:after{clear:both;}
+.form-horizontal .control-label{float:left;width:160px;padding-top:5px;text-align:right;}
+.form-horizontal .controls{*display:inline-block;*padding-left:20px;margin-left:180px;*margin-left:0;}.form-horizontal .controls:first-child{*padding-left:180px;}
+.form-horizontal .help-block{margin-bottom:0;}
+.form-horizontal input+.help-block,.form-horizontal select+.help-block,.form-horizontal textarea+.help-block,.form-horizontal .uneditable-input+.help-block,.form-horizontal .input-prepend+.help-block,.form-horizontal .input-append+.help-block{margin-top:10px;}
+.form-horizontal .form-actions{padding-left:180px;}
+table{max-width:100%;background-color:transparent;border-collapse:collapse;border-spacing:0;}
+.table{width:100%;margin-bottom:20px;}.table th,.table td{padding:8px;line-height:20px;text-align:left;vertical-align:top;border-top:1px solid #dddddd;}
+.table th{font-weight:bold;}
+.table thead th{vertical-align:bottom;}
+.table caption+thead tr:first-child th,.table caption+thead tr:first-child td,.table colgroup+thead tr:first-child th,.table colgroup+thead tr:first-child td,.table thead:first-child tr:first-child th,.table thead:first-child tr:first-child td{border-top:0;}
+.table tbody+tbody{border-top:2px solid #dddddd;}
+.table .table{background-color:#ffffff;}
+.table-condensed th,.table-condensed td{padding:4px 5px;}
+.table-bordered{border:1px solid #dddddd;border-collapse:separate;*border-collapse:collapse;border-left:0;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;}.table-bordered th,.table-bordered td{border-left:1px solid #dddddd;}
+.table-bordered caption+thead tr:first-child th,.table-bordered caption+tbody tr:first-child th,.table-bordered caption+tbody tr:first-child td,.table-bordered colgroup+thead tr:first-child th,.table-bordered colgroup+tbody tr:first-child th,.table-bordered colgroup+tbody tr:first-child td,.table-bordered thead:first-child tr:first-child th,.table-bordered tbody:first-child tr:first-child th,.table-bordered tbody:first-child tr:first-child td{border-top:0;}
+.table-bordered thead:first-child tr:first-child>th:first-child,.table-bordered tbody:first-child tr:first-child>td:first-child{-webkit-border-top-left-radius:4px;-moz-border-radius-topleft:4px;border-top-left-radius:4px;}
+.table-bordered thead:first-child tr:first-child>th:last-child,.table-bordered tbody:first-child tr:first-child>td:last-child{-webkit-border-top-right-radius:4px;-moz-border-radius-topright:4px;border-top-right-radius:4px;}
+.table-bordered thead:last-child tr:last-child>th:first-child,.table-bordered tbody:last-child tr:last-child>td:first-child,.table-bordered tfoot:last-child tr:last-child>td:first-child{-webkit-border-bottom-left-radius:4px;-moz-border-radius-bottomleft:4px;border-bottom-left-radius:4px;}
+.table-bordered thead:last-child tr:last-child>th:last-child,.table-bordered tbody:last-child tr:last-child>td:last-child,.table-bordered tfoot:last-child tr:last-child>td:last-child{-webkit-border-bottom-right-radius:4px;-moz-border-radius-bottomright:4px;border-bottom-right-radius:4px;}
+.table-bordered tfoot+tbody:last-child tr:last-child td:first-child{-webkit-border-bottom-left-radius:0;-moz-border-radius-bottomleft:0;border-bottom-left-radius:0;}
+.table-bordered tfoot+tbody:last-child tr:last-child td:last-child{-webkit-border-bottom-right-radius:0;-moz-border-radius-bottomright:0;border-bottom-right-radius:0;}
+.table-bordered caption+thead tr:first-child th:first-child,.table-bordered caption+tbody tr:first-child td:first-child,.table-bordered colgroup+thead tr:first-child th:first-child,.table-bordered colgroup+tbody tr:first-child td:first-child{-webkit-border-top-left-radius:4px;-moz-border-radius-topleft:4px;border-top-left-radius:4px;}
+.table-bordered caption+thead tr:first-child th:last-child,.table-bordered caption+tbody tr:first-child td:last-child,.table-bordered colgroup+thead tr:first-child th:last-child,.table-bordered colgroup+tbody tr:first-child td:last-child{-webkit-border-top-right-radius:4px;-moz-border-radius-topright:4px;border-top-right-radius:4px;}
+.table-striped tbody>tr:nth-child(odd)>td,.table-striped tbody>tr:nth-child(odd)>th{background-color:#f9f9f9;}
+.table-hover tbody tr:hover td,.table-hover tbody tr:hover th{background-color:#f5f5f5;}
+table td[class*="span"],table th[class*="span"],.row-fluid table td[class*="span"],.row-fluid table th[class*="span"]{display:table-cell;float:none;margin-left:0;}
+.table td.span1,.table th.span1{float:none;width:44px;margin-left:0;}
+.table td.span2,.table th.span2{float:none;width:124px;margin-left:0;}
+.table td.span3,.table th.span3{float:none;width:204px;margin-left:0;}
+.table td.span4,.table th.span4{float:none;width:284px;margin-left:0;}
+.table td.span5,.table th.span5{float:none;width:364px;margin-left:0;}
+.table td.span6,.table th.span6{float:none;width:444px;margin-left:0;}
+.table td.span7,.table th.span7{float:none;width:524px;margin-left:0;}
+.table td.span8,.table th.span8{float:none;width:604px;margin-left:0;}
+.table td.span9,.table th.span9{float:none;width:684px;margin-left:0;}
+.table td.span10,.table th.span10{float:none;width:764px;margin-left:0;}
+.table td.span11,.table th.span11{float:none;width:844px;margin-left:0;}
+.table td.span12,.table th.span12{float:none;width:924px;margin-left:0;}
+.table tbody tr.success td{background-color:#d5ecbf;}
+.table tbody tr.error td{background-color:#f2bdb1;}
+.table tbody tr.warning td{background-color:#f1ceab;}
+.table tbody tr.info td{background-color:#a7dff1;}
+.table-hover tbody tr.success:hover td{background-color:#c8e6ab;}
+.table-hover tbody tr.error:hover td{background-color:#eeab9b;}
+.table-hover tbody tr.warning:hover td{background-color:#edc195;}
+.table-hover tbody tr.info:hover td{background-color:#91d7ee;}
+[class^="icon-"],[class*=" icon-"]{display:inline-block;width:14px;height:14px;*margin-right:.3em;line-height:14px;vertical-align:text-top;background-image:url("../images/glyphicons-halflings.png");background-position:14px 14px;background-repeat:no-repeat;margin-top:1px;}
+.icon-white,.nav-pills>.active>a>[class^="icon-"],.nav-pills>.active>a>[class*=" icon-"],.nav-list>.active>a>[class^="icon-"],.nav-list>.active>a>[class*=" icon-"],.navbar-inverse .nav>.active>a>[class^="icon-"],.navbar-inverse .nav>.active>a>[class*=" icon-"],.dropdown-menu>li>a:hover>[class^="icon-"],.dropdown-menu>li>a:hover>[class*=" icon-"],.dropdown-menu>.active>a>[class^="icon-"],.dropdown-menu>.active>a>[class*=" icon-"],.dropdown-submenu:hover>a>[class^="icon-"],.dropdown-submenu:hover>a>[class*=" icon-"]{background-image:url("../images/glyphicons-halflings-white.png");}
+.icon-glass{background-position:0 0;}
+.icon-music{background-position:-24px 0;}
+.icon-search{background-position:-48px 0;}
+.icon-envelope{background-position:-72px 0;}
+.icon-heart{background-position:-96px 0;}
+.icon-star{background-position:-120px 0;}
+.icon-star-empty{background-position:-144px 0;}
+.icon-user{background-position:-168px 0;}
+.icon-film{background-position:-192px 0;}
+.icon-th-large{background-position:-216px 0;}
+.icon-th{background-position:-240px 0;}
+.icon-th-list{background-position:-264px 0;}
+.icon-ok{background-position:-288px 0;}
+.icon-remove{background-position:-312px 0;}
+.icon-zoom-in{background-position:-336px 0;}
+.icon-zoom-out{background-position:-360px 0;}
+.icon-off{background-position:-384px 0;}
+.icon-signal{background-position:-408px 0;}
+.icon-cog{background-position:-432px 0;}
+.icon-trash{background-position:-456px 0;}
+.icon-home{background-position:0 -24px;}
+.icon-file{background-position:-24px -24px;}
+.icon-time{background-position:-48px -24px;}
+.icon-road{background-position:-72px -24px;}
+.icon-download-alt{background-position:-96px -24px;}
+.icon-download{background-position:-120px -24px;}
+.icon-upload{background-position:-144px -24px;}
+.icon-inbox{background-position:-168px -24px;}
+.icon-play-circle{background-position:-192px -24px;}
+.icon-repeat{background-position:-216px -24px;}
+.icon-refresh{background-position:-240px -24px;}
+.icon-list-alt{background-position:-264px -24px;}
+.icon-lock{background-position:-287px -24px;}
+.icon-flag{background-position:-312px -24px;}
+.icon-headphones{background-position:-336px -24px;}
+.icon-volume-off{background-position:-360px -24px;}
+.icon-volume-down{background-position:-384px -24px;}
+.icon-volume-up{background-position:-408px -24px;}
+.icon-qrcode{background-position:-432px -24px;}
+.icon-barcode{background-position:-456px -24px;}
+.icon-tag{background-position:0 -48px;}
+.icon-tags{background-position:-25px -48px;}
+.icon-book{background-position:-48px -48px;}
+.icon-bookmark{background-position:-72px -48px;}
+.icon-print{background-position:-96px -48px;}
+.icon-camera{background-position:-120px -48px;}
+.icon-font{background-position:-144px -48px;}
+.icon-bold{background-position:-167px -48px;}
+.icon-italic{background-position:-192px -48px;}
+.icon-text-height{background-position:-216px -48px;}
+.icon-text-width{background-position:-240px -48px;}
+.icon-align-left{background-position:-264px -48px;}
+.icon-align-center{background-position:-288px -48px;}
+.icon-align-right{background-position:-312px -48px;}
+.icon-align-justify{background-position:-336px -48px;}
+.icon-list{background-position:-360px -48px;}
+.icon-indent-left{background-position:-384px -48px;}
+.icon-indent-right{background-position:-408px -48px;}
+.icon-facetime-video{background-position:-432px -48px;}
+.icon-picture{background-position:-456px -48px;}
+.icon-pencil{background-position:0 -72px;}
+.icon-map-marker{background-position:-24px -72px;}
+.icon-adjust{background-position:-48px -72px;}
+.icon-tint{background-position:-72px -72px;}
+.icon-edit{background-position:-96px -72px;}
+.icon-share{background-position:-120px -72px;}
+.icon-check{background-position:-144px -72px;}
+.icon-move{background-position:-168px -72px;}
+.icon-step-backward{background-position:-192px -72px;}
+.icon-fast-backward{background-position:-216px -72px;}
+.icon-backward{background-position:-240px -72px;}
+.icon-play{background-position:-264px -72px;}
+.icon-pause{background-position:-288px -72px;}
+.icon-stop{background-position:-312px -72px;}
+.icon-forward{background-position:-336px -72px;}
+.icon-fast-forward{background-position:-360px -72px;}
+.icon-step-forward{background-position:-384px -72px;}
+.icon-eject{background-position:-408px -72px;}
+.icon-chevron-left{background-position:-432px -72px;}
+.icon-chevron-right{background-position:-456px -72px;}
+.icon-plus-sign{background-position:0 -96px;}
+.icon-minus-sign{background-position:-24px -96px;}
+.icon-remove-sign{background-position:-48px -96px;}
+.icon-ok-sign{background-position:-72px -96px;}
+.icon-question-sign{background-position:-96px -96px;}
+.icon-info-sign{background-position:-120px -96px;}
+.icon-screenshot{background-position:-144px -96px;}
+.icon-remove-circle{background-position:-168px -96px;}
+.icon-ok-circle{background-position:-192px -96px;}
+.icon-ban-circle{background-position:-216px -96px;}
+.icon-arrow-left{background-position:-240px -96px;}
+.icon-arrow-right{background-position:-264px -96px;}
+.icon-arrow-up{background-position:-289px -96px;}
+.icon-arrow-down{background-position:-312px -96px;}
+.icon-share-alt{background-position:-336px -96px;}
+.icon-resize-full{background-position:-360px -96px;}
+.icon-resize-small{background-position:-384px -96px;}
+.icon-plus{background-position:-408px -96px;}
+.icon-minus{background-position:-433px -96px;}
+.icon-asterisk{background-position:-456px -96px;}
+.icon-exclamation-sign{background-position:0 -120px;}
+.icon-gift{background-position:-24px -120px;}
+.icon-leaf{background-position:-48px -120px;}
+.icon-fire{background-position:-72px -120px;}
+.icon-eye-open{background-position:-96px -120px;}
+.icon-eye-close{background-position:-120px -120px;}
+.icon-warning-sign{background-position:-144px -120px;}
+.icon-plane{background-position:-168px -120px;}
+.icon-calendar{background-position:-192px -120px;}
+.icon-random{background-position:-216px -120px;width:16px;}
+.icon-comment{background-position:-240px -120px;}
+.icon-magnet{background-position:-264px -120px;}
+.icon-chevron-up{background-position:-288px -120px;}
+.icon-chevron-down{background-position:-313px -119px;}
+.icon-retweet{background-position:-336px -120px;}
+.icon-shopping-cart{background-position:-360px -120px;}
+.icon-folder-close{background-position:-384px -120px;}
+.icon-folder-open{background-position:-408px -120px;width:16px;}
+.icon-resize-vertical{background-position:-432px -119px;}
+.icon-resize-horizontal{background-position:-456px -118px;}
+.icon-hdd{background-position:0 -144px;}
+.icon-bullhorn{background-position:-24px -144px;}
+.icon-bell{background-position:-48px -144px;}
+.icon-certificate{background-position:-72px -144px;}
+.icon-thumbs-up{background-position:-96px -144px;}
+.icon-thumbs-down{background-position:-120px -144px;}
+.icon-hand-right{background-position:-144px -144px;}
+.icon-hand-left{background-position:-168px -144px;}
+.icon-hand-up{background-position:-192px -144px;}
+.icon-hand-down{background-position:-216px -144px;}
+.icon-circle-arrow-right{background-position:-240px -144px;}
+.icon-circle-arrow-left{background-position:-264px -144px;}
+.icon-circle-arrow-up{background-position:-288px -144px;}
+.icon-circle-arrow-down{background-position:-312px -144px;}
+.icon-globe{background-position:-336px -144px;}
+.icon-wrench{background-position:-360px -144px;}
+.icon-tasks{background-position:-384px -144px;}
+.icon-filter{background-position:-408px -144px;}
+.icon-briefcase{background-position:-432px -144px;}
+.icon-fullscreen{background-position:-456px -144px;}
+.dropup,.dropdown{position:relative;}
+.dropdown-toggle{*margin-bottom:-3px;}
+.dropdown-toggle:active,.open .dropdown-toggle{outline:0;}
+.caret{display:inline-block;width:0;height:0;vertical-align:top;border-top:4px solid #000000;border-right:4px solid transparent;border-left:4px solid transparent;content:"";}
+.dropdown .caret{margin-top:8px;margin-left:2px;}
+.dropdown-menu{position:absolute;top:100%;left:0;z-index:1000;display:none;float:left;min-width:160px;padding:5px 0;margin:2px 0 0;list-style:none;background-color:#ffffff;border:1px solid #ccc;border:1px solid rgba(0, 0, 0, 0.2);*border-right-width:2px;*border-bottom-width:2px;-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px;-webkit-box-shadow:0 5px 10px rgba(0, 0, 0, 0.2);-moz-box-shadow:0 5px 10px rgba(0, 0, 0, 0.2);box-shadow:0 5px 10px rgba(0, 0, 0, 0.2);-webkit-background-clip:padding-box;-moz-background-clip:padding;background-clip:padding-box;}.dropdown-menu.pull-right{right:0;left:auto;}
+.dropdown-menu .divider{*width:100%;height:1px;margin:9px 1px;*margin:-5px 0 5px;overflow:hidden;background-color:#e5e5e5;border-bottom:1px solid #ffffff;}
+.dropdown-menu li>a{display:block;padding:3px 20px;clear:both;font-weight:normal;line-height:20px;color:#333333;white-space:nowrap;}
+.dropdown-menu li>a:hover,.dropdown-menu li>a:focus,.dropdown-submenu:hover>a{text-decoration:none;color:#ffffff;background-color:#27a0e5;background-image:-moz-linear-gradient(top, #2fa4e7, #1a99e2);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#2fa4e7), to(#1a99e2));background-image:-webkit-linear-gradient(top, #2fa4e7, #1a99e2);background-image:-o-linear-gradient(top, #2fa4e7, #1a99e2);background-image:linear-gradient(to bottom, #2fa4e7, #1a99e2);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff2fa4e7', endColorstr='#ff1a99e2', GradientType=0);}
+.dropdown-menu .active>a,.dropdown-menu .active>a:hover{color:#ffffff;text-decoration:none;outline:0;background-color:#27a0e5;background-image:-moz-linear-gradient(top, #2fa4e7, #1a99e2);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#2fa4e7), to(#1a99e2));background-image:-webkit-linear-gradient(top, #2fa4e7, #1a99e2);background-image:-o-linear-gradient(top, #2fa4e7, #1a99e2);background-image:linear-gradient(to bottom, #2fa4e7, #1a99e2);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff2fa4e7', endColorstr='#ff1a99e2', GradientType=0);}
+.dropdown-menu .disabled>a,.dropdown-menu .disabled>a:hover{color:#999999;}
+.dropdown-menu .disabled>a:hover{text-decoration:none;background-color:transparent;background-image:none;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);cursor:default;}
+.open{*z-index:1000;}.open >.dropdown-menu{display:block;}
+.pull-right>.dropdown-menu{right:0;left:auto;}
+.dropup .caret,.navbar-fixed-bottom .dropdown .caret{border-top:0;border-bottom:4px solid #000000;content:"";}
+.dropup .dropdown-menu,.navbar-fixed-bottom .dropdown .dropdown-menu{top:auto;bottom:100%;margin-bottom:1px;}
+.dropdown-submenu{position:relative;}
+.dropdown-submenu>.dropdown-menu{top:0;left:100%;margin-top:-6px;margin-left:-1px;-webkit-border-radius:0 6px 6px 6px;-moz-border-radius:0 6px 6px 6px;border-radius:0 6px 6px 6px;}
+.dropdown-submenu:hover>.dropdown-menu{display:block;}
+.dropup .dropdown-submenu>.dropdown-menu{top:auto;bottom:0;margin-top:0;margin-bottom:-2px;-webkit-border-radius:5px 5px 5px 0;-moz-border-radius:5px 5px 5px 0;border-radius:5px 5px 5px 0;}
+.dropdown-submenu>a:after{display:block;content:" ";float:right;width:0;height:0;border-color:transparent;border-style:solid;border-width:5px 0 5px 5px;border-left-color:#cccccc;margin-top:5px;margin-right:-10px;}
+.dropdown-submenu:hover>a:after{border-left-color:#ffffff;}
+.dropdown-submenu.pull-left{float:none;}.dropdown-submenu.pull-left>.dropdown-menu{left:-100%;margin-left:10px;-webkit-border-radius:6px 0 6px 6px;-moz-border-radius:6px 0 6px 6px;border-radius:6px 0 6px 6px;}
+.dropdown .dropdown-menu .nav-header{padding-left:20px;padding-right:20px;}
+.typeahead{z-index:1051;margin-top:2px;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;}
+.well{min-height:20px;padding:19px;margin-bottom:20px;background-color:#f5f5f5;border:1px solid #e3e3e3;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;-webkit-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.05);-moz-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.05);box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.05);}.well blockquote{border-color:#ddd;border-color:rgba(0, 0, 0, 0.15);}
+.well-large{padding:24px;-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px;}
+.well-small{padding:9px;-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px;}
+.fade{opacity:0;-webkit-transition:opacity 0.15s linear;-moz-transition:opacity 0.15s linear;-o-transition:opacity 0.15s linear;transition:opacity 0.15s linear;}.fade.in{opacity:1;}
+.collapse{position:relative;height:0;overflow:hidden;-webkit-transition:height 0.35s ease;-moz-transition:height 0.35s ease;-o-transition:height 0.35s ease;transition:height 0.35s ease;}.collapse.in{height:auto;}
+.close{float:right;font-size:20px;font-weight:bold;line-height:20px;color:#000000;text-shadow:0 1px 0 #ffffff;opacity:0.2;filter:alpha(opacity=20);}.close:hover{color:#000000;text-decoration:none;cursor:pointer;opacity:0.4;filter:alpha(opacity=40);}
+button.close{padding:0;cursor:pointer;background:transparent;border:0;-webkit-appearance:none;}
+.btn{display:inline-block;*display:inline;*zoom:1;padding:4px 12px;margin-bottom:0;font-size:14px;line-height:20px;text-align:center;vertical-align:middle;cursor:pointer;color:#333333;text-shadow:0 1px 1px rgba(255, 255, 255, 0.75);background-color:#f5f5f5;background-image:-moz-linear-gradient(top, #ffffff, #e6e6e6);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#ffffff), to(#e6e6e6));background-image:-webkit-linear-gradient(top, #ffffff, #e6e6e6);background-image:-o-linear-gradient(top, #ffffff, #e6e6e6);background-image:linear-gradient(to bottom, #ffffff, #e6e6e6);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff', endColorstr='#ffe6e6e6', GradientType=0);border-color:#e6e6e6 #e6e6e6 #bfbfbf;border-color:rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);*background-color:#e6e6e6;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);border:1px solid #cccccc;*border:0;border-bottom-color:#b
 3b3b3;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;*margin-left:.3em;-webkit-box-shadow:inset 0 1px 0 rgba(255,255,255,.2), 0 1px 2px rgba(0,0,0,.05);-moz-box-shadow:inset 0 1px 0 rgba(255,255,255,.2), 0 1px 2px rgba(0,0,0,.05);box-shadow:inset 0 1px 0 rgba(255,255,255,.2), 0 1px 2px rgba(0,0,0,.05);}.btn:hover,.btn:active,.btn.active,.btn.disabled,.btn[disabled]{color:#333333;background-color:#e6e6e6;*background-color:#d9d9d9;}
+.btn:active,.btn.active{background-color:#cccccc \9;}
+.btn:first-child{*margin-left:0;}
+.btn:hover{color:#333333;text-decoration:none;background-position:0 -15px;-webkit-transition:background-position 0.1s linear;-moz-transition:background-position 0.1s linear;-o-transition:background-position 0.1s linear;transition:background-position 0.1s linear;}
+.btn:focus{outline:thin dotted #333;outline:5px auto -webkit-focus-ring-color;outline-offset:-2px;}
+.btn.active,.btn:active{background-image:none;outline:0;-webkit-box-shadow:inset 0 2px 4px rgba(0,0,0,.15), 0 1px 2px rgba(0,0,0,.05);-moz-box-shadow:inset 0 2px 4px rgba(0,0,0,.15), 0 1px 2px rgba(0,0,0,.05);box-shadow:inset 0 2px 4px rgba(0,0,0,.15), 0 1px 2px rgba(0,0,0,.05);}
+.btn.disabled,.btn[disabled]{cursor:default;background-image:none;opacity:0.65;filter:alpha(opacity=65);-webkit-box-shadow:none;-moz-box-shadow:none;box-shadow:none;}
+.btn-large{padding:11px 19px;font-size:17.5px;-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px;}
+.btn-large [class^="icon-"],.btn-large [class*=" icon-"]{margin-top:4px;}
+.btn-small{padding:2px 10px;font-size:11.9px;-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px;}
+.btn-small [class^="icon-"],.btn-small [class*=" icon-"]{margin-top:0;}
+.btn-mini [class^="icon-"],.btn-mini [class*=" icon-"]{margin-top:-1px;}
+.btn-mini{padding:0px 6px;font-size:10.5px;-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px;}
+.btn-block{display:block;width:100%;padding-left:0;padding-right:0;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;}
+.btn-block+.btn-block{margin-top:5px;}
+input[type="submit"].btn-block,input[type="reset"].btn-block,input[type="button"].btn-block{width:100%;}
+.btn-primary.active,.btn-warning.active,.btn-danger.active,.btn-success.active,.btn-info.active,.btn-inverse.active{color:rgba(255, 255, 255, 0.75);}
+.btn{border-color:#c5c5c5;border-color:rgba(0, 0, 0, 0.15) rgba(0, 0, 0, 0.15) rgba(0, 0, 0, 0.25);}
+.btn-primary{color:#ffffff;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);background-color:#2f92e7;background-image:-moz-linear-gradient(top, #2fa4e7, #2f76e7);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#2fa4e7), to(#2f76e7));background-image:-webkit-linear-gradient(top, #2fa4e7, #2f76e7);background-image:-o-linear-gradient(top, #2fa4e7, #2f76e7);background-image:linear-gradient(to bottom, #2fa4e7, #2f76e7);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff2fa4e7', endColorstr='#ff2f76e7', GradientType=0);border-color:#2f76e7 #2f76e7 #1553b5;border-color:rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);*background-color:#2f76e7;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);}.btn-primary:hover,.btn-primary:active,.btn-primary.active,.btn-primary.disabled,.btn-primary[disabled]{color:#ffffff;background-color:#2f76e7;*background-color:#1a67e2;}
+.btn-primary:active,.btn-primary.active{background-color:#175dcc \9;}
+.btn-warning{color:#ffffff;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);background-color:#dd5600;background-image:-moz-linear-gradient(top, #dd5600, #dd5600);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#dd5600), to(#dd5600));background-image:-webkit-linear-gradient(top, #dd5600, #dd5600);background-image:-o-linear-gradient(top, #dd5600, #dd5600);background-image:linear-gradient(to bottom, #dd5600, #dd5600);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffdd5600', endColorstr='#ffdd5600', GradientType=0);border-color:#dd5600 #dd5600 #913800;border-color:rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);*background-color:#dd5600;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);}.btn-warning:hover,.btn-warning:active,.btn-warning.active,.btn-warning.disabled,.btn-warning[disabled]{color:#ffffff;background-color:#dd5600;*background-color:#c44c00;}
+.btn-warning:active,.btn-warning.active{background-color:#aa4200 \9;}
+.btn-danger{color:#ffffff;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);background-color:#c32627;background-image:-moz-linear-gradient(top, #c71c22, #bd362f);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#c71c22), to(#bd362f));background-image:-webkit-linear-gradient(top, #c71c22, #bd362f);background-image:-o-linear-gradient(top, #c71c22, #bd362f);background-image:linear-gradient(to bottom, #c71c22, #bd362f);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffc71c22', endColorstr='#ffbd362f', GradientType=0);border-color:#bd362f #bd362f #802420;border-color:rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);*background-color:#bd362f;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);}.btn-danger:hover,.btn-danger:active,.btn-danger.active,.btn-danger.disabled,.btn-danger[disabled]{color:#ffffff;background-color:#bd362f;*background-color:#a9302a;}
+.btn-danger:active,.btn-danger.active{background-color:#942a25 \9;}
+.btn-success{color:#ffffff;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);background-color:#65a643;background-image:-moz-linear-gradient(top, #73a839, #51a351);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#73a839), to(#51a351));background-image:-webkit-linear-gradient(top, #73a839, #51a351);background-image:-o-linear-gradient(top, #73a839, #51a351);background-image:linear-gradient(to bottom, #73a839, #51a351);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff73a839', endColorstr='#ff51a351', GradientType=0);border-color:#51a351 #51a351 #387038;border-color:rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);*background-color:#51a351;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);}.btn-success:hover,.btn-success:active,.btn-success.active,.btn-success.disabled,.btn-success[disabled]{color:#ffffff;background-color:#51a351;*background-color:#499249;}
+.btn-success:active,.btn-success.active{background-color:#408140 \9;}
+.btn-info{color:#ffffff;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);background-color:#6d76b3;background-image:-moz-linear-gradient(top, #9760b3, #2f96b4);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#9760b3), to(#2f96b4));background-image:-webkit-linear-gradient(top, #9760b3, #2f96b4);background-image:-o-linear-gradient(top, #9760b3, #2f96b4);background-image:linear-gradient(to bottom, #9760b3, #2f96b4);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff9760b3', endColorstr='#ff2f96b4', GradientType=0);border-color:#2f96b4 #2f96b4 #1f6377;border-color:rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);*background-color:#2f96b4;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);}.btn-info:hover,.btn-info:active,.btn-info.active,.btn-info.disabled,.btn-info[disabled]{color:#ffffff;background-color:#2f96b4;*background-color:#2a85a0;}
+.btn-info:active,.btn-info.active{background-color:#24748c \9;}
+.btn-inverse{color:#ffffff;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);background-color:#0f3253;background-image:-moz-linear-gradient(top, #033c73, #222222);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#033c73), to(#222222));background-image:-webkit-linear-gradient(top, #033c73, #222222);background-image:-o-linear-gradient(top, #033c73, #222222);background-image:linear-gradient(to bottom, #033c73, #222222);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff033c73', endColorstr='#ff222222', GradientType=0);border-color:#222222 #222222 #000000;border-color:rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);*background-color:#222222;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);}.btn-inverse:hover,.btn-inverse:active,.btn-inverse.active,.btn-inverse.disabled,.btn-inverse[disabled]{color:#ffffff;background-color:#222222;*background-color:#151515;}
+.btn-inverse:active,.btn-inverse.active{background-color:#080808 \9;}
+button.btn,input[type="submit"].btn{*padding-top:3px;*padding-bottom:3px;}button.btn::-moz-focus-inner,input[type="submit"].btn::-moz-focus-inner{padding:0;border:0;}
+button.btn.btn-large,input[type="submit"].btn.btn-large{*padding-top:7px;*padding-bottom:7px;}
+button.btn.btn-small,input[type="submit"].btn.btn-small{*padding-top:3px;*padding-bottom:3px;}
+button.btn.btn-mini,input[type="submit"].btn.btn-mini{*padding-top:1px;*padding-bottom:1px;}
+.btn-link,.btn-link:active,.btn-link[disabled]{background-color:transparent;background-image:none;-webkit-box-shadow:none;-moz-box-shadow:none;box-shadow:none;}
+.btn-link{border-color:transparent;cursor:pointer;color:#2fa4e7;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0;}
+.btn-link:hover{color:#157ab5;text-decoration:underline;background-color:transparent;}
+.btn-link[disabled]:hover{color:#333333;text-decoration:none;}
+.btn-group{position:relative;display:inline-block;*display:inline;*zoom:1;font-size:0;vertical-align:middle;white-space:nowrap;*margin-left:.3em;}.btn-group:first-child{*margin-left:0;}
+.btn-group+.btn-group{margin-left:5px;}
+.btn-toolbar{font-size:0;margin-top:10px;margin-bottom:10px;}.btn-toolbar>.btn+.btn,.btn-toolbar>.btn-group+.btn,.btn-toolbar>.btn+.btn-group{margin-left:5px;}
+.btn-group>.btn{position:relative;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0;}
+.btn-group>.btn+.btn{margin-left:-1px;}
+.btn-group>.btn,.btn-group>.dropdown-menu,.btn-group>.popover{font-size:14px;}
+.btn-group>.btn-mini{font-size:10.5px;}
+.btn-group>.btn-small{font-size:11.9px;}
+.btn-group>.btn-large{font-size:17.5px;}
+.btn-group>.btn:first-child{margin-left:0;-webkit-border-top-left-radius:4px;-moz-border-radius-topleft:4px;border-top-left-radius:4px;-webkit-border-bottom-left-radius:4px;-moz-border-radius-bottomleft:4px;border-bottom-left-radius:4px;}
+.btn-group>.btn:last-child,.btn-group>.dropdown-toggle{-webkit-border-top-right-radius:4px;-moz-border-radius-topright:4px;border-top-right-radius:4px;-webkit-border-bottom-right-radius:4px;-moz-border-radius-bottomright:4px;border-bottom-right-radius:4px;}
+.btn-group>.btn.large:first-child{margin-left:0;-webkit-border-top-left-radius:6px;-moz-border-radius-topleft:6px;border-top-left-radius:6px;-webkit-border-bottom-left-radius:6px;-moz-border-radius-bottomleft:6px;border-bottom-left-radius:6px;}
+.btn-group>.btn.large:last-child,.btn-group>.large.dropdown-toggle{-webkit-border-top-right-radius:6px;-moz-border-radius-topright:6px;border-top-right-radius:6px;-webkit-border-bottom-right-radius:6px;-moz-border-radius-bottomright:6px;border-bottom-right-radius:6px;}
+.btn-group>.btn:hover,.btn-group>.btn:focus,.btn-group>.btn:active,.btn-group>.btn.active{z-index:2;}
+.btn-group .dropdown-toggle:active,.btn-group.open .dropdown-toggle{outline:0;}
+.btn-group>.btn+.dropdown-toggle{padding-left:8px;padding-right:8px;-webkit-box-shadow:inset 1px 0 0 rgba(255,255,255,.125), inset 0 1px 0 rgba(255,255,255,.2), 0 1px 2px rgba(0,0,0,.05);-moz-box-shadow:inset 1px 0 0 rgba(255,255,255,.125), inset 0 1px 0 rgba(255,255,255,.2), 0 1px 2px rgba(0,0,0,.05);box-shadow:inset 1px 0 0 rgba(255,255,255,.125), inset 0 1px 0 rgba(255,255,255,.2), 0 1px 2px rgba(0,0,0,.05);*padding-top:5px;*padding-bottom:5px;}
+.btn-group>.btn-mini+.dropdown-toggle{padding-left:5px;padding-right:5px;*padding-top:2px;*padding-bottom:2px;}
+.btn-group>.btn-small+.dropdown-toggle{*padding-top:5px;*padding-bottom:4px;}
+.btn-group>.btn-large+.dropdown-toggle{padding-left:12px;padding-right:12px;*padding-top:7px;*padding-bottom:7px;}
+.btn-group.open .dropdown-toggle{background-image:none;-webkit-box-shadow:inset 0 2px 4px rgba(0,0,0,.15), 0 1px 2px rgba(0,0,0,.05);-moz-box-shadow:inset 0 2px 4px rgba(0,0,0,.15), 0 1px 2px rgba(0,0,0,.05);box-shadow:inset 0 2px 4px rgba(0,0,0,.15), 0 1px 2px rgba(0,0,0,.05);}
+.btn-group.open .btn.dropdown-toggle{background-color:#e6e6e6;}
+.btn-group.open .btn-primary.dropdown-toggle{background-color:#2f76e7;}
+.btn-group.open .btn-warning.dropdown-toggle{background-color:#dd5600;}
+.btn-group.open .btn-danger.dropdown-toggle{background-color:#bd362f;}
+.btn-group.open .btn-success.dropdown-toggle{background-color:#51a351;}
+.btn-group.open .btn-info.dropdown-toggle{background-color:#2f96b4;}
+.btn-group.open .btn-inverse.dropdown-toggle{background-color:#222222;}
+.btn .caret{margin-top:8px;margin-left:0;}
+.btn-mini .caret,.btn-small .caret,.btn-large .caret{margin-top:6px;}
+.btn-large .caret{border-left-width:5px;border-right-width:5px;border-top-width:5px;}
+.dropup .btn-large .caret{border-bottom-width:5px;}
+.btn-primary .caret,.btn-warning .caret,.btn-danger .caret,.btn-info .caret,.btn-success .caret,.btn-inverse .caret{border-top-color:#ffffff;border-bottom-color:#ffffff;}
+.btn-group-vertical{display:inline-block;*display:inline;*zoom:1;}
+.btn-group-vertical>.btn{display:block;float:none;max-width:100%;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0;}
+.btn-group-vertical>.btn+.btn{margin-left:0;margin-top:-1px;}
+.btn-group-vertical>.btn:first-child{-webkit-border-radius:4px 4px 0 0;-moz-border-radius:4px 4px 0 0;border-radius:4px 4px 0 0;}
+.btn-group-vertical>.btn:last-child{-webkit-border-radius:0 0 4px 4px;-moz-border-radius:0 0 4px 4px;border-radius:0 0 4px 4px;}
+.btn-group-vertical>.btn-large:first-child{-webkit-border-radius:6px 6px 0 0;-moz-border-radius:6px 6px 0 0;border-radius:6px 6px 0 0;}
+.btn-group-vertical>.btn-large:last-child{-webkit-border-radius:0 0 6px 6px;-moz-border-radius:0 0 6px 6px;border-radius:0 0 6px 6px;}
+.alert{padding:8px 35px 8px 14px;margin-bottom:20px;text-shadow:0 1px 0 rgba(255, 255, 255, 0.5);background-color:#f1ceab;border:1px solid #efb99e;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;}
+.alert,.alert h4{color:#dd5600;}
+.alert h4{margin:0;}
+.alert .close{position:relative;top:-2px;right:-21px;line-height:20px;}
+.alert-success{background-color:#d5ecbf;border-color:#d2e6ab;color:#669533;}
+.alert-success h4{color:#669533;}
+.alert-danger,.alert-error{background-color:#f2bdb1;border-color:#f0a5a4;color:#bd4247;}
+.alert-danger h4,.alert-error h4{color:#bd4247;}
+.alert-info{background-color:#a7dff1;border-color:#88e4ec;color:#817b58;}
+.alert-info h4{color:#817b58;}
+.alert-block{padding-top:14px;padding-bottom:14px;}
+.alert-block>p,.alert-block>ul{margin-bottom:0;}
+.alert-block p+p{margin-top:5px;}
+.nav{margin-left:0;margin-bottom:20px;list-style:none;}
+.nav>li>a{display:block;}
+.nav>li>a:hover{text-decoration:none;background-color:#f5f5f5;}
+.nav>li>a>img{max-width:none;}
+.nav>.pull-right{float:right;}
+.nav-header{display:block;padding:3px 15px;font-size:11px;font-weight:bold;line-height:20px;color:#999999;text-shadow:0 1px 0 rgba(255, 255, 255, 0.5);text-transform:uppercase;}
+.nav li+.nav-header{margin-top:9px;}
+.nav-list{padding-left:15px;padding-right:15px;margin-bottom:0;}
+.nav-list>li>a,.nav-list .nav-header{margin-left:-15px;margin-right:-15px;text-shadow:0 1px 0 rgba(255, 255, 255, 0.5);}
+.nav-list>li>a{padding:3px 15px;}
+.nav-list>.active>a,.nav-list>.active>a:hover{color:#ffffff;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.2);background-color:#2fa4e7;}
+.nav-list [class^="icon-"],.nav-list [class*=" icon-"]{margin-right:2px;}
+.nav-list .divider{*width:100%;height:1px;margin:9px 1px;*margin:-5px 0 5px;overflow:hidden;background-color:#e5e5e5;border-bottom:1px solid #ffffff;}
+.nav-tabs,.nav-pills{*zoom:1;}.nav-tabs:before,.nav-pills:before,.nav-tabs:after,.nav-pills:after{display:table;content:"";line-height:0;}
+.nav-tabs:after,.nav-pills:after{clear:both;}
+.nav-tabs>li,.nav-pills>li{float:left;}
+.nav-tabs>li>a,.nav-pills>li>a{padding-right:12px;padding-left:12px;margin-right:2px;line-height:14px;}
+.nav-tabs{border-bottom:1px solid #ddd;}
+.nav-tabs>li{margin-bottom:-1px;}
+.nav-tabs>li>a{padding-top:8px;padding-bottom:8px;line-height:20px;border:1px solid transparent;-webkit-border-radius:4px 4px 0 0;-moz-border-radius:4px 4px 0 0;border-radius:4px 4px 0 0;}.nav-tabs>li>a:hover{border-color:#f5f5f5 #f5f5f5 #dddddd;}
+.nav-tabs>.active>a,.nav-tabs>.active>a:hover{color:#555555;background-color:#ffffff;border:1px solid #ddd;border-bottom-color:transparent;cursor:default;}
+.nav-pills>li>a{padding-top:8px;padding-bottom:8px;margin-top:2px;margin-bottom:2px;-webkit-border-radius:5px;-moz-border-radius:5px;border-radius:5px;}
+.nav-pills>.active>a,.nav-pills>.active>a:hover{color:#ffffff;background-color:#2fa4e7;}
+.nav-stacked>li{float:none;}
+.nav-stacked>li>a{margin-right:0;}
+.nav-tabs.nav-stacked{border-bottom:0;}
+.nav-tabs.nav-stacked>li>a{border:1px solid #ddd;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0;}
+.nav-tabs.nav-stacked>li:first-child>a{-webkit-border-top-right-radius:4px;-moz-border-radius-topright:4px;border-top-right-radius:4px;-webkit-border-top-left-radius:4px;-moz-border-radius-topleft:4px;border-top-left-radius:4px;}
+.nav-tabs.nav-stacked>li:last-child>a{-webkit-border-bottom-right-radius:4px;-moz-border-radius-bottomright:4px;border-bottom-right-radius:4px;-webkit-border-bottom-left-radius:4px;-moz-border-radius-bottomleft:4px;border-bottom-left-radius:4px;}
+.nav-tabs.nav-stacked>li>a:hover{border-color:#ddd;z-index:2;}
+.nav-pills.nav-stacked>li>a{margin-bottom:3px;}
+.nav-pills.nav-stacked>li:last-child>a{margin-bottom:1px;}
+.nav-tabs .dropdown-menu{-webkit-border-radius:0 0 6px 6px;-moz-border-radius:0 0 6px 6px;border-radius:0 0 6px 6px;}
+.nav-pills .dropdown-menu{-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px;}
+.nav .dropdown-toggle .caret{border-top-color:#2fa4e7;border-bottom-color:#2fa4e7;margin-top:6px;}
+.nav .dropdown-toggle:hover .caret{border-top-color:#157ab5;border-bottom-color:#157ab5;}
+.nav-tabs .dropdown-toggle .caret{margin-top:8px;}
+.nav .active .dropdown-toggle .caret{border-top-color:#fff;border-bottom-color:#fff;}
+.nav-tabs .active .dropdown-toggle .caret{border-top-color:#555555;border-bottom-color:#555555;}
+.nav>.dropdown.active>a:hover{cursor:pointer;}
+.nav-tabs .open .dropdown-toggle,.nav-pills .open .dropdown-toggle,.nav>li.dropdown.open.active>a:hover{color:#ffffff;background-color:#999999;border-color:#999999;}
+.nav li.dropdown.open .caret,.nav li.dropdown.open.active .caret,.nav li.dropdown.open a:hover .caret{border-top-color:#ffffff;border-bottom-color:#ffffff;opacity:1;filter:alpha(opacity=100);}
+.tabs-stacked .open>a:hover{border-color:#999999;}
+.tabbable{*zoom:1;}.tabbable:before,.tabbable:after{display:table;content:"";line-height:0;}
+.tabbable:after{clear:both;}
+.tab-content{overflow:auto;}
+.tabs-below>.nav-tabs,.tabs-right>.nav-tabs,.tabs-left>.nav-tabs{border-bottom:0;}
+.tab-content>.tab-pane,.pill-content>.pill-pane{display:none;}
+.tab-content>.active,.pill-content>.active{display:block;}
+.tabs-below>.nav-tabs{border-top:1px solid #ddd;}
+.tabs-below>.nav-tabs>li{margin-top:-1px;margin-bottom:0;}
+.tabs-below>.nav-tabs>li>a{-webkit-border-radius:0 0 4px 4px;-moz-border-radius:0 0 4px 4px;border-radius:0 0 4px 4px;}.tabs-below>.nav-tabs>li>a:hover{border-bottom-color:transparent;border-top-color:#ddd;}
+.tabs-below>.nav-tabs>.active>a,.tabs-below>.nav-tabs>.active>a:hover{border-color:transparent #ddd #ddd #ddd;}
+.tabs-left>.nav-tabs>li,.tabs-right>.nav-tabs>li{float:none;}
+.tabs-left>.nav-tabs>li>a,.tabs-right>.nav-tabs>li>a{min-width:74px;margin-right:0;margin-bottom:3px;}
+.tabs-left>.nav-tabs{float:left;margin-right:19px;border-right:1px solid #ddd;}
+.tabs-left>.nav-tabs>li>a{margin-right:-1px;-webkit-border-radius:4px 0 0 4px;-moz-border-radius:4px 0 0 4px;border-radius:4px 0 0 4px;}
+.tabs-left>.nav-tabs>li>a:hover{border-color:#f5f5f5 #dddddd #f5f5f5 #f5f5f5;}
+.tabs-left>.nav-tabs .active>a,.tabs-left>.nav-tabs .active>a:hover{border-color:#ddd transparent #ddd #ddd;*border-right-color:#ffffff;}
+.tabs-right>.nav-tabs{float:right;margin-left:19px;border-left:1px solid #ddd;}
+.tabs-right>.nav-tabs>li>a{margin-left:-1px;-webkit-border-radius:0 4px 4px 0;-moz-border-radius:0 4px 4px 0;border-radius:0 4px 4px 0;}
+.tabs-right>.nav-tabs>li>a:hover{border-color:#f5f5f5 #f5f5f5 #f5f5f5 #dddddd;}
+.tabs-right>.nav-tabs .active>a,.tabs-right>.nav-tabs .active>a:hover{border-color:#ddd #ddd #ddd transparent;*border-left-color:#ffffff;}
+.nav>.disabled>a{color:#999999;}
+.nav>.disabled>a:hover{text-decoration:none;background-color:transparent;cursor:default;}
+.navbar{overflow:visible;margin-bottom:20px;*position:relative;*z-index:2;}
+.navbar-inner{min-height:50px;padding-left:20px;padding-right:20px;background-color:#45aeea;background-image:-moz-linear-gradient(top, #54b4eb, #2fa4e7);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#54b4eb), to(#2fa4e7));background-image:-webkit-linear-gradient(top, #54b4eb, #2fa4e7);background-image:-o-linear-gradient(top, #54b4eb, #2fa4e7);background-image:linear-gradient(to bottom, #54b4eb, #2fa4e7);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff54b4eb', endColorstr='#ff2fa4e7', GradientType=0);border:1px solid #1990d5;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;-webkit-box-shadow:0 1px 4px rgba(0, 0, 0, 0.065);-moz-box-shadow:0 1px 4px rgba(0, 0, 0, 0.065);box-shadow:0 1px 4px rgba(0, 0, 0, 0.065);*zoom:1;}.navbar-inner:before,.navbar-inner:after{display:table;content:"";line-height:0;}
+.navbar-inner:after{clear:both;}
+.navbar .container{width:auto;}
+.nav-collapse.collapse{height:auto;overflow:visible;}
+.navbar .brand{float:left;display:block;padding:15px 20px 15px;margin-left:-20px;font-size:20px;font-weight:200;color:#ffffff;text-shadow:0 1px 0 #54b4eb;}.navbar .brand:hover{text-decoration:none;}
+.navbar-text{margin-bottom:0;line-height:50px;color:#f5f5f5;}
+.navbar-link{color:#ffffff;}.navbar-link:hover{color:#ffffff;}
+.navbar .divider-vertical{height:50px;margin:0 9px;border-left:1px solid #2fa4e7;border-right:1px solid #54b4eb;}
+.navbar .btn,.navbar .btn-group{margin-top:10px;}
+.navbar .btn-group .btn,.navbar .input-prepend .btn,.navbar .input-append .btn{margin-top:0;}
+.navbar-form{margin-bottom:0;*zoom:1;}.navbar-form:before,.navbar-form:after{display:table;content:"";line-height:0;}
+.navbar-form:after{clear:both;}
+.navbar-form input,.navbar-form select,.navbar-form .radio,.navbar-form .checkbox{margin-top:10px;}
+.navbar-form input,.navbar-form select,.navbar-form .btn{display:inline-block;margin-bottom:0;}
+.navbar-form input[type="image"],.navbar-form input[type="checkbox"],.navbar-form input[type="radio"]{margin-top:3px;}
+.navbar-form .input-append,.navbar-form .input-prepend{margin-top:5px;white-space:nowrap;}.navbar-form .input-append input,.navbar-form .input-prepend input{margin-top:0;}
+.navbar-search{position:relative;float:left;margin-top:10px;margin-bottom:0;}.navbar-search .search-query{margin-bottom:0;padding:4px 14px;font-family:"Helvetica Neue",Helvetica,Arial,sans-serif;font-size:13px;font-weight:normal;line-height:1;-webkit-border-radius:15px;-moz-border-radius:15px;border-radius:15px;}
+.navbar-static-top{position:static;margin-bottom:0;}.navbar-static-top .navbar-inner{-webkit-border-radius:0;-moz-border-radius:0;border-radius:0;}
+.navbar-fixed-top,.navbar-fixed-bottom{position:fixed;right:0;left:0;z-index:1030;margin-bottom:0;}
+.navbar-fixed-top .navbar-inner,.navbar-static-top .navbar-inner{border-width:0 0 1px;}
+.navbar-fixed-bottom .navbar-inner{border-width:1px 0 0;}
+.navbar-fixed-top .navbar-inner,.navbar-fixed-bottom .navbar-inner{padding-left:0;padding-right:0;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0;}
+.navbar-static-top .container,.navbar-fixed-top .container,.navbar-fixed-bottom .container{width:940px;}
+.navbar-fixed-top{top:0;}
+.navbar-fixed-top .navbar-inner,.navbar-static-top .navbar-inner{-webkit-box-shadow:0 1px 10px rgba(0,0,0,.1);-moz-box-shadow:0 1px 10px rgba(0,0,0,.1);box-shadow:0 1px 10px rgba(0,0,0,.1);}
+.navbar-fixed-bottom{bottom:0;}.navbar-fixed-bottom .navbar-inner{-webkit-box-shadow:0 -1px 10px rgba(0,0,0,.1);-moz-box-shadow:0 -1px 10px rgba(0,0,0,.1);box-shadow:0 -1px 10px rgba(0,0,0,.1);}
+.navbar .nav{position:relative;left:0;display:block;float:left;margin:0 10px 0 0;}
+.navbar .nav.pull-right{float:right;margin-right:0;}
+.navbar .nav>li{float:left;}
+.navbar .nav>li>a{float:none;padding:15px 15px 15px;color:#ffffff;text-decoration:none;text-shadow:0 1px 0 #54b4eb;}
+.navbar .nav .dropdown-toggle .caret{margin-top:8px;}
+.navbar .nav>li>a:focus,.navbar .nav>li>a:hover{background-color:#1684c2;color:#ffffff;text-decoration:none;}
+.navbar .nav>.active>a,.navbar .nav>.active>a:hover,.navbar .nav>.active>a:focus{color:#ffffff;text-decoration:none;background-color:#1684c2;-webkit-box-shadow:inset 0 3px 8px rgba(0, 0, 0, 0.125);-moz-box-shadow:inset 0 3px 8px rgba(0, 0, 0, 0.125);box-shadow:inset 0 3px 8px rgba(0, 0, 0, 0.125);}
+.navbar .btn-navbar{display:none;float:right;padding:7px 10px;margin-left:5px;margin-right:5px;color:#ffffff;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);background-color:#2fa3e6;background-image:-moz-linear-gradient(top, #3daae9, #1a99e2);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#3daae9), to(#1a99e2));background-image:-webkit-linear-gradient(top, #3daae9, #1a99e2);background-image:-o-linear-gradient(top, #3daae9, #1a99e2);background-image:linear-gradient(to bottom, #3daae9, #1a99e2);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff3daae9', endColorstr='#ff1a99e2', GradientType=0);border-color:#1a99e2 #1a99e2 #126b9e;border-color:rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);*background-color:#1a99e2;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);-webkit-box-shadow:inset 0 1px 0 rgba(255,255,255,.1), 0 1px 0 rgba(255,255,255,.075);-moz-box-shadow:inset 0 1px 0 rgba(255,255,255,.1), 0
  1px 0 rgba(255,255,255,.075);box-shadow:inset 0 1px 0 rgba(255,255,255,.1), 0 1px 0 rgba(255,255,255,.075);}.navbar .btn-navbar:hover,.navbar .btn-navbar:active,.navbar .btn-navbar.active,.navbar .btn-navbar.disabled,.navbar .btn-navbar[disabled]{color:#ffffff;background-color:#1a99e2;*background-color:#178acc;}
+.navbar .btn-navbar:active,.navbar .btn-navbar.active{background-color:#157ab5 \9;}
+.navbar .btn-navbar .icon-bar{display:block;width:18px;height:2px;background-color:#f5f5f5;-webkit-border-radius:1px;-moz-border-radius:1px;border-radius:1px;-webkit-box-shadow:0 1px 0 rgba(0, 0, 0, 0.25);-moz-box-shadow:0 1px 0 rgba(0, 0, 0, 0.25);box-shadow:0 1px 0 rgba(0, 0, 0, 0.25);}
+.btn-navbar .icon-bar+.icon-bar{margin-top:3px;}
+.navbar .nav>li>.dropdown-menu:before{content:'';display:inline-block;border-left:7px solid transparent;border-right:7px solid transparent;border-bottom:7px solid #ccc;border-bottom-color:rgba(0, 0, 0, 0.2);position:absolute;top:-7px;left:9px;}
+.navbar .nav>li>.dropdown-menu:after{content:'';display:inline-block;border-left:6px solid transparent;border-right:6px solid transparent;border-bottom:6px solid #ffffff;position:absolute;top:-6px;left:10px;}
+.navbar-fixed-bottom .nav>li>.dropdown-menu:before{border-top:7px solid #ccc;border-top-color:rgba(0, 0, 0, 0.2);border-bottom:0;bottom:-7px;top:auto;}
+.navbar-fixed-bottom .nav>li>.dropdown-menu:after{border-top:6px solid #ffffff;border-bottom:0;bottom:-6px;top:auto;}
+.navbar .nav li.dropdown>a:hover .caret{border-top-color:#ffffff;border-bottom-color:#ffffff;}
+.navbar .nav li.dropdown.open>.dropdown-toggle,.navbar .nav li.dropdown.active>.dropdown-toggle,.navbar .nav li.dropdown.open.active>.dropdown-toggle{background-color:#1684c2;color:#ffffff;}
+.navbar .nav li.dropdown>.dropdown-toggle .caret{border-top-color:#ffffff;border-bottom-color:#ffffff;}
+.navbar .nav li.dropdown.open>.dropdown-toggle .caret,.navbar .nav li.dropdown.active>.dropdown-toggle .caret,.navbar .nav li.dropdown.open.active>.dropdown-toggle .caret{border-top-color:#ffffff;border-bottom-color:#ffffff;}
+.navbar .pull-right>li>.dropdown-menu,.navbar .nav>li>.dropdown-menu.pull-right{left:auto;right:0;}.navbar .pull-right>li>.dropdown-menu:before,.navbar .nav>li>.dropdown-menu.pull-right:before{left:auto;right:12px;}
+.navbar .pull-right>li>.dropdown-menu:after,.navbar .nav>li>.dropdown-menu.pull-right:after{left:auto;right:13px;}
+.navbar .pull-right>li>.dropdown-menu .dropdown-menu,.navbar .nav>li>.dropdown-menu.pull-right .dropdown-menu{left:auto;right:100%;margin-left:0;margin-right:-1px;-webkit-border-radius:6px 0 6px 6px;-moz-border-radius:6px 0 6px 6px;border-radius:6px 0 6px 6px;}
+.navbar-inverse .navbar-inner{background-color:#034482;background-image:-moz-linear-gradient(top, #04498c, #033c73);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#04498c), to(#033c73));background-image:-webkit-linear-gradient(top, #04498c, #033c73);background-image:-o-linear-gradient(top, #04498c, #033c73);background-image:linear-gradient(to bottom, #04498c, #033c73);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff04498c', endColorstr='#ff033c73', GradientType=0);border-color:#033464;}
+.navbar-inverse .brand,.navbar-inverse .nav>li>a{color:#ffffff;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);}.navbar-inverse .brand:hover,.navbar-inverse .nav>li>a:hover{color:#ffffff;}
+.navbar-inverse .brand{color:#ffffff;}
+.navbar-inverse .navbar-text{color:#ffffff;}
+.navbar-inverse .nav>li>a:focus,.navbar-inverse .nav>li>a:hover{background-color:#022c55;color:#ffffff;}
+.navbar-inverse .nav .active>a,.navbar-inverse .nav .active>a:hover,.navbar-inverse .nav .active>a:focus{color:#ffffff;background-color:#022c55;}
+.navbar-inverse .navbar-link{color:#ffffff;}.navbar-inverse .navbar-link:hover{color:#ffffff;}
+.navbar-inverse .divider-vertical{border-left-color:#033c73;border-right-color:#04498c;}
+.navbar-inverse .nav li.dropdown.open>.dropdown-toggle,.navbar-inverse .nav li.dropdown.active>.dropdown-toggle,.navbar-inverse .nav li.dropdown.open.active>.dropdown-toggle{background-color:#022c55;color:#ffffff;}
+.navbar-inverse .nav li.dropdown>a:hover .caret{border-top-color:#ffffff;border-bottom-color:#ffffff;}
+.navbar-inverse .nav li.dropdown>.dropdown-toggle .caret{border-top-color:#ffffff;border-bottom-color:#ffffff;}
+.navbar-inverse .nav li.dropdown.open>.dropdown-toggle .caret,.navbar-inverse .nav li.dropdown.active>.dropdown-toggle .caret,.navbar-inverse .nav li.dropdown.open.active>.dropdown-toggle .caret{border-top-color:#ffffff;border-bottom-color:#ffffff;}
+.navbar-inverse .navbar-search .search-query{color:#ffffff;background-color:#ffffff;border-color:#033c73;-webkit-box-shadow:inset 0 1px 2px rgba(0,0,0,.1), 0 1px 0 rgba(255,255,255,.15);-moz-box-shadow:inset 0 1px 2px rgba(0,0,0,.1), 0 1px 0 rgba(255,255,255,.15);box-shadow:inset 0 1px 2px rgba(0,0,0,.1), 0 1px 0 rgba(255,255,255,.15);-webkit-transition:none;-moz-transition:none;-o-transition:none;transition:none;}.navbar-inverse .navbar-search .search-query:-moz-placeholder{color:#999999;}
+.navbar-inverse .navbar-search .search-query:-ms-input-placeholder{color:#999999;}
+.navbar-inverse .navbar-search .search-query::-webkit-input-placeholder{color:#999999;}
+.navbar-inverse .navbar-search .search-query:focus,.navbar-inverse .navbar-search .search-query.focused{padding:5px 15px;color:#333333;text-shadow:0 1px 0 #ffffff;background-color:#ffffff;border:0;-webkit-box-shadow:0 0 3px rgba(0, 0, 0, 0.15);-moz-box-shadow:0 0 3px rgba(0, 0, 0, 0.15);box-shadow:0 0 3px rgba(0, 0, 0, 0.15);outline:0;}
+.navbar-inverse .btn-navbar{color:#ffffff;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);background-color:#033769;background-image:-moz-linear-gradient(top, #033c73, #022f5a);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#033c73), to(#022f5a));background-image:-webkit-linear-gradient(top, #033c73, #022f5a);background-image:-o-linear-gradient(top, #033c73, #022f5a);background-image:linear-gradient(to bottom, #033c73, #022f5a);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff033c73', endColorstr='#ff022f5a', GradientType=0);border-color:#022f5a #022f5a #000810;border-color:rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);*background-color:#022f5a;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);}.navbar-inverse .btn-navbar:hover,.navbar-inverse .btn-navbar:active,.navbar-inverse .btn-navbar.active,.navbar-inverse .btn-navbar.disabled,.navbar-inverse .btn-navbar[disabled]{color:#ffffff;background-c
 olor:#022f5a;*background-color:#022241;}
+.navbar-inverse .btn-navbar:active,.navbar-inverse .btn-navbar.active{background-color:#011528 \9;}
+.breadcrumb{padding:8px 15px;margin:0 0 20px;list-style:none;background-color:#f5f5f5;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;}.breadcrumb>li{display:inline-block;*display:inline;*zoom:1;text-shadow:0 1px 0 #ffffff;}.breadcrumb>li>.divider{padding:0 5px;color:#ccc;}
+.breadcrumb>.active{color:#999999;}
+.pagination{margin:20px 0;}
+.pagination ul{display:inline-block;*display:inline;*zoom:1;margin-left:0;margin-bottom:0;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;-webkit-box-shadow:0 1px 2px rgba(0, 0, 0, 0.05);-moz-box-shadow:0 1px 2px rgba(0, 0, 0, 0.05);box-shadow:0 1px 2px rgba(0, 0, 0, 0.05);}
+.pagination ul>li{display:inline;}
+.pagination ul>li>a,.pagination ul>li>span{float:left;padding:4px 12px;line-height:20px;text-decoration:none;background-color:#ffffff;border:1px solid #dddddd;border-left-width:0;}
+.pagination ul>li>a:hover,.pagination ul>.active>a,.pagination ul>.active>span{background-color:#f5f5f5;}
+.pagination ul>.active>a,.pagination ul>.active>span{color:#999999;cursor:default;}
+.pagination ul>.disabled>span,.pagination ul>.disabled>a,.pagination ul>.disabled>a:hover{color:#999999;background-color:transparent;cursor:default;}
+.pagination ul>li:first-child>a,.pagination ul>li:first-child>span{border-left-width:1px;-webkit-border-top-left-radius:4px;-moz-border-radius-topleft:4px;border-top-left-radius:4px;-webkit-border-bottom-left-radius:4px;-moz-border-radius-bottomleft:4px;border-bottom-left-radius:4px;}
+.pagination ul>li:last-child>a,.pagination ul>li:last-child>span{-webkit-border-top-right-radius:4px;-moz-border-radius-topright:4px;border-top-right-radius:4px;-webkit-border-bottom-right-radius:4px;-moz-border-radius-bottomright:4px;border-bottom-right-radius:4px;}
+.pagination-centered{text-align:center;}
+.pagination-right{text-align:right;}
+.pagination-large ul>li>a,.pagination-large ul>li>span{padding:11px 19px;font-size:17.5px;}
+.pagination-large ul>li:first-child>a,.pagination-large ul>li:first-child>span{-webkit-border-top-left-radius:6px;-moz-border-radius-topleft:6px;border-top-left-radius:6px;-webkit-border-bottom-left-radius:6px;-moz-border-radius-bottomleft:6px;border-bottom-left-radius:6px;}
+.pagination-large ul>li:last-child>a,.pagination-large ul>li:last-child>span{-webkit-border-top-right-radius:6px;-moz-border-radius-topright:6px;border-top-right-radius:6px;-webkit-border-bottom-right-radius:6px;-moz-border-radius-bottomright:6px;border-bottom-right-radius:6px;}
+.pagination-mini ul>li:first-child>a,.pagination-small ul>li:first-child>a,.pagination-mini ul>li:first-child>span,.pagination-small ul>li:first-child>span{-webkit-border-top-left-radius:3px;-moz-border-radius-topleft:3px;border-top-left-radius:3px;-webkit-border-bottom-left-radius:3px;-moz-border-radius-bottomleft:3px;border-bottom-left-radius:3px;}
+.pagination-mini ul>li:last-child>a,.pagination-small ul>li:last-child>a,.pagination-mini ul>li:last-child>span,.pagination-small ul>li:last-child>span{-webkit-border-top-right-radius:3px;-moz-border-radius-topright:3px;border-top-right-radius:3px;-webkit-border-bottom-right-radius:3px;-moz-border-radius-bottomright:3px;border-bottom-right-radius:3px;}
+.pagination-small ul>li>a,.pagination-small ul>li>span{padding:2px 10px;font-size:11.9px;}
+.pagination-mini ul>li>a,.pagination-mini ul>li>span{padding:0px 6px;font-size:10.5px;}
+.pager{margin:20px 0;list-style:none;text-align:center;*zoom:1;}.pager:before,.pager:after{display:table;content:"";line-height:0;}
+.pager:after{clear:both;}
+.pager li{display:inline;}
+.pager li>a,.pager li>span{display:inline-block;padding:5px 14px;background-color:#fff;border:1px solid #ddd;-webkit-border-radius:15px;-moz-border-radius:15px;border-radius:15px;}
+.pager li>a:hover{text-decoration:none;background-color:#f5f5f5;}
+.pager .next>a,.pager .next>span{float:right;}
+.pager .previous>a,.pager .previous>span{float:left;}
+.pager .disabled>a,.pager .disabled>a:hover,.pager .disabled>span{color:#999999;background-color:#fff;cursor:default;}
+.modal-backdrop{position:fixed;top:0;right:0;bottom:0;left:0;z-index:1040;background-color:#000000;}.modal-backdrop.fade{opacity:0;}
+.modal-backdrop,.modal-backdrop.fade.in{opacity:0.8;filter:alpha(opacity=80);}
+.modal{position:fixed;top:10%;left:50%;z-index:1050;width:560px;margin-left:-280px;background-color:#ffffff;border:1px solid #999;border:1px solid rgba(0, 0, 0, 0.3);*border:1px solid #999;-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px;-webkit-box-shadow:0 3px 7px rgba(0, 0, 0, 0.3);-moz-box-shadow:0 3px 7px rgba(0, 0, 0, 0.3);box-shadow:0 3px 7px rgba(0, 0, 0, 0.3);-webkit-background-clip:padding-box;-moz-background-clip:padding-box;background-clip:padding-box;outline:none;}.modal.fade{-webkit-transition:opacity .3s linear, top .3s ease-out;-moz-transition:opacity .3s linear, top .3s ease-out;-o-transition:opacity .3s linear, top .3s ease-out;transition:opacity .3s linear, top .3s ease-out;top:-25%;}
+.modal.fade.in{top:10%;}
+.modal-header{padding:9px 15px;border-bottom:1px solid #eee;}.modal-header .close{margin-top:2px;}
+.modal-header h3{margin:0;line-height:30px;}
+.modal-body{position:relative;overflow-y:auto;max-height:400px;padding:15px;}
+.modal-form{margin-bottom:0;}
+.modal-footer{padding:14px 15px 15px;margin-bottom:0;text-align:right;background-color:#f5f5f5;border-top:1px solid #ddd;-webkit-border-radius:0 0 6px 6px;-moz-border-radius:0 0 6px 6px;border-radius:0 0 6px 6px;-webkit-box-shadow:inset 0 1px 0 #ffffff;-moz-box-shadow:inset 0 1px 0 #ffffff;box-shadow:inset 0 1px 0 #ffffff;*zoom:1;}.modal-footer:before,.modal-footer:after{display:table;content:"";line-height:0;}
+.modal-footer:after{clear:both;}
+.modal-footer .btn+.btn{margin-left:5px;margin-bottom:0;}
+.modal-footer .btn-group .btn+.btn{margin-left:-1px;}
+.modal-footer .btn-block+.btn-block{margin-left:0;}
+.tooltip{position:absolute;z-index:1020;display:block;visibility:visible;padding:5px;font-size:11px;opacity:0;filter:alpha(opacity=0);}.tooltip.in{opacity:0.8;filter:alpha(opacity=80);}
+.tooltip.top{margin-top:-3px;}
+.tooltip.right{margin-left:3px;}
+.tooltip.bottom{margin-top:3px;}
+.tooltip.left{margin-left:-3px;}
+.tooltip-inner{max-width:200px;padding:3px 8px;color:#ffffff;text-align:center;text-decoration:none;background-color:#000000;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;}
+.tooltip-arrow{position:absolute;width:0;height:0;border-color:transparent;border-style:solid;}
+.tooltip.top .tooltip-arrow{bottom:0;left:50%;margin-left:-5px;border-width:5px 5px 0;border-top-color:#000000;}
+.tooltip.right .tooltip-arrow{top:50%;left:0;margin-top:-5px;border-width:5px 5px 5px 0;border-right-color:#000000;}
+.tooltip.left .tooltip-arrow{top:50%;right:0;margin-top:-5px;border-width:5px 0 5px 5px;border-left-color:#000000;}
+.tooltip.bottom .tooltip-arrow{top:0;left:50%;margin-left:-5px;border-width:0 5px 5px;border-bottom-color:#000000;}
+.popover{position:absolute;top:0;left:0;z-index:1010;display:none;width:236px;padding:1px;text-align:left;background-color:#ffffff;-webkit-background-clip:padding-box;-moz-background-clip:padding;background-clip:padding-box;border:1px solid #ccc;border:1px solid rgba(0, 0, 0, 0.2);-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px;-webkit-box-shadow:0 5px 10px rgba(0, 0, 0, 0.2);-moz-box-shadow:0 5px 10px rgba(0, 0, 0, 0.2);box-shadow:0 5px 10px rgba(0, 0, 0, 0.2);white-space:normal;}.popover.top{margin-top:-10px;}
+.popover.right{margin-left:10px;}
+.popover.bottom{margin-top:10px;}
+.popover.left{margin-left:-10px;}
+.popover-title{margin:0;padding:8px 14px;font-size:14px;font-weight:normal;line-height:18px;background-color:#f7f7f7;border-bottom:1px solid #ebebeb;-webkit-border-radius:5px 5px 0 0;-moz-border-radius:5px 5px 0 0;border-radius:5px 5px 0 0;}
+.popover-content{padding:9px 14px;}
+.popover .arrow,.popover .arrow:after{position:absolute;display:block;width:0;height:0;border-color:transparent;border-style:solid;}
+.popover .arrow{border-width:11px;}
+.popover .arrow:after{border-width:10px;content:"";}
+.popover.top .arrow{left:50%;margin-left:-11px;border-bottom-width:0;border-top-color:#999;border-top-color:rgba(0, 0, 0, 0.25);bottom:-11px;}.popover.top .arrow:after{bottom:1px;margin-left:-10px;border-bottom-width:0;border-top-color:#ffffff;}
+.popover.right .arrow{top:50%;left:-11px;margin-top:-11px;border-left-width:0;border-right-color:#999;border-right-color:rgba(0, 0, 0, 0.25);}.popover.right .arrow:after{left:1px;bottom:-10px;border-left-width:0;border-right-color:#ffffff;}
+.popover.bottom .arrow{left:50%;margin-left:-11px;border-top-width:0;border-bottom-color:#999;border-bottom-color:rgba(0, 0, 0, 0.25);top:-11px;}.popover.bottom .arrow:after{top:1px;margin-left:-10px;border-top-width:0;border-bottom-color:#ffffff;}
+.popover.left .arrow{top:50%;right:-11px;margin-top:-11px;border-right-width:0;border-left-color:#999;border-left-color:rgba(0, 0, 0, 0.25);}.popover.left .arrow:after{right:1px;border-right-width:0;border-left-color:#ffffff;bottom:-10px;}
+.thumbnails{margin-left:-20px;list-style:none;*zoom:1;}.thumbnails:before,.thumbnails:after{display:table;content:"";line-height:0;}
+.thumbnails:after{clear:both;}
+.row-fluid .thumbnails{margin-left:0;}
+.thumbnails>li{float:left;margin-bottom:20px;margin-left:20px;}
+.thumbnail{display:block;padding:4px;line-height:20px;border:1px solid #ddd;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;-webkit-box-shadow:0 1px 3px rgba(0, 0, 0, 0.055);-moz-box-shadow:0 1px 3px rgba(0, 0, 0, 0.055);box-shadow:0 1px 3px rgba(0, 0, 0, 0.055);-webkit-transition:all 0.2s ease-in-out;-moz-transition:all 0.2s ease-in-out;-o-transition:all 0.2s ease-in-out;transition:all 0.2s ease-in-out;}
+a.thumbnail:hover{border-color:#2fa4e7;-webkit-box-shadow:0 1px 4px rgba(0, 105, 214, 0.25);-moz-box-shadow:0 1px 4px rgba(0, 105, 214, 0.25);box-shadow:0 1px 4px rgba(0, 105, 214, 0.25);}
+.thumbnail>img{display:block;max-width:100%;margin-left:auto;margin-right:auto;}
+.thumbnail .caption{padding:9px;color:#555555;}
+.media,.media-body{overflow:hidden;*overflow:visible;zoom:1;}
+.media,.media .media{margin-top:15px;}
+.media:first-child{margin-top:0;}
+.media-object{display:block;}
+.media-heading{margin:0 0 5px;}
+.media .pull-left{margin-right:10px;}
+.media .pull-right{margin-left:10px;}
+.media-list{margin-left:0;list-style:none;}
+.label,.badge{display:inline-block;padding:2px 4px;font-size:11.844px;font-weight:bold;line-height:14px;color:#ffffff;vertical-align:baseline;white-space:nowrap;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);background-color:#999999;}
+.label{-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px;}
+.badge{padding-left:9px;padding-right:9px;-webkit-border-radius:9px;-moz-border-radius:9px;border-radius:9px;}
+.label:empty,.badge:empty{display:none;}
+a.label:hover,a.badge:hover{color:#ffffff;text-decoration:none;cursor:pointer;}
+.label-important,.badge-important{background-color:#bd4247;}
+.label-important[href],.badge-important[href]{background-color:#983538;}
+.label-warning,.badge-warning{background-color:#dd5600;}
+.label-warning[href],.badge-warning[href]{background-color:#aa4200;}
+.label-success,.badge-success{background-color:#669533;}
+.label-success[href],.badge-success[href]{background-color:#4c6f26;}
+.label-info,.badge-info{background-color:#817b58;}
+.label-info[href],.badge-info[href]{background-color:#625e43;}
+.label-inverse,.badge-inverse{background-color:#333333;}
+.label-inverse[href],.badge-inverse[href]{background-color:#1a1a1a;}
+.btn .label,.btn .badge{position:relative;top:-1px;}
+.btn-mini .label,.btn-mini .badge{top:0;}
+ at -webkit-keyframes progress-bar-stripes{from{background-position:40px 0;} to{background-position:0 0;}}@-moz-keyframes progress-bar-stripes{from{background-position:40px 0;} to{background-position:0 0;}}@-ms-keyframes progress-bar-stripes{from{background-position:40px 0;} to{background-position:0 0;}}@-o-keyframes progress-bar-stripes{from{background-position:0 0;} to{background-position:40px 0;}}@keyframes progress-bar-stripes{from{background-position:40px 0;} to{background-position:0 0;}}.progress{overflow:hidden;height:20px;margin-bottom:20px;background-color:#f7f7f7;background-image:-moz-linear-gradient(top, #f5f5f5, #f9f9f9);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#f5f5f5), to(#f9f9f9));background-image:-webkit-linear-gradient(top, #f5f5f5, #f9f9f9);background-image:-o-linear-gradient(top, #f5f5f5, #f9f9f9);background-image:linear-gradient(to bottom, #f5f5f5, #f9f9f9);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startC
 olorstr='#fff5f5f5', endColorstr='#fff9f9f9', GradientType=0);-webkit-box-shadow:inset 0 1px 2px rgba(0, 0, 0, 0.1);-moz-box-shadow:inset 0 1px 2px rgba(0, 0, 0, 0.1);box-shadow:inset 0 1px 2px rgba(0, 0, 0, 0.1);-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;}
+.progress .bar{width:0%;height:100%;color:#ffffff;float:left;font-size:12px;text-align:center;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);background-color:#0e90d2;background-image:-moz-linear-gradient(top, #149bdf, #0480be);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#149bdf), to(#0480be));background-image:-webkit-linear-gradient(top, #149bdf, #0480be);background-image:-o-linear-gradient(top, #149bdf, #0480be);background-image:linear-gradient(to bottom, #149bdf, #0480be);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff149bdf', endColorstr='#ff0480be', GradientType=0);-webkit-box-shadow:inset 0 -1px 0 rgba(0, 0, 0, 0.15);-moz-box-shadow:inset 0 -1px 0 rgba(0, 0, 0, 0.15);box-shadow:inset 0 -1px 0 rgba(0, 0, 0, 0.15);-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;-webkit-transition:width 0.6s ease;-moz-transition:width 0.6s ease;-o-transition:width 0.6s ease;transition:width 0.6s ease;}
+.progress .bar+.bar{-webkit-box-shadow:inset 1px 0 0 rgba(0,0,0,.15), inset 0 -1px 0 rgba(0,0,0,.15);-moz-box-shadow:inset 1px 0 0 rgba(0,0,0,.15), inset 0 -1px 0 rgba(0,0,0,.15);box-shadow:inset 1px 0 0 rgba(0,0,0,.15), inset 0 -1px 0 rgba(0,0,0,.15);}
+.progress-striped .bar{background-color:#149bdf;background-image:-webkit-gradient(linear, 0 100%, 100% 0, color-stop(0.25, rgba(255, 255, 255, 0.15)), color-stop(0.25, transparent), color-stop(0.5, transparent), color-stop(0.5, rgba(255, 255, 255, 0.15)), color-stop(0.75, rgba(255, 255, 255, 0.15)), color-stop(0.75, transparent), to(transparent));background-image:-webkit-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);background-image:-moz-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);background-image:-o-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);background-image:linear-gradient(
 45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);-webkit-background-size:40px 40px;-moz-background-size:40px 40px;-o-background-size:40px 40px;background-size:40px 40px;}
+.progress.active .bar{-webkit-animation:progress-bar-stripes 2s linear infinite;-moz-animation:progress-bar-stripes 2s linear infinite;-ms-animation:progress-bar-stripes 2s linear infinite;-o-animation:progress-bar-stripes 2s linear infinite;animation:progress-bar-stripes 2s linear infinite;}
+.progress-danger .bar,.progress .bar-danger{background-color:#dd514c;background-image:-moz-linear-gradient(top, #ee5f5b, #c43c35);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#ee5f5b), to(#c43c35));background-image:-webkit-linear-gradient(top, #ee5f5b, #c43c35);background-image:-o-linear-gradient(top, #ee5f5b, #c43c35);background-image:linear-gradient(to bottom, #ee5f5b, #c43c35);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffee5f5b', endColorstr='#ffc43c35', GradientType=0);}
+.progress-danger.progress-striped .bar,.progress-striped .bar-danger{background-color:#ee5f5b;background-image:-webkit-gradient(linear, 0 100%, 100% 0, color-stop(0.25, rgba(255, 255, 255, 0.15)), color-stop(0.25, transparent), color-stop(0.5, transparent), color-stop(0.5, rgba(255, 255, 255, 0.15)), color-stop(0.75, rgba(255, 255, 255, 0.15)), color-stop(0.75, transparent), to(transparent));background-image:-webkit-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);background-image:-moz-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);background-image:-o-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, 
 transparent);background-image:linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);}
+.progress-success .bar,.progress .bar-success{background-color:#5eb95e;background-image:-moz-linear-gradient(top, #62c462, #57a957);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#62c462), to(#57a957));background-image:-webkit-linear-gradient(top, #62c462, #57a957);background-image:-o-linear-gradient(top, #62c462, #57a957);background-image:linear-gradient(to bottom, #62c462, #57a957);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff62c462', endColorstr='#ff57a957', GradientType=0);}
+.progress-success.progress-striped .bar,.progress-striped .bar-success{background-color:#62c462;background-image:-webkit-gradient(linear, 0 100%, 100% 0, color-stop(0.25, rgba(255, 255, 255, 0.15)), color-stop(0.25, transparent), color-stop(0.5, transparent), color-stop(0.5, rgba(255, 255, 255, 0.15)), color-stop(0.75, rgba(255, 255, 255, 0.15)), color-stop(0.75, transparent), to(transparent));background-image:-webkit-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);background-image:-moz-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);background-image:-o-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%
 , transparent);background-image:linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);}
+.progress-info .bar,.progress .bar-info{background-color:#4bb1cf;background-image:-moz-linear-gradient(top, #5bc0de, #339bb9);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#5bc0de), to(#339bb9));background-image:-webkit-linear-gradient(top, #5bc0de, #339bb9);background-image:-o-linear-gradient(top, #5bc0de, #339bb9);background-image:linear-gradient(to bottom, #5bc0de, #339bb9);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff5bc0de', endColorstr='#ff339bb9', GradientType=0);}
+.progress-info.progress-striped .bar,.progress-striped .bar-info{background-color:#5bc0de;background-image:-webkit-gradient(linear, 0 100%, 100% 0, color-stop(0.25, rgba(255, 255, 255, 0.15)), color-stop(0.25, transparent), color-stop(0.5, transparent), color-stop(0.5, rgba(255, 255, 255, 0.15)), color-stop(0.75, rgba(255, 255, 255, 0.15)), color-stop(0.75, transparent), to(transparent));background-image:-webkit-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);background-image:-moz-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);background-image:-o-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, tran
 sparent);background-image:linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);}
+.progress-warning .bar,.progress .bar-warning{background-color:#f16e1a;background-image:-moz-linear-gradient(top, #ff7d2b, #dd5600);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#ff7d2b), to(#dd5600));background-image:-webkit-linear-gradient(top, #ff7d2b, #dd5600);background-image:-o-linear-gradient(top, #ff7d2b, #dd5600);background-image:linear-gradient(to bottom, #ff7d2b, #dd5600);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffff7d2b', endColorstr='#ffdd5600', GradientType=0);}
+.progress-warning.progress-striped .bar,.progress-striped .bar-warning{background-color:#ff7d2b;background-image:-webkit-gradient(linear, 0 100%, 100% 0, color-stop(0.25, rgba(255, 255, 255, 0.15)), color-stop(0.25, transparent), color-stop(0.5, transparent), color-stop(0.5, rgba(255, 255, 255, 0.15)), color-stop(0.75, rgba(255, 255, 255, 0.15)), color-stop(0.75, transparent), to(transparent));background-image:-webkit-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);background-image:-moz-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);background-image:-o-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%
 , transparent);background-image:linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);}
+.accordion{margin-bottom:20px;}
+.accordion-group{margin-bottom:2px;border:1px solid #e5e5e5;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;}
+.accordion-heading{border-bottom:0;}
+.accordion-heading .accordion-toggle{display:block;padding:8px 15px;}
+.accordion-toggle{cursor:pointer;}
+.accordion-inner{padding:9px 15px;border-top:1px solid #e5e5e5;}
+.carousel{position:relative;margin-bottom:20px;line-height:1;}
+.carousel-inner{overflow:hidden;width:100%;position:relative;}
+.carousel-inner>.item{display:none;position:relative;-webkit-transition:0.6s ease-in-out left;-moz-transition:0.6s ease-in-out left;-o-transition:0.6s ease-in-out left;transition:0.6s ease-in-out left;}
+.carousel-inner>.item>img{display:block;line-height:1;}
+.carousel-inner>.active,.carousel-inner>.next,.carousel-inner>.prev{display:block;}
+.carousel-inner>.active{left:0;}
+.carousel-inner>.next,.carousel-inner>.prev{position:absolute;top:0;width:100%;}
+.carousel-inner>.next{left:100%;}
+.carousel-inner>.prev{left:-100%;}
+.carousel-inner>.next.left,.carousel-inner>.prev.right{left:0;}
+.carousel-inner>.active.left{left:-100%;}
+.carousel-inner>.active.right{left:100%;}
+.carousel-control{position:absolute;top:40%;left:15px;width:40px;height:40px;margin-top:-20px;font-size:60px;font-weight:100;line-height:30px;color:#ffffff;text-align:center;background:#222222;border:3px solid #ffffff;-webkit-border-radius:23px;-moz-border-radius:23px;border-radius:23px;opacity:0.5;filter:alpha(opacity=50);}.carousel-control.right{left:auto;right:15px;}
+.carousel-control:hover{color:#ffffff;text-decoration:none;opacity:0.9;filter:alpha(opacity=90);}
+.carousel-caption{position:absolute;left:0;right:0;bottom:0;padding:15px;background:#333333;background:rgba(0, 0, 0, 0.75);}
+.carousel-caption h4,.carousel-caption p{color:#ffffff;line-height:20px;}
+.carousel-caption h4{margin:0 0 5px;}
+.carousel-caption p{margin-bottom:0;}
+.hero-unit{padding:30px;margin-bottom:30px;font-size:18px;font-weight:200;line-height:30px;color:inherit;background-color:#f5f5f5;-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px;}.hero-unit h1{margin-bottom:0;font-size:60px;line-height:1;color:inherit;letter-spacing:-1px;}
+.hero-unit li{line-height:30px;}
+.pull-right{float:right;}
+.pull-left{float:left;}
+.hide{display:none;}
+.show{display:block;}
+.invisible{visibility:hidden;}
+.affix{position:fixed;}
+.navbar .brand{padding:14px 20px 16px;font-family:'Telex',sans-serif;text-shadow:1px 1px 0 rgba(0, 0, 0, 0.2);}
+.navbar li{line-height:20px;}
+.navbar .nav>li>a{padding:16px 10px 14px;font-family:'Telex',sans-serif;text-shadow:1px 1px 0 rgba(0, 0, 0, 0.2);}
+.navbar .search-query{border:1px solid #178acc;line-height:normal;}
+.navbar .navbar-text{padding:19px 10px 18px;line-height:13px;color:rgba(0, 0, 0, 0.5);text-shadow:1px 1px 0 rgba(255, 255, 255, 0.3);}
+.navbar-inverse .navbar-search .search-query{color:#555555;}
+ at media (max-width:979px){.navbar .nav-collapse .nav li>a{font-family:'Telex',sans-serif;font-weight:normal;color:#ffffff;text-shadow:1px 1px 0 rgba(0, 0, 0, 0.2);}.navbar .nav-collapse .nav li>a:hover{background-color:#2B7CAC;} .navbar .nav-collapse .nav .active>a{-webkit-box-shadow:none;-moz-box-shadow:none;box-shadow:none;background-color:#2B7CAC;} .navbar .nav-collapse .dropdown-menu li>a:hover,.navbar .nav-collapse .dropdown-menu li>a:focus,.navbar .nav-collapse .dropdown-submenu:hover>a{background-image:none;} .navbar .nav-collapse .navbar-form,.navbar .nav-collapse .navbar-search{border:none;} .navbar .nav-collapse .nav-header{color:#2B7CAC;} .navbar-inverse .nav-collapse .nav li>a{color:#ffffff;}.navbar-inverse .nav-collapse .nav li>a:hover{background-color:rgba(0, 0, 0, 0.1);} .navbar-inverse .nav-collapse .nav .active>a,.navbar-inverse .nav-collapse .nav>li>a:hover,.navbar-inverse .nav-collapse .dropdown-menu a:hover{background-color:rgba(0, 0, 0, 0.1) !important;}}
 div.subnav{font-family:'Telex',sans-serif;text-shadow:1px 1px 0 rgba(255, 255, 255, 0.2);}div.subnav-fixed{top:50px;}
+.btn{background-color:#ffffff;background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#ffffff), color-stop(5%, #ffffff), to(#ffffff));background-image:-webkit-linear-gradient(#ffffff, #ffffff 5%, #ffffff);background-image:-moz-linear-gradient(top, #ffffff, #ffffff 5%, #ffffff);background-image:-o-linear-gradient(#ffffff, #ffffff 5%, #ffffff);background-image:linear-gradient(#ffffff, #ffffff 5%, #ffffff);background-repeat:no-repeat;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff', endColorstr='#ffffffff', GradientType=0);-webkit-box-shadow:inset 0 1px 0 rgba(255, 255, 255, 0.2),0 1px 2px rgba(0, 0, 0, 0.05);-moz-box-shadow:inset 0 1px 0 rgba(255, 255, 255, 0.2),0 1px 2px rgba(0, 0, 0, 0.05);box-shadow:inset 0 1px 0 rgba(255, 255, 255, 0.2),0 1px 2px rgba(0, 0, 0, 0.05);}.btn:hover{background-position:0 0;}
+.btn-primary{color:#ffffff;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);background-color:#3daae9;background-image:-moz-linear-gradient(top, #46aeea, #2fa4e7);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#46aeea), to(#2fa4e7));background-image:-webkit-linear-gradient(top, #46aeea, #2fa4e7);background-image:-o-linear-gradient(top, #46aeea, #2fa4e7);background-image:linear-gradient(to bottom, #46aeea, #2fa4e7);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff46aeea', endColorstr='#ff2fa4e7', GradientType=0);border-color:#2fa4e7 #2fa4e7 #157ab5;border-color:rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);*background-color:#2fa4e7;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);}.btn-primary:hover,.btn-primary:active,.btn-primary.active,.btn-primary.disabled,.btn-primary[disabled]{color:#ffffff;background-color:#2fa4e7;*background-color:#1a99e2;}
+.btn-primary:active,.btn-primary.active{background-color:#178acc \9;}
+.btn-info{color:#ffffff;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);background-color:#9e6ab8;background-image:-moz-linear-gradient(top, #a271bb, #9760b3);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#a271bb), to(#9760b3));background-image:-webkit-linear-gradient(top, #a271bb, #9760b3);background-image:-o-linear-gradient(top, #a271bb, #9760b3);background-image:linear-gradient(to bottom, #a271bb, #9760b3);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffa271bb', endColorstr='#ff9760b3', GradientType=0);border-color:#9760b3 #9760b3 #6f4086;border-color:rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);*background-color:#9760b3;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);}.btn-info:hover,.btn-info:active,.btn-info.active,.btn-info.disabled,.btn-info[disabled]{color:#ffffff;background-color:#9760b3;*background-color:#8b51a9;}
+.btn-info:active,.btn-info.active{background-color:#7d4898 \9;}
+.btn-success{color:#ffffff;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);background-color:#7bb33d;background-image:-moz-linear-gradient(top, #80bb3f, #73a839);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#80bb3f), to(#73a839));background-image:-webkit-linear-gradient(top, #80bb3f, #73a839);background-image:-o-linear-gradient(top, #80bb3f, #73a839);background-image:linear-gradient(to bottom, #80bb3f, #73a839);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff80bb3f', endColorstr='#ff73a839', GradientType=0);border-color:#73a839 #73a839 #4c6f26;border-color:rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);*background-color:#73a839;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);}.btn-success:hover,.btn-success:active,.btn-success.active,.btn-success.disabled,.btn-success[disabled]{color:#ffffff;background-color:#73a839;*background-color:#669533;}
+.btn-success:active,.btn-success.active{background-color:#59822c \9;}
+.btn-warning{color:#ffffff;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);background-color:#ec5c00;background-image:-moz-linear-gradient(top, #f76000, #dd5600);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#f76000), to(#dd5600));background-image:-webkit-linear-gradient(top, #f76000, #dd5600);background-image:-o-linear-gradient(top, #f76000, #dd5600);background-image:linear-gradient(to bottom, #f76000, #dd5600);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#fff76000', endColorstr='#ffdd5600', GradientType=0);border-color:#dd5600 #dd5600 #913800;border-color:rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);*background-color:#dd5600;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);}.btn-warning:hover,.btn-warning:active,.btn-warning.active,.btn-warning.disabled,.btn-warning[disabled]{color:#ffffff;background-color:#dd5600;*background-color:#c44c00;}
+.btn-warning:active,.btn-warning.active{background-color:#aa4200 \9;}
+.btn-danger{color:#ffffff;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);background-color:#d41e24;background-image:-moz-linear-gradient(top, #dd1f26, #c71c22);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#dd1f26), to(#c71c22));background-image:-webkit-linear-gradient(top, #dd1f26, #c71c22);background-image:-o-linear-gradient(top, #dd1f26, #c71c22);background-image:linear-gradient(to bottom, #dd1f26, #c71c22);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffdd1f26', endColorstr='#ffc71c22', GradientType=0);border-color:#c71c22 #c71c22 #841317;border-color:rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);*background-color:#c71c22;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);}.btn-danger:hover,.btn-danger:active,.btn-danger.active,.btn-danger.disabled,.btn-danger[disabled]{color:#ffffff;background-color:#c71c22;*background-color:#b1191e;}
+.btn-danger:active,.btn-danger.active{background-color:#9a161a \9;}
+.btn-inverse{color:#ffffff;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);background-color:#034482;background-image:-moz-linear-gradient(top, #04498c, #033c73);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#04498c), to(#033c73));background-image:-webkit-linear-gradient(top, #04498c, #033c73);background-image:-o-linear-gradient(top, #04498c, #033c73);background-image:linear-gradient(to bottom, #04498c, #033c73);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff04498c', endColorstr='#ff033c73', GradientType=0);border-color:#033c73 #033c73 #011528;border-color:rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);*background-color:#033c73;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);}.btn-inverse:hover,.btn-inverse:active,.btn-inverse.active,.btn-inverse.disabled,.btn-inverse[disabled]{color:#ffffff;background-color:#033c73;*background-color:#022f5a;}
+.btn-inverse:active,.btn-inverse.active{background-color:#022241 \9;}
+i[class^="icon-"]{opacity:0.8;}
+.pull-right{float:right;}
+.pull-left{float:left;}
+.hide{display:none;}
+.show{display:block;}
+.invisible{visibility:hidden;}
+.affix{position:fixed;}
diff --git a/docs/css/bootswatch.less b/docs/css/bootswatch.less
new file mode 100644
index 0000000..3c353e9
--- /dev/null
+++ b/docs/css/bootswatch.less
@@ -0,0 +1,181 @@
+// Cerulean 2.2.2
+// Bootswatch
+// -----------------------------------------------------
+
+
+// TYPOGRAPHY
+// -----------------------------------------------------
+
+ at import url(//fonts.googleapis.com/css?family=Telex);
+
+// SCAFFOLDING
+// -----------------------------------------------------
+
+// NAVBAR
+// -----------------------------------------------------
+
+.navbar {
+
+
+	.brand {
+		padding: 14px 20px 16px;
+		font-family: @headingsFontFamily;
+		text-shadow: 1px 1px 0 rgba(0, 0, 0, 0.2);
+	}
+
+	li {
+		line-height: 20px;
+	}
+
+	.nav > li > a {
+		padding: 16px 10px 14px;
+		font-family: @headingsFontFamily;
+		text-shadow: 1px 1px 0 rgba(0, 0, 0, 0.2);
+	}
+
+	.search-query {
+		border: 1px solid darken(@linkColor, 10%);
+		line-height: normal;
+	}
+
+	.navbar-text {
+		padding: 19px 10px 18px;
+		line-height: 13px;
+		color: rgba(0, 0, 0, 0.5);
+		text-shadow: 1px 1px 0 rgba(255, 255, 255, 0.3);
+	}
+
+	&-inverse {
+
+		.navbar-search .search-query {
+			color: @textColor;
+		}
+	}
+}
+
+ at media (max-width: @navbarCollapseWidth) {
+
+	.navbar .nav-collapse {
+
+		.nav li > a {
+
+			font-family: @headingsFontFamily;
+			font-weight: normal;
+			color: @white;
+			text-shadow: 1px 1px 0 rgba(0, 0, 0, 0.2);
+
+			&:hover {
+				background-color: #2B7CAC;
+			}
+		}
+
+		.nav .active > a {
+			.box-shadow(none);
+			background-color: #2B7CAC;
+		}
+
+		.dropdown-menu li > a:hover,
+		.dropdown-menu li > a:focus,
+		.dropdown-submenu:hover > a {
+			background-image: none;
+		}
+
+		.navbar-form,
+		.navbar-search {
+			border: none;
+		}
+
+		.nav-header {
+			color: #2B7CAC;
+		}
+	}
+
+	.navbar-inverse .nav-collapse {
+
+		.nav li > a {
+			color: @navbarInverseLinkColor;
+
+			&:hover {
+				background-color: rgba(0, 0, 0, 0.1);
+			}
+		}
+
+		.nav .active > a,
+		.nav > li > a:hover,
+		.dropdown-menu a:hover {
+			background-color: rgba(0, 0, 0, 0.1) !important;
+		}
+	}
+}
+
+div.subnav {
+
+	font-family: @headingsFontFamily;
+	text-shadow: 1px 1px 0 rgba(255, 255, 255, 0.2);
+
+	&-fixed {
+		top: @navbarHeight;
+	}
+}
+
+// NAV
+// -----------------------------------------------------
+
+// BUTTONS
+// -----------------------------------------------------
+
+.btn {
+  #gradient > .vertical-three-colors(@white, @white, 5%, darken(@white, 0%));
+  @shadow: inset 0 1px 0 rgba(255,255,255,.2), 0 1px 2px rgba(0,0,0,.05);
+  .box-shadow(@shadow);
+
+  &:hover {
+  	background-position: 0 0;
+  }
+}
+
+.btn-primary {
+  .buttonBackground(lighten(@btnPrimaryBackground, 5%), @btnPrimaryBackground);
+}
+
+.btn-info {
+  .buttonBackground(lighten(@btnInfoBackground, 5%), @btnInfoBackground);
+}
+
+.btn-success {
+  .buttonBackground(lighten(@btnSuccessBackground, 5%), @btnSuccessBackground);
+}
+
+.btn-warning {
+  .buttonBackground(lighten(@btnWarningBackground, 5%), @btnWarningBackground);
+}
+
+.btn-danger {
+  .buttonBackground(lighten(@btnDangerBackground, 5%), @btnDangerBackground);
+}
+
+.btn-inverse {
+  .buttonBackground(lighten(@btnInverseBackground, 5%), @btnInverseBackground);
+}
+
+// TABLES
+// -----------------------------------------------------
+
+// FORMS
+// -----------------------------------------------------
+
+// DROPDOWNS
+// -----------------------------------------------------
+
+// ALERTS, LABELS, BADGES
+// -----------------------------------------------------
+
+// MISC
+// -----------------------------------------------------
+
+i[class^="icon-"]{
+	opacity: 0.8;
+}
+
+// MEDIA QUERIES
+// -----------------------------------------------------
diff --git a/docs/css/variables.less b/docs/css/variables.less
new file mode 100644
index 0000000..32a8529
--- /dev/null
+++ b/docs/css/variables.less
@@ -0,0 +1,301 @@
+// Cerulean 2.2.2
+// Variables
+// --------------------------------------------------
+
+
+// GLOBAL VALUES
+// --------------------------------------------------
+
+
+// Grays
+// -------------------------
+ at black:                 #000;
+ at grayDarker:            #222;
+ at grayDark:              #333;
+ at gray:                  #555;
+ at grayLight:             #999;
+ at grayLighter:           #F5F5F5;
+ at white:                 #fff;
+
+
+// Accent colors
+// -------------------------
+ at blue:                  #2FA4E7;
+ at blueDark:              #033C73;
+ at green:                 #73A839;
+ at red:                   #C71C22;
+ at yellow:                #F7B42C;
+ at orange:                #DD5600;
+ at pink:                  #F49AC1;
+ at purple:                #9760B3;
+
+
+// Scaffolding
+// -------------------------
+ at bodyBackground:        @white;
+ at textColor:             @gray;
+
+
+// Links
+// -------------------------
+ at linkColor:             @blue;
+ at linkColorHover:        darken(@linkColor, 15%);
+
+
+// Typography
+// -------------------------
+ at sansFontFamily:        "Helvetica Neue", Helvetica, Arial, sans-serif;
+ at serifFontFamily:       Georgia, "Times New Roman", Times, serif;
+ at monoFontFamily:        Menlo, Monaco, Consolas, "Courier New", monospace;
+
+ at baseFontSize:          14px;
+ at baseFontFamily:        @sansFontFamily;
+ at baseLineHeight:        20px;
+ at altFontFamily:         @monoFontFamily;
+
+ at headingsFontFamily:    'Telex', sans-serif; // empty to use BS default, @baseFontFamily
+ at headingsFontWeight:    bold;    // instead of browser default, bold
+ at headingsColor:         #317EAC; // empty to use BS default, @textColor
+
+
+// Component sizing
+// -------------------------
+// Based on 14px font-size and 20px line-height
+
+ at fontSizeLarge:         @baseFontSize * 1.25; // ~18px
+ at fontSizeSmall:         @baseFontSize * 0.85; // ~12px
+ at fontSizeMini:          @baseFontSize * 0.75; // ~11px
+
+ at paddingLarge:          11px 19px; // 44px
+ at paddingSmall:          2px 10px;  // 26px
+ at paddingMini:           0px 6px;   // 22px
+
+ at baseBorderRadius:      4px;
+ at borderRadiusLarge:     6px;
+ at borderRadiusSmall:     3px;
+
+
+// Tables
+// -------------------------
+ at tableBackground:                   transparent; // overall background-color
+ at tableBackgroundAccent:             #f9f9f9; // for striping
+ at tableBackgroundHover:              #f5f5f5; // for hover
+ at tableBorder:                       #ddd; // table and cell border
+
+// Buttons
+// -------------------------
+ at btnBackground:                     @white;
+ at btnBackgroundHighlight:            darken(@white, 10%);
+ at btnBorder:                         darken(@white, 20%);
+
+ at btnPrimaryBackground:              @linkColor;
+ at btnPrimaryBackgroundHighlight:     spin(@btnPrimaryBackground, 15%);
+
+ at btnInfoBackground:                 @purple;
+ at btnInfoBackgroundHighlight:        #2f96b4;
+
+ at btnSuccessBackground:              @green;
+ at btnSuccessBackgroundHighlight:     #51a351;
+
+ at btnWarningBackground:              @orange;
+ at btnWarningBackgroundHighlight:     @orange;
+
+ at btnDangerBackground:               @red;
+ at btnDangerBackgroundHighlight:      #bd362f;
+
+ at btnInverseBackground:              @blueDark;
+ at btnInverseBackgroundHighlight:     @grayDarker;
+
+
+// Forms
+// -------------------------
+ at inputBackground:               @white;
+ at inputBorder:                   #ccc;
+ at inputBorderRadius:             @baseBorderRadius;
+ at inputDisabledBackground:       @grayLighter;
+ at formActionsBackground:         #f5f5f5;
+ at inputHeight:                   @baseLineHeight + 10px; // base line-height + 8px vertical padding + 2px top/bottom border
+
+
+// Dropdowns
+// -------------------------
+ at dropdownBackground:            @white;
+ at dropdownBorder:                rgba(0,0,0,.2);
+ at dropdownDividerTop:            #e5e5e5;
+ at dropdownDividerBottom:         @white;
+
+ at dropdownLinkColor:             @grayDark;
+ at dropdownLinkColorHover:        @white;
+ at dropdownLinkColorActive:       @white;
+
+ at dropdownLinkBackgroundActive:  @linkColor;
+ at dropdownLinkBackgroundHover:   @dropdownLinkBackgroundActive;
+
+
+
+// COMPONENT VARIABLES
+// --------------------------------------------------
+
+
+// Z-index master list
+// -------------------------
+// Used for a bird's eye view of components dependent on the z-axis
+// Try to avoid customizing these :)
+ at zindexDropdown:          1000;
+ at zindexPopover:           1010;
+ at zindexTooltip:           1020;
+ at zindexFixedNavbar:       1030;
+ at zindexModalBackdrop:     1040;
+ at zindexModal:             1050;
+
+
+// Sprite icons path
+// -------------------------
+ at iconSpritePath:          "../images/glyphicons-halflings.png";
+ at iconWhiteSpritePath:     "../images/glyphicons-halflings-white.png";
+
+
+// Input placeholder text color
+// -------------------------
+ at placeholderText:         @grayLight;
+
+
+// Hr border color
+// -------------------------
+ at hrBorder:                @grayLighter;
+
+
+// Horizontal forms & lists
+// -------------------------
+ at horizontalComponentOffset:       180px;
+
+
+// Wells
+// -------------------------
+ at wellBackground:                  #f5f5f5;
+
+
+// Navbar
+// -------------------------
+ at navbarCollapseWidth:             979px;
+ at navbarCollapseDesktopWidth:      @navbarCollapseWidth + 1;
+
+ at navbarHeight:                    50px;
+ at navbarBackgroundHighlight:       lighten(@navbarBackground, 8%);
+ at navbarBackground:                @blue;
+ at navbarBorder:                    darken(@navbarBackground, 8%);
+
+ at navbarText:                      @grayLighter;
+ at navbarLinkColor:                 @white;
+ at navbarLinkColorHover:            @white;
+ at navbarLinkColorActive:           @navbarLinkColorHover;
+ at navbarLinkBackgroundHover:       darken(@navbarBackground, 12%);
+ at navbarLinkBackgroundActive:      darken(@navbarBackground, 12%);
+
+ at navbarBrandColor:                @navbarLinkColor;
+
+// Inverted navbar
+ at navbarInverseBackground:                @blueDark;
+ at navbarInverseBackgroundHighlight:       lighten(@navbarInverseBackground, 5%);
+ at navbarInverseBorder:                    darken(@navbarInverseBackground, 3%);
+
+ at navbarInverseText:                      @white;
+ at navbarInverseLinkColor:                 @white;
+ at navbarInverseLinkColorHover:            @white;
+ at navbarInverseLinkColorActive:           @white;
+ at navbarInverseLinkBackgroundHover:       darken(@navbarInverseBackground, 6%);
+ at navbarInverseLinkBackgroundActive:      darken(@navbarInverseBackground, 6%);
+
+ at navbarInverseSearchBackground:          @white;
+ at navbarInverseSearchBackgroundFocus:     @white;
+ at navbarInverseSearchBorder:              @navbarInverseBackground;
+ at navbarInverseSearchPlaceholderColor:    @grayLight;
+
+ at navbarInverseBrandColor:                @navbarInverseLinkColor;
+
+
+// Pagination
+// -------------------------
+ at paginationBackground:                #fff;
+ at paginationBorder:                    #ddd;
+ at paginationActiveBackground:          #f5f5f5;
+
+
+// Hero unit
+// -------------------------
+ at heroUnitBackground:              @grayLighter;
+ at heroUnitHeadingColor:            inherit;
+ at heroUnitLeadColor:               inherit;
+
+
+// Form states and alerts
+// -------------------------
+ at warningText:             @orange;
+ at warningBackground:       #F1CEAB;
+ at warningBorder:           darken(spin(@warningBackground, -10), 3%);
+
+ at errorText:               darken(#C45559, 5%);
+ at errorBackground:         #F2BDB1;
+ at errorBorder:             darken(spin(@errorBackground, -10), 3%);
+
+ at successText:             darken(@green, 5%);
+ at successBackground:       #D5ECBF;
+ at successBorder:           darken(spin(@successBackground, -10), 5%);
+
+ at infoText:                darken(#908A62, 5%);
+ at infoBackground:          #A7DFF1;
+ at infoBorder:              darken(spin(@infoBackground, -10), 7%);
+
+
+// Tooltips and popovers
+// -------------------------
+ at tooltipColor:            #fff;
+ at tooltipBackground:       #000;
+ at tooltipArrowWidth:       5px;
+ at tooltipArrowColor:       @tooltipBackground;
+
+ at popoverBackground:       #fff;
+ at popoverArrowWidth:       10px;
+ at popoverArrowColor:       #fff;
+ at popoverTitleBackground:  darken(@popoverBackground, 3%);
+
+// Special enhancement for popovers
+ at popoverArrowOuterWidth:  @popoverArrowWidth + 1;
+ at popoverArrowOuterColor:  rgba(0,0,0,.25);
+
+
+
+// GRID
+// --------------------------------------------------
+
+
+// Default 940px grid
+// -------------------------
+ at gridColumns:             12;
+ at gridColumnWidth:         60px;
+ at gridGutterWidth:         20px;
+ at gridRowWidth:            (@gridColumns * @gridColumnWidth) + (@gridGutterWidth * (@gridColumns - 1));
+
+// 1200px min
+ at gridColumnWidth1200:     70px;
+ at gridGutterWidth1200:     30px;
+ at gridRowWidth1200:        (@gridColumns * @gridColumnWidth1200) + (@gridGutterWidth1200 * (@gridColumns - 1));
+
+// 768px-979px
+ at gridColumnWidth768:      42px;
+ at gridGutterWidth768:      20px;
+ at gridRowWidth768:         (@gridColumns * @gridColumnWidth768) + (@gridGutterWidth768 * (@gridColumns - 1));
+
+
+// Fluid grid
+// -------------------------
+ at fluidGridColumnWidth:    percentage(@gridColumnWidth/@gridRowWidth);
+ at fluidGridGutterWidth:    percentage(@gridGutterWidth/@gridRowWidth);
+
+// 1200px min
+ at fluidGridColumnWidth1200:     percentage(@gridColumnWidth1200/@gridRowWidth1200);
+ at fluidGridGutterWidth1200:     percentage(@gridGutterWidth1200/@gridRowWidth1200);
+
+// 768px-979px
+ at fluidGridColumnWidth768:      percentage(@gridColumnWidth768/@gridRowWidth768);
+ at fluidGridGutterWidth768:      percentage(@gridGutterWidth768/@gridRowWidth768);
diff --git a/docs/images/glyphicons-halflings-white.png b/docs/images/glyphicons-halflings-white.png
new file mode 100644
index 0000000000000000000000000000000000000000..3bf6484a29d8da269f9bc874b25493a45fae3bae
GIT binary patch
literal 8777
zcmZvC1yGz#v+m*$LXcp=A$ZWB0fL7wNbp_U*$~{_gL`my3oP#L!5tQYy99Ta`+g_q
zKlj|KJ2f at c)ARJx{q*b<Rc{fZDE|-E3z8Qg5C}{9v!pTzga8NZOmrk*O`5892Z0dh
z6y;PuJwHDK9$?(w-u|_L_3`o1($W%e0`}kWUyy&dCnqOQPfu4@SAgf?;o*P$z|s8t
zJh1KR>bkhN_!|Wn*Vos8{TEhUT at 5e;_WJsIMMcG5%>DiS&dv_N`4 at J0cnAQ-#>RjZ
z00W5t&tJ^l-QC*ST1-p~00u^9XJ=AUl7oW-;2a+x2k__T=grN{+1c4XK0ZL~^z^i$
zp&>vEhr at 4fZWb380S18T&!0cQ3IKpHF)?v=b_NIm0Q>v<fKgXh*W25>wY7D0baZ)n
z31Fa5sELUQARIVaU0nqf0XzT+fB_63aA;@<$l~wse|mcA;^G1TmX?-)e)jkGPfkuA
z92@|!<>h5S_4f8QP-JRq>d&7)^Yin8l7K8gED$&_FaV?gY+wLjpoW%~7NDe=nHfMG
z5DO3j{R9kv5GbssrUpO)<pElNvVjx;Inad7%}rnn)BtoiIXM{s0C>Oyv<s*i2m!7M
zNCXUk1jq|?5|99_k&%%AIlu-a0ty3=KxY8j%*;&S3IIajE_Qc!f%*X_5DScgf&xH0
zumu>Vrlx>u0UKD0i;Dpm5S5dY16(DL5l{ixz|mhJU@&-OWCTb7_%}8-fE(P~+XIRO
zJU|wp1|S>|J3KrLcz^+v1f&BDpd>&MAaibR4#5A_4(MucZwG9E1h4 at u0P@C8;oo+g
zIVj7kfJi{oV~E(NZ*h(@^<JQ`7oGGHtP>-(Q(C`Psb3KZ{N;^GB(a8NE*Vwc715!9
zr-H4Ao|T_c6+VT_JH9H+P3>iXSt!a$F`>s`jn`w9GZ_~B!{<w2b}Uz=xRP0Noee!5
zHGxHKH;uZjouChSB9)ldcOm@{14~ct04{b8>0soaiV|O_c^R2aWa%}O3jUE)WO=pa
zs~_Wz08z|ieY5A%$@FcBF9^!1a}m5ks at 7gjn;67N>}S~Hrm`4sM5Hh`q7&5-N{|31
z6x1{ol7Bn<k_m&K*9NkB7ANp6;_WSmra!UL^eY+pz_w5LlB(g$UY9|-AP@zsw4|7-
zi|#>skoViZ<brlX21G1wL@^v%v2P&MSTZc8SKT&&Tq!~%Uw%k^(D<O<S;ewoH)@(b
zb2Z<#wBV6y-?HHFVJFRg^me&@Reg!dys6F1>0GqbLa#kW`Z<Hy>)VCjt1MysKg|rT
zi!?s#<KsBd5lg=VLu4^|xo0%enAx0mMXMSpk0KF_*gOS;jx!zP=@5TPN+S>#Ck>8c
zpi|>$lGlw#@yMNi&V4`6OBGJ(H&7lqLlcTQ&1zWriG_fL>BnFcr~?;E93{M-xIozQ
zO=EHQ#+?<}%@wbWWv23#!V70h9MOuUVaU>3kpTvYfc|LBw?&b*89~Gc9i&8tlT#kF
ztpbZoAzkdB+UTy=tx%L3Z4)I{zY(Kb)eg{InobSJmNwPZt$14aS-uc4eKuY<?xyi!
z`TeGpun(kP^7#~<fX0r^ExRQwveWDF;DOQbL}?LBzt>8h$dtfyxu^a%zA)<y|4;I#
zFU8x7%0eT|Hd@3!T6Anh3IoHrN%@H8e6ge;3u)_$N2H&Rv2`ml6;kL~xS07C5Nzt<
z>>fYI&)@ZXky?^{5>xSC?;w4r&td6vBdi%vHm4=XJH!3yL3?Ep+T5aU_>i;yr_XGq
zxZfCzUU at GvnoIk+_Nd`aky>S&H!b*{A%L>?*XPAgWL(Vf(k7qUS}>Zn=U(ZfcOc{B
z3*tOHH at t5Ub5D~#N7!Fxx}P2)sy{vE_l(R7$aW&CX>c|&HY+7};vUIietK%}!ph<X
z*_6&Ee=)&D at nDa!y{$f<(Q`UdM+|H2ksGEhG7utFYl`Y6pD#+4LC8Hw@6|1H-x{D`
zE$uaNS!i^Rx(%B(My5}1#H73>rCuh+;C at 1usp;XLU<8Gq8P!rEI3<U)y>ieg#W$!=
zQcZr{hp>8sF?k&Yl0?B84OneiQxef-4TEFrq3O~JAZR}yEJHA|Xkqd49tR&8oq{zP
zY@>J^HBV*(gJvJZc_0VFN7Sx?H7#75E3#?N8<p*btH>Z!C+_f53YU}py<FUNWgSuj
zi^M}p>ggxx1?wQi5Yb-_`I`_V*SMx5+*P^b=ec5RON-k1cIlsBLk}(HiaJyab0`CI
zo0{<v3Q5P3 at oM!6@v&t6RJy0OS}M??mGqk1x;(pa`FWA#n+2z37<uPHl{#HvB!^?r
zm9?WOv;Tt(gt*?Pw;;%nF3|I0gDBXPM>=1_LO$~oE2%Tl_}KURuX<`+mQN_sTdM&*
zkFf!Xtl^e^gTy6ON=&gTn6)$JHQq2)33R at _!#9?BLNq-Wi{U|rVX7Vny$l6#+S<va
z%-r+y8D)Cm{5=IM8|<{prj)kZfIZ$NiW0)fE9{-SR)@-;NBJtHk@DI_v*mK(N0#s#
z?S8~jyotdcJJAAUt_;Tr)fa|*cT)~*JZ!c_7yVpSb{r2MllfJDbfI~-7n_#K6lw4G
z^Eyhsh^z8eZs2;adrfk9ip%h;IP|>Z at KvQt@VYb%<9JfapI^b9j=wa+Tqb4ei;8c5
z&1>Uz at lVFv6T4Z*YU$r4G`g=91lSeA<=GRZ!*KTWKDPR}NPUW%peCUj`Ix_LDq!8|
zMH-V`Pv!a~QkTL||L@cqiTz)*G-0=ytr1KqTuFPan9y4gYD5>PleK`NZB$ev at W%t=
zkp)_=lBUTLZJpAtZg;pjI;7r2y|26-N7&a(h<zryrg`J^oeC|8V|qszB+|*eQ-(Dy
zbn*nJ1W|b4-1y?dTI6}3IPMw+-O0;Q at eMMtjjQ+G6QfN3ae61Yd9LfQx_UREWecK4
zMn7A~fOz)be1)Yg{2Ysl9G%s8-h-~@C;ALAL0r=<JP2uCe!T|wAywH1r;F|f_q8N(
zYp^0FkyL9uj<8bK@fyTtgo+DT)14B^<SigcSJotgDV02O!M(CS6_B&^bILwyV?Ng4
zm7WQp?{l<Obhuy=22?5<oQDiM22&u4rZrRVG|L9ABfY{=95aTyd~@a$o~1P#ji`=w
zBKmQqX}r3Nlk9Q|gR7)~#n6AzYk`#!R*d5x`A)hU(!1R1%^zXxNJ(kPCw4htU9^(O
zP4cYV^F(I>X|`1YNM9N8{>8JAu<en5+94bD>v}hp1v`3JHT-=5lbXpbMq7X~2J5Kl
zh7tyU`_AusMFZ{ej9D;Uyy;SQ!4nwgSnngsYBwdS&EO3NS*o04)*j<g2BLf;iAZ2(
z7Key$cc6ey>uAYl;57c2Ly0(DEZ8IY?zSph-kyxu+D`tt at oU{32J#I{vmy=#0ySPK
zA+i(A3yl)qmTz*$dZi#y9FS;$;h%bY+;StNx{_R56Otq+?pGe^T^{5d7Gs&?`_r`8
zD&dzOA|j8 at 3<oPyCd}SOX6AZj_;pT>A&FR5U3*eQNBf<4^4W_iS_()*8b4aaUzfk2
zzIcMWSEjm;EPZPk{j{1>oXd}pXAj!NaRm8{Sjz!D=~q3WJ at vmt6ND_?HI~|wUS1j5
z9!S1MKr7%nxoJ3k`GB^7yV~*{n~O~n6($~x5Bu{7s|JyXbAyKI4+tO(zZYMslK;Zc
zzeHGVl{`iP at jfSKq>R;{+djJ9n%$%EL()Uw+sykjNQdflkJZSjqV_QDWivbZS~S{K
zkE at T^Jcv)Dfm93!mf$XYnCT--_A$zo9MOkPB6&diM8MwOfV?+ApNv`moV at nqn>&lv
zYbN1-M|jc~sG|yLN^1R2=`+1ih3jCshg`iP&mY$GMTcY^W^T`WOCX!{-KHmZ#GiRH
zYl{|+KLn5!PCLtBy~9i}`#d^gCDDx$+GQb~uc;V#K3OgbbOG0j5{BRG-si%Bo{@lB
zGIt+Ain8^C`!*S0d0OSWVO+Z8<kqm;qPrHIJ!qB8;9h5*>9}}O8aFTZ>p&k}2gGCV
zh#<$gswePFxWGT$4DC^8 at 84_e*^KT74?7n8!$8cg=sL$OlKr&HMh@Rr5%*Wr!xoOl
zo7jItnj-xYgVTX)H1=A2bD(tle<tL7^Z!nJ*fwgn&QUe>EH57#V{xAeW_ezISg5OC
zg=k>hOLA^urTH_e6*vSYRqCm$J{xo}-x3 at HH;bsHD1Z`Pzvsn}%cvfw%Q(}h`Dgtb
z0_J^niUmoCM5$*f)6}}qi(u;cPgxfyeV<wtcQgsqG?QDyA@6XXM7siU#+0#mP~AnX
z9f=bMes~9>aaVmOsG<)5`6tzU4wyhF;k|~|x>7-2hXpVBpc5k{L4M`Wbe6Q?tr^*B
z`Y*>6*&R#~%JlBIitlZ^qGe3s21~h3U|&k%%jeMM;6!~UH|+0+<5V-_zDqZQN7<fD
zM2vP&&BMr(%$M51tLpycNES^{gnGn-o~t&>9?n?!Aj!Nj`YMO9?j>uqI9-Tex+nJD
z%e0#Yca6(zqGUR|KITa?9x-#C0!JKJHO(+fy at 1!B$%ZwJwncQW7vGYv?~!^`#L~Um
zOL++>4qmqW`0Chc0T23G8|vO)tK=Z2`gvS4*qpqhIJCEv9i&&$09VO8YOz|oZ+ubd
zNXVdLc&p=KsSgtmIPLN69P7xYkYQ1vJ?u1g)T!6Ru`k2wkdj*wDC)VryGu2=yb0?F
z>q~~e>KZ0d<sP$M^)hrN7IC)eGuv*?pAk#*4fxII<8rIx545 at 9E}-};{IJdo*}!V1
zkUgWQp<TD%7(QQhWkf*vd;SiT1P@}N?jaoKEV?lzqfa1pG1Y^}ikjNMM*Kb?m5(n&
zOz8{+G2z7JatI<J95R%#%#ATAzlwPl$?6)w6WH~ku?(FhO)k1eRlF4I5UqR?T`Iy=
z_bVtkxqs3lQGny-BS%nkzwrXhI_M|P4l_VNVoMjVRoZ*0(JkMQ#AdJLFBj%$oTBx9
z_5|g_ll0@cfLf<j;&lJ>_#7f3UgV%9MY1}vMgF{B8yfE{HL*pMyhYF)WDZ^^3vS8F
zGlOhs%g_~pS3=WQ#494 at jAXwOtr^Y|TnQ5zki>qRG)(oPY*f}U_=ip_{qB0!%w7~G
zWE!P4p3khyW-JJnE>eECuYfI?^d366Shq!Wm#x&jA<tFBO~aWRutYg|6S!-V%dvXb
zjpm3-7^fYCzbWmx*ts$8ECu=f{D#|=T{2_Q?C-SVQTSi8ey{G^D$8U&*bY{vQ$kGG
zq$8)>o>=HdCllE$>DPO0N;y#4G)D2y#B at 5=N=+F%Xo2n{gKcPcK2!hP*^WSXl+ut;
zyLvVoY>VL{H%Kd9^i~lsb8j4>$EllrparEOJNT?Ym>vJa$(P^tOG)5aVb_5w^*&M0
zYOJ`I`}<NkH4X@iCc57jNSqY3D>9}UoSnYg#E(&yyK(tqr^@n}qU2H2DhkK-`2He%
zgXr_4kpXoQHxAO9S`wEdmqGU4j=1JdG!OixdqB4PPP6<nq;ZS)73s_@N{54U_<mt#
zR{@UUroZJ1=lVB~3y%RbLLE=9Mh=pj4wNruVxXLk8pKH)JVr{Hbx`P1XQ>RXA}>GM
zumruUUH|ZG2$bBj)Qluj&uB=dRb)?^qomw?Z$X%#D+Q*O97eHrgVB2*mR$bFBU`*}
zIem?dM)i}raTFDn at 5^caxE^XFXVhBePmH9fqcTi`TLaXiueH=@06sl}>F%}h9H_e9
z>^O?LxM1EjX}NVppaO at NNQr=AtHcH-BU{yBT_vejJ#J)l^cl69Z7$sk`82Zyw7Wxt
z=~J?hZm{f at W}|96FUJfy65Gk8?^{^yjhOahUMCNNpt5DJw}ZKH7b!bGiFY9y6OY&T
z_N)?Jj(MuLTN36ZCJ6<obtKS{VOOSzs>I5Xy7uVlrb$o*Z%=-)kPo9s?<^Yqz~!Z*
z_mP<Y8YDC3(vm~>8(unFq65XSi!$@YtieSQ!<7IEOaA9VkKI?lA`*(nURv<D`3vIl
zzk?RMHDq|}aqs!Q7n{<V(L>fKL8cX}-+~uw9|_5)uC2`ZHca<BJSyCJ7L7R3^ezpJ
zixdU%^Arizo-zh;Lga89_J>eX7L8aG6Ghleg at F9aG%X$#g6^yP5apnB>YTz&EfS{q
z9UVfSyEIczebC)qlVu5cOoMzS_jrC|)rQlAzK7sfiW0`M8mVIohazPE9Jzn*qPt%6
zZL8RELY at L09B83@Be;x5V-IHnn$}{RAT#<2JA%ttlk#^(%u}CGze|1JY5MPhbfnYG
zIw%$XfBmA-<_pKLpGKwbRF$#P;@_)ech#>vj25sv25VM$ouo)?BXdRcO{)*OwTw)G
zv43W~T6ekBMtUD%5Bm>`<n0ehww;K9t*_z=^iZoM2Gjm6Wx6QTWDzOX28g|i7p-G(
znPo(pGb2-Hja^(5g>^Ltv!w4~65N!Ut5twl!Agrzyq4O2Fi3pUMtCU~>9gt_=h-f%
z;1&OuSu?A_sJvIvQ+dZNo3?m1%b1+s&UAx?8sUHEe_sB7zkm4R%6)<@oYB_i5>3Ip
zIA+?jVdX|zL{)?TGpx+=Ta>G80}0}Ax+722$XFNJsC1gcH56{8B)*)eU#r~HrC&}`
z|EWW92&;6y;3}!L5zXa385@?-D%>dSvyK;?jqU2t_R3wvBW;$!j45uQ7tyEIQv<v(
zw)qBpyRhiKBMR9HV)v2ZJdk>a;Db}r&bR3kqNSh)Q_$MJ#Uj3Gj1F;)sO|%6z#@<+
zi{pbYsYS#u`X$Nf($OS+lhw>xgjos1OnF^$-I$u;qhJswhH~p|ab*nO>zBrtb0ndn
zxV0uh!LN`&xckTP+JW}gznSpU492)u+`f{9Yr)js`NmfYH#Wdtradc0TnKNz at Su!e
zu$9}G_=ku;%4xk}eXl>)KgpuT>_<`Ud(A^a++K&pm3LbN;gI}ku@YVrA%FJBZ5$;m
zobR8}OLtW4-i+qPPLS-(7<>M{)rhiPoi@?&vDeVq5%fmZk=mDdRV>Pb-l7pP1y6|J
z8I>sF+TypKV=_<SBxSgNFy at 5`t70+_4F<*(g54PNEt&4u%OoVR^n+$TL)qKdP6c)n
z-CoP*_kXZ4vBsj8M^2Y0nDq-^4r-wgu2Y-3fmi6ooPIXTI%UdJhw@7KgR=N+Vl3NO
zcl8-&i~^e%3E1G+u&^#M&5!sI)la$uQ2y&KsaZjx^r8D68BTZd^NrAV{0u$=#SH#4
zLE2)q%<UADH&I$um|>^NwBU^>4JJq<*14GLfM2*XQzYdlqqjnE)gZsPW^E@mp&ww*
zW9i>XL=uwLVZ9pO*8K>t>vdL~Ek_NUL$?LQi5sc#1Q-f6-ywKcIT8Kw?C<o*=Aa~-
z*eA0Mgmu5-j8rTh^;={1$#X=Ck5Gk;@KK#haYa^sXr0^_^Q84%+WOl3?#Mc#{{d}B
z>(_3pbR`e|)%9S-({if|E+hR2W!&qfQ&UiF^I!|M#xhdWsen<tq75@@WHX{+T3S~F
znoMw2v{^ia4`fkd=3p<6XkL)!lsI%8iq@>v^wpKCBiuxXbnp85`{i|;BM?Ba`lqTA
zyRm=UWJl&E{8JzYDHFu>*Z10-?#A8D|5jW9Ho0*CAs0fAy~MqbwYuOq9jjt9*nuHI
zbDwKvh)5Ir$r!fS5|;?Dt>V+ at F*v8=TJJF)TdnC#Mk>+tGDGCw;A~^PC`gUt*<(|i
zB{{g{`uFehu`$fm4)&k7`u{xIV)yvA(%5SxX9MS80p2EKnL<HSdiWFiAy=3UmV-rj
zc%^|o`X!t!vuYErrUzbG?ostY(qs7GE^=Z33k*P+F6r($h_?W-bHJ|GUK at Wlv9++M
zG}?Z?8{_X${_c9aOXw4qfk0vTaVRH6FMOnFD?w|zo{zKKg$8wzW&yufWk&idB=+9!
z^dTI@g=>t<HJ%Cd%{u~X`lRpMFg&X{m?Nw#T4cg*?z{+rC($M4z9RHV at 8KoueD7_)
z8T@i-6RG$5%_Y`lSjj|?wSvITK5c4g0!Uq49VAn-H<9~;vn7~hBdYuDOt2$gtNuBm
zo8$Y{2lwMxZNbfb$Hm0T528Og7Jfl!35edSr>CZ>tlX>*Z6nd&6-<c}7z{sZ9V^Ux
zMNgR3$iH97>Mv$5rHD*<Fmux@1NkgiA%VmyOAwal{&*L*?*@Cl?&!jtcf3KL{{|8z
z_($$R;SoAei#gUO@=7)M7s~2aAxJ>db;&IBK3KH&M<+ArlGXDRdX1VVO4)&R$f4<g
z`M~bg9+=(|cc^a3vB10?3GZiq$o|Zromh?lE2%m!alG4CIrvmRZHZVSM>NxXI>GBh
zSv|h>5GDAI(4E`@F?En<q4iBUtn-fux#Jt=qU6#PBE4-GhP)}OK!CI;i(sJ6^VIJF
zwJMEAeGKMb_^`VbA1hFYio)roSCrLG-NL5Yqhb{sh3_zt(Zg93UP*;!m?}k&V`1AB
zNYPri&yVkXW8uO1geXM3Oj&$G%~#Jd%h;?JDKwrq;P+!t&4W1Z^1?Ikguvk#bK?Bx
z$w5M*LxgRe=jz?UiDBbfC1I3!cjeMD*ueh4W0S*z6=TAf+ZYkG$}FGti`ipjpIK>W
zS>#c&Gw6~_XL`qQG4bK`W*>hek4LX*efn6|_MY+rXkNyAuu?NxS%L7~9tD3cn7&p(
zCtfqe6sjB&Q-Vs7BP5+%;#Gk};4xtwU!KY0XXbmkUy$kR9)!~?*v)qw00!+Yg^#H>
zc#8*z6zZo>+(bud?K<*!QO<vKd$8TBt^HLIw%iB>4ehiTCK&PD4G&n)Tr9X_3r-we
z?fI+}-G~Yn93gI6F{}Dw_SC*FLZ)5(85zp4%uubtD)J)UELLkvGk4#tw&Tuss<g@J
zd3(n+h;=s-joD7pea}*kl|?T5<3W!rK}V)#HpvFL3uRc{oe_mV<z1l~^m1_TkJDu3
z;JtNs6#g&&@E09TG{#Z`zh|EKwRTiJr)s50$5?Nrhn68HAr=rV#m>a)mTD$R2&O~{
zCI3>fr-!-b at EGRI%g0L8UU%%u_<;e9439JNV;4KSxd|78v+I+8^rmM<g+mx0&Si$a
zgf1uYC03KcCN)Lz!>f3f40Jb}wEszROD?xBZu>Ll3;sUIoNxDK3|j3*sam2tC@@e$
z^!;+AK>efeBJB%ALsQ{uFui)oD<x}JL&L^@dTz{b&_?*nsS;lNnoJ@(k9d5xVq$|w
z<ejC>oq()2USi?n=6C3#eetz?wPswc={I<8x=(8lE4EIsUfyGNZ{|KYn1IR|=E==f
z(;!A5(-2y^2xRFCSPqzHAZn5RCN_bp22T(KEtjA(rFZ%>a4 at STrHZflxKoqe9Z4@^
zM*scx_y73<sFS1_?6+u!sT9fvjld*kU~edMy>?Q{<Kw(x)TAd1JfBpLz7(Nk)Jsdz
zj7#eyM{0^=a(C#N_pwZ(&^&zZP@5Qw`oUBRW0i<S2ql<0tEs~>vt6?~WEl?2q*;@8
z3M*&@%l)SQmXkcUm)d at GT2#JdzhfSAP9|n#C;$E8X|pwD!r#X?0P>0ZisQ~TNqupW
z*lUY~+ikD`vQb?@SAWX#r*Y+;=_|oacL$2CL$^(mV}aKO77pg}O+-=T1oLBT5sL2i
z42Qth<Jh0Ysw=K%u7GarF`3bIM1>2+0 at C`c+*D0*5!qy26sis<9a7>LN2{z%Qj49t
z=L at x`4$ALHb*3COHoT?5S_c(Hs}g!V>W^=6Q0}zaubkDn)(lTax0+!+%B}9Vqw6{H
zvL|BRM`O<@;eVi1DzM!tXtBrA20Ce@^Jz|>%X-t`vi-%WweXCh_LhI#bUg2*pcP~R
z*RuTUzBKLXO~~uMd&o$v3 at d0shHfUjC6c539PE6rF&;Ufa(Rw at K1*m7?f5)t`MjH0
z)_V(cajV5Am>f!kWcI at 5rE8t6$S>5M=k=aRZROH6fA^jJp~2NlR4;Q2>L$7F#RT#9
z>4 at 1RhWG`Khy>P2j1Yx^BBL{S`niMaxlSWV-JBU0-T9zZ%>7mR3l$~QV$({o0;jTI
ze5=cN^!Bc2bT|BcojXp~K#2cM>OTe*cM{Kg-j*CkiW)EGQot^}s;cy8_1_ at JA0Whq
zlrNr+R;Efa+`6N)s5rH*|E)nYZ3uqkk2C(E7 at A|3YI`ozP~9Lexx#*1(r8luq+YPk
z{J}c$<WQa$CfVIhsE>s`<i2`cEPYHzF!ZIy?L$}MhAPFqQe at _8Lh#cQAH~-zZ5p$u
zZauEKr<oluR2T6z2A|B^#roi2jr3F<X4&!ZjiXo?9nIbJ4iAii=A_@&#n$TqH^#R&
z{$qMQO7u^&7KEB6l{H~A;ylPsJw2kA4#E2@7dO%lsi+3{VJ4?~e4(Bz-tw&^YR9P1
zTlpCH(W_%+@#|?%RN0HM=U?pU5$E2f<RPK1fw%3KLs--hd|lj})1h|Y<6CA3NsuSI
zl=<<g*vcJW=6yZY`aXe5QUB~awgg5fxlu%7u#A8=UXt61U-7wGtR{L&XvKbUf-}PL
z<eXA6<<r^;=`XwtFN1~2J^$Y${#Q0Tyev?j!*Z4q^mjQ4ah)uW_s=JkrRS%l*Ut`>
zPM35Fx(YWB3Z5IYnN+L_4|jaR(5iWJi2~l&xy}aU7kW?o-V*6Av2wyZTG!E2KSW2*
zGRLQkQU;Oz##ie-Z4fI)WSRxn$(ZcD;TL+;^r=a4(G~H3ZhK$lSXZj?cvyY8%d9JM
zzc3#pD^W_QnWy#rx#;<pgDoauRid_B6w$J6XKKeAcZHU9rH9=s!y`%~e@hGc<c#A7
zRRTR`&dt`*;~VYcVGk-~aNB!?q#4B&%52?dI@=%LQ>c&N at sqHhrnHRmj<I9Tx4aSD
zVUQ}9lh=Kd&QIx0uCqYm3pFs_*L;b|$xyZks(AAwgYsH85PAL~ndH7DNUoZKBHCWu
z_<;@&ed^tpoO=DG4Hem|2>#i;s%zLm6SE(n&BWpd&f7>XnjV}OlZntI70fq%8~9<7
zMYaw`E-rp49-oC1N_uZTo)Cu%RR2QWdHpzQIcNsoDp`3xfP+`gI?tVQZ4X={qU?(n
zV>0ASES^Xuc;9JBji{)RnFL(Lez;8XbB1uWaMp at p?7xhXk6V#!6B at aP4Rz7-K%a>i
z?fvf}va_DGUXlI#4--`A3qK7J?-HwnG7O~H2;zR~RLW)_^#La!=}+>KW#anZ{|^D3
B7G?kd

literal 0
HcmV?d00001

diff --git a/docs/images/glyphicons-halflings.png b/docs/images/glyphicons-halflings.png
new file mode 100644
index 0000000000000000000000000000000000000000..a9969993201f9cee63cf9f49217646347297b643
GIT binary patch
literal 12799
zcma*OWmH^Ivn@*S;K3nSf_t!#;0f+&pm7Po8`nk}2q8f5;M%x$<L>SdAkd9FAvlc$
zx660V9e3Ox at 4WZ^?7jZ%QFGU-T~%||Ug4iK6bbQY at zBuF2$hxOw9wF=A)nUSxR_5@
zEX>HBryGrjyuOFFv$Y4<+|3H at gQfEqD<)+}a~mryD|1U9*I_FOG&F%+Ww{SJ-V2BR
zjt<81Ek$}Yb*95D4RS0HCps|uLyovt;P05hchQb-u2bzLtmog&f2}1VlNhxXV);S9
zM2buBg~!q9PtF)&KGRgf3#z7B(hm5WlNClaCWFs!-P!4-u*u5+=+D|ZE9e`KvhTHT
zJBnLwGM%!u&vlE%1ytJ=!xt~y_YkFLQb6bS!E+s8l7PiPGSt9xrmg?LV&&SL?J~cI
zS(e9TF1?SGyh+M_p@o1dyWu7o7_6p;N6hO!;4~<t3w3SV570<|$VWNPP~TbX3|=X>
z2B`I;y`;$ZdtBpvK5%oQ^p4eR2L)BH>B$FQeC*t)c`L71gXHPUa|vyu`Bnz)H$Z<N
z7UVAHFsR+HLO+(tK~=M@pM7ZMPj5gkz>cXGve(}XvR!+*8a>BLV;+ryG1kt0=)ytl
zNJxFUN{V7P?#|Cp85QTa@(*Q3%K-R(Pkv1N8YU*(d(Y}9?PQ(j<e|z%-Bnrh*J1R%
z%JAF*cdp#Zk#h09fv12$TuGUsX=V-wgNcEGe0hhp%mK8EVPi6@!a;xi$k!wcIO|bJ
zPx8DZ*0Y(ggKhnp2=Ax#f<wKp{=pA29>;NzWoEVWRD-~H$=f>j<LsfOZ;WLF*F0cm
z9PSRSlSFQE>9~PN^BM2okI(gY-&_&BCV6RP&I$FnSEM3d=0fCxbxA6~l>54-upTrw
zYgX@%m>jsSGi`0cQt6b8cX~+02IghVlNblR7eI;0ps}mpWUcxty1yG56C5rh%ep(X
z?)#2d?C<4t-KLc*EAn>>M8%HvC1TyBSoPNg(4id~H8JwO#I)Bf;N*y6ai6K9_bA`4
z_g9(-R;qyH&6I$`b<fg~;S@}+8_8-ItZ!TS<!|pei*+CWiVH?M1CEFM{ij_eP4dL+
zsn%eDn^Kp7vLEn|Dq0`Wt&GpZ?eq^%pqXVR^PA!ZyoGLI7ihDaWiNi$M6h)PNwvHR
zEcA82H5fM6RnpZ!R872>42v|0V3Z8IXN*p*8g$gE98+JpXNY+jXxU0zsR^W$#V=KP
z3AEFp at OL}WqwOfsV<)A^UTF4&HF1vQecz?LWE@p^Z2){=KEC_3Iopx_eS42>DeiDG
zWMXGbYfG~W7C8s@@m<_?#Gqk;!&)_Key@^0xJxrJahv{B&{^!>TV7TEDZlP|$=ZCz
zmX=ZWtt4QZK<Y>x**)lQQoW8y-XLiOQy#T`2t}p6l*S`68ojyH at UXJ-b~@tN`WpjF
z%7%Yzv807gsO!v=!(2uR)16!&U5~VPrPHtGzUU?2w(b1Xchq}(5<TwC<%h0ow%K}h
zTlz}37c^dc?7rEmt7Zy9#q|V+5bE1c06?X{e~%TDZ!@uG_uU!n6VJy=odWKS?p#j?
zn;v){i#`+1X;Ls^(9p!?42vli(fu1D-%nf?-3VKCs1JT^-;{Pg82EGZ&|T}A#wtP(
zR^df|3P4JZ0|weuCV=JopL6MLvYycbd;-Xx_r)Hm1~(2>Ed^G|SD7IG+kvgyVksU)
z(0R)SW1V(>&q2nM%Z!C9=;pTg!(8pPSc%H01urXmQI6Gi^dkYCYfu6b4^tW))b^U+
z$2K&iOgN_OU7n#GC2jgiXU{caO5hZt0(>k+c^(r><#m|#J^s?zA6pi;^#*rp&;aqL
zRcZi0Q4HhVX3$ybclxo4FFJW*`IV`)Bj_L3rQe?5{wLJh168Ve1jZv+f1D}f0S$N=
zm4i|9cEWz&C9~ZI3q*gwWH^<6sBWuphgy@S3Qy?MJiL>gwd|E<2h9-$3;gT9V~S6r
z)cAcmE0KXOwDA5eJ02-75d~f?3;n7a9d_xPBJaO;Z)#@s7gk5$Qn(Fc^w@9c5W0zY
z59is0?Mt^@Rolcn{4%)Ioat(kxQH6}hIykSA)zht=9F_W*D#<}N(k&&;k;&gKkWIL
z0Of*sP=X(Uyu$Pw;?F@?j{}=>{aSHFcii#78FC^6JGrg-)!)MV4AKz>pXnhVgTgx8
z1&5Y=>|8RGA6++FrSy=__k_imx|z-EI at foKi>tK0Hq2LetjUotCgk2QFXaej!BWYL
zJc{fv(&qA7UUJ|AXL<Te#svgLe$GRVt~C0`%AZ+-=S0D^On=i42k@^tJ-LZGdLpRi
zdrV5?>c5z*_NW#yWzKtl(c8mEW{A>5Hj^gfZ^HC9lQNQ?RowXjmuCj4!!54Us1=hY
z0{@-phvC}yls!PmA~_z>Y&n&IW9FQcj}9(OLO-t^NN$c0o}YksCUWt|DV(MJB%%Sr
zdf}8!9ylU2TW!=T{?)g-ojAMKc>3pW;KiZ7f0;&g)k}K^#HBhE5ot)%oxq$*$W at b#
zg4p<<e2}@}ZtI091*fR6EHmhc2JFT&S+9NWaDJ!A80$GFF7R`A%xl6?3MWwFH)kiY
zKkO7P(Y}AIYl!b at wU{Hfoy`qG`h+F#SJJ{&-s<{+@b9bRRm+2<>Ou`ME|Kd1WHK at 8
zzLD+0(NHWa`B{em3Ye?@aVsEi>y#0XVZfaFuq#;X5C3{*ikRx7UY4FF{ZtNHNO?A_
z#Q?hwRv~D8fPEc%B5E-ZMI&TAmikl||EERumQCRh7p;)>fdZMxvKq;ky0}7IjhJph
zW*uuu*<F&)uV|73Nr>(Y6)S;Od--8uR^R#sb$cmFCnPcj9PPCWhPN;n`i1Q#Qn>ii
z{WR|0>8F`vf&#E(c2NsoH=I7Cd-FV|%(7a`i}gZw4N~QFFG2WtS^H%@c?%9UZ+kez
z;PwGgg_r6V>Kn5n(nZ40P4qMyrCP3bDkJp at hp6&X3>gzC>=f at Hsen<%I~7W+x@}b>
z0}Et*vx_50-q at PIV=(3&Tbm}}QRo*FP2@)A#XX-8jYspIhah`9ukPBr)$8>Tmtg&R
z?JBoH17?+1 at Y@r>anoKPQ}F8o9?vhcG79Cjv^V6ct709VOQwg{c0Q#rBSsSmK3Q;O
zBpNihl3S0_IGVE)^`#94#j~$;<ISbQ+zLM8Q_sWpD4<&Sicl|!a~&A@PH`UFRr4^t
zSjAA>7+u870yWiV$@={|GrBmuz4b)*bCOPkaN0{6$MvazOEBxFdKZDlbVvv{8_*kJ
zfE6C`4&Kkz<5u%dEdStd85-5UHG5IOWbo8i9azgg#zw-(P1AA049hddAB*UdG3Vn0
zX`OgM+EM|<+KhJ<=k?z~WA5waVj?T9eBdfJGebVifBKS1u<$#vl^<Wg*!!OoyJ@GG
z%+_%2Ex-A(=Z(Bs6q~agBwBL+Pcns5yTYUCI_zEv3JOnOB;7f=h8xGf|IQl+Qw37#
z{BhR?wjaFo)FpPNNRkn616I`fE=rl+<Vv=sXw)oTB*nsxZd}^hq|lwuLq2tPYK9Ch
zP~rW|kx{-S+q;ojdznAWu9)x>BvSg)xsnT5Aw_ZY#}v*LXO#htB>f}x3qDdDHoFeb
zAq7;0CW;XJ`d&G*9V)@H&739DpfWYzdQt+Kx_E1K#Cg1EMtFa8eQRk_JuUdHD*2;W
zR~XFnl!L2A?48O;_iqCVr1oxEXvOIiN_9CUVTZs3C~P+11}ebyTRLACiJuMIG#`xP
zKlC|E(S at QvN+%pBc6vPiQS8KgQAUh75C0<L{Rx=;M-*LCs2Bp<jfOoZepIeH1&E9@
zECcRp6~TSaxo9}VYr%Om){SqtW<MPRfw2-K1_c9&KORpSyh3Z*9=_y`d-Pn0_zAw+
z=kYI%Xg`=LN{&qw<HTtk2MKE0r;WoX$l}>a2xcPQDD$}*bM&z~g8+=9ltmkT$;c;s
z5_=8%i0H^fEAOQbHXf0;?D<BP;<HVQI1JZt*v)6RAq&gagO^!F$spXEh)>N5z-5+1
zDxj50yYkz4ox9p$HbZ|H?8ukAbLE^P$@h}L%i6QVcY>)i!w=hkv2zvrduut%!8>6b
zcus3bh1w~L804EZ*s96?GB&<V5y;va8bgv&LhJ<YYLxjoJ6PJ;r2T$n2GZZ+&blBq
zN@;fP%v^kz^?uH{Kpq(Ih{eCW5OnE5%HakzY6sMl!wfw!(lBl{oyDuNM|bEKU#YtR
zTTK?n-{?&5Szx)y^~WKl(fG>F7c5?m?|t$-tp2rKMy>F*=4;w*jW}^;8v`st&8)c;
z2Ct2{)?S(Z;@_mjAEjb8x=qAQvx=}S6l9?~H?PmP`-xu;ME*B8sm|!h at BX4>u(xg_
zIHmQzp4Tgf*J}Y=8STR5_s)GKcmgV!<zLBv<JCu*R*$7_b_L{9GvwPbpvkT at 1&MS$
zijYfuLM?Pa-BA2}iX9A(2K)AF@cP6QkvvCLyswdDf?LI~tZ|qKPtWR#^oamFBRcUk
zs5b$Sc+=%VrL*7Ba(pp>$JKTg at LO402{{Wrg>#D4-L%vjmtJ4r?p&$F!o-BOf7ej~
z6)BuK^^g1b#(E>$s`t3i13{6-mmSp7{;QkeG5v}GAN&lM2lQT$@(aQCcFP(%UyZbF
z#$HLTqGT^@F#A29b0HqiJ<ZOKS1P#S0IU6AksffR*wx4ca5r>sRJAlh8kngU`BDI6
zJUE~&!cQ*&f95Ot$#mxU5+*^$qg_DWNdfu+1irglB7yDglzH()2!@#rpu)^3S8weW
z_FE$=j^GTY*|5SH95O8o8W9FluYwB=2PwtbW|JG6kcV^dMVmX(wG+Otj;E$%gfu^K
z!t~<3??8=()WQSycsBKy24>NjRtuZ>zxJIED;YXaU<x|u=Vd7uuZ|>z$@0z4rl+TW
zWxmvM$%4jYIpO>j5k1t1&}1VKM~s!<EQ6q8U;EP6<gFYZ!m%POxUBC$P89e*7OnrM
zdWQA)CjX#LYDI-i*mnQZr;sN<6@SPOXNM}9Rp_hcE;y>eLsCVQ`TTjn3JRXZD~>GM
z$-IT~(Y)flNqDkC%DfbxaV9?QuWCV&-U1yzrV at 0jRhE;)ZO0=r-{s at W?HOFbRHDDV
zq;eLo+wOW;nI|#mNf(J?RImB9{YSO2Y`9825Lz#u4(nk3)RGv3X8B(A$TsontJ8L!
z9JP^eWxtKC?G8^xAZa1HECx*rp35s!^%;&@Jyk)NexVc)@U4$^<D$wmm?XpH-Sg4*
z8B^w;<H>X1Dag6`WKs|(HhZ#rzO2KEw3xh~-0<;|zcs0L>OcO#YYX{S<TTw)*(lZC
zIx888OkDY0a@=pFP3fhTGE0#kua@EqJ8hp4VSNt-Xfx&Iq8mr)#UbJIBdW*?_9fdi
z7f!0)Iy{xeM7LDi+*QJ?BdGeD5e0(0aSm&GvjQ!V6CD0we*R)~MbsZ|>N8m6`9pp+
zQG at q$I)T?aoe#AoR@%om_#z=c at ych!bj~lV13Qi-xg$i$hXEAB#l=t7QWENGbma4L
zbBf*X*4oNYZUd_;1{Ln_ZeAwQv4z?n9$eoxJeI?lU9^!AB2Y~AwOSq67dT9ADZ)s@
zCRYS7W$Zpkdx$3T>7$I%3EI2ik~m!f7&$Djpt6kZqDWZJ-G{*_eXs*B8$1R4+I}Kf
zqniwCI64r;>h2Lu{0c(#Atn)%E8&)=0S4BMhq9$`vu|Ct;^ur~gL`bD>J at l)P$q_A
zO7b3HGOUG`vgH{}&&Agr<FnKy|IF(G1iR*`GW247VX<aAlJ2F?Q<={Aib+`}_HyE*
zujP5~Z9 at I2PBhiOY}cNA6jXAuIimavj#$XIs@HezE!U24{*GtAdHFvr(O>Fy%K^>?
z>wf**coZ2vdSDcNYSm~dZ(vk6&m6bVKmVgrx-X<>{QzA!)2*L+HLTQz$e8UcB&Djq
zl)-%s$ZtUN-R!4ZiG=L0#_P=BbUyH+YPmFl_ogkkQ$=s at T1v}rNnZ^eMaqJ|quc+6
z*ygceDOrldsL30w`H;rNu+I<VKUrjL=bDy~WtS;;K#ThRGVRMNFq&Gco*pd+ChOJI
zqAbbk-&kSt%3!MCpue~I%|gblH{=P#-)jqQC%xCp|J^jUO>jlS+G~p&0SawXCA1+D
zC%cZtjUkLNq%FadtHE?O(yQTP486A{1x<{krq#rpauNQaeyhM3*i0%tBpQHQo-u)x
z{0{&KS`>}vf2_}b160XZO2$b)cyrHq7ZSeiSbRvaxnKUH{Q`-P(nL&^fcF2){vhN-
zbX&WEjP7?b4A%0y6n_=m%l00uZ+}mCYO(!x?j$+O$*TqoD_Q5EoyDJ?w?^UIa491H
zE}87(bR`X;@u#3Qy~9wWdWQIg1`cXrk$x9=ccR|RY1~%{fAJ at uq@J3e872x0v$hmv
ze_KcL(wM|n0EOp;t{hKoohYyDmYO;!`7^Lx;0k=PWPGZpI>V5qYlzjSL_(%|mud50
z7#{p97s`U|Sn$WYF>-i{i4`kzlrV6a<}=72q2sAT7Zh{>P%*6B;Zl;~0xWymt10Mo
zl5{bmR(wJefJpNGK=fSRP|mpCI-)Nf6?Pv==FcFmpSwF1%CTOucV{yqxSyx4Zws3O
z8hr5Uyd%ezIO7?PnEO0T%af#KOiXD$e?V&OX-B|ZX-YsgSs%sv-6U+sLPuz{D4bq|
zpd&|o5tNCmpT>(uIbRf?8c}d3IpOb3sn6>_dr*26R#ev<_~vi)wleW$P<Wyn_7n0-
zl)LIgF0z;$xTz(0JgW0t|K0{|pl+d7{+{fAW)lB*Qg({z1~qrplnmDSP!2>X|5)$_
z+_|=pi(0D(AB_sjQ;sQQSM&AWqzDO1 at NHw;C9cPdXRKRI#@nUW)CgFxzQ1nyd!+h&
zcjU!U=&u|>@}R(9D$%lu2TlV>@I2-n at fCr5Pr<dtPlfA<Z*`%$WS?W!M7-X at Sw}lf
zu7sLkI`BK6gTBwv0nqdk^SqiGBO}U16-Ky}DlzfpVxxnEAc|MG(;#A7b;H&MP*riE
zHr?l)sap(Q`P6U_@Ov18QJwI7yr|=6Y+TbD2PUEPfsh&V{s?8AA2dT>ZNVyKWR7hm
zWjoy^<!R*J%IXEk=E5cj6b=;i9u3uQuMH4{qOT^=OGnt_=n2>p7v8m#$qN0K#8jT-
zq`mSirDZDa1Jxm;Rg3<Jf$!Bj9`<kE;Sz+T_M)m3-f__2l^&CsYnIwV?+%t2FG{Ta
zI-67-X7Fu-xbrdN@cn6z3_k9VZ?2i{<ie%nx)UUiUTLNtHEK)0HD_qUYpV0X30}z?
zM!*@omRu>rAPhC)LcI4 at -RvKT+@9&KsR3b0_0zuM!Fg7u>oF>3bzOxZPU&$ab$Z9@
zY)f7<va9`_LvY6!5H@PMYi?(=yM97@*rbrsB=oh`t5ydnN2A;15DysI3n?zsE3{ZX
zq+yK*u5H1rVq8mwv!|dvE&PWazz!0^LY7dozu5qaS3Q5~q}uAQUJN5WW+A&wvpho?
z=!z1Q9;>pKh22I7ZykL{YsdjcqeN++=0a}elQM-4;Q)(`Ep3|VFHqnXOh14`!Bus&
z9w%*EWK6AiAM{s$6~SEQS;A>ey$#`7)khZvamem{P?>k)5&7Sl&&NXKk}o!%vd;-!
zpo2p-_h^b$D<fdz<@`H3n|HeSVR76K at 6|_9&-VHAVO=;`v1rN8I|9P)PS7vp83efu
z`yTr9OVLz|?h*IHce7sdT@Ktb#!>NBO>{h4JdGB=D>fvGIYN8v&XsfxU~VaefL?q}
z3ekM?<wNDtI4J<DC6XBgM26Nv#0iut=ZwA#^>iOKkCzQHkBkhg=hD!@&(L}FcHKoa
zbZ7)H1C|lHjwEb at tu=n^OvdHOo7o+W`0-y3KdP#bb~wM=Vr_gyoEq|#B?$&d$tals
ziIs-&7isBpvS|CjC|7C&3I0SE?~`a%g~$PI%;au^cUp at ER3?mn-|vyu!$7MV6(uvt
z+CcGuM(Ku2&G0tcRCo7#D$Dirfqef2qPOE5I)oCGzmR5G!o#Q~(k~)c=LpIfrhHQk
zeAva6MilEifE7rgP1M7AyWmLOXK}i8?=z<j)TsCg#MI>2;N=no)`IGm#y%aGE>-FN
zyXCp0Sln{IsfOBuCdE*#@CQof%jzuU*jkR*Su3?5t}F(#g0BD0Zzu|1MDes8U7f9;
z$JBg|mqTXt`muZ8=Z`3wx$uizZG_7>GI7tcfOHW`C2bKxNOR)XAwRkLOaHS4xwlH4
zDpU29#6wLXI;H?0Se`SRa&I_QmI{zo7p%uveBZ0KZKd9H6 at U?YGArbfm)D*^5=&Rp
z`k{35?Z5GbZnv>z at NmJ%+sx=1WanWg)8r}C_>EGR8mk(NR$pW<-l8OTU^_u3M at gwS
z7}GGa1)`z5G|DZirw;FB@VhH7Dq*0qc=|9lLe{w2#`g+_nt<uBB~iQoK%j+BR{KW$
zxUoEE;u<56rl_>>_%o<~9(VZe=zI*SSz4w43-_o>4E4`M at NPKTWZuQJs)?KXbWp1M
zimd5F;?AP(LWcaI-^Sl{`~>tmxsQB9Y$Xi*{Zr#py_+I$vx7 at NY`S?HFfS!hUiz$a
z{>!&e1(16T!Om)m)&k1W#*d#GslD^4!TwiF2WjFBvi=Ms!ADT)ArEW6zfVuIXcXVk
z>AHjPADW+mJzY`_Ieq(s?jbk4iD2Rb8*V3t6?I+E06(K8H!!xnDzO%GB;Z$N-{M|B
zeT`jo%9)s%op*XZKDd6*)-^lWO{#RaIGFdBH+;XXjI(8RxpBc~azG1H^2v7c^bkFE
zZ<!d@6;Xr=zrz^$h_Zbcf~Z$lrrBw0nL?BbB`hkkx&01qcs_@(`dj5M$3rI2JKgsr
zS^x~?G~LTF&PL>CVPE+E*Q=FSe8Vm&6|^3ki{9~qafiMAf7i4APZg>b%&5>nT at pHH
z%O*pOv(77<h_P}M1fVl at bA%;8!%G$2v2^1K;a|J|258iaFK<JsY+PvseEryJp$5<!
z9lXGNp5qrv`T=s~_@3Ry-B6o<m;T-lQtjLZ)m`X2mKrN#6`?5SI5G#qCc`>?ZiT{W
zBibx}Q12tRc7Py1NcZTp`Q4ey%T_nj@<r4RLoFiQ1cOG!U!@-f&DrHzjFreg6r@E|
zvE{2Q=kFJS$gwo*FVtl=epg~LzgZ(&E7V*y3ct|~AGvI-3JcYr{%DF#=;?cH6~ge-
zxOld^6>1WKg5Fz_Rjl4wlJQj)rtp8yL3r!S<K<bid;Q+mY&EMZN}!KaieT~EVI>hy
zvZvnmh!tH4T6Js-?vI0<-rzzl{mgT*S0d_7^AU_8gBg^03o-J=p(1o6kww2hx|!%T
z-jqp}m^G*W?$!R#M%Ef?&2jYxmx+lXWZszpI4d$p<r;|3!?@3AW<2Zgi0<hN9ff)N
z(zo6I+-$9Bx*(c$-bk0EGqBsb91nmH7yrN`CVj(QCaD{RJgvV-JPkoBQAwGD;nyzn
z*I;L?L=(3oeAQ<rjW4NvWy!bHdLOHMjezGb#Hb+lSX`#>UN`(S)|*c^CgdwY>Fa>>
zgGBJhwe8y#Xd*q0=@SLEgPF>+Qe4?%E*v{a`||luZ~&dqMBrRfJ{SDMaJ!s_;cSJp
zSqZHXIdc@@XteNySUZs^9SG7xK`8=NBN<V=E)OCgg+S0s%X at m8dOqs;y*2U#C_D)u
z81;Mt5p^uC3PVJP at 9PH9!<3b5IE^n;kwm}NvP7!(7^P%;1DOYVJumd1Eg9zSvb at M<
z=8_n~reVNX{Rwy18un@y&;emesWi1XQooSmDu!<kFo)-HRP5pn?;0r-+4i~5mY$28
z(;>M)fRVOjw)D^)w%L2OPkTQ$Tel-J)GD3=YXy+F4in(ILy*A3m at 3o73uv?JC}Q>f
zr<Ie&tGbM^0N<roTuDj*?S_O(I}B&He=e8Pl8`tjGg-O~5%TUI<1yQ05r*$Oc2#s#
z8%FWrdDtn79-cwa2pX4M_-JFx9zK7mChDM?zK(~_K9>Y&8SWmesiba0|3X-jmlMT3
z*ST|_U at O=i*sM_*48G)dgXqlwoFp5G6qSM3&%_f_*<qxyINw1$We6It<0I>n!P<uj
z?87vdPOI3mk{cGX^R<>iT>?cNI)fAUkA{qWnqdMi+aNK_yVQ&lx4UZknAc9FIzVk%
zo6JmFH~c{_tK!gt4+o2>)zoP{sR}!!vfRjI=13!z<fc;{t9y2@_q+%poab^!jwREr
z2+#Zf9d~36snX-iZ(5U>5}ijMFQ4a4?QIg-BE4T6!#%?d&L;`j5=a`4is>U;%@Rd~
zXC<xcC%fK=hCSNPW&)8o$8W+KO-SU#5LbV{{RyL+099LpC;6!uxU&{MmE<Y{b<h52
z$81YnCmIWu(0dlOntRk)&>~H7eGQhhYWhMPWf9znDbYIgwud(6$W3e>$W4$~d%qoJ
z+JE`1g$qJ%>b|z*xCKenmpV$0pM=Gl-Y*LT8K+P)2X#;XYEFF4mRb<YTI|Oo*wqC5
z0h9Vcyd1-aYw_k;tVodW95W2hdEX}FLSrp|R+GE56fkm-P)-t$V)|A=l7x|mefFZC
zXMAilrJt8o)%dz@>c~jj?DM@(1e`nL=F4Syv)TKIePQUz)bZ<lVCgA$*!Fmgxl6o%
zjdFR@&JKgonL5u$SS;U)hR2JO%(X!<3`;2ma}g7i__wVr1m~_yKAfNhm3c!NlBG8F
zi*)rX!5cY!j#B&Bh5F)#rbPS@4QDD~@ulB?(x|5|p4JWn*dAG|<;_kq<4J3{W|V%$
zFux+io?Ym>?Bi3 at G@HO$Aps1DvDGkYF50O$_welu^cL7;vPiMGho74$;4fDqKbE{U
zd1h{;LfM#Fb|Z&uH~Rm_J)R~Vy4b;1?tW_A)Iz#S_=F|~pISaVkCnQ0&u%Yz%o#|!
zS-TSg87LUfFSs{tTuM3$!06ZzH&MFtG)X-l7>3)V?Txuj2HyG*5u;EY2_5vU0ujA?
zHXh5G%6e3y7v?AjhyX79pnRBVr}RmPmtrxoB7lkxEzChX^(vKd+sLh?SBic=Q)5nA
zdz7Mw3_iA>;T^_Kl~?1|5t%GZ;ki_+i>Q~Q1EVdKZ)$Sh3LM at ea&D~{2HOG++7*wF
zAC6jW4>fa~!Vp5+$Z{<)Qxb|<doy+ePfu6oC(7$`&WuO0q0$+a9a%yz_{5phPWBz7
zW*;>{unMgCv2)@%3j=7)Zc%U<^i|SAF88s!A^+Xs!OASYT%7;Jx?olg_6NFP1475N
z#0s<@E~FI}#LNQ{?B1;t+N$2k*`K$Hxb%#8tRQi*Z#No0J}Pl;HWb){l7{A8(pu#@
zfE<FZzTROa?{|??!(1M&=4t#qdoS<^Na+oYIxC;QnUK0am at X-v$)ut<3yca1@z&t9
zM)d{X_R6>-OTvEreoz1+p`9sUI%<waswQ*s(MUS7r-ADfL?@KW0)mbJ;|S&qT$0vX
z+3A>Y{e5L-oTP_^NkgpYhZjp&ykinnW;(fu1;ttpSsgYM8ABX4dHe_HxU+%M(D=~)
zYM}XUJ5guZ;=_ZcOsC`_{CiU$zN3$+x&5C`vX-V3`8&RjlBs^rf00MNYZW+jCd~7N
z%{jJuUUwY(M`8$`B>K&_48!Li682ZaRknMgQ3~dnlp8C?__!P2z@=Auv;T^$yrsNy
zCARmaA@^Yo2sS%2$`031-+h9K<HTVTe5)EQvp!MW(iadmCJS1wSbK_ at ufo=dlOY}z
zCO9zVYKg|I&o<%8Sb*|F!S|!19op-p&g=TZ%N9@L#(UmyHRFj))9t+gQpBfbTesf-
za`2nVU~8Sd4Kd<Xb>MZsIHfB>s@}>Y(z988e!`%4=EDoAQ0kbk>+lCoK60Mx9P!~I
zlq~wf7kcm_NFImt3ZYlE(b3O1K^QWiFb$V^a2Jlwvm(!XYx<`i at ZMS3UwFt{;x+-v
zhx{m=m;4dgvkKp5{*lfSN3o^keSpp9{hlXj%=}e_7Ou{Yiw(J at NXuh*;pL6@$HsfB
zh?v+r^cp@jQ4E<vE>spC#RqpwPY(}_SS$wZ{S959`C25777&sgtNh%XTCo9VHJC-G
z;;wi9{-iv+ETiY;K9qvlEc04f;ZnUP>cUL_T*ms``EtGoP^B#Q>n2dSrbAg8a>*Lg
zd0EJ^=tdW~7fbcLFsqryFEcy*-<UjNQKPSE=_Pn2>8!?;n%;F+8i{eZyCDaiYxghr
z$8k>L|2&-!lhvuVdk!r-kpSFl`5F5d4DJr%M4-qOy3<bq6e{+%w<EWihn1$%KzFfu
z`LKHky~)zdoi4^H8U?2zL}?l1u6MD%jgB7&*;Qf>gdmQb<G$UVN?JmKSKB~L!OR=i
zI@^y#3#{3i>qF1=aBtRM<!CT741&i5jO+s2lsMXtwRPLCm;Sn!-GpQ>7)c_Ae?$b8
zQg4c8*KQ{XJmL)1c7#0Yn0#PTMEs4-IH<W7>Pjkn0!=;JdhMXqzMLeh`yOylXROP-
zl#z3+fwM9l3%VN(6R77ua*uI9%hO7l7{+Hcbr(peh;afUK?B4EC09J{-u{mv)+u#?
zdKVBCPt`eU at IzL)OXA`E<o1(5;mC6=k at -!Ol2~E}J9hOE??)KsP;2EQ2{Z(0gwv}f
z!It<n&*dKHQo4x|g+0u^h~lZ5Ov4IC#Tfq*CptilVN;HXz`iK4{1F;tZh8So5XLY*
zXxgB;G7CZ#<Iv1X4e=NIfHyT;2#ek12;Y}7qA*ja41jVbduyrB$HRMX3i4#!N49oM
z=DRz&*@5P2{)@K+w!!IcW58;P<<)I=(H60m7Iz@T{w1f<%~zS?f9pR^Y*#fpT<Noz
z19vhe>bu`Xp?u0m%h&X41}FNfnJ*g1!1wcbbpo%F4x!-#R9ft!8{5`Ho}04?FI#Kg
zL|k`tF1t_`ywdy8(wnTut>HND(qNnq%Sq=AvvZbXnLx|mJhi!*&lwG2g|edBdVgLy
zjvVTKHAx(+&P;P#2Xobo7_RttUi)Nllc}}hX>|N?-u5g7VJ-NNdwYcaOG?NK=5)}`
zMtOL;o|i0mSKm(UI_7BL_^6HnVOTkuPI6y at ZLR(H?c1cr-_ouSLp{5!bx^DiKd*Yb
z{K78Ci<l%%epWQ$#NR9uIf5|S3KV`ZTJ$&qJ6`ry!VhqBuPs(j#jC&+5r^-xzR6fB
zK27~T)ZekimVRRz-lpCAJu2yR?1~gIvHR5a1NYj$*q3Netl55}ts!oix2<m^q4oKA
zx&s$GFeBD?)7%@b7gCQPQkbzcY-#e<IqbmH&`NOUj{m_7zrJE%0%MGK`P$ftHCCyA
z#QEOkdexcb5q+aRNqFbL{IkS#hFvjjH9v~WbirfMFFJD$DOv0$f8V^PmC)h at B?4Tt
zm|Lni^t};e&92Z{h%k-#j#z#sF&$u2EIp%nX3YhhH9Z@UzRMIVYuCt&$V#l>&Twup
zTKm)ioN|wcYy%Qnwb)Izb<b#d)i{+1p{kvKer6Fm8jK>H>W!;Ah5Zdm_jRY`+VRJ2
zhkspZ9hbK3iQD91A$d!0*-1i#%x81|s+SPRmD}d~<1p6!A13(!vABP<Z{iwC7e4%~
z_Ln8-%lvcLY32-Y@1SO1*q92_(j#+rhCS=CLMntrY3Mry$(OvuZNSYRrU>2kNgqEG
z?AMgl^P+iRoIY(9 at _I?n1829lGvAsRnHwS~|5vD2+Zi53j<5N4wNn0{q>>jF9*bI)
zL$kMXM-awNOElF>{?Jr^tOz1glbwaD-<Z?hQEA3Pbch{-zrz(GmD@~J*ag^+fZsaw
zY>M0OKOlTeW3C!1ZyxRbB>8JDof(O&R1bh%3x#>y2~<>OXO#IIedH0Q`(&&?eo-c~
z>*Ah#3~09unym~UC-UFqqI>{dmUD$Y4 at evG#ORLI*{ZM)J<p{vwhmRDEF0r$s4y_e
z=sJVWn|ZM-lg`hKmi%p5C*Kde*o`ZFJEf1Ej+^5AxXqpoV)MlQbue7)^k_qkb+e;`
zWde0R#5(=H5cM$dK9LAsdS=Yk0oGNTPVR(|j6Ls{ih2+`6_F=VxMEkqB<u_yrMn-7
zem-jG!zg{VfBK=QGIg$ZuYze9uWx?aDxho7OdK|L{6b`Vwt6C>l=e1it!XzY($S3V
zLG!Y6fCjE>x6r at 5FG1n|8ompSZaJ>9)q6jqU;XxCQk9zV(?C9<V#w?Lf%1Im<}?28
z%fv0sO4GSZ%zfKH*&?O&xk<I#mt_{KWN at l7yB^%JPt=7^LfPgcr~mEkBmfFP7Db0M
zd#E!M<3epZs@^{m3?RG}!71NRBMkEamf~hxD%`6taJAN-7_P+KIU~cqcmswNPF@u0
zBEd?J2tVMNdm+C_OO1xnDaP<CvO06_?;7EsCcbdr{cefhRUYuKyPaC&4Q})>+i*>w
z21+KYt1gXX&0`x3E)hS7I5}snbBzox9C at Xzcr|{B8Hw;SY1$}&BoYKXH^hpjW-RgJ
z-Fb}tannKCv>y~^`r|(1Q9;+sZlYf3XPSX|^gR01UFtu$B*R;$sPZdIZShRr>|b at J
z;#G{EdoY+O;REEjQ}X7_YzWL<b@Mth=4xckE^wJmIQPsUfw>O+Ey3>a_KDe1CjSe|
z6arqcEZ)CX!8r(si`dqbF$uu&pnf^Np{1f*TdJ<q2__L6D at tfPK*~rzVm(OhYZi{~
zO7D1Cy0z3WdT1AOu^h7D1_(%nFOYSW(8K@CEF1cpVqIf7{ZixjH(=6Z%>`r2;@SaZ
z#hb4xlaCA at Pwqj#LlUEe5L{I$k(Zj$d3(~)u(F%&xb8={N9hKxlZIO1ABsM{Mt|)2
zJ^t9Id;?%4PfR4&Ph9B9cFK~@tG3wlFW-0<w~5R`uK#F{bA6_apO|PKuT2G1V=wh!
zZWPJWbbu)nGiWn?;_;mE<K|T11{jR4I#*v{H=AUuEc3+UXA@7uIuDpTy`jcYhUz%o
zBA}z0OR6}0Iqx8Rc?*~((>fXZS_L4U*EiAA%+`h%q2^6BCC;t0iO<j7`ENmUd8a;m
zq?b}^r<Irhn?t82<3YNwQO;C at tCYRR<pR}s5&giTT+nc?H}mtH3ZX|EFpV#H_g4in
z8Tbrg7JdfQvFh#<ovHft;`1YsxU2!leoc~Y)qNFc1mAL8P2+9584$1X7q1nBToy)y
z$s4}XIl~zQ7=m5m-cT at n8wijJJ$|#uxO(nL+IWs9qk?i9%s#W2ZxqfW`jt6{wIS^q
z*iUq6jHCeqca?Re1w*!C)k-nH(eV#(PnPU`?~ov%Y+nj9)j3~WBrKHnC<W0QlTNC*
z<u_q0O?_PoEKdE%)ty at V5F=^-=y+E`(D|T`;&Jjf?_7CST84~oRyM!RwLEZ{ZM at iY
zIB{U~Ge+IK^?H|Bpj8js3(0P2EU%fWNhAH!9B5rA(2TXL071s~i2t!VlQfp=S*6A2
zkt-CN_z|1uc9QB1_^Gpz5);n_@pEbj*T#DvuqJuuKb_PutQhcu6?7{m7g7o;mzZA9
zf{W$DK$@&k565^Y7M*vmK#vF0i(Zb4TM%~5g7C?du<oAbjjU>4V=s4Qug{M|iDV at s
zC7|ef-dxiR7T&Mpre!%hiUhHM%3Qxi$Lzw6&(Tvlx9QA_7LhYq<(o~=Y>3ka-zrQa
zhGpfFK@)#)rtfz61w35^sN1=IFw&Oc!Nah+8 at qhJ0UEGr;JplaxOGI82OVqZHsqfX
ze1}r{jy;G?&}Da}a7>S<aX|!tNbjGLu?E#M_FQ+tx7QwU!f|T#|0pGw8beze%W}X8
zTh%o9Dbrk*KF8LN?^<3buL7%?KbkRMr_jMII=xY`U$vl5f0r@#H-|^ToExGU<wfLd
zXr+GANZ(jz6qI7<1HwuGyQ7H^naJ1E$XxZfl>CDsFDuzusee<BvkaOnN;I1*%q9kj
z^#m2ll1tq&oMv5g`}?0u!-DOva7&B0@Z!bH=K`f(k?GfNkG{%)>CKof|Dz2BPsP8?
zY;a)Tkr2P~0^2BeO?wnzF_<l4Nvqf<W`7QjWtJDSw)B?FOMa{8DG?kxHAQnVhPF5z
zxnU_-^up4Prel^ed-PkB1+y((Pnm`A;p#0KHiAU@r9|EKB!f~*!CI?=fpguhu1lxJ
zNfwd#_vJ<v;}^GGOcxE|6OXh~-#_DXMEuzGXcF>Ul-ekY=-w26VnU%U3f19Z-pj&2
z4J_a|o4Dci+MO)mPQIM>kdPG1<w<ic`+WErB>xydiR9@#<n}&^Z@zb@F^w%zU4>8m
zh27D7GF{p|a{8({Q-Pr-;#jV{2zHR><r}G)UYxpAdB=!PS*(C~*1H#i#3#T1$j2)t
z81k%ZC~^7K<oMng7XOD4<}b)aGe_1j<vxx~;=~OWNZThvqsq&|9D#PlGC$L88fM!1
ziqq3RXQ^4C*>lGoFtIfIpoMo?exuQyX_A;;l0AP4!)JEM$EwMInZkj+8*IHP4vKRd
zKx_l-i*>A*C@{u%ct`y~s6MWAfO{@FPIX&sg8H{GMDc{4M3%$@c8&RAlw0-R<4DO3
trJqdc$mBpWeznn?E0M$F`|3v=`3%T2A17h;rxP7$%JLd=6(2u;`(N3pt&so#

literal 0
HcmV?d00001

diff --git a/docs/images/menuconfig.png b/docs/images/menuconfig.png
index 8b88ccba53e75d6423d53b32487f2984e8dda81b..dffddfa4692713a67f0ae5f0b2c881dd44335923 100644
GIT binary patch
literal 8604
zcmV;NA!FW&P)<h;3K|Lk000e1NJLTq00C40007(w0{{R37}%+X00001b5ch_0Itp)
z=>Px#U{Fj{MF9f<0s=4#0FwX)^c at t_02=c=I5$*PQchlSQB?P7Xl6-j`UI6`0FU?D
zWn_JO@r{g$h?lB1x%HQx^{lF;0POw0!sp%BC2ICy)6mPt>c9H$0OI7(>*L(y=HvDD
z@;0qLZU6uv>PbXFRCwC$ed~7PxXx_mqeV*4RtvIVP0%N(djGdPKPcI9E}dj1=}X2~
zoz)IakyHgFK at gX_EI0aKy1NtJ=!2=;34K~=2}DF-{khTegm7CaV*BK~Px(%0!%EYN
zCHSP78|{d0^@Dk=pWL~9GUhv>ZJatq1S9A<BFG3bNRl@kugRSiTo0q0Io-onWG(WY
z&=G+E!aYK!2a&ttCJHNJrHIIK!|@TQ7fxllySoebFzTJ$*$S!w?(Pov2+O(EJF~ld
zH|d?po!&{#HyodUO0J-aQ`{{qnD2zXg6b=oM?B=a$?x3n)LieVcYbGb1N9N87WwWj
z)7*_kEmu(WF5h`P18QzHTh1<7Oz+|b>I<N%s)o5+n5u?bSeS<T#;NCx$|KyP!fR&h
zFYenKa-%b->zeB4JwI&6#XC^d-6PKb!o$6O_8aZ!BB#1Pl~dQ<|HgVBOZo10_Wy9o
zcQ^VB`s@F0^r7_E-QC?^=~-&}CZ+zl^6gXKq`v;rr%$7<PpRwDOJhvGA^iZ<Q{SZK
z*gPrkPur(s-}I*@rPQ3RtM$X>^Dqoea~zsxI3AkeSW)PXLvuV1!}C3FwQ6roO3zjt
zhLpPF?+ at x>7 at B4n(l88NcNz|dVMwVThVB~Fp>KvXbp6m(IEUes`e8UUL!X*qNd4(F
zq?A%Kq at hXaG#vY37>52hoKl7V)E)cNuyNbk-Y^VJN+}Jerb+#9Xog{Ej;A5 at LzkLi
z7`h=1P3>rC`qQcJhCZc!=$h@(-w at R1)HmtWABWR0oYJXFsXL|S)UB`IcPpreQ-4aQ
zp*aodaB9+U>Q3o+Y?@Pd?2r9$Y=+9<&9ON)sXwMucRU`4{?wg@)1h+qY3PSzpZY%a
zr@lKJo8#fs9fy=sIu0rIr|#6Bnp4-Gn$#SRX*l+$;gn9zaB7-nI31hgv1x`=>eiaW
z?+9wsq~?@TIyJ-b*mtLNI;7N`Qgcf6UAJ-fr*!I1={Th03hFVP(s8IYPlw@@hT}Gm
zhtwTYI(5Tw7 at AXR`cu;!QaUxqA*JDzPRDfUhf^AkLpr77u|8G5>QCv^_otN7 at tBUs
zW(D<_(y2cl)A5*6f7*ugdxCoEQyPv#(;ttA4b)~h4b3oI54bxG$L2VkhW>Qy({VU7
z$Dsm09FI+ZJa%cD+K1C2osL7-9gof7c<fVu>?<Q4kIgU~yLI{>)8W*mQ?ss}$DwbI
z$Kh~Fr>;Mx)E|%i;W(VS<4{384#y$&r@lL$hGsYp%_$xG-*=;GQfjV#ZPH;lJ=%Pm
ztzz?}`qNLTdG2$wFMqNeHji3JsY%1}cqweoqiddd{5RhH&%0OmTa3Cpq(6n;0P2ly
zpx!|J;-C&U`VhJTwYkxU&~5tP*3=uQH&C}<=H*8Jkj585T^`~m+8Y93kili-JTHuR
zn70uGgF#{)PXKFC5c5pdiowm+iwqLr!#vk7f<Nz7BI03w8C2pYQa_F}0brSdek8zg
zBw|;kTL1vdIL})V#}UB1?5eFFqn`uw9J`{QLnQc{fExWg&-1*D%Q)g;oEh`n&r3hg
zn8yY4IAiR_C4d-b#xjq~GS1`D_cP{k;WCc%Jfp`rj>|I7%iQ(LJkG>CE=xa;KkZH2
z?1!NKyqS;a=W!Y5rQ_0p<NOfaGR{l4#5gbg+ at o92Em3RoVI0@Oc_i4+5B)s%^N0 at p
zjF{(ce&}a%9Ba*PefB533r+KnLH&uG+AZ at q&Px|d2aY3GP{E4dashQ55w$S7WgLm9
zppNsnbm- at YrCYlBp`YUdYIIBdwCOLu3#fJ4j`O&T<BVmTInU#~i~#0wiFuss2LLh8
zOU&c4j2JP`#5|76GLQW-&LifTG0x-6d0ggkoVS|G&s$i_Zv$$zGmfa+N^AuHV*kaq
z@5EXo*4miInNc6w+S>j6)V-=ajK2w}|CW}k{r8tr;k+4AyawtEBX!@4GjT1~Y*ijJ
z<)z8T-<=utS!M>wb0_gkivR$#$3>5ab=7NpJgB;v`}`2pptT5+APF!4fPtWD6~;mE
z!X#wW9}sk}Uyz{rr52S`<>e1n+ul9;cn?4kQIdq6Ywqf;k6U&CjQXu|ZFmzR0gA7W
zf)VE?_#BJ#^FRglFNEnt(}^zbP8a~H`9fC at qrp|Z%4+Ja>S19}1wtoxRah?0&;<cN
zveHBsx;g@Y>Etx6j~ngL>xEfyhw0>!6=4dRPEfC}?y5#pr#RrcAXK-S1_0rzFu1EI
zTy>(W!*qhdJyeZnAX!<%?ESF58B|xDm{nO?4bfI7JhT9)WrF9@hM1s;)xSV%EmhhO
z6ZdRX6`_{ai+Yrj9RMsFt+h5v$pFAo@?<$r)>`X@#rJd6Rn4;$%_fr-r<L5Yv<g!(
zASlIPIkyx?l#-!pZpEnC8~`FuhC($JnJkw!a%qvRcnP(w7Tg?e4w%7J_0vFo$fc#!
znd61xQu0KA`qxCuX4E{<RhG)W6c@`hnLu@lySiwmI6YhC!4OiF<y;^trebbNaiLtT
zw=QBXBn#Cbq>35E30E;9;3~^j=-Dg^NEg;A1|UoYLN#?)6IIV<E)*B4hRQ?$Fm<{b
zT at 7v`p9Ly)azOzoju2^~r9}W#(<ww1o)?;yinNA!(F`vWEsL8J at uHbpoVqR&QG}{d
zLMk^<M9f9qlqHI0zhYLpSynNjT4be*8pW|q|1d3+iyBotR23@fQIxLI5&%?Nh-8ye
z788*WH7^ub$>w$N>yp220;cO9=2NCW=x_iIAndY(I>HfV(5X(GsNXr<Jm7$vIkil5
zbA;8}b&0cDb1QInr<-Gay!N)=G|bGsHo8vJy8Oj9ZR-#Wwaq$_;cNS_bp-BCcdtFy
z5v(0Pvr)z4VSE^<*8&XVk*q^P*FAnGF~#~F0X4*K19-HxUiHKu?7Mun=9PfD at 1&{;
z*Z=FzvkrcHgR@u=A1B|w8PwN>Ii62K&pkoLQwj7*)p)bmNXAPiv$cu%kyP|X*)%>E
z)OA8v(M3ovO3;h}(3C-Uu3YO%09v<r1e}0hjgXJuw#vP-3BbNJ@)9uT34Qr;6M`SX
z;s}4t%U;$+G5}l#jvdzm2zv2NAg8|_?l*5##VO`>lrHWxVO>_;Vd8-3dBqh1L9q&^
z7QnIx+<|aMY|C-|d|o;!?)A@C3@%*1h_&h-#Uk2Pw03Q7!@0o7a9OOaCjr!&aL^0m
zTwUbcjPK7|0ns`fcSKRZu{Q4hBUIlEs)%MQ$`HxO(!zwWY;-B&Sz624Xwv$FR6d{>
zLrZHVD<msi%0$T$BH{pOQYMxnp`~4+D$7GDljZ^!ov5XSxK38Yt`<`PGfL5rGKENO
z)3Q;EOd*n2epdC;!etdVL<A<SyAWO<)pg*-*G|GkS_A;i#a+teQYOpAQ7GoQn9C|B
z{991f3tVZ!;)UX-bgEJ9L0nj<Mr0{2?klLy$Wq`+KuF6X6pIkGRh$=L@$jr=h00Vd
zS_<fQEh9^D6M>2PehFYHWkNw%RtZsqh=FR<Da3?pdu0N3B3!Zq2vK8}QpMaX>O!6e
zZn6p`s(F<ool-<YB~zVVsOG|uBFdLfTJM_vt^yaUpn3ry3KOeup#sX}RMmC*D?%oR
z6^9q6i95vzx9mhvCM_&Zmpb8CLe*3!77H&rQOpr}qMNk)RhGpGl&FuoX1L`EqEv&p
zSVbjFm8vw^&Ptjg(|I^>G3PpPxRsUwJ^Ko(7*!qCTBazXcy<?3)g6x({eJ?gIn6|r
zCM}fap-K}mYH8i52r;^dhfYQy;No-<gepS?VWKn#RHn+QG8xr@?bM=h3l+e`-9q6a
z{vZoY)MNh^<^U9ci9%$8$^;W}bJQ`eJD9I3oVo;xOmGpWZNm|Ti_ulwL_Gk6P8#b=
zBUCJOQo1-zCU+x3#i-N21r-DcGH5cb`{AmwQd#P#H&Ks|WxvZ0R|%3kt<p|fWEE?#
zv|iMSaTYiq?e}Y&^=f)+cN^m~n>8N~XVrA=q}r?TT{>9BU0w=b-mBg&{O{i91tIxL
z&B at C!<B<URV;MU@;%8he$4k;ty(-}4+jw4t=D+3CIL|pZn)-Do@kA1LqpH`Mk7-xv
z_V|?op+>w*bNw7TFaKFyEv%pI)!QG_58za)F#v}bT_?=SmEO{n>!nhisC6 at NQSR3d
z0IY at evkSN7?p)7gU0wj1)tYghc>CdGna-N#^E}>q%d&QJdGgu9+R6Ghv8{9Q-1&np
zt#9*)Ui{Ia`<<ZDjWiKiyeOzfxK1lOxLTfE%uw}jq**ag469-v2o?Bb6HSDsgu*PO
z6`IuBrMi28ma~P)5+al3Y*d(0WunQ|jVRS9lgUJ1Hz}7@nhn>g&KB{|Vy+IZg}yJ`
zI;2Z|n=n~IO(6m=S@$|JHAZpMdI0m1l~yLYi2oB%11^i{G+9e4RkAB3S0!dqH`Pf)
zMOkYKOt=S?nsZCZ?&3~WqJ*ldisw?bawgeV^&BmimL?gh!4js-=AKKtUuLL93(91k
zOGaspQtYgGMHaErR+$JUV%LRLQ|PtBpqNZV)Sfj at KyjGFl{OcYiLr?)R^Y`8tabl~
zB9-Pmsi6=;sxiu0^iwnStfp$Q)}#w5zFk2DMct__s<f?)0yQ-kE57Phtr$@i30B;_
zc!nt{P-P)&P2UYk-K##@9d2a_t6JtzRTGkK#l=WhRo@rtTDZ1D6sQuQiaRZPP(YL2
z&7`V26=7PhX6Ql}7MSv%uBi_qP=lakrDvmwY}y7lrO2w6z=Md_xsjcoH<?w;Tb-yy
z;Mu5B%uCS_(e(s*0X0-KL<&4BwG^cQp`t*!Ug9Z^P!XuKZnCQG8D_Z@)pbp91D`Jh
z0-lXl!~=m4(GV3#E{LKyi=%`a&0*_>7+e at yrn;N_(~T-{)`DRB*=vxvmr>4Yl9dk;
zzFIV_kDh-&t1tY~t#&wK{r}wPOEzKtXhdL*SGH<^Hs#kA#jI*pxNmpsB-{fLXWdC$
z$tQkR&0GpTLZ8alv|n$RV_vBp&)yctn}p9*y5!z8B`#vd8;8R^ue at Dse&2~|$9YdA
z_Pq+zuf@bGh4LzK`r}skWb6UNo)z4I*xO&kbF6!9#_?3H_t&pR&Q<&+bC8!Gc^9bW
zFegK^BOa;U3B>t&Jm|$@e?9S_VrLVH%>qImD|rl8S0E8ppL{t9uqXiwc-4MiI^sn|
zzO at mX#$tbWLtxdeZ^vF5HZfN(618mid{rI^hUnH&z^*%5g;tNt>GpkEDmT<S;r$gE
z!<{z4&I`DJZV0z3dCFvZzJ7C?5T+1&bYv;0mvv#2bGz0HYmI(ZVIwRXwySHG;&4Nl
zIixro?r>Y^cCr77^#B*HhA^*Jqh^4sd6w-ivfY8|Ja2`oZmV7<nmIJvb`3Hy){D-y
zBYUqtwMaH8ZIxlP-CJ3xN4*oS)+wd9i%gWF0e~tBD|rejEu~1PD9U!pegQS0B~K<I
zQA+DsTZm@cUaj6n-%Wc^%}Z&a(z+C*xCygplzM#*%T6upu(Dc6S+(mWPcCYf#Y0L9
zmAnIWGgOi7`Y794t2NC=F)z%bAyvDMsvdtos0NXuN^!cJ|Cpd>bw0F2XwhxPs<B+^
zxV0i`)tJKQg=9Tf?MO%#RTqB{%c?FEFZ<~)POnF`m32*NSv6EQiPn?_w7goCP@Sf_
ztg7e9vudp=>Z;_*A{u2koF|~trPfld`c&}{3h0-PjIO$#_}(@Bbyewl))w5<BH`*f
z5xP!=suh;$JT_HpO$=5ls3EE-QT4~?9<r&a8cbAN%)PMq6HbL=2ddD;+_Po(Y!nq?
z3HY|QSXQ`|i9o=#4N-#^qlvi}HHsia4XXK>>A!($g)U~1En5|`rLZ_+>&UaX+iJ1#
zuG>_DsWH@%&FOMcQo2 at EL~O>DVS3pSz3QthY%;h9LUmpLe6PD&t;@7b)!+t((CJ*O
zZdAawQLXZ&>bhDQLnnvT9=A4qTj^ZY5vuFLy;=3BGgNCw&ummz9l>?-ZQXy;k#DpA
zeOfAz3^3dnuSlC$^1<2Uaj%?y#!RB>U{$M5^~yB!Wl8&5?fgjTy=t)Q47%2tZwl&N
z6Hhwwmph6l9i2 at Z-l?RHx7utzZ!+<!_#E*gGl?Jewl`mYyFU7#D8l38g#R0TxP{6s
ztHj&9!QKO^>y2I`dnc$Yas%yEy6kmt16BMsyWcSV-wWz(_j!wX=f4Ft9{5ltwTIt@
z_@{#!%Q%kn{r&y at JpL{;|LLG|PAT>OI~@M^4`S{eQc9`$@L+unzXYglN*7S|@4wrp
zZ#u3aEDt-!Vs<H|alS50<8#qD=kZb8#Q6t*t1k#@`ulro`u>pmeoWmsHcj89o=Zh_
z<{@?c*rahhEc4iOW0wvy$JF#)YWlJ3v2<P6jH&O(bXda(H)v8?+ib?JZ_?7e7^SlL
zlAvm8#$`#IyAB=uW#-r{^I;7gG^S<gnq@pR80Y0MFRAHyXfU%|#zS*h=EE{KOq{#J
zGPA49mr@#MB+OmMaqbfOebmwV({xSh=ds7v1a+B5BzCD|LeKutq&1pQv&?f^#?-J$
ziA}$xaY?CT>ew9)JfxJCIW1$ugf4aL4mFH5Qkv(UY3b7e{n%fDx-g}gP3qXE)Ghd;
zpw9D*#4a6{k=;D^hcwsuI?fH!GN&}p<AL3{bPLARU~J~GZ{~UI(!6xzGBcr1%`)~Y
zgLi3OMkb7 at LqB)T@<K@5dF~GJ1wlPDDK$-#nv_yE#vvV=<~l_37MijCcc_KiW2tG*
zkEg>{ySud6q#xu>_!=8k)1?0XfB(Bb>>@DMpQdS=uJ4))Sl4kH&+!_YW{qQgu6eG!
zf9k4*AH>T%ykMOB(?WfG%rW)q7{e>=^72xT?|aL5ca8O$VRsE5_ at h9*QsytqvQ*RA
z>Kz(2D8>0kbu(olgb_3+oafr-ntK!AaD?+*ZfDE*h;zFW*L#fBD9F at NFRj$zM7=-z
zhkvnO0_vWYZd|G#^JXjNz~(GZ`)hOVbCmVY&+ at ru^}BPR`qynnYqC7FS8diGua5$&
zmz3k|nP;NYA}Xe>nHERrOTm+z@!Ny?FwPGu?Sfo1L`q0$E$7YQOR969h*pQe>}NN?
z5K$}H>cxGoetaurI+>J-xhP5 at L|SAildMM0)xttrSS~KPophoYsjaAb$+kBfTCei9
zKf#q^`8NfX<4n_RQP#*5S>^mj4_R6krwQqWQg8ExT<s=EGeY8Q4I$N9O2i+uC<}rR
zhHCaTGR4IfNHxQRp(09^V$>Gdb#mnusPtmhm`Vg(-2i`YQ2UwLilUGvCe;$XS_jZt
zD=1DEt1g}>iYP`CcNa67fMTL7L0eq_ at sL}VNt7i3&G78mtA}XyBcm?WL(ha15rvz0
zY29Vf){EmsCo&iF-=0%rUg%P-3_?pwlj;Tt1kGvH{6I8}=DPab!9?k at ISj5w3bvY8
z(<Zu31_N9~X{v5Cr)r!xD$@yWs9`Ha+(pGg6rswOHmU&rfHifqo(uv|S+0x}E^($-
zGYLL2Yq++C*u<fDT)2xNby+3(*rb8y*j5BQUiZNIeL?+^)k3_%9O5-&j31jtye9Ge
zIdbY--zLr_zS+{)*~%WPEQMFy?7sRP)l-`Lab{dQ{Z?-}0JKcYA||;?t`F)FQYLtI
z&mxoNf`=Ccb^b>|edy;0l?f1;D6P^~m%S>d=0(M2Vp;ucgw%<}AM)hIwPkTomq(t`
zTl7Bl|0byHXS!sI*4)&KXUW)Nx`pUuS&E0O5~Gk}6jyCMOP(sIJDJkN>0*Q^!ld|r
z71Uy4D6A3G^6D{J1<oRqQ6F=vSdlUbZROOROnHg8=QZM9{1-tTXQ~u~1VW@xMK+H=
z>hz#fF0$;`RF^W at M4fUe%hNS=7rD#r!-dK}XZMfQgNj;KMaNS=v(2{Luge_%((WJ6
z1QhrWfqFsd`Cu52quJq4!0MMy|Fe?%rKk{b&8$CHgZziesq?&CojI|0#9I%JwCZQK
zi<113y*6*40!u%_%mA~6tJ|KJQk_u4s>h#aacGUiNjIyGcuz!A5U at WE)=yGWo8%?3
zn2VGsrS&3fObwCAvQA#at0SI>i^$}852~Fbqt>Ve at t<E)$C;|dqK2*z&!#)aG8dbe
zDNazpLQ{2@P~F9l5(QL16^Cn4{^vpMXBI7n5-`ycVn(aMGApOHI#I=8S)n2>=7KG<
zF@P%-pz9wu|35>dS{ArY4hN{ErLXRF>zc|M<6IqTicq5i?k`^y@lO*CJ_FR)>5f(X
z+LMliJ0q}nx7);mn at IJx_BWTpeXxu-gzLD0`gry)*mS5;<Cp67p{YiJ`nt$|0;t`*
zCh2nkb$=>;26Ow>_XY7{yNtMjx`HZDvus3hoP!u!5onP`b8(cy(9%L`3}1V8ga7#3
z<3AMC=;m=2uAvc1@EpXrKqsACD7D9$CB#*&>~{Xu&H>fVL9^YCsQ|iV9>qneil{-6
z^ZK+*I@!eH0WXN+;w4mRWhbLPw#bPasK7kVi%IKNiqT4q7FT(2q7-pjag-vkGEre>
zA}<(^`5!50ea49@He-raBeIJ^%o-naXFE~FtM>&~`;W`1<a4R%;_InUKmSB^F_}1@
zJ+A`0#TOR*KW$AN=S}ro<Lr}OHv6ZV=kHH8mG~u~MnBgm#H#fP7e&#DsuN6nORM%&
zA$3mDcLVh~eX5u&syeaMY!8vGxJx#O*2I73>S};$jip|b^xZ&xL7z%BaTgX;qiLbI
zm?%xD%3ZoVHNbTHxq<pJs9FS8%0v}}h_3nbih0hix(j}Mt&hG<{~yujK@!{92wSSC
z&0ppD(R>NH;IlwI%k;#S%OI|T7=LA{>N9r#D|KDGbSBvI>tpMRUFhU at +irhNP?vdG
zCDAp!|CX-jtQ>VUfV6B}r##o(d4_AZhAm$47VDbMHT3&d%lRm&C8HKTk9_>0pmy^(
zubE4s8otI9-ZJ6^O-wzuG!<TRoO(9EJP@|a<fp~2lCxSin)sTr6*ViP+nORUR)b4>
z$uG+Nr-Uv16xH82niPK!aZ_C&(uPWQD|sP6E9N1kr7B at 1FApN7SsaoPDlN*IJI^I+
zh_tjUjsPSJElay)19ZvCnlrFSh-7GK&u)M_Rbsts_(`h7PXM(a=fyOe7- at IY=A9>A
zHU+<%Oj(7hWEOEXl0tw|-2i3HnL(GT<KA)yQApG3MOcR~gsYTuYV0iHkbSDRopT>P
z+_~@Paq0t$6*DoY>f+h5i{&jneYkp!z-;0*cb=G2G+^07YVLAfQ|QpeTAY&v6{9Lk
zoRjqxr?xdkV2EX3Gxt4jGi+k`GdXo$0N2TDz-OPrCWTAuq4oJtnW}T28biftV)S}U
zfXhTXr at J-O6oK18%LHyP_^S9`LmnH=0b4uai)puh&PC#9oT&Eaq&3(wT&7Dpu&2&_
zSGn^Tyk at g_ER3BSkE@)4wsrE0qv(FN$KPWs>Fp#?Gl0KtWc}K=@k)x2uc-Nd`i3D!
zH|lj$Z;2Uk<sI-_AILt-<L|NrJofk#1RP$Bdt0E@?ZSC&inT2Z=ZpqVQ~dpg`h!pP
z_$yC5{%ASdB|YFdaqPnsDylg<T_&isYxan;;GE;H8fL&nrcl|Xh`ZRqBev8HUr_Z|
zJ^uXc at ppDkqbj2&{$u2lUBqaUESAkFhPAM!;4yLWHfpN3n!MO1YomCcc0*CAet{--
zNxk<4mDGEWzq0fAqbfJo$;jpiD-&}IxU`ftXP}5wP&Ha_*Zg@k7mK&1Ebv__oa;z6
zA083qx4BMv!Q-#4j_1UGCIS^%C=*>|qOCatRjWCBNSQp#M9)gCx!>KC0=Y_ve39?N
zoL_NGz217tM8tE_(-tqmL2K94Xz@%=;+oGs9 at z@`YcKSbMXJr?kFQ-5{NUT)R&V-K
zPgL<FFo%DI`@CN&r(&6Rncbu6qxH-9^ZhC%^%7=)sk^Du)vwc|aj!V?uZQbr=u^9y
zTJnS}rbXK*t3LX&O4>Oz0)Gb)=uZH39+6cY&v^W8!n&V>c!Y_3wX4<7xlWl?&AkLw
zQ9|_W@%QYp@;3cnrv<TuslzujikhhO_f>%W0iec3Yl^)h`6g1`vi#gYy at 7fI^#<y%
z0QGFBpydYnjZ<%+-ax&9`T?Mxz0o2NH&8z+&ByokzX#k<eK)9251SE)xWBLWQ1|yY
zK7B8!<*Dj3?!SM(kNf+Ghws4m`|meKeP`NaE&4b~aNOVD-{bx}zTe+}2kyVeEpam5
z1L|{;Bjfx1{r9-P$HV>ocRbuUbw_Ul_1Qh@{vPM)e}8}5r#=EyJUj#*?yF$+{rgR(
z`Vdez8DRI{jXng_8{I&?f%?aatFM51qxX|ZzH#bDllyJ at -`3O{s4vR4Z$3odKz;M>
zI3M=Z9G=qhhO at -G$HuP=>chBZj!!A2)Q`_3mtUUhZ_c~GYSX^A(T*RV`62?<hV!d~
zI{d9|N+~tVyhC$bYR^w$s=g=w?b|nFAgZmao|!OSP;UmmIlnmr)y+MA2H*Y~P@BI0
z`|osU#(7NhoKiQBO*7AZw{Yyn!*iT!>InEZcXzYJ&ETq)`=0go3s)tA- at f@bcQcw2
zX669+xj6%W38>>d9uD9C9(&A8^PC#a7?-hfYSYj2@|fu?t0PuU4OP(e!m06GLJ$!{
zAo%Uuw{NDVFeTJYi9nc?uLkPUH-{wuZ^R*`WljzIlrW~0Mx>^D3M$-ccnkkV@(HNV
zrLKu;|6ZrRsRv9M6;yn(f8Z~g{$oFW|9eRDJU87krhcBg!#t1au#DaO-1KL7o&Mjx
znVT&&)J&bscs2nb>5f>})Vf+2bbaD;!~guk-Tw!)@I{FzuDk=|lIh|H`~Q~9Euj80
z;w}6VIkkI at mN&n0y!zcQNF?|xPE@>|sBUxv^$!4*T5j}y`XQ({ru&Dx#tqaPsDC`D
zH+23P`42#?)TIBryU{<T7eGxnP;a2#K)r!_qZ_C<P;a2#=--2S_`e(dQ+g598~r=F
zfqDb=2I>ve8{I&?f%=~W^>CvPrN3 at xpiiMJSCk+9exujvF=lsnkHRI0-Q3OI?Vk1s
ivvQY9zR}0h-Tw!S1h_?q)VzBD0000<MNUMnLSTab#wW-C

literal 9087
zcmZvCcT`hdvv-iDAfSSPM2aF!=|~_{LFv6ql>mZ53cXhq1ZmO)3{84BNN=GDkq#mu
z^xiu`dikQy^WJ;Eb?+ZpS$k&hIkV5qp5M&u6Q- at HL`A_w0RRA~RFt3T0svP)000r<
zDlvfqCvwUm{1Lh6D#-&%`|hp+0K@=ob$tZ at 5rCA496&;TorIW{gp`c@7Rgn%YZO2>
zax${(0(U4$Zc`DH(a7*qk^!mjUAw7t^M(X911W%P at 7`?+SsF4%lI?p;H>jBmsF_T!
z-L<>LDhy_%qPr(}lbZ^_VGg*vPs8CZ at _>=?5m=Lr3iwdYhKZ8>q2Pl at QUVM+eE`56
zeoc99CfSETEg?F25pH_XL>_S!NiMVp7qtx^tvc)84bcM~AsdLG9zgntP7e88f=gS5
zQ&UC={7mb;2tAjwA3*uwv5GaTS}c at r=ablNC7Jpcih}8qz(~0}w&E)Q!y|T+w_X}-
zoTjBPU8z_-HaVN*FS5I_#ykMWqZhVt3CGw(wS7~wOHs#)Vzc}4R!?4;U%Y@^N(D-R
zJu={~0vUGlwsxnl+(N|t8v!4V)qK!_?)FMS`N?k5&jUXPdO1r4o|*)dhro_L+Fv at m
zo<;gN)VT=+1o~S?ytel}aC@5&^~NbbP`=pj`7@*+AnVloqb}^-e&IU>zN91PL^))r
zm*J;Ybg)FmhqnRI75NcXXwUukaT%~gOw$LGx_4jQ6PxZ8pOn10L`PaZ&Fcw at Jpj}m
z!_#ZN$7<?ipJYTGho&{!=l#e@{gm*P|9x(qe_nrkif3AONpJMQyPQ)%&qY;cWO-&%
zSng(NZhCtGETL#ExO}L$NXNSVti9MXwl)#ggau5TRicVoat=S$bz{DT_g3q5RAd3x
z&U<PSZd?MU3U>hK#(?cJz)@Cu+s4Ru3v8QXM%SpzuM5E8B at e!){d at Dz`h&WTp|5>q
zPqx|(&jG(WDn>iQaF~3+<z?HrRQ%|w*BM~4FSDonpy}sS-(bJr>Tu2IY}c>pv7g-~
zd(2Zq-^YJ$E%zNx4fpj<^v{lcn;xr~8*9RjPt1+}{4u>yvpBsla at f1iI=JpQwG_QL
ziTyP at H#5_ at GL2iD{W-H#F*&z5GdDdmyFNcRie0!^o?BR-8?WBFTv(dlTAJQmUfNkc
zTwPx|KPTN?Ut2u5JUP3(xIFWv7&G~EFs#&+o&iEhnUx8HYmUmsE&u at Ktv^4apOgM)
z1R}YsiiQIDC^7IlCD0g~tqK6J9;rN&)At<POr=VpZ}-D2i%01ZsiZq=a2F^&%@+_=
zjd-x2q4j`XS({d!g)jSBjN-M2&IalQ6&z$5OvSqMYU=!f0+A{+-&Og)to(jxBC5q}
z#fDahs^{b(-`{y6cFXzD)ow|)UIf2U-oNG2?{e61=I@(kH=3H5I(aT5Qhr*W{POyn
zJ#D5pa|H?3c%Q2uID&gkLmVwKCU9q49(+c3?2noC6-?mVU1UMMh=B3Ekve|FF&}|c
zYV@Ex3#yGXgF6yK3n_t(Z@)?XnFK`OB7Xtv7=4HfZTQ3(KYWvexMUwHBeriIwz>W2
z$i1Ccm04D1^eMck?<F*Y=~>%S3419uj|!CEs%Wa_tvPR;hlOWrXhFRVe9qx}`neA5
ze8jP@=qfOvjrcB-nB2tIhI(_-Cw~zz($e``R%)vP%QZQcTj at q$?;+}QIz=482X`|z
zZTMWKCEKdl=m>b|lZ+c68x(<zg@}bRq2(a+t=|p}4)Iq;EW&z&m@#EKd|EZx6)fU{
zv0Q~-v0oe5&_{Wn-amO69og6_y8-YkpduG1qI+stj(8EipiuBKeISbVB4cZ+ at zm_e
z!6vZNWI`g(ptR<N`PTBs=RsZO-C@_{+MO#~+Bn%lT9<+WPzf&9%VyksJy_`Upx26Z
zx?Aiaw1Gzd3(f}qk(CBn%Flr0s#&Se317co4Rj%wtX{`gM!30I2#!ULwLiLZoFk(>
z>QLLF9Z$sq(prhdxk`_n$d8DWXw{@+v89Pe)oRx+T?;NNt{_#LJ1jbD<t*`QMb*A-
z1AJfQ4Ia>b;09hr`k*aWSW>zQTRRA14wa$)kP02GvnzSGDB_xz7;ez1T|xS=ai{I%
z{klOSr~Ud7k(>|-G~>Rt2tw^)d*YttGj|enn(DEsi>;v42VdW?Te2U2w&t=AC;b2d
z{TvRiUy(PPs48{xXvoa6R*>go8gYl3&thVLdOWGU+P%ipWo{Nzm}LbbQ1BUyRH=s+
zXrxiV7p71EcF_(0Wu<37RuPY(f<^e>MCz^sf%H_FTlppyt!2g)Drayb=ww}Pi?ou%
z5hBjNdp{g*mTrRFT-YT+G8Mq~K64#U*6>s+k`=G+9L#Jgf90=&sy+b067IlNpenVq
zro-|JsNwKc#J;GXpAzN-{E$I{OdzP($eERu`R&6}U{!%ig5GWHkDSkC#xW;8hbElZ
z+|QqN9VTgi{z_Wg39z!Nl at ZP3kp#i(G^TjOm<lwc)Jb?>CuJQxp~M?CylZ14#A4<*
zEgE~md+qcV<13Yk*Vk|KCQmP at n|^WD!C30k-;C<VgfNU4yv;B`WEYziG9sh&-<oN=
z#q8YF<|<-;X=an97b84$2j}XUEPCX?Y^z?N7^Rpslh@hja+3SYyL^z=flAHHq=45!
z4{6x5>#UM<#ia8pCQ<mqcm<k0CsBl(6UD<13cHJYP*rT+9WaU)7d2$(*eeI}Z02gX
zTGE$jl^E3~F(fb*JjeYY8M@WX2>{xclqf!&sVMB=%#K-8P8Bwn>@?NOV~mW)s(VJp
z*Cod=7nd-H(}{i?KRvX+2jbPKJpwN8jw#y1^yD8i2{Yg`brZ!~cMGhwagY1%=`)D{
z3korcZeb&?uAzNt{w4*oN#$z3s#a6jDA8Xo3qnZG%ctwN!t<SJ>|>sPQ|K-iY8Qx7
zg--<5n^yDgg|ANrB8&%T+`=YhHcr6){2dB8z?}(<66OiSrRs;Mv8I8r2*X6+^1$P!
z<a}j=lU*uG(4Iwwv%xAx3|dJ=0%g03d(upH1#|-y6i7v~7_33@Mm~6qOrD*T2>6%v
zhCqg9Ksq{t*f=bSiI5YjoX772PS=muFqALXR=lp;BARWLg;e at p)b*krbx=a`RRXC^
zJN}X#XA6D#g4%SJdNP&W-JPVPF`*&72MccXFPdC#xGClA=o;X7v#UBC(iRT8)t0CE
ziMLYHU85#yEn7CF?PJu}G)6@`&3$KsC&2-;O%il(=NkQgp8?xh^q>B~yV{s5CF`h*
zBz9qPQ!HMVit2Xe)Hf8peylt4pc<A)ba)8&fG;|T6$Ts2^=KXJkp^?bjX$HxwF+G<
z5f)(urg339gRxM8U%l&EtZ?SHveqlD>~(9w)d=2=A(FO-1(}doJ%z|HF at fTfS+VSO
z&-B|?aL;Swk%gqdb9>vCj?N$|QQb0B%(W_JBGBS^wG+bIVz6{tw9`E+=BEkU*BISH
z6^q0pNR!vK<`7{$NnPB=gl7Im4>UVagJ(LBYf^KyjgnzPIaSxcpeme;U!dE9*Sulm
zrB(uc6!KYp{vO$x+i>!5*%zr7Xo*gdEM^^?yGa~j&yN@^^%lJ?_Wd83H|Gxg{(NC}
z69 at QXtG6ATj&;74#0eB2Xuj^ZTM}&%RKGhPGC*_H8KXp6z9DQ#(K{!VcBH&^2G-?y
z7d7Sy5xs0QS8ycO_<>{*#QgEu%gyn|_NXC;smUp?`vJD at J2h|wA~mjQ$?D+CnCwN`
zkn!}q)Rv*%^zo3%dG*;M?OIbu_v1P9Y4?=QesF&j{^1F8fQ5^Y9;A at sWAf_lx9Q<G
zmr$L{nklm|eMyR@C;etVbrhejZA^A$Ngq>c*@vx!HgNA%bBr9k5Few`t4+daI_N(T
zTlT1apE#z@!d-4d0N0*z7KylJyisHN9=)Bp(@Ka+Ur#;QfOY?%$}ZEVrw at GTymFHv
z#KjOSVg&BHhV=P;#eDE|hVdf3+TXQdp0|F&*uCIz$OUiK*&tYVH$K^5{D)bO-~pYF
zeSCFH<~s=fXQiEbqkpx1wti<1K{dZsR$1ZS-u>@0*!MD5uG#weRvT*Kaj!KX^DLX$
zJG#iux6v)!#ypTAv2XR|Q+%@PF~%R-f3PfDrkWx*3Rcs;4UUh0uf5;XThr10`pQ?w
zl*7jLSX1w_E47y;F-`0qyBiPex?HA=m%M}pBKo9W+Ctb}gxV$^eT8LnLvX*+u%(ss
z at y%m=dJ31TK8pFSuFov!q+5Q#8&j6bhCa6{rnC$YlrYGF@<+rb+yX`8LxJZ*>qj{8
z`OBd5O~wF3IHsywFlZdtzw4d9jTZ1bdQko(O5|Y5LNiq4A`#&Nh3Y3&XU(9g%G;8T
z@<6)rV-|S=6;-1JtVT=l<P(kbjmzBCQ2lrl>7cMkuZ;>tg*n`>KPE{lsRGwNc0hLX
zdzi-6(u3?eAG+T;<*hdxAE)W4c^}Z1ci8nVV(km-@Hp;nb?vt5#dNof<VYEi=Qc?9
z7wJQhpFiCB7(^oY0fep2Z|8<YFK&zvU?%t|x8!!%b#*${uIaOLxClk3V)K;?V<`A4
z6Qr^cZK_nrUAV}7iBj)l_Y{5!*RR9p&I|m02(g;U`aVh<t*tVrZ^F#GeFz-x41dkd
zNJu9Rw(nEdpk_Az-VgmLpr}XLncc5Puntf$IIeSUz<X9vh^A5y_UOJs8%lUATE;|;
zt^T_OxYs(7;DEy%)I62RzE=@FA-{Qci`A^Tj$6c~GE1CYAm3k4I;ly{rB1hr7CA%N
z2q6(@Nle8I;>90_d9b%-x~?Vvo+;eHm`ng8<d-Cl^w_p%ROyk;r$+S7SIR@mpj>IU
z=j=&LVtJ#xjXf-U?rq%@K<b$FV5%54jjllVek=|@nil#oGzE4q$8YRTwzubEdB~x>
zNE4GvTkDtaj4gzNlQCRv+_tD==$)0H;5 at -@qC|yTQw`e*%b-P(=mX2hN^;c<UZ`;J
ztAM4TPOg5MsN=<>db~$p at 1zN4YxskS?a~V>&-B3Z$F8`Q93ASwRfhM$G1c9C`0G%0
zTJV5xmAR!eMj>f2uzOM!F-0s<&BJOo&ghdtVj*F>g~$o8Tqu-eIKPI-+;jUY6P_Z!
zO}7#tIs>6~{1k$Y`FXB5BtT86hecf%DHGCIc!D2w4U+a~P>NP5=%i2NERuLzt8pB`
z+8J7~iDlsqN{li-#nVKXx!K8PaXu7So|q_c+vwoQPWq!KjwB at q(h-7nc#Cqn(qKag
zYy<TPj#P>cky5*0{7lU-oCNi-LVBw<R|J^L5A23Pk_Pd<sV*+n*fL2hPrsBv*8$BL
z@Xc(CqUf`V(mK2xBqR}vUCf0QpUtu1M}^ER7o+sd;ozCMr&A5f3Gb8lco{$!EcrJ~
zBwzt|{D2=~zq+KAnV#c%6;(SPU)n#pvw{^u%{F&b6c`jNw7s1XY*TahDfI3iL`Cx0
zW*kH7n!A`2AyvfuG7G(@7G9w|>9oL?>fIz$Z(hSinO)!cd|v6Rtu<Z8MM`U{<G+%{
zZz9ri?52gXaW>pNx%^I)k~Dh$AGxw!U9lar-#G~+H%dt~59{JxqcjAK7R6t*E+hil
zE`opD2M;=53yl at gxLGnATbqB(ed5JK1_F2UcL<}D-}mi_tAK~-TA89??@ZY{@e#N1
zqpAlM-jfD{eQG=qm$_0%d+rUaBa}VmcJ3!j(y`gJlUK_*&vBmf4UL22Codk@)D&6G
z3>w+)IG*1uNDq&hkaF*WVsrWwM9#=9Lwe=i%U}92v at k_kzB47~yHtbddtTB#3!O_$
zH9MQZ%PYl}%*FQSr)s6z$YvQv+weFr4Zf%tQ;ftPC?eKJCS8q&GuF_Zz)8opi{DD&
zc9;<1aoGdJQF>ug8tU>v`sqqlfvKm1c<fF1-HHZYI>q2Ty&LyF7{BLckX>nbcg_*B
zH=X*D%gru|#?Bl2IJ4;$F5hXYYXqbUt1FtySR=>${@^(Mk7&i02W<0hfv>lc(O+uE
zt)92VL^$Fzg5$e4r41MI*yQO5M#7M#CJI91FSqiOUq<ZCs`r2XO;?L}N_ZJ$Z(md8
ztd^d<EwnT5<2@Y#@|ALlAx#rTnV|_GkrDE_rL7$}m{9SovSN+ffC=40snj=Db>z#0
z`qcWyIKwaD)_NQKLXr3?)E(es`EiG~7m_i?8bx9zW?FFfEuQj`sMCAfdPR!%#qhP*
zN$6G;Bi8W&yHp0^DMbIM8Ld&peJjS at Ud2$e%h^JzVvLwl%MTe?eBPv+^q3AeAdV1i
zBKzI0PAO at f*ZusHS;WFp7D-pn<_X_W-FIP%<hq3{WIc1SXiDBq7EcciNa2oCmNqyc
zoYmFh*PZMprmF{)<(H}7y6RSNPjZSG(V!mEe6t?XtN$bx98tY&#oKashKdE3TV;|q
z9K0A3Z?9aZwsQ&>OcK*wWud9z>w!0K)mpmt{;J<YGx8#!JsjP}W`?L~=dDOyqxk#u
z9yKWN@>UOQlnU1w?!oH4|7NyziCA(p?a)q<d+Nq|rlsD%9Q_TT%ZjkZ^Q3#nADuDd
z-t&y8#}3&LlOpbYef3B%4S0UZ(#6HZ36TNnR<BuR-)Km6e~y-s5S0rWN>^e%OBE`W
zVgQly!R0W4$ft?PyGO`{J1AexF-EeD#B~{O6}8;ge3=6xp8Wy+QIWDZUyky;+lPu7
zO6{BhtmfaZrCdmz%pe?^edEV+1Kast!K|sxb32ntY?Y}3WrSP+uK7f#Kc!#z_P5{3
zt$dtbKYWq$*%8{)vb0n&ht;0rj?_oX)P>TDpL^}MOhekK+HwWk`FKGc121hoE4*Rz
z7miK$L)I}OmWLyxNGt{NW3CCr`Z`D~?>0>nHSeig=yq0k$-i3>1CjE;<;sNK^ZP{V
ze<YH$*f+=oqLwT7-Ah=kkyzmm_Sq at Cc#+qU@j|$X6vGK%ey<hwM9A0mQDV<(e-_O}
zAES}X_jW!u(9*z50-gz5o*SWUmS|r!!^N}QzyIp3dd-)W&+o(t`i9RTLv{;|5;ie)
zbw3IBeRuFT`t{8I@*sJDDe=<#ni>UP)#8J at HqDwmAv{1O9gNL;8QDiIcGXV}Co-+|
zKG-q16eRKzN(iEV%ZUHL;_d4|GK052ODR53`Fk4N|AUqPmK)7v1lP*XF8ksN(+yj@
zf#RV9jfoM~a|CKgz%IFDHDo`FuJn#J=enZ6oOB5kUxI={%y1+>X^9HNnvkNeItR%t
z_2erxG+z}{%D^mV;%Y;G&?3E7@#P_+xd<{4$9oM4>7AlcU#EZoiNP9}rDW5O^%L@{
z^i*X^uiYlE{a#is{hsfU at 5v`nuHNRCgGID-S{xrc8 at a96r}<^?gB9*cC(3YS@viPy
zZNB&7h?ilaN-`>i13*uW#vkvj$7)Vb2y*SRuJ%8!9XU8%#RJ>hh1bHwssmoY=Y^V*
zFW_&VCr>7^pqO}6HFaKPMN?^QZ3caotz<1Bh#XzTD`1HSQMKng&28mDy&o-y_8Uyu
zukWa}3ph2MZd#1{TgYC=;ja7IQg2Tj35haZhjN1zI-7G_qBDO9=ptXvit677g7hgr
zhd&#tyLdr_{L-8|y=mY%GKI;#S8gPn`eIdUO{m;@D1)%7<LVHQr=0f+()E)f1@5{S
z$gY1^AYnv#a^gv4Gmpi-=vFlP67w*3L^&B3N)kWeko{fJLuu%o*~@33{=2O)9Vn*$
z`>X5_Y9x58_CUa39uH6SeB%1NJ%r<ZqlMC3uaQ}Cly_kMMQH=N5YJ1i?R+N~)VDt3
zv9KxEL?qUoi89_hC36i^yKtJW$QR=$z0Go%APRD&yzWATYwjWeIsGX<3D&>;mg<qM
z@%@G4i!<koCjzKWEtN0NM_^s=%!Ho%8wH%XMBz7Tq_n-yeiq;K@XfE<YG9Fho8oDG
z<k7cd>*rDlWk+?grg)CL(rWY;ef6bmmX<>Ri6jRF#GLPG)mkA&5?oU8CI<&4EXxy4
zXN`>}dzd~F(A(CIlwT7`Srh)rzn|LmHS}IfyO{7jb(^_92PyZH1*xd>y!sUEt_fU>
z+PL4TqE+G=*Pkl>RDEJ?zmunm1`F2Pa<8}|;nVR<O6kD2uvu{!bdtTabaxR;Z98=^
zkgQp?+D~jD%W_n>(>#hkRdnAj*skoF+q8h{OMbI>Ik0YXm)Pfnv}jkmqZ48}!P$1@
zk)3#D(WN$;$fQG7pLX}|s7pIBFf3BEp!WDa!kT=ma&ut><avS*9Em1JKa}#ULa1aL
z)2k{2hoj!0gobKw-;G{9fUPm$3u<Zn=PKZN?z>y)gzc-Cj-sjkU{NC}R1EHU+-Ib~
z9>{%1Twt&RI+PB?k at T{$NQ_rQFMGZX#Ddl~Qzn&@SCfvo%2S)ao?s^ZB0XgNL@#`v
zc0BtE(^Q1Tg++o3YJcC~j at cwS$D&sIm2A`Hq+F}EM-+Fbs*LGPekxW at a^G?b>vd%T
z`2jmhoek5uIp3f+J~U=leOVy5)XF%CwY8=_yicdp!WK5gL9P)1N1sbLlI@~K(W_Ha
zyp)S7z+v|+WmjT&P8 at E>f6r)mbrbA4`)aWI%R&v2Kt*Psjs;WeJUX_S%q5<f5L^I+
zWSkIvXbTV~@JVe;THn*ubmBhNZO!wlP3lg`*|!W7BVcjc+R6PZ$dAh)Ayf=?P5tHo
zd)CI2<B830E*?$$VQS^ydBsNV;NDr%juUxQ?@Px*9(LuOt%X@y_Bgww25G#4(GC$U
zFBVQi$yK#<&dTI9J|!(KNf0A%K&>QawyH`WalNymy<0wEW@kzJMgvNof><xQ2Fre9
z{Rz2#9V(9s+YGF4IW>%?T)oxbd+WdFnN1iX`n-u{S{sRIqQZbXs{Rv+dBjl|zu^d~
zyN>^q8qh#0{YhNlWML~O4f)*~0P=`hoN#nBq2#`pRncuY!_CQHv2Ugw+7Rbw;)k`F
z2~;%ix~r<f)&lDxV(N2m%V<hc7M@$rGzbc5pT6tWN#AJM;Map@O3p|XYd({Dj<BA8
zzdJj!?K8qry>C-xFIfMG9JxYW6QW at bf-ZPZ`@J~XQPFV#CQUAeYPgc0 at s3IqD5?ev
zN%wTGDE(d;*B1s2GVd_wjhvWU-BvWWzP&UMx^r{;jI7knKzgftF>t;Eh_jK886qMF
z{nL0N0%?OSvy4dxg~=<1Lp6kxQ<_{&-RT(}i9kVGFbhq70H~Q$21Hp223GQRUgc^z
zAp?1{Cz#be^0b1$U!5km5eT+07jx`!KF!JBkpxI-BKmWRS+4<06jd?8lKli^@9f+K
zg-VJ_KZ;bOz>1*;Pe9|p78VNgPJa)oySqm63lZkUeRZ6tBD~?h at rV$U^p9~#v|Y9f
zH0nVbJB*HG>VX>kj?NSOgqkmo6!;DG8qzqZ-MC<i4ns<D)C#@Xc~IkAc8?NCk3H2J
zRzoieI(?HG?nrslZC;D}$N>Ji!_%ASTLhVV7wL`n(6(dZ_i(e)bFgHWwNI+KB&X-K
zhY=^%I|B<6;u=W7GfQgdVZq%RTn0j~(|pckl;hJum22}K31Uua{YY?4d!hY*p!OeR
z?J%6UYkc&o4)w&V->~@`0C~^3nZc}D<RWLxrDf%Ffk$v&s4l8(6C4ORZv7spp+nvv
zm2Sp(8KGs-a5|91aGeEdLXL~)0{MC}kB(0fqx(A1%dnoX(#Ot;#jdZ|hemApzqEZn
z$7)0+-kUe?X@QdzkaSF)7qd4tN<CY|GuD$h03nD+l92vqUa#8~9W-4F1V;S!W9fY|
zT}`sgT0_E+!G{qZLge*?9t_FSRO7!Ztp^jIPcNywL_ESf&zYgMfxY0tVZyV+w`*~q
zxl^&+i73dN?X2{CBUeUD?6u;?Zq$lPwQ1_1aOH|xVbx7(z1N6GQ2Ow+!m(F<VOtIX
zsnvtP$NcmV+;dV;S?AB{&I!pOHD<`x!QIN<&V1NjYsdzyAAix3#Dd5Y<*NJT#n)(F
zgz*F}Qr#>mP<-f{<Y}Aa_COfSA$X_>8C- at dP3LmsJ~nRpOo{dEfJ|I6)nNamQB#V?
zN5TKmFJTwXa*ZRA)n%KG-fzo&LWK&WHzzesA+zu>(b<p`w76%u^C7?oEXDJ09 at Ks#
z8GGQn8oZGm_%XJLDEgemv8{qXKkuqpS6)@vIm-^g8~|j}HjxprMa1#X&h$@1=^ofa
z@n|h=hlgMV$R8wX>%J~hl;{Jaom8_uX+@!5pWy$t!j9v<0CjMB8wENRhDpYa4P{~T
z9ORZyg$VrjoI4a4<n_tWIYZgc#8Jt^-9V(c#kZhHh~LouvY)l=p<F<3zh15twXNY-
zI_R8dCmAT@_vXO<a$;HJ*qE~PhcGHzLjlAej{5o?B)0nV#aWq?@CUQFP6Ik(U{A3H
zB>I$Wk)ywkF8Z+WCbGq=lU;M23^Z&!{<qys$p7MrKnl*aUz|HaqPrSwdAy68Ir%}=
z{J3k-Kn-;$iza-i!<mwNg2{u~i#&<0!W*T+zcJhcpA9sfFMZ_rSQK at K7bM2HJ<<b*
zh at 1R3sj-@WrK|_;FyRJ^7$c)iGg3=DT3nFmZv~-*$UU<V#86l0gegz|#^3SNKOsmw
zouJPD=z<dh0HHB%No+s^GM=#iYpMUm&e&^T5|bS?OuGP=5~IR0&S94YC5<?2Bqb5l
zdA%Lf_~uw+JYZHHfZXsNgCQ@*&!r|0WUU%Cd at o;&YdPL4yaO~^y#a25uhVbpnVNnL
z(RhKZSAV*gEpHX4cR7B5Pv1RIu^Q^gK?QXgwRd!QolL)2pt{AxV@azdP!;Br|3WXZ
zhRWQE0CfqsnrF!F;uhGYwut|aB%BDCzmEzkG~X}O{RO(g^dHarPqwa6bIXe&k>w9^
z>H(lf<vnwdp$W4Y>sN4o&ri*qOrY&^Y?*bmpE at xYW1cSxY`{&7lrvw`Yy3L*@hUVE
zf}blp1o>{5wzuS7O`t~c5J5l5q>H;ltB$toE`m1gd;$l?{-oJdKSR|ToZX(1K+|du
zTq%)My_2cE9tHF{wZ;gO%*KMDKD>V3HhO94(<B9QY3cMcVw71x%QB7&G&J&?wNYeu
z)EaZq3(G>M%QOl3=|i46OsfY}w|s at cWu<m@HXNZAbq5gzBimI>1!&|}-Reo&jN-#q
z(;vk6iGhal@?&pS<Uu+pKvXfUnG*p`WA*fu5g5l@Y>i+pcn13)#S;ZnmHf^FMkp4(
zHoyETFH$01BApSl28D0+O;vaPrr!&c()zu|8?3Q?k9{Q8uiWd{nthFW^pT8v54%ku
z>h%EqVA)O4HccQhy{<ASuCfXYR)v*|5F;)41Za`E{^eezk99RNW4w17sq9!zlgD`{
zd2e`$_*K2i{{DGH`FEaH*e_+$1K0`tWR0vmX3dFgyn1w?!PwCyE+5mQNa2UP?-2%^
z;NPv4bwM=Sg=-3a)%#2xeiDMUNfeKH-de4=e#>quu-<&`{1*rPjFd!D9-m2K((+!9
z#<zl>_1|manAR|UFHhoYeBo_Df3oeJ?0^0IPY3faek8o1qPh}NXyQ~B#8&9^U)+CB
zfI?dbU7E%JJSYGE<<Y;zUEy^o8 at HOl8(O0Os`dz%OMe at s{|3Dqe@|Be8;EdidP6@`
z)lSC&dm~?h?oCK|uW5_@ON5+3$&JTmP?jI}4*>eZ6mrCG_69DAJ at 18co&cQh5k3n5
Os3>SYE0wo=^Zx)+Bip|K

diff --git a/docs/js/bootstrap.js b/docs/js/bootstrap.js
new file mode 100644
index 0000000..6c15a58
--- /dev/null
+++ b/docs/js/bootstrap.js
@@ -0,0 +1,2159 @@
+/* ===================================================
+ * bootstrap-transition.js v2.2.2
+ * http://twitter.github.com/bootstrap/javascript.html#transitions
+ * ===================================================
+ * Copyright 2012 Twitter, Inc.
+ *
+ * Licensed under the Apache License, Version 2.0 (the "License");
+ * you may not use this file except in compliance with the License.
+ * You may obtain a copy of the License at
+ *
+ * http://www.apache.org/licenses/LICENSE-2.0
+ *
+ * Unless required by applicable law or agreed to in writing, software
+ * distributed under the License is distributed on an "AS IS" BASIS,
+ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
+ * See the License for the specific language governing permissions and
+ * limitations under the License.
+ * ========================================================== */
+
+
+!function ($) {
+
+  "use strict"; // jshint ;_;
+
+
+  /* CSS TRANSITION SUPPORT (http://www.modernizr.com/)
+   * ======================================================= */
+
+  $(function () {
+
+    $.support.transition = (function () {
+
+      var transitionEnd = (function () {
+
+        var el = document.createElement('bootstrap')
+          , transEndEventNames = {
+               'WebkitTransition' : 'webkitTransitionEnd'
+            ,  'MozTransition'    : 'transitionend'
+            ,  'OTransition'      : 'oTransitionEnd otransitionend'
+            ,  'transition'       : 'transitionend'
+            }
+          , name
+
+        for (name in transEndEventNames){
+          if (el.style[name] !== undefined) {
+            return transEndEventNames[name]
+          }
+        }
+
+      }())
+
+      return transitionEnd && {
+        end: transitionEnd
+      }
+
+    })()
+
+  })
+
+}(window.jQuery);/* ==========================================================
+ * bootstrap-alert.js v2.2.2
+ * http://twitter.github.com/bootstrap/javascript.html#alerts
+ * ==========================================================
+ * Copyright 2012 Twitter, Inc.
+ *
+ * Licensed under the Apache License, Version 2.0 (the "License");
+ * you may not use this file except in compliance with the License.
+ * You may obtain a copy of the License at
+ *
+ * http://www.apache.org/licenses/LICENSE-2.0
+ *
+ * Unless required by applicable law or agreed to in writing, software
+ * distributed under the License is distributed on an "AS IS" BASIS,
+ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
+ * See the License for the specific language governing permissions and
+ * limitations under the License.
+ * ========================================================== */
+
+
+!function ($) {
+
+  "use strict"; // jshint ;_;
+
+
+ /* ALERT CLASS DEFINITION
+  * ====================== */
+
+  var dismiss = '[data-dismiss="alert"]'
+    , Alert = function (el) {
+        $(el).on('click', dismiss, this.close)
+      }
+
+  Alert.prototype.close = function (e) {
+    var $this = $(this)
+      , selector = $this.attr('data-target')
+      , $parent
+
+    if (!selector) {
+      selector = $this.attr('href')
+      selector = selector && selector.replace(/.*(?=#[^\s]*$)/, '') //strip for ie7
+    }
+
+    $parent = $(selector)
+
+    e && e.preventDefault()
+
+    $parent.length || ($parent = $this.hasClass('alert') ? $this : $this.parent())
+
+    $parent.trigger(e = $.Event('close'))
+
+    if (e.isDefaultPrevented()) return
+
+    $parent.removeClass('in')
+
+    function removeElement() {
+      $parent
+        .trigger('closed')
+        .remove()
+    }
+
+    $.support.transition && $parent.hasClass('fade') ?
+      $parent.on($.support.transition.end, removeElement) :
+      removeElement()
+  }
+
+
+ /* ALERT PLUGIN DEFINITION
+  * ======================= */
+
+  var old = $.fn.alert
+
+  $.fn.alert = function (option) {
+    return this.each(function () {
+      var $this = $(this)
+        , data = $this.data('alert')
+      if (!data) $this.data('alert', (data = new Alert(this)))
+      if (typeof option == 'string') data[option].call($this)
+    })
+  }
+
+  $.fn.alert.Constructor = Alert
+
+
+ /* ALERT NO CONFLICT
+  * ================= */
+
+  $.fn.alert.noConflict = function () {
+    $.fn.alert = old
+    return this
+  }
+
+
+ /* ALERT DATA-API
+  * ============== */
+
+  $(document).on('click.alert.data-api', dismiss, Alert.prototype.close)
+
+}(window.jQuery);/* ============================================================
+ * bootstrap-button.js v2.2.2
+ * http://twitter.github.com/bootstrap/javascript.html#buttons
+ * ============================================================
+ * Copyright 2012 Twitter, Inc.
+ *
+ * Licensed under the Apache License, Version 2.0 (the "License");
+ * you may not use this file except in compliance with the License.
+ * You may obtain a copy of the License at
+ *
+ * http://www.apache.org/licenses/LICENSE-2.0
+ *
+ * Unless required by applicable law or agreed to in writing, software
+ * distributed under the License is distributed on an "AS IS" BASIS,
+ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
+ * See the License for the specific language governing permissions and
+ * limitations under the License.
+ * ============================================================ */
+
+
+!function ($) {
+
+  "use strict"; // jshint ;_;
+
+
+ /* BUTTON PUBLIC CLASS DEFINITION
+  * ============================== */
+
+  var Button = function (element, options) {
+    this.$element = $(element)
+    this.options = $.extend({}, $.fn.button.defaults, options)
+  }
+
+  Button.prototype.setState = function (state) {
+    var d = 'disabled'
+      , $el = this.$element
+      , data = $el.data()
+      , val = $el.is('input') ? 'val' : 'html'
+
+    state = state + 'Text'
+    data.resetText || $el.data('resetText', $el[val]())
+
+    $el[val](data[state] || this.options[state])
+
+    // push to event loop to allow forms to submit
+    setTimeout(function () {
+      state == 'loadingText' ?
+        $el.addClass(d).attr(d, d) :
+        $el.removeClass(d).removeAttr(d)
+    }, 0)
+  }
+
+  Button.prototype.toggle = function () {
+    var $parent = this.$element.closest('[data-toggle="buttons-radio"]')
+
+    $parent && $parent
+      .find('.active')
+      .removeClass('active')
+
+    this.$element.toggleClass('active')
+  }
+
+
+ /* BUTTON PLUGIN DEFINITION
+  * ======================== */
+
+  var old = $.fn.button
+
+  $.fn.button = function (option) {
+    return this.each(function () {
+      var $this = $(this)
+        , data = $this.data('button')
+        , options = typeof option == 'object' && option
+      if (!data) $this.data('button', (data = new Button(this, options)))
+      if (option == 'toggle') data.toggle()
+      else if (option) data.setState(option)
+    })
+  }
+
+  $.fn.button.defaults = {
+    loadingText: 'loading...'
+  }
+
+  $.fn.button.Constructor = Button
+
+
+ /* BUTTON NO CONFLICT
+  * ================== */
+
+  $.fn.button.noConflict = function () {
+    $.fn.button = old
+    return this
+  }
+
+
+ /* BUTTON DATA-API
+  * =============== */
+
+  $(document).on('click.button.data-api', '[data-toggle^=button]', function (e) {
+    var $btn = $(e.target)
+    if (!$btn.hasClass('btn')) $btn = $btn.closest('.btn')
+    $btn.button('toggle')
+  })
+
+}(window.jQuery);/* ==========================================================
+ * bootstrap-carousel.js v2.2.2
+ * http://twitter.github.com/bootstrap/javascript.html#carousel
+ * ==========================================================
+ * Copyright 2012 Twitter, Inc.
+ *
+ * Licensed under the Apache License, Version 2.0 (the "License");
+ * you may not use this file except in compliance with the License.
+ * You may obtain a copy of the License at
+ *
+ * http://www.apache.org/licenses/LICENSE-2.0
+ *
+ * Unless required by applicable law or agreed to in writing, software
+ * distributed under the License is distributed on an "AS IS" BASIS,
+ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
+ * See the License for the specific language governing permissions and
+ * limitations under the License.
+ * ========================================================== */
+
+
+!function ($) {
+
+  "use strict"; // jshint ;_;
+
+
+ /* CAROUSEL CLASS DEFINITION
+  * ========================= */
+
+  var Carousel = function (element, options) {
+    this.$element = $(element)
+    this.options = options
+    this.options.pause == 'hover' && this.$element
+      .on('mouseenter', $.proxy(this.pause, this))
+      .on('mouseleave', $.proxy(this.cycle, this))
+  }
+
+  Carousel.prototype = {
+
+    cycle: function (e) {
+      if (!e) this.paused = false
+      this.options.interval
+        && !this.paused
+        && (this.interval = setInterval($.proxy(this.next, this), this.options.interval))
+      return this
+    }
+
+  , to: function (pos) {
+      var $active = this.$element.find('.item.active')
+        , children = $active.parent().children()
+        , activePos = children.index($active)
+        , that = this
+
+      if (pos > (children.length - 1) || pos < 0) return
+
+      if (this.sliding) {
+        return this.$element.one('slid', function () {
+          that.to(pos)
+        })
+      }
+
+      if (activePos == pos) {
+        return this.pause().cycle()
+      }
+
+      return this.slide(pos > activePos ? 'next' : 'prev', $(children[pos]))
+    }
+
+  , pause: function (e) {
+      if (!e) this.paused = true
+      if (this.$element.find('.next, .prev').length && $.support.transition.end) {
+        this.$element.trigger($.support.transition.end)
+        this.cycle()
+      }
+      clearInterval(this.interval)
+      this.interval = null
+      return this
+    }
+
+  , next: function () {
+      if (this.sliding) return
+      return this.slide('next')
+    }
+
+  , prev: function () {
+      if (this.sliding) return
+      return this.slide('prev')
+    }
+
+  , slide: function (type, next) {
+      var $active = this.$element.find('.item.active')
+        , $next = next || $active[type]()
+        , isCycling = this.interval
+        , direction = type == 'next' ? 'left' : 'right'
+        , fallback  = type == 'next' ? 'first' : 'last'
+        , that = this
+        , e
+
+      this.sliding = true
+
+      isCycling && this.pause()
+
+      $next = $next.length ? $next : this.$element.find('.item')[fallback]()
+
+      e = $.Event('slide', {
+        relatedTarget: $next[0]
+      })
+
+      if ($next.hasClass('active')) return
+
+      if ($.support.transition && this.$element.hasClass('slide')) {
+        this.$element.trigger(e)
+        if (e.isDefaultPrevented()) return
+        $next.addClass(type)
+        $next[0].offsetWidth // force reflow
+        $active.addClass(direction)
+        $next.addClass(direction)
+        this.$element.one($.support.transition.end, function () {
+          $next.removeClass([type, direction].join(' ')).addClass('active')
+          $active.removeClass(['active', direction].join(' '))
+          that.sliding = false
+          setTimeout(function () { that.$element.trigger('slid') }, 0)
+        })
+      } else {
+        this.$element.trigger(e)
+        if (e.isDefaultPrevented()) return
+        $active.removeClass('active')
+        $next.addClass('active')
+        this.sliding = false
+        this.$element.trigger('slid')
+      }
+
+      isCycling && this.cycle()
+
+      return this
+    }
+
+  }
+
+
+ /* CAROUSEL PLUGIN DEFINITION
+  * ========================== */
+
+  var old = $.fn.carousel
+
+  $.fn.carousel = function (option) {
+    return this.each(function () {
+      var $this = $(this)
+        , data = $this.data('carousel')
+        , options = $.extend({}, $.fn.carousel.defaults, typeof option == 'object' && option)
+        , action = typeof option == 'string' ? option : options.slide
+      if (!data) $this.data('carousel', (data = new Carousel(this, options)))
+      if (typeof option == 'number') data.to(option)
+      else if (action) data[action]()
+      else if (options.interval) data.cycle()
+    })
+  }
+
+  $.fn.carousel.defaults = {
+    interval: 5000
+  , pause: 'hover'
+  }
+
+  $.fn.carousel.Constructor = Carousel
+
+
+ /* CAROUSEL NO CONFLICT
+  * ==================== */
+
+  $.fn.carousel.noConflict = function () {
+    $.fn.carousel = old
+    return this
+  }
+
+ /* CAROUSEL DATA-API
+  * ================= */
+
+  $(document).on('click.carousel.data-api', '[data-slide]', function (e) {
+    var $this = $(this), href
+      , $target = $($this.attr('data-target') || (href = $this.attr('href')) && href.replace(/.*(?=#[^\s]+$)/, '')) //strip for ie7
+      , options = $.extend({}, $target.data(), $this.data())
+    $target.carousel(options)
+    e.preventDefault()
+  })
+
+}(window.jQuery);/* =============================================================
+ * bootstrap-collapse.js v2.2.2
+ * http://twitter.github.com/bootstrap/javascript.html#collapse
+ * =============================================================
+ * Copyright 2012 Twitter, Inc.
+ *
+ * Licensed under the Apache License, Version 2.0 (the "License");
+ * you may not use this file except in compliance with the License.
+ * You may obtain a copy of the License at
+ *
+ * http://www.apache.org/licenses/LICENSE-2.0
+ *
+ * Unless required by applicable law or agreed to in writing, software
+ * distributed under the License is distributed on an "AS IS" BASIS,
+ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
+ * See the License for the specific language governing permissions and
+ * limitations under the License.
+ * ============================================================ */
+
+
+!function ($) {
+
+  "use strict"; // jshint ;_;
+
+
+ /* COLLAPSE PUBLIC CLASS DEFINITION
+  * ================================ */
+
+  var Collapse = function (element, options) {
+    this.$element = $(element)
+    this.options = $.extend({}, $.fn.collapse.defaults, options)
+
+    if (this.options.parent) {
+      this.$parent = $(this.options.parent)
+    }
+
+    this.options.toggle && this.toggle()
+  }
+
+  Collapse.prototype = {
+
+    constructor: Collapse
+
+  , dimension: function () {
+      var hasWidth = this.$element.hasClass('width')
+      return hasWidth ? 'width' : 'height'
+    }
+
+  , show: function () {
+      var dimension
+        , scroll
+        , actives
+        , hasData
+
+      if (this.transitioning) return
+
+      dimension = this.dimension()
+      scroll = $.camelCase(['scroll', dimension].join('-'))
+      actives = this.$parent && this.$parent.find('> .accordion-group > .in')
+
+      if (actives && actives.length) {
+        hasData = actives.data('collapse')
+        if (hasData && hasData.transitioning) return
+        actives.collapse('hide')
+        hasData || actives.data('collapse', null)
+      }
+
+      this.$element[dimension](0)
+      this.transition('addClass', $.Event('show'), 'shown')
+      $.support.transition && this.$element[dimension](this.$element[0][scroll])
+    }
+
+  , hide: function () {
+      var dimension
+      if (this.transitioning) return
+      dimension = this.dimension()
+      this.reset(this.$element[dimension]())
+      this.transition('removeClass', $.Event('hide'), 'hidden')
+      this.$element[dimension](0)
+    }
+
+  , reset: function (size) {
+      var dimension = this.dimension()
+
+      this.$element
+        .removeClass('collapse')
+        [dimension](size || 'auto')
+        [0].offsetWidth
+
+      this.$element[size !== null ? 'addClass' : 'removeClass']('collapse')
+
+      return this
+    }
+
+  , transition: function (method, startEvent, completeEvent) {
+      var that = this
+        , complete = function () {
+            if (startEvent.type == 'show') that.reset()
+            that.transitioning = 0
+            that.$element.trigger(completeEvent)
+          }
+
+      this.$element.trigger(startEvent)
+
+      if (startEvent.isDefaultPrevented()) return
+
+      this.transitioning = 1
+
+      this.$element[method]('in')
+
+      $.support.transition && this.$element.hasClass('collapse') ?
+        this.$element.one($.support.transition.end, complete) :
+        complete()
+    }
+
+  , toggle: function () {
+      this[this.$element.hasClass('in') ? 'hide' : 'show']()
+    }
+
+  }
+
+
+ /* COLLAPSE PLUGIN DEFINITION
+  * ========================== */
+
+  var old = $.fn.collapse
+
+  $.fn.collapse = function (option) {
+    return this.each(function () {
+      var $this = $(this)
+        , data = $this.data('collapse')
+        , options = typeof option == 'object' && option
+      if (!data) $this.data('collapse', (data = new Collapse(this, options)))
+      if (typeof option == 'string') data[option]()
+    })
+  }
+
+  $.fn.collapse.defaults = {
+    toggle: true
+  }
+
+  $.fn.collapse.Constructor = Collapse
+
+
+ /* COLLAPSE NO CONFLICT
+  * ==================== */
+
+  $.fn.collapse.noConflict = function () {
+    $.fn.collapse = old
+    return this
+  }
+
+
+ /* COLLAPSE DATA-API
+  * ================= */
+
+  $(document).on('click.collapse.data-api', '[data-toggle=collapse]', function (e) {
+    var $this = $(this), href
+      , target = $this.attr('data-target')
+        || e.preventDefault()
+        || (href = $this.attr('href')) && href.replace(/.*(?=#[^\s]+$)/, '') //strip for ie7
+      , option = $(target).data('collapse') ? 'toggle' : $this.data()
+    $this[$(target).hasClass('in') ? 'addClass' : 'removeClass']('collapsed')
+    $(target).collapse(option)
+  })
+
+}(window.jQuery);/* ============================================================
+ * bootstrap-dropdown.js v2.2.2
+ * http://twitter.github.com/bootstrap/javascript.html#dropdowns
+ * ============================================================
+ * Copyright 2012 Twitter, Inc.
+ *
+ * Licensed under the Apache License, Version 2.0 (the "License");
+ * you may not use this file except in compliance with the License.
+ * You may obtain a copy of the License at
+ *
+ * http://www.apache.org/licenses/LICENSE-2.0
+ *
+ * Unless required by applicable law or agreed to in writing, software
+ * distributed under the License is distributed on an "AS IS" BASIS,
+ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
+ * See the License for the specific language governing permissions and
+ * limitations under the License.
+ * ============================================================ */
+
+
+!function ($) {
+
+  "use strict"; // jshint ;_;
+
+
+ /* DROPDOWN CLASS DEFINITION
+  * ========================= */
+
+  var toggle = '[data-toggle=dropdown]'
+    , Dropdown = function (element) {
+        var $el = $(element).on('click.dropdown.data-api', this.toggle)
+        $('html').on('click.dropdown.data-api', function () {
+          $el.parent().removeClass('open')
+        })
+      }
+
+  Dropdown.prototype = {
+
+    constructor: Dropdown
+
+  , toggle: function (e) {
+      var $this = $(this)
+        , $parent
+        , isActive
+
+      if ($this.is('.disabled, :disabled')) return
+
+      $parent = getParent($this)
+
+      isActive = $parent.hasClass('open')
+
+      clearMenus()
+
+      if (!isActive) {
+        $parent.toggleClass('open')
+      }
+
+      $this.focus()
+
+      return false
+    }
+
+  , keydown: function (e) {
+      var $this
+        , $items
+        , $active
+        , $parent
+        , isActive
+        , index
+
+      if (!/(38|40|27)/.test(e.keyCode)) return
+
+      $this = $(this)
+
+      e.preventDefault()
+      e.stopPropagation()
+
+      if ($this.is('.disabled, :disabled')) return
+
+      $parent = getParent($this)
+
+      isActive = $parent.hasClass('open')
+
+      if (!isActive || (isActive && e.keyCode == 27)) return $this.click()
+
+      $items = $('[role=menu] li:not(.divider):visible a', $parent)
+
+      if (!$items.length) return
+
+      index = $items.index($items.filter(':focus'))
+
+      if (e.keyCode == 38 && index > 0) index--                                        // up
+      if (e.keyCode == 40 && index < $items.length - 1) index++                        // down
+      if (!~index) index = 0
+
+      $items
+        .eq(index)
+        .focus()
+    }
+
+  }
+
+  function clearMenus() {
+    $(toggle).each(function () {
+      getParent($(this)).removeClass('open')
+    })
+  }
+
+  function getParent($this) {
+    var selector = $this.attr('data-target')
+      , $parent
+
+    if (!selector) {
+      selector = $this.attr('href')
+      selector = selector && /#/.test(selector) && selector.replace(/.*(?=#[^\s]*$)/, '') //strip for ie7
+    }
+
+    $parent = $(selector)
+    $parent.length || ($parent = $this.parent())
+
+    return $parent
+  }
+
+
+  /* DROPDOWN PLUGIN DEFINITION
+   * ========================== */
+
+  var old = $.fn.dropdown
+
+  $.fn.dropdown = function (option) {
+    return this.each(function () {
+      var $this = $(this)
+        , data = $this.data('dropdown')
+      if (!data) $this.data('dropdown', (data = new Dropdown(this)))
+      if (typeof option == 'string') data[option].call($this)
+    })
+  }
+
+  $.fn.dropdown.Constructor = Dropdown
+
+
+ /* DROPDOWN NO CONFLICT
+  * ==================== */
+
+  $.fn.dropdown.noConflict = function () {
+    $.fn.dropdown = old
+    return this
+  }
+
+
+  /* APPLY TO STANDARD DROPDOWN ELEMENTS
+   * =================================== */
+
+  $(document)
+    .on('click.dropdown.data-api touchstart.dropdown.data-api', clearMenus)
+    .on('click.dropdown touchstart.dropdown.data-api', '.dropdown form', function (e) { e.stopPropagation() })
+    .on('touchstart.dropdown.data-api', '.dropdown-menu', function (e) { e.stopPropagation() })
+    .on('click.dropdown.data-api touchstart.dropdown.data-api'  , toggle, Dropdown.prototype.toggle)
+    .on('keydown.dropdown.data-api touchstart.dropdown.data-api', toggle + ', [role=menu]' , Dropdown.prototype.keydown)
+
+}(window.jQuery);/* =========================================================
+ * bootstrap-modal.js v2.2.2
+ * http://twitter.github.com/bootstrap/javascript.html#modals
+ * =========================================================
+ * Copyright 2012 Twitter, Inc.
+ *
+ * Licensed under the Apache License, Version 2.0 (the "License");
+ * you may not use this file except in compliance with the License.
+ * You may obtain a copy of the License at
+ *
+ * http://www.apache.org/licenses/LICENSE-2.0
+ *
+ * Unless required by applicable law or agreed to in writing, software
+ * distributed under the License is distributed on an "AS IS" BASIS,
+ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
+ * See the License for the specific language governing permissions and
+ * limitations under the License.
+ * ========================================================= */
+
+
+!function ($) {
+
+  "use strict"; // jshint ;_;
+
+
+ /* MODAL CLASS DEFINITION
+  * ====================== */
+
+  var Modal = function (element, options) {
+    this.options = options
+    this.$element = $(element)
+      .delegate('[data-dismiss="modal"]', 'click.dismiss.modal', $.proxy(this.hide, this))
+    this.options.remote && this.$element.find('.modal-body').load(this.options.remote)
+  }
+
+  Modal.prototype = {
+
+      constructor: Modal
+
+    , toggle: function () {
+        return this[!this.isShown ? 'show' : 'hide']()
+      }
+
+    , show: function () {
+        var that = this
+          , e = $.Event('show')
+
+        this.$element.trigger(e)
+
+        if (this.isShown || e.isDefaultPrevented()) return
+
+        this.isShown = true
+
+        this.escape()
+
+        this.backdrop(function () {
+          var transition = $.support.transition && that.$element.hasClass('fade')
+
+          if (!that.$element.parent().length) {
+            that.$element.appendTo(document.body) //don't move modals dom position
+          }
+
+          that.$element
+            .show()
+
+          if (transition) {
+            that.$element[0].offsetWidth // force reflow
+          }
+
+          that.$element
+            .addClass('in')
+            .attr('aria-hidden', false)
+
+          that.enforceFocus()
+
+          transition ?
+            that.$element.one($.support.transition.end, function () { that.$element.focus().trigger('shown') }) :
+            that.$element.focus().trigger('shown')
+
+        })
+      }
+
+    , hide: function (e) {
+        e && e.preventDefault()
+
+        var that = this
+
+        e = $.Event('hide')
+
+        this.$element.trigger(e)
+
+        if (!this.isShown || e.isDefaultPrevented()) return
+
+        this.isShown = false
+
+        this.escape()
+
+        $(document).off('focusin.modal')
+
+        this.$element
+          .removeClass('in')
+          .attr('aria-hidden', true)
+
+        $.support.transition && this.$element.hasClass('fade') ?
+          this.hideWithTransition() :
+          this.hideModal()
+      }
+
+    , enforceFocus: function () {
+        var that = this
+        $(document).on('focusin.modal', function (e) {
+          if (that.$element[0] !== e.target && !that.$element.has(e.target).length) {
+            that.$element.focus()
+          }
+        })
+      }
+
+    , escape: function () {
+        var that = this
+        if (this.isShown && this.options.keyboard) {
+          this.$element.on('keyup.dismiss.modal', function ( e ) {
+            e.which == 27 && that.hide()
+          })
+        } else if (!this.isShown) {
+          this.$element.off('keyup.dismiss.modal')
+        }
+      }
+
+    , hideWithTransition: function () {
+        var that = this
+          , timeout = setTimeout(function () {
+              that.$element.off($.support.transition.end)
+              that.hideModal()
+            }, 500)
+
+        this.$element.one($.support.transition.end, function () {
+          clearTimeout(timeout)
+          that.hideModal()
+        })
+      }
+
+    , hideModal: function (that) {
+        this.$element
+          .hide()
+          .trigger('hidden')
+
+        this.backdrop()
+      }
+
+    , removeBackdrop: function () {
+        this.$backdrop.remove()
+        this.$backdrop = null
+      }
+
+    , backdrop: function (callback) {
+        var that = this
+          , animate = this.$element.hasClass('fade') ? 'fade' : ''
+
+        if (this.isShown && this.options.backdrop) {
+          var doAnimate = $.support.transition && animate
+
+          this.$backdrop = $('<div class="modal-backdrop ' + animate + '" />')
+            .appendTo(document.body)
+
+          this.$backdrop.click(
+            this.options.backdrop == 'static' ?
+              $.proxy(this.$element[0].focus, this.$element[0])
+            : $.proxy(this.hide, this)
+          )
+
+          if (doAnimate) this.$backdrop[0].offsetWidth // force reflow
+
+          this.$backdrop.addClass('in')
+
+          doAnimate ?
+            this.$backdrop.one($.support.transition.end, callback) :
+            callback()
+
+        } else if (!this.isShown && this.$backdrop) {
+          this.$backdrop.removeClass('in')
+
+          $.support.transition && this.$element.hasClass('fade')?
+            this.$backdrop.one($.support.transition.end, $.proxy(this.removeBackdrop, this)) :
+            this.removeBackdrop()
+
+        } else if (callback) {
+          callback()
+        }
+      }
+  }
+
+
+ /* MODAL PLUGIN DEFINITION
+  * ======================= */
+
+  var old = $.fn.modal
+
+  $.fn.modal = function (option) {
+    return this.each(function () {
+      var $this = $(this)
+        , data = $this.data('modal')
+        , options = $.extend({}, $.fn.modal.defaults, $this.data(), typeof option == 'object' && option)
+      if (!data) $this.data('modal', (data = new Modal(this, options)))
+      if (typeof option == 'string') data[option]()
+      else if (options.show) data.show()
+    })
+  }
+
+  $.fn.modal.defaults = {
+      backdrop: true
+    , keyboard: true
+    , show: true
+  }
+
+  $.fn.modal.Constructor = Modal
+
+
+ /* MODAL NO CONFLICT
+  * ================= */
+
+  $.fn.modal.noConflict = function () {
+    $.fn.modal = old
+    return this
+  }
+
+
+ /* MODAL DATA-API
+  * ============== */
+
+  $(document).on('click.modal.data-api', '[data-toggle="modal"]', function (e) {
+    var $this = $(this)
+      , href = $this.attr('href')
+      , $target = $($this.attr('data-target') || (href && href.replace(/.*(?=#[^\s]+$)/, ''))) //strip for ie7
+      , option = $target.data('modal') ? 'toggle' : $.extend({ remote:!/#/.test(href) && href }, $target.data(), $this.data())
+
+    e.preventDefault()
+
+    $target
+      .modal(option)
+      .one('hide', function () {
+        $this.focus()
+      })
+  })
+
+}(window.jQuery);
+/* ===========================================================
+ * bootstrap-tooltip.js v2.2.2
+ * http://twitter.github.com/bootstrap/javascript.html#tooltips
+ * Inspired by the original jQuery.tipsy by Jason Frame
+ * ===========================================================
+ * Copyright 2012 Twitter, Inc.
+ *
+ * Licensed under the Apache License, Version 2.0 (the "License");
+ * you may not use this file except in compliance with the License.
+ * You may obtain a copy of the License at
+ *
+ * http://www.apache.org/licenses/LICENSE-2.0
+ *
+ * Unless required by applicable law or agreed to in writing, software
+ * distributed under the License is distributed on an "AS IS" BASIS,
+ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
+ * See the License for the specific language governing permissions and
+ * limitations under the License.
+ * ========================================================== */
+
+
+!function ($) {
+
+  "use strict"; // jshint ;_;
+
+
+ /* TOOLTIP PUBLIC CLASS DEFINITION
+  * =============================== */
+
+  var Tooltip = function (element, options) {
+    this.init('tooltip', element, options)
+  }
+
+  Tooltip.prototype = {
+
+    constructor: Tooltip
+
+  , init: function (type, element, options) {
+      var eventIn
+        , eventOut
+
+      this.type = type
+      this.$element = $(element)
+      this.options = this.getOptions(options)
+      this.enabled = true
+
+      if (this.options.trigger == 'click') {
+        this.$element.on('click.' + this.type, this.options.selector, $.proxy(this.toggle, this))
+      } else if (this.options.trigger != 'manual') {
+        eventIn = this.options.trigger == 'hover' ? 'mouseenter' : 'focus'
+        eventOut = this.options.trigger == 'hover' ? 'mouseleave' : 'blur'
+        this.$element.on(eventIn + '.' + this.type, this.options.selector, $.proxy(this.enter, this))
+        this.$element.on(eventOut + '.' + this.type, this.options.selector, $.proxy(this.leave, this))
+      }
+
+      this.options.selector ?
+        (this._options = $.extend({}, this.options, { trigger: 'manual', selector: '' })) :
+        this.fixTitle()
+    }
+
+  , getOptions: function (options) {
+      options = $.extend({}, $.fn[this.type].defaults, options, this.$element.data())
+
+      if (options.delay && typeof options.delay == 'number') {
+        options.delay = {
+          show: options.delay
+        , hide: options.delay
+        }
+      }
+
+      return options
+    }
+
+  , enter: function (e) {
+      var self = $(e.currentTarget)[this.type](this._options).data(this.type)
+
+      if (!self.options.delay || !self.options.delay.show) return self.show()
+
+      clearTimeout(this.timeout)
+      self.hoverState = 'in'
+      this.timeout = setTimeout(function() {
+        if (self.hoverState == 'in') self.show()
+      }, self.options.delay.show)
+    }
+
+  , leave: function (e) {
+      var self = $(e.currentTarget)[this.type](this._options).data(this.type)
+
+      if (this.timeout) clearTimeout(this.timeout)
+      if (!self.options.delay || !self.options.delay.hide) return self.hide()
+
+      self.hoverState = 'out'
+      this.timeout = setTimeout(function() {
+        if (self.hoverState == 'out') self.hide()
+      }, self.options.delay.hide)
+    }
+
+  , show: function () {
+      var $tip
+        , inside
+        , pos
+        , actualWidth
+        , actualHeight
+        , placement
+        , tp
+
+      if (this.hasContent() && this.enabled) {
+        $tip = this.tip()
+        this.setContent()
+
+        if (this.options.animation) {
+          $tip.addClass('fade')
+        }
+
+        placement = typeof this.options.placement == 'function' ?
+          this.options.placement.call(this, $tip[0], this.$element[0]) :
+          this.options.placement
+
+        inside = /in/.test(placement)
+
+        $tip
+          .detach()
+          .css({ top: 0, left: 0, display: 'block' })
+          .insertAfter(this.$element)
+
+        pos = this.getPosition(inside)
+
+        actualWidth = $tip[0].offsetWidth
+        actualHeight = $tip[0].offsetHeight
+
+        switch (inside ? placement.split(' ')[1] : placement) {
+          case 'bottom':
+            tp = {top: pos.top + pos.height, left: pos.left + pos.width / 2 - actualWidth / 2}
+            break
+          case 'top':
+            tp = {top: pos.top - actualHeight, left: pos.left + pos.width / 2 - actualWidth / 2}
+            break
+          case 'left':
+            tp = {top: pos.top + pos.height / 2 - actualHeight / 2, left: pos.left - actualWidth}
+            break
+          case 'right':
+            tp = {top: pos.top + pos.height / 2 - actualHeight / 2, left: pos.left + pos.width}
+            break
+        }
+
+        $tip
+          .offset(tp)
+          .addClass(placement)
+          .addClass('in')
+      }
+    }
+
+  , setContent: function () {
+      var $tip = this.tip()
+        , title = this.getTitle()
+
+      $tip.find('.tooltip-inner')[this.options.html ? 'html' : 'text'](title)
+      $tip.removeClass('fade in top bottom left right')
+    }
+
+  , hide: function () {
+      var that = this
+        , $tip = this.tip()
+
+      $tip.removeClass('in')
+
+      function removeWithAnimation() {
+        var timeout = setTimeout(function () {
+          $tip.off($.support.transition.end).detach()
+        }, 500)
+
+        $tip.one($.support.transition.end, function () {
+          clearTimeout(timeout)
+          $tip.detach()
+        })
+      }
+
+      $.support.transition && this.$tip.hasClass('fade') ?
+        removeWithAnimation() :
+        $tip.detach()
+
+      return this
+    }
+
+  , fixTitle: function () {
+      var $e = this.$element
+      if ($e.attr('title') || typeof($e.attr('data-original-title')) != 'string') {
+        $e.attr('data-original-title', $e.attr('title') || '').removeAttr('title')
+      }
+    }
+
+  , hasContent: function () {
+      return this.getTitle()
+    }
+
+  , getPosition: function (inside) {
+      return $.extend({}, (inside ? {top: 0, left: 0} : this.$element.offset()), {
+        width: this.$element[0].offsetWidth
+      , height: this.$element[0].offsetHeight
+      })
+    }
+
+  , getTitle: function () {
+      var title
+        , $e = this.$element
+        , o = this.options
+
+      title = $e.attr('data-original-title')
+        || (typeof o.title == 'function' ? o.title.call($e[0]) :  o.title)
+
+      return title
+    }
+
+  , tip: function () {
+      return this.$tip = this.$tip || $(this.options.template)
+    }
+
+  , validate: function () {
+      if (!this.$element[0].parentNode) {
+        this.hide()
+        this.$element = null
+        this.options = null
+      }
+    }
+
+  , enable: function () {
+      this.enabled = true
+    }
+
+  , disable: function () {
+      this.enabled = false
+    }
+
+  , toggleEnabled: function () {
+      this.enabled = !this.enabled
+    }
+
+  , toggle: function (e) {
+      var self = $(e.currentTarget)[this.type](this._options).data(this.type)
+      self[self.tip().hasClass('in') ? 'hide' : 'show']()
+    }
+
+  , destroy: function () {
+      this.hide().$element.off('.' + this.type).removeData(this.type)
+    }
+
+  }
+
+
+ /* TOOLTIP PLUGIN DEFINITION
+  * ========================= */
+
+  var old = $.fn.tooltip
+
+  $.fn.tooltip = function ( option ) {
+    return this.each(function () {
+      var $this = $(this)
+        , data = $this.data('tooltip')
+        , options = typeof option == 'object' && option
+      if (!data) $this.data('tooltip', (data = new Tooltip(this, options)))
+      if (typeof option == 'string') data[option]()
+    })
+  }
+
+  $.fn.tooltip.Constructor = Tooltip
+
+  $.fn.tooltip.defaults = {
+    animation: true
+  , placement: 'top'
+  , selector: false
+  , template: '<div class="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
+  , trigger: 'hover'
+  , title: ''
+  , delay: 0
+  , html: false
+  }
+
+
+ /* TOOLTIP NO CONFLICT
+  * =================== */
+
+  $.fn.tooltip.noConflict = function () {
+    $.fn.tooltip = old
+    return this
+  }
+
+}(window.jQuery);/* ===========================================================
+ * bootstrap-popover.js v2.2.2
+ * http://twitter.github.com/bootstrap/javascript.html#popovers
+ * ===========================================================
+ * Copyright 2012 Twitter, Inc.
+ *
+ * Licensed under the Apache License, Version 2.0 (the "License");
+ * you may not use this file except in compliance with the License.
+ * You may obtain a copy of the License at
+ *
+ * http://www.apache.org/licenses/LICENSE-2.0
+ *
+ * Unless required by applicable law or agreed to in writing, software
+ * distributed under the License is distributed on an "AS IS" BASIS,
+ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
+ * See the License for the specific language governing permissions and
+ * limitations under the License.
+ * =========================================================== */
+
+
+!function ($) {
+
+  "use strict"; // jshint ;_;
+
+
+ /* POPOVER PUBLIC CLASS DEFINITION
+  * =============================== */
+
+  var Popover = function (element, options) {
+    this.init('popover', element, options)
+  }
+
+
+  /* NOTE: POPOVER EXTENDS BOOTSTRAP-TOOLTIP.js
+     ========================================== */
+
+  Popover.prototype = $.extend({}, $.fn.tooltip.Constructor.prototype, {
+
+    constructor: Popover
+
+  , setContent: function () {
+      var $tip = this.tip()
+        , title = this.getTitle()
+        , content = this.getContent()
+
+      $tip.find('.popover-title')[this.options.html ? 'html' : 'text'](title)
+      $tip.find('.popover-content')[this.options.html ? 'html' : 'text'](content)
+
+      $tip.removeClass('fade top bottom left right in')
+    }
+
+  , hasContent: function () {
+      return this.getTitle() || this.getContent()
+    }
+
+  , getContent: function () {
+      var content
+        , $e = this.$element
+        , o = this.options
+
+      content = $e.attr('data-content')
+        || (typeof o.content == 'function' ? o.content.call($e[0]) :  o.content)
+
+      return content
+    }
+
+  , tip: function () {
+      if (!this.$tip) {
+        this.$tip = $(this.options.template)
+      }
+      return this.$tip
+    }
+
+  , destroy: function () {
+      this.hide().$element.off('.' + this.type).removeData(this.type)
+    }
+
+  })
+
+
+ /* POPOVER PLUGIN DEFINITION
+  * ======================= */
+
+  var old = $.fn.popover
+
+  $.fn.popover = function (option) {
+    return this.each(function () {
+      var $this = $(this)
+        , data = $this.data('popover')
+        , options = typeof option == 'object' && option
+      if (!data) $this.data('popover', (data = new Popover(this, options)))
+      if (typeof option == 'string') data[option]()
+    })
+  }
+
+  $.fn.popover.Constructor = Popover
+
+  $.fn.popover.defaults = $.extend({} , $.fn.tooltip.defaults, {
+    placement: 'right'
+  , trigger: 'click'
+  , content: ''
+  , template: '<div class="popover"><div class="arrow"></div><div class="popover-inner"><h3 class="popover-title"></h3><div class="popover-content"></div></div></div>'
+  })
+
+
+ /* POPOVER NO CONFLICT
+  * =================== */
+
+  $.fn.popover.noConflict = function () {
+    $.fn.popover = old
+    return this
+  }
+
+}(window.jQuery);/* =============================================================
+ * bootstrap-scrollspy.js v2.2.2
+ * http://twitter.github.com/bootstrap/javascript.html#scrollspy
+ * =============================================================
+ * Copyright 2012 Twitter, Inc.
+ *
+ * Licensed under the Apache License, Version 2.0 (the "License");
+ * you may not use this file except in compliance with the License.
+ * You may obtain a copy of the License at
+ *
+ * http://www.apache.org/licenses/LICENSE-2.0
+ *
+ * Unless required by applicable law or agreed to in writing, software
+ * distributed under the License is distributed on an "AS IS" BASIS,
+ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
+ * See the License for the specific language governing permissions and
+ * limitations under the License.
+ * ============================================================== */
+
+
+!function ($) {
+
+  "use strict"; // jshint ;_;
+
+
+ /* SCROLLSPY CLASS DEFINITION
+  * ========================== */
+
+  function ScrollSpy(element, options) {
+    var process = $.proxy(this.process, this)
+      , $element = $(element).is('body') ? $(window) : $(element)
+      , href
+    this.options = $.extend({}, $.fn.scrollspy.defaults, options)
+    this.$scrollElement = $element.on('scroll.scroll-spy.data-api', process)
+    this.selector = (this.options.target
+      || ((href = $(element).attr('href')) && href.replace(/.*(?=#[^\s]+$)/, '')) //strip for ie7
+      || '') + ' .nav li > a'
+    this.$body = $('body')
+    this.refresh()
+    this.process()
+  }
+
+  ScrollSpy.prototype = {
+
+      constructor: ScrollSpy
+
+    , refresh: function () {
+        var self = this
+          , $targets
+
+        this.offsets = $([])
+        this.targets = $([])
+
+        $targets = this.$body
+          .find(this.selector)
+          .map(function () {
+            var $el = $(this)
+              , href = $el.data('target') || $el.attr('href')
+              , $href = /^#\w/.test(href) && $(href)
+            return ( $href
+              && $href.length
+              && [[ $href.position().top + self.$scrollElement.scrollTop(), href ]] ) || null
+          })
+          .sort(function (a, b) { return a[0] - b[0] })
+          .each(function () {
+            self.offsets.push(this[0])
+            self.targets.push(this[1])
+          })
+      }
+
+    , process: function () {
+        var scrollTop = this.$scrollElement.scrollTop() + this.options.offset
+          , scrollHeight = this.$scrollElement[0].scrollHeight || this.$body[0].scrollHeight
+          , maxScroll = scrollHeight - this.$scrollElement.height()
+          , offsets = this.offsets
+          , targets = this.targets
+          , activeTarget = this.activeTarget
+          , i
+
+        if (scrollTop >= maxScroll) {
+          return activeTarget != (i = targets.last()[0])
+            && this.activate ( i )
+        }
+
+        for (i = offsets.length; i--;) {
+          activeTarget != targets[i]
+            && scrollTop >= offsets[i]
+            && (!offsets[i + 1] || scrollTop <= offsets[i + 1])
+            && this.activate( targets[i] )
+        }
+      }
+
+    , activate: function (target) {
+        var active
+          , selector
+
+        this.activeTarget = target
+
+        $(this.selector)
+          .parent('.active')
+          .removeClass('active')
+
+        selector = this.selector
+          + '[data-target="' + target + '"],'
+          + this.selector + '[href="' + target + '"]'
+
+        active = $(selector)
+          .parent('li')
+          .addClass('active')
+
+        if (active.parent('.dropdown-menu').length)  {
+          active = active.closest('li.dropdown').addClass('active')
+        }
+
+        active.trigger('activate')
+      }
+
+  }
+
+
+ /* SCROLLSPY PLUGIN DEFINITION
+  * =========================== */
+
+  var old = $.fn.scrollspy
+
+  $.fn.scrollspy = function (option) {
+    return this.each(function () {
+      var $this = $(this)
+        , data = $this.data('scrollspy')
+        , options = typeof option == 'object' && option
+      if (!data) $this.data('scrollspy', (data = new ScrollSpy(this, options)))
+      if (typeof option == 'string') data[option]()
+    })
+  }
+
+  $.fn.scrollspy.Constructor = ScrollSpy
+
+  $.fn.scrollspy.defaults = {
+    offset: 10
+  }
+
+
+ /* SCROLLSPY NO CONFLICT
+  * ===================== */
+
+  $.fn.scrollspy.noConflict = function () {
+    $.fn.scrollspy = old
+    return this
+  }
+
+
+ /* SCROLLSPY DATA-API
+  * ================== */
+
+  $(window).on('load', function () {
+    $('[data-spy="scroll"]').each(function () {
+      var $spy = $(this)
+      $spy.scrollspy($spy.data())
+    })
+  })
+
+}(window.jQuery);/* ========================================================
+ * bootstrap-tab.js v2.2.2
+ * http://twitter.github.com/bootstrap/javascript.html#tabs
+ * ========================================================
+ * Copyright 2012 Twitter, Inc.
+ *
+ * Licensed under the Apache License, Version 2.0 (the "License");
+ * you may not use this file except in compliance with the License.
+ * You may obtain a copy of the License at
+ *
+ * http://www.apache.org/licenses/LICENSE-2.0
+ *
+ * Unless required by applicable law or agreed to in writing, software
+ * distributed under the License is distributed on an "AS IS" BASIS,
+ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
+ * See the License for the specific language governing permissions and
+ * limitations under the License.
+ * ======================================================== */
+
+
+!function ($) {
+
+  "use strict"; // jshint ;_;
+
+
+ /* TAB CLASS DEFINITION
+  * ==================== */
+
+  var Tab = function (element) {
+    this.element = $(element)
+  }
+
+  Tab.prototype = {
+
+    constructor: Tab
+
+  , show: function () {
+      var $this = this.element
+        , $ul = $this.closest('ul:not(.dropdown-menu)')
+        , selector = $this.attr('data-target')
+        , previous
+        , $target
+        , e
+
+      if (!selector) {
+        selector = $this.attr('href')
+        selector = selector && selector.replace(/.*(?=#[^\s]*$)/, '') //strip for ie7
+      }
+
+      if ( $this.parent('li').hasClass('active') ) return
+
+      previous = $ul.find('.active:last a')[0]
+
+      e = $.Event('show', {
+        relatedTarget: previous
+      })
+
+      $this.trigger(e)
+
+      if (e.isDefaultPrevented()) return
+
+      $target = $(selector)
+
+      this.activate($this.parent('li'), $ul)
+      this.activate($target, $target.parent(), function () {
+        $this.trigger({
+          type: 'shown'
+        , relatedTarget: previous
+        })
+      })
+    }
+
+  , activate: function ( element, container, callback) {
+      var $active = container.find('> .active')
+        , transition = callback
+            && $.support.transition
+            && $active.hasClass('fade')
+
+      function next() {
+        $active
+          .removeClass('active')
+          .find('> .dropdown-menu > .active')
+          .removeClass('active')
+
+        element.addClass('active')
+
+        if (transition) {
+          element[0].offsetWidth // reflow for transition
+          element.addClass('in')
+        } else {
+          element.removeClass('fade')
+        }
+
+        if ( element.parent('.dropdown-menu') ) {
+          element.closest('li.dropdown').addClass('active')
+        }
+
+        callback && callback()
+      }
+
+      transition ?
+        $active.one($.support.transition.end, next) :
+        next()
+
+      $active.removeClass('in')
+    }
+  }
+
+
+ /* TAB PLUGIN DEFINITION
+  * ===================== */
+
+  var old = $.fn.tab
+
+  $.fn.tab = function ( option ) {
+    return this.each(function () {
+      var $this = $(this)
+        , data = $this.data('tab')
+      if (!data) $this.data('tab', (data = new Tab(this)))
+      if (typeof option == 'string') data[option]()
+    })
+  }
+
+  $.fn.tab.Constructor = Tab
+
+
+ /* TAB NO CONFLICT
+  * =============== */
+
+  $.fn.tab.noConflict = function () {
+    $.fn.tab = old
+    return this
+  }
+
+
+ /* TAB DATA-API
+  * ============ */
+
+  $(document).on('click.tab.data-api', '[data-toggle="tab"], [data-toggle="pill"]', function (e) {
+    e.preventDefault()
+    $(this).tab('show')
+  })
+
+}(window.jQuery);/* =============================================================
+ * bootstrap-typeahead.js v2.2.2
+ * http://twitter.github.com/bootstrap/javascript.html#typeahead
+ * =============================================================
+ * Copyright 2012 Twitter, Inc.
+ *
+ * Licensed under the Apache License, Version 2.0 (the "License");
+ * you may not use this file except in compliance with the License.
+ * You may obtain a copy of the License at
+ *
+ * http://www.apache.org/licenses/LICENSE-2.0
+ *
+ * Unless required by applicable law or agreed to in writing, software
+ * distributed under the License is distributed on an "AS IS" BASIS,
+ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
+ * See the License for the specific language governing permissions and
+ * limitations under the License.
+ * ============================================================ */
+
+
+!function($){
+
+  "use strict"; // jshint ;_;
+
+
+ /* TYPEAHEAD PUBLIC CLASS DEFINITION
+  * ================================= */
+
+  var Typeahead = function (element, options) {
+    this.$element = $(element)
+    this.options = $.extend({}, $.fn.typeahead.defaults, options)
+    this.matcher = this.options.matcher || this.matcher
+    this.sorter = this.options.sorter || this.sorter
+    this.highlighter = this.options.highlighter || this.highlighter
+    this.updater = this.options.updater || this.updater
+    this.source = this.options.source
+    this.$menu = $(this.options.menu)
+    this.shown = false
+    this.listen()
+  }
+
+  Typeahead.prototype = {
+
+    constructor: Typeahead
+
+  , select: function () {
+      var val = this.$menu.find('.active').attr('data-value')
+      this.$element
+        .val(this.updater(val))
+        .change()
+      return this.hide()
+    }
+
+  , updater: function (item) {
+      return item
+    }
+
+  , show: function () {
+      var pos = $.extend({}, this.$element.position(), {
+        height: this.$element[0].offsetHeight
+      })
+
+      this.$menu
+        .insertAfter(this.$element)
+        .css({
+          top: pos.top + pos.height
+        , left: pos.left
+        })
+        .show()
+
+      this.shown = true
+      return this
+    }
+
+  , hide: function () {
+      this.$menu.hide()
+      this.shown = false
+      return this
+    }
+
+  , lookup: function (event) {
+      var items
+
+      this.query = this.$element.val()
+
+      if (!this.query || this.query.length < this.options.minLength) {
+        return this.shown ? this.hide() : this
+      }
+
+      items = $.isFunction(this.source) ? this.source(this.query, $.proxy(this.process, this)) : this.source
+
+      return items ? this.process(items) : this
+    }
+
+  , process: function (items) {
+      var that = this
+
+      items = $.grep(items, function (item) {
+        return that.matcher(item)
+      })
+
+      items = this.sorter(items)
+
+      if (!items.length) {
+        return this.shown ? this.hide() : this
+      }
+
+      return this.render(items.slice(0, this.options.items)).show()
+    }
+
+  , matcher: function (item) {
+      return ~item.toLowerCase().indexOf(this.query.toLowerCase())
+    }
+
+  , sorter: function (items) {
+      var beginswith = []
+        , caseSensitive = []
+        , caseInsensitive = []
+        , item
+
+      while (item = items.shift()) {
+        if (!item.toLowerCase().indexOf(this.query.toLowerCase())) beginswith.push(item)
+        else if (~item.indexOf(this.query)) caseSensitive.push(item)
+        else caseInsensitive.push(item)
+      }
+
+      return beginswith.concat(caseSensitive, caseInsensitive)
+    }
+
+  , highlighter: function (item) {
+      var query = this.query.replace(/[\-\[\]{}()*+?.,\\\^$|#\s]/g, '\\$&')
+      return item.replace(new RegExp('(' + query + ')', 'ig'), function ($1, match) {
+        return '<strong>' + match + '</strong>'
+      })
+    }
+
+  , render: function (items) {
+      var that = this
+
+      items = $(items).map(function (i, item) {
+        i = $(that.options.item).attr('data-value', item)
+        i.find('a').html(that.highlighter(item))
+        return i[0]
+      })
+
+      items.first().addClass('active')
+      this.$menu.html(items)
+      return this
+    }
+
+  , next: function (event) {
+      var active = this.$menu.find('.active').removeClass('active')
+        , next = active.next()
+
+      if (!next.length) {
+        next = $(this.$menu.find('li')[0])
+      }
+
+      next.addClass('active')
+    }
+
+  , prev: function (event) {
+      var active = this.$menu.find('.active').removeClass('active')
+        , prev = active.prev()
+
+      if (!prev.length) {
+        prev = this.$menu.find('li').last()
+      }
+
+      prev.addClass('active')
+    }
+
+  , listen: function () {
+      this.$element
+        .on('blur',     $.proxy(this.blur, this))
+        .on('keypress', $.proxy(this.keypress, this))
+        .on('keyup',    $.proxy(this.keyup, this))
+
+      if (this.eventSupported('keydown')) {
+        this.$element.on('keydown', $.proxy(this.keydown, this))
+      }
+
+      this.$menu
+        .on('click', $.proxy(this.click, this))
+        .on('mouseenter', 'li', $.proxy(this.mouseenter, this))
+    }
+
+  , eventSupported: function(eventName) {
+      var isSupported = eventName in this.$element
+      if (!isSupported) {
+        this.$element.setAttribute(eventName, 'return;')
+        isSupported = typeof this.$element[eventName] === 'function'
+      }
+      return isSupported
+    }
+
+  , move: function (e) {
+      if (!this.shown) return
+
+      switch(e.keyCode) {
+        case 9: // tab
+        case 13: // enter
+        case 27: // escape
+          e.preventDefault()
+          break
+
+        case 38: // up arrow
+          e.preventDefault()
+          this.prev()
+          break
+
+        case 40: // down arrow
+          e.preventDefault()
+          this.next()
+          break
+      }
+
+      e.stopPropagation()
+    }
+
+  , keydown: function (e) {
+      this.suppressKeyPressRepeat = ~$.inArray(e.keyCode, [40,38,9,13,27])
+      this.move(e)
+    }
+
+  , keypress: function (e) {
+      if (this.suppressKeyPressRepeat) return
+      this.move(e)
+    }
+
+  , keyup: function (e) {
+      switch(e.keyCode) {
+        case 40: // down arrow
+        case 38: // up arrow
+        case 16: // shift
+        case 17: // ctrl
+        case 18: // alt
+          break
+
+        case 9: // tab
+        case 13: // enter
+          if (!this.shown) return
+          this.select()
+          break
+
+        case 27: // escape
+          if (!this.shown) return
+          this.hide()
+          break
+
+        default:
+          this.lookup()
+      }
+
+      e.stopPropagation()
+      e.preventDefault()
+  }
+
+  , blur: function (e) {
+      var that = this
+      setTimeout(function () { that.hide() }, 150)
+    }
+
+  , click: function (e) {
+      e.stopPropagation()
+      e.preventDefault()
+      this.select()
+    }
+
+  , mouseenter: function (e) {
+      this.$menu.find('.active').removeClass('active')
+      $(e.currentTarget).addClass('active')
+    }
+
+  }
+
+
+  /* TYPEAHEAD PLUGIN DEFINITION
+   * =========================== */
+
+  var old = $.fn.typeahead
+
+  $.fn.typeahead = function (option) {
+    return this.each(function () {
+      var $this = $(this)
+        , data = $this.data('typeahead')
+        , options = typeof option == 'object' && option
+      if (!data) $this.data('typeahead', (data = new Typeahead(this, options)))
+      if (typeof option == 'string') data[option]()
+    })
+  }
+
+  $.fn.typeahead.defaults = {
+    source: []
+  , items: 8
+  , menu: '<ul class="typeahead dropdown-menu"></ul>'
+  , item: '<li><a href="#"></a></li>'
+  , minLength: 1
+  }
+
+  $.fn.typeahead.Constructor = Typeahead
+
+
+ /* TYPEAHEAD NO CONFLICT
+  * =================== */
+
+  $.fn.typeahead.noConflict = function () {
+    $.fn.typeahead = old
+    return this
+  }
+
+
+ /* TYPEAHEAD DATA-API
+  * ================== */
+
+  $(document).on('focus.typeahead.data-api', '[data-provide="typeahead"]', function (e) {
+    var $this = $(this)
+    if ($this.data('typeahead')) return
+    e.preventDefault()
+    $this.typeahead($this.data())
+  })
+
+}(window.jQuery);
+/* ==========================================================
+ * bootstrap-affix.js v2.2.2
+ * http://twitter.github.com/bootstrap/javascript.html#affix
+ * ==========================================================
+ * Copyright 2012 Twitter, Inc.
+ *
+ * Licensed under the Apache License, Version 2.0 (the "License");
+ * you may not use this file except in compliance with the License.
+ * You may obtain a copy of the License at
+ *
+ * http://www.apache.org/licenses/LICENSE-2.0
+ *
+ * Unless required by applicable law or agreed to in writing, software
+ * distributed under the License is distributed on an "AS IS" BASIS,
+ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
+ * See the License for the specific language governing permissions and
+ * limitations under the License.
+ * ========================================================== */
+
+
+!function ($) {
+
+  "use strict"; // jshint ;_;
+
+
+ /* AFFIX CLASS DEFINITION
+  * ====================== */
+
+  var Affix = function (element, options) {
+    this.options = $.extend({}, $.fn.affix.defaults, options)
+    this.$window = $(window)
+      .on('scroll.affix.data-api', $.proxy(this.checkPosition, this))
+      .on('click.affix.data-api',  $.proxy(function () { setTimeout($.proxy(this.checkPosition, this), 1) }, this))
+    this.$element = $(element)
+    this.checkPosition()
+  }
+
+  Affix.prototype.checkPosition = function () {
+    if (!this.$element.is(':visible')) return
+
+    var scrollHeight = $(document).height()
+      , scrollTop = this.$window.scrollTop()
+      , position = this.$element.offset()
+      , offset = this.options.offset
+      , offsetBottom = offset.bottom
+      , offsetTop = offset.top
+      , reset = 'affix affix-top affix-bottom'
+      , affix
+
+    if (typeof offset != 'object') offsetBottom = offsetTop = offset
+    if (typeof offsetTop == 'function') offsetTop = offset.top()
+    if (typeof offsetBottom == 'function') offsetBottom = offset.bottom()
+
+    affix = this.unpin != null && (scrollTop + this.unpin <= position.top) ?
+      false    : offsetBottom != null && (position.top + this.$element.height() >= scrollHeight - offsetBottom) ?
+      'bottom' : offsetTop != null && scrollTop <= offsetTop ?
+      'top'    : false
+
+    if (this.affixed === affix) return
+
+    this.affixed = affix
+    this.unpin = affix == 'bottom' ? position.top - scrollTop : null
+
+    this.$element.removeClass(reset).addClass('affix' + (affix ? '-' + affix : ''))
+  }
+
+
+ /* AFFIX PLUGIN DEFINITION
+  * ======================= */
+
+  var old = $.fn.affix
+
+  $.fn.affix = function (option) {
+    return this.each(function () {
+      var $this = $(this)
+        , data = $this.data('affix')
+        , options = typeof option == 'object' && option
+      if (!data) $this.data('affix', (data = new Affix(this, options)))
+      if (typeof option == 'string') data[option]()
+    })
+  }
+
+  $.fn.affix.Constructor = Affix
+
+  $.fn.affix.defaults = {
+    offset: 0
+  }
+
+
+ /* AFFIX NO CONFLICT
+  * ================= */
+
+  $.fn.affix.noConflict = function () {
+    $.fn.affix = old
+    return this
+  }
+
+
+ /* AFFIX DATA-API
+  * ============== */
+
+  $(window).on('load', function () {
+    $('[data-spy="affix"]').each(function () {
+      var $spy = $(this)
+        , data = $spy.data()
+
+      data.offset = data.offset || {}
+
+      data.offsetBottom && (data.offset.bottom = data.offsetBottom)
+      data.offsetTop && (data.offset.top = data.offsetTop)
+
+      $spy.affix(data)
+    })
+  })
+
+
+}(window.jQuery);
\ No newline@end of file
diff --git a/docs/js/bootstrap.min.js b/docs/js/bootstrap.min.js
new file mode 100644
index 0000000..6eeb15c
--- /dev/null
+++ b/docs/js/bootstrap.min.js
@@ -0,0 +1,6 @@
+/*!
+* Bootstrap.js by @fat & @mdo
+* Copyright 2012 Twitter, Inc.
+* http://www.apache.org/licenses/LICENSE-2.0.txt
+*/
+!function($){"use strict";$(function(){$.support.transition=function(){var transitionEnd=function(){var name,el=document.createElement("bootstrap"),transEndEventNames={WebkitTransition:"webkitTransitionEnd",MozTransition:"transitionend",OTransition:"oTransitionEnd otransitionend",transition:"transitionend"};for(name in transEndEventNames)if(void 0!==el.style[name])return transEndEventNames[name]}();return transitionEnd&&{end:transitionEnd}}()})}(window.jQuery),!function($){"use strict";var dismiss='[data-dismiss="alert"]',Alert=function(el){$(el).on("click",dismiss,this.close)};Alert.prototype.close=function(e){function removeElement(){$parent.trigger("closed").remove()}var $parent,$this=$(this),selector=$this.attr("data-target");selector||(selector=$this.attr("href"),selector=selector&&selector.replace(/.*(?=#[^\s]*$)/,"")),$parent=$(selector),e&&e.preventDefault(),$parent.length||($parent=$this.hasClass("alert")?$this:$this.parent()),$parent.trigger(e=$.Event("close")),e.i
 sDefaultPrevented()||($parent.removeClass("in"),$.support.transition&&$parent.hasClass("fade")?$parent.on($.support.transition.end,removeElement):removeElement())};var old=$.fn.alert;$.fn.alert=function(option){return this.each(function(){var $this=$(this),data=$this.data("alert");data||$this.data("alert",data=new Alert(this)),"string"==typeof option&&data[option].call($this)})},$.fn.alert.Constructor=Alert,$.fn.alert.noConflict=function(){return $.fn.alert=old,this},$(document).on("click.alert.data-api",dismiss,Alert.prototype.close)}(window.jQuery),!function($){"use strict";var Button=function(element,options){this.$element=$(element),this.options=$.extend({},$.fn.button.defaults,options)};Button.prototype.setState=function(state){var d="disabled",$el=this.$element,data=$el.data(),val=$el.is("input")?"val":"html";state+="Text",data.resetText||$el.data("resetText",$el[val]()),$el[val](data[state]||this.options[state]),setTimeout(function(){"loadingText"==state?$el.addClass(
 d).attr(d,d):$el.removeClass(d).removeAttr(d)},0)},Button.prototype.toggle=function(){var $parent=this.$element.closest('[data-toggle="buttons-radio"]');$parent&&$parent.find(".active").removeClass("active"),this.$element.toggleClass("active")};var old=$.fn.button;$.fn.button=function(option){return this.each(function(){var $this=$(this),data=$this.data("button"),options="object"==typeof option&&option;data||$this.data("button",data=new Button(this,options)),"toggle"==option?data.toggle():option&&data.setState(option)})},$.fn.button.defaults={loadingText:"loading..."},$.fn.button.Constructor=Button,$.fn.button.noConflict=function(){return $.fn.button=old,this},$(document).on("click.button.data-api","[data-toggle^=button]",function(e){var $btn=$(e.target);$btn.hasClass("btn")||($btn=$btn.closest(".btn")),$btn.button("toggle")})}(window.jQuery),!function($){"use strict";var Carousel=function(element,options){this.$element=$(element),this.options=options,"hover"==this.options.p
 ause&&this.$element.on("mouseenter",$.proxy(this.pause,this)).on("mouseleave",$.proxy(this.cycle,this))};Carousel.prototype={cycle:function(e){return e||(this.paused=!1),this.options.interval&&!this.paused&&(this.interval=setInterval($.proxy(this.next,this),this.options.interval)),this},to:function(pos){var $active=this.$element.find(".item.active"),children=$active.parent().children(),activePos=children.index($active),that=this;if(!(pos>children.length-1||0>pos))return this.sliding?this.$element.one("slid",function(){that.to(pos)}):activePos==pos?this.pause().cycle():this.slide(pos>activePos?"next":"prev",$(children[pos]))},pause:function(e){return e||(this.paused=!0),this.$element.find(".next, .prev").length&&$.support.transition.end&&(this.$element.trigger($.support.transition.end),this.cycle()),clearInterval(this.interval),this.interval=null,this},next:function(){return this.sliding?void 0:this.slide("next")},prev:function(){return this.sliding?void 0:this.slide("prev")}
 ,slide:function(type,next){var e,$active=this.$element.find(".item.active"),$next=next||$active[type](),isCycling=this.interval,direction="next"==type?"left":"right",fallback="next"==type?"first":"last",that=this;if(this.sliding=!0,isCycling&&this.pause(),$next=$next.length?$next:this.$element.find(".item")[fallback](),e=$.Event("slide",{relatedTarget:$next[0]}),!$next.hasClass("active")){if($.support.transition&&this.$element.hasClass("slide")){if(this.$element.trigger(e),e.isDefaultPrevented())return;$next.addClass(type),$next[0].offsetWidth,$active.addClass(direction),$next.addClass(direction),this.$element.one($.support.transition.end,function(){$next.removeClass([type,direction].join(" ")).addClass("active"),$active.removeClass(["active",direction].join(" ")),that.sliding=!1,setTimeout(function(){that.$element.trigger("slid")},0)})}else{if(this.$element.trigger(e),e.isDefaultPrevented())return;$active.removeClass("active"),$next.addClass("active"),this.sliding=!1,this.$
 element.trigger("slid")}return isCycling&&this.cycle(),this}}};var old=$.fn.carousel;$.fn.carousel=function(option){return this.each(function(){var $this=$(this),data=$this.data("carousel"),options=$.extend({},$.fn.carousel.defaults,"object"==typeof option&&option),action="string"==typeof option?option:options.slide;data||$this.data("carousel",data=new Carousel(this,options)),"number"==typeof option?data.to(option):action?data[action]():options.interval&&data.cycle()})},$.fn.carousel.defaults={interval:5e3,pause:"hover"},$.fn.carousel.Constructor=Carousel,$.fn.carousel.noConflict=function(){return $.fn.carousel=old,this},$(document).on("click.carousel.data-api","[data-slide]",function(e){var href,$this=$(this),$target=$($this.attr("data-target")||(href=$this.attr("href"))&&href.replace(/.*(?=#[^\s]+$)/,"")),options=$.extend({},$target.data(),$this.data());$target.carousel(options),e.preventDefault()})}(window.jQuery),!function($){"use strict";var Collapse=function(element,op
 tions){this.$element=$(element),this.options=$.extend({},$.fn.collapse.defaults,options),this.options.parent&&(this.$parent=$(this.options.parent)),this.options.toggle&&this.toggle()};Collapse.prototype={constructor:Collapse,dimension:function(){var hasWidth=this.$element.hasClass("width");return hasWidth?"width":"height"},show:function(){var dimension,scroll,actives,hasData;if(!this.transitioning){if(dimension=this.dimension(),scroll=$.camelCase(["scroll",dimension].join("-")),actives=this.$parent&&this.$parent.find("> .accordion-group > .in"),actives&&actives.length){if(hasData=actives.data("collapse"),hasData&&hasData.transitioning)return;actives.collapse("hide"),hasData||actives.data("collapse",null)}this.$element[dimension](0),this.transition("addClass",$.Event("show"),"shown"),$.support.transition&&this.$element[dimension](this.$element[0][scroll])}},hide:function(){var dimension;this.transitioning||(dimension=this.dimension(),this.reset(this.$element[dimension]()),thi
 s.transition("removeClass",$.Event("hide"),"hidden"),this.$element[dimension](0))},reset:function(size){var dimension=this.dimension();return this.$element.removeClass("collapse")[dimension](size||"auto")[0].offsetWidth,this.$element[null!==size?"addClass":"removeClass"]("collapse"),this},transition:function(method,startEvent,completeEvent){var that=this,complete=function(){"show"==startEvent.type&&that.reset(),that.transitioning=0,that.$element.trigger(completeEvent)};this.$element.trigger(startEvent),startEvent.isDefaultPrevented()||(this.transitioning=1,this.$element[method]("in"),$.support.transition&&this.$element.hasClass("collapse")?this.$element.one($.support.transition.end,complete):complete())},toggle:function(){this[this.$element.hasClass("in")?"hide":"show"]()}};var old=$.fn.collapse;$.fn.collapse=function(option){return this.each(function(){var $this=$(this),data=$this.data("collapse"),options="object"==typeof option&&option;data||$this.data("collapse",data=new 
 Collapse(this,options)),"string"==typeof option&&data[option]()})},$.fn.collapse.defaults={toggle:!0},$.fn.collapse.Constructor=Collapse,$.fn.collapse.noConflict=function(){return $.fn.collapse=old,this},$(document).on("click.collapse.data-api","[data-toggle=collapse]",function(e){var href,$this=$(this),target=$this.attr("data-target")||e.preventDefault()||(href=$this.attr("href"))&&href.replace(/.*(?=#[^\s]+$)/,""),option=$(target).data("collapse")?"toggle":$this.data();$this[$(target).hasClass("in")?"addClass":"removeClass"]("collapsed"),$(target).collapse(option)})}(window.jQuery),!function($){"use strict";function clearMenus(){$(toggle).each(function(){getParent($(this)).removeClass("open")})}function getParent($this){var $parent,selector=$this.attr("data-target");return selector||(selector=$this.attr("href"),selector=selector&&/#/.test(selector)&&selector.replace(/.*(?=#[^\s]*$)/,"")),$parent=$(selector),$parent.length||($parent=$this.parent()),$parent}var toggle="[data
 -toggle=dropdown]",Dropdown=function(element){var $el=$(element).on("click.dropdown.data-api",this.toggle);$("html").on("click.dropdown.data-api",function(){$el.parent().removeClass("open")})};Dropdown.prototype={constructor:Dropdown,toggle:function(){var $parent,isActive,$this=$(this);if(!$this.is(".disabled, :disabled"))return $parent=getParent($this),isActive=$parent.hasClass("open"),clearMenus(),isActive||$parent.toggleClass("open"),$this.focus(),!1},keydown:function(e){var $this,$items,$parent,isActive,index;if(/(38|40|27)/.test(e.keyCode)&&($this=$(this),e.preventDefault(),e.stopPropagation(),!$this.is(".disabled, :disabled"))){if($parent=getParent($this),isActive=$parent.hasClass("open"),!isActive||isActive&&27==e.keyCode)return $this.click();$items=$("[role=menu] li:not(.divider):visible a",$parent),$items.length&&(index=$items.index($items.filter(":focus")),38==e.keyCode&&index>0&&index--,40==e.keyCode&&$items.length-1>index&&index++,~index||(index=0),$items.eq(inde
 x).focus())}}};var old=$.fn.dropdown;$.fn.dropdown=function(option){return this.each(function(){var $this=$(this),data=$this.data("dropdown");data||$this.data("dropdown",data=new Dropdown(this)),"string"==typeof option&&data[option].call($this)})},$.fn.dropdown.Constructor=Dropdown,$.fn.dropdown.noConflict=function(){return $.fn.dropdown=old,this},$(document).on("click.dropdown.data-api touchstart.dropdown.data-api",clearMenus).on("click.dropdown touchstart.dropdown.data-api",".dropdown form",function(e){e.stopPropagation()}).on("touchstart.dropdown.data-api",".dropdown-menu",function(e){e.stopPropagation()}).on("click.dropdown.data-api touchstart.dropdown.data-api",toggle,Dropdown.prototype.toggle).on("keydown.dropdown.data-api touchstart.dropdown.data-api",toggle+", [role=menu]",Dropdown.prototype.keydown)}(window.jQuery),!function($){"use strict";var Modal=function(element,options){this.options=options,this.$element=$(element).delegate('[data-dismiss="modal"]',"click.dism
 iss.modal",$.proxy(this.hide,this)),this.options.remote&&this.$element.find(".modal-body").load(this.options.remote)};Modal.prototype={constructor:Modal,toggle:function(){return this[this.isShown?"hide":"show"]()},show:function(){var that=this,e=$.Event("show");this.$element.trigger(e),this.isShown||e.isDefaultPrevented()||(this.isShown=!0,this.escape(),this.backdrop(function(){var transition=$.support.transition&&that.$element.hasClass("fade");that.$element.parent().length||that.$element.appendTo(document.body),that.$element.show(),transition&&that.$element[0].offsetWidth,that.$element.addClass("in").attr("aria-hidden",!1),that.enforceFocus(),transition?that.$element.one($.support.transition.end,function(){that.$element.focus().trigger("shown")}):that.$element.focus().trigger("shown")}))},hide:function(e){e&&e.preventDefault(),e=$.Event("hide"),this.$element.trigger(e),this.isShown&&!e.isDefaultPrevented()&&(this.isShown=!1,this.escape(),$(document).off("focusin.modal"),thi
 s.$element.removeClass("in").attr("aria-hidden",!0),$.support.transition&&this.$element.hasClass("fade")?this.hideWithTransition():this.hideModal())},enforceFocus:function(){var that=this;$(document).on("focusin.modal",function(e){that.$element[0]===e.target||that.$element.has(e.target).length||that.$element.focus()})},escape:function(){var that=this;this.isShown&&this.options.keyboard?this.$element.on("keyup.dismiss.modal",function(e){27==e.which&&that.hide()}):this.isShown||this.$element.off("keyup.dismiss.modal")},hideWithTransition:function(){var that=this,timeout=setTimeout(function(){that.$element.off($.support.transition.end),that.hideModal()},500);this.$element.one($.support.transition.end,function(){clearTimeout(timeout),that.hideModal()})},hideModal:function(){this.$element.hide().trigger("hidden"),this.backdrop()},removeBackdrop:function(){this.$backdrop.remove(),this.$backdrop=null},backdrop:function(callback){var animate=this.$element.hasClass("fade")?"fade":"";
 if(this.isShown&&this.options.backdrop){var doAnimate=$.support.transition&&animate;this.$backdrop=$('<div class="modal-backdrop '+animate+'" />').appendTo(document.body),this.$backdrop.click("static"==this.options.backdrop?$.proxy(this.$element[0].focus,this.$element[0]):$.proxy(this.hide,this)),doAnimate&&this.$backdrop[0].offsetWidth,this.$backdrop.addClass("in"),doAnimate?this.$backdrop.one($.support.transition.end,callback):callback()}else!this.isShown&&this.$backdrop?(this.$backdrop.removeClass("in"),$.support.transition&&this.$element.hasClass("fade")?this.$backdrop.one($.support.transition.end,$.proxy(this.removeBackdrop,this)):this.removeBackdrop()):callback&&callback()}};var old=$.fn.modal;$.fn.modal=function(option){return this.each(function(){var $this=$(this),data=$this.data("modal"),options=$.extend({},$.fn.modal.defaults,$this.data(),"object"==typeof option&&option);data||$this.data("modal",data=new Modal(this,options)),"string"==typeof option?data[option]():o
 ptions.show&&data.show()})},$.fn.modal.defaults={backdrop:!0,keyboard:!0,show:!0},$.fn.modal.Constructor=Modal,$.fn.modal.noConflict=function(){return $.fn.modal=old,this},$(document).on("click.modal.data-api",'[data-toggle="modal"]',function(e){var $this=$(this),href=$this.attr("href"),$target=$($this.attr("data-target")||href&&href.replace(/.*(?=#[^\s]+$)/,"")),option=$target.data("modal")?"toggle":$.extend({remote:!/#/.test(href)&&href},$target.data(),$this.data());e.preventDefault(),$target.modal(option).one("hide",function(){$this.focus()})})}(window.jQuery),!function($){"use strict";var Tooltip=function(element,options){this.init("tooltip",element,options)};Tooltip.prototype={constructor:Tooltip,init:function(type,element,options){var eventIn,eventOut;this.type=type,this.$element=$(element),this.options=this.getOptions(options),this.enabled=!0,"click"==this.options.trigger?this.$element.on("click."+this.type,this.options.selector,$.proxy(this.toggle,this)):"manual"!=th
 is.options.trigger&&(eventIn="hover"==this.options.trigger?"mouseenter":"focus",eventOut="hover"==this.options.trigger?"mouseleave":"blur",this.$element.on(eventIn+"."+this.type,this.options.selector,$.proxy(this.enter,this)),this.$element.on(eventOut+"."+this.type,this.options.selector,$.proxy(this.leave,this))),this.options.selector?this._options=$.extend({},this.options,{trigger:"manual",selector:""}):this.fixTitle()},getOptions:function(options){return options=$.extend({},$.fn[this.type].defaults,options,this.$element.data()),options.delay&&"number"==typeof options.delay&&(options.delay={show:options.delay,hide:options.delay}),options},enter:function(e){var self=$(e.currentTarget)[this.type](this._options).data(this.type);return self.options.delay&&self.options.delay.show?(clearTimeout(this.timeout),self.hoverState="in",this.timeout=setTimeout(function(){"in"==self.hoverState&&self.show()},self.options.delay.show),void 0):self.show()},leave:function(e){var self=$(e.curre
 ntTarget)[this.type](this._options).data(this.type);return this.timeout&&clearTimeout(this.timeout),self.options.delay&&self.options.delay.hide?(self.hoverState="out",this.timeout=setTimeout(function(){"out"==self.hoverState&&self.hide()},self.options.delay.hide),void 0):self.hide()},show:function(){var $tip,inside,pos,actualWidth,actualHeight,placement,tp;if(this.hasContent()&&this.enabled){switch($tip=this.tip(),this.setContent(),this.options.animation&&$tip.addClass("fade"),placement="function"==typeof this.options.placement?this.options.placement.call(this,$tip[0],this.$element[0]):this.options.placement,inside=/in/.test(placement),$tip.detach().css({top:0,left:0,display:"block"}).insertAfter(this.$element),pos=this.getPosition(inside),actualWidth=$tip[0].offsetWidth,actualHeight=$tip[0].offsetHeight,inside?placement.split(" ")[1]:placement){case"bottom":tp={top:pos.top+pos.height,left:pos.left+pos.width/2-actualWidth/2};break;case"top":tp={top:pos.top-actualHeight,left:
 pos.left+pos.width/2-actualWidth/2};break;case"left":tp={top:pos.top+pos.height/2-actualHeight/2,left:pos.left-actualWidth};break;case"right":tp={top:pos.top+pos.height/2-actualHeight/2,left:pos.left+pos.width}}$tip.offset(tp).addClass(placement).addClass("in")}},setContent:function(){var $tip=this.tip(),title=this.getTitle();$tip.find(".tooltip-inner")[this.options.html?"html":"text"](title),$tip.removeClass("fade in top bottom left right")},hide:function(){function removeWithAnimation(){var timeout=setTimeout(function(){$tip.off($.support.transition.end).detach()},500);$tip.one($.support.transition.end,function(){clearTimeout(timeout),$tip.detach()})}var $tip=this.tip();return $tip.removeClass("in"),$.support.transition&&this.$tip.hasClass("fade")?removeWithAnimation():$tip.detach(),this},fixTitle:function(){var $e=this.$element;($e.attr("title")||"string"!=typeof $e.attr("data-original-title"))&&$e.attr("data-original-title",$e.attr("title")||"").removeAttr("title")},hasC
 ontent:function(){return this.getTitle()},getPosition:function(inside){return $.extend({},inside?{top:0,left:0}:this.$element.offset(),{width:this.$element[0].offsetWidth,height:this.$element[0].offsetHeight})},getTitle:function(){var title,$e=this.$element,o=this.options;return title=$e.attr("data-original-title")||("function"==typeof o.title?o.title.call($e[0]):o.title)},tip:function(){return this.$tip=this.$tip||$(this.options.template)},validate:function(){this.$element[0].parentNode||(this.hide(),this.$element=null,this.options=null)},enable:function(){this.enabled=!0},disable:function(){this.enabled=!1},toggleEnabled:function(){this.enabled=!this.enabled},toggle:function(e){var self=$(e.currentTarget)[this.type](this._options).data(this.type);self[self.tip().hasClass("in")?"hide":"show"]()},destroy:function(){this.hide().$element.off("."+this.type).removeData(this.type)}};var old=$.fn.tooltip;$.fn.tooltip=function(option){return this.each(function(){var $this=$(this),d
 ata=$this.data("tooltip"),options="object"==typeof option&&option;data||$this.data("tooltip",data=new Tooltip(this,options)),"string"==typeof option&&data[option]()})},$.fn.tooltip.Constructor=Tooltip,$.fn.tooltip.defaults={animation:!0,placement:"top",selector:!1,template:'<div class="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>',trigger:"hover",title:"",delay:0,html:!1},$.fn.tooltip.noConflict=function(){return $.fn.tooltip=old,this}}(window.jQuery),!function($){"use strict";var Popover=function(element,options){this.init("popover",element,options)};Popover.prototype=$.extend({},$.fn.tooltip.Constructor.prototype,{constructor:Popover,setContent:function(){var $tip=this.tip(),title=this.getTitle(),content=this.getContent();$tip.find(".popover-title")[this.options.html?"html":"text"](title),$tip.find(".popover-content")[this.options.html?"html":"text"](content),$tip.removeClass("fade top bottom left right in")},hasContent:function(){retur
 n this.getTitle()||this.getContent()},getContent:function(){var content,$e=this.$element,o=this.options;return content=$e.attr("data-content")||("function"==typeof o.content?o.content.call($e[0]):o.content)},tip:function(){return this.$tip||(this.$tip=$(this.options.template)),this.$tip},destroy:function(){this.hide().$element.off("."+this.type).removeData(this.type)}});var old=$.fn.popover;$.fn.popover=function(option){return this.each(function(){var $this=$(this),data=$this.data("popover"),options="object"==typeof option&&option;data||$this.data("popover",data=new Popover(this,options)),"string"==typeof option&&data[option]()})},$.fn.popover.Constructor=Popover,$.fn.popover.defaults=$.extend({},$.fn.tooltip.defaults,{placement:"right",trigger:"click",content:"",template:'<div class="popover"><div class="arrow"></div><div class="popover-inner"><h3 class="popover-title"></h3><div class="popover-content"></div></div></div>'}),$.fn.popover.noConflict=function(){return $.fn.pop
 over=old,this}}(window.jQuery),!function($){"use strict";function ScrollSpy(element,options){var href,process=$.proxy(this.process,this),$element=$(element).is("body")?$(window):$(element);this.options=$.extend({},$.fn.scrollspy.defaults,options),this.$scrollElement=$element.on("scroll.scroll-spy.data-api",process),this.selector=(this.options.target||(href=$(element).attr("href"))&&href.replace(/.*(?=#[^\s]+$)/,"")||"")+" .nav li > a",this.$body=$("body"),this.refresh(),this.process()}ScrollSpy.prototype={constructor:ScrollSpy,refresh:function(){var $targets,self=this;this.offsets=$([]),this.targets=$([]),$targets=this.$body.find(this.selector).map(function(){var $el=$(this),href=$el.data("target")||$el.attr("href"),$href=/^#\w/.test(href)&&$(href);return $href&&$href.length&&[[$href.position().top+self.$scrollElement.scrollTop(),href]]||null}).sort(function(a,b){return a[0]-b[0]}).each(function(){self.offsets.push(this[0]),self.targets.push(this[1])})},process:function(){va
 r i,scrollTop=this.$scrollElement.scrollTop()+this.options.offset,scrollHeight=this.$scrollElement[0].scrollHeight||this.$body[0].scrollHeight,maxScroll=scrollHeight-this.$scrollElement.height(),offsets=this.offsets,targets=this.targets,activeTarget=this.activeTarget;if(scrollTop>=maxScroll)return activeTarget!=(i=targets.last()[0])&&this.activate(i);for(i=offsets.length;i--;)activeTarget!=targets[i]&&scrollTop>=offsets[i]&&(!offsets[i+1]||offsets[i+1]>=scrollTop)&&this.activate(targets[i])},activate:function(target){var active,selector;this.activeTarget=target,$(this.selector).parent(".active").removeClass("active"),selector=this.selector+'[data-target="'+target+'"],'+this.selector+'[href="'+target+'"]',active=$(selector).parent("li").addClass("active"),active.parent(".dropdown-menu").length&&(active=active.closest("li.dropdown").addClass("active")),active.trigger("activate")}};var old=$.fn.scrollspy;$.fn.scrollspy=function(option){return this.each(function(){var $this=$(th
 is),data=$this.data("scrollspy"),options="object"==typeof option&&option;data||$this.data("scrollspy",data=new ScrollSpy(this,options)),"string"==typeof option&&data[option]()})},$.fn.scrollspy.Constructor=ScrollSpy,$.fn.scrollspy.defaults={offset:10},$.fn.scrollspy.noConflict=function(){return $.fn.scrollspy=old,this},$(window).on("load",function(){$('[data-spy="scroll"]').each(function(){var $spy=$(this);$spy.scrollspy($spy.data())})})}(window.jQuery),!function($){"use strict";var Tab=function(element){this.element=$(element)};Tab.prototype={constructor:Tab,show:function(){var previous,$target,e,$this=this.element,$ul=$this.closest("ul:not(.dropdown-menu)"),selector=$this.attr("data-target");selector||(selector=$this.attr("href"),selector=selector&&selector.replace(/.*(?=#[^\s]*$)/,"")),$this.parent("li").hasClass("active")||(previous=$ul.find(".active:last a")[0],e=$.Event("show",{relatedTarget:previous}),$this.trigger(e),e.isDefaultPrevented()||($target=$(selector),this.
 activate($this.parent("li"),$ul),this.activate($target,$target.parent(),function(){$this.trigger({type:"shown",relatedTarget:previous})})))},activate:function(element,container,callback){function next(){$active.removeClass("active").find("> .dropdown-menu > .active").removeClass("active"),element.addClass("active"),transition?(element[0].offsetWidth,element.addClass("in")):element.removeClass("fade"),element.parent(".dropdown-menu")&&element.closest("li.dropdown").addClass("active"),callback&&callback()}var $active=container.find("> .active"),transition=callback&&$.support.transition&&$active.hasClass("fade");transition?$active.one($.support.transition.end,next):next(),$active.removeClass("in")}};var old=$.fn.tab;$.fn.tab=function(option){return this.each(function(){var $this=$(this),data=$this.data("tab");data||$this.data("tab",data=new Tab(this)),"string"==typeof option&&data[option]()})},$.fn.tab.Constructor=Tab,$.fn.tab.noConflict=function(){return $.fn.tab=old,this},$(d
 ocument).on("click.tab.data-api",'[data-toggle="tab"], [data-toggle="pill"]',function(e){e.preventDefault(),$(this).tab("show")})}(window.jQuery),!function($){"use strict";var Typeahead=function(element,options){this.$element=$(element),this.options=$.extend({},$.fn.typeahead.defaults,options),this.matcher=this.options.matcher||this.matcher,this.sorter=this.options.sorter||this.sorter,this.highlighter=this.options.highlighter||this.highlighter,this.updater=this.options.updater||this.updater,this.source=this.options.source,this.$menu=$(this.options.menu),this.shown=!1,this.listen()};Typeahead.prototype={constructor:Typeahead,select:function(){var val=this.$menu.find(".active").attr("data-value");return this.$element.val(this.updater(val)).change(),this.hide()},updater:function(item){return item},show:function(){var pos=$.extend({},this.$element.position(),{height:this.$element[0].offsetHeight});return this.$menu.insertAfter(this.$element).css({top:pos.top+pos.height,left:pos.
 left}).show(),this.shown=!0,this},hide:function(){return this.$menu.hide(),this.shown=!1,this},lookup:function(){var items;return this.query=this.$element.val(),!this.query||this.query.length<this.options.minLength?this.shown?this.hide():this:(items=$.isFunction(this.source)?this.source(this.query,$.proxy(this.process,this)):this.source,items?this.process(items):this)},process:function(items){var that=this;return items=$.grep(items,function(item){return that.matcher(item)}),items=this.sorter(items),items.length?this.render(items.slice(0,this.options.items)).show():this.shown?this.hide():this},matcher:function(item){return~item.toLowerCase().indexOf(this.query.toLowerCase())},sorter:function(items){for(var item,beginswith=[],caseSensitive=[],caseInsensitive=[];item=items.shift();)item.toLowerCase().indexOf(this.query.toLowerCase())?~item.indexOf(this.query)?caseSensitive.push(item):caseInsensitive.push(item):beginswith.push(item);return beginswith.concat(caseSensitive,caseIns
 ensitive)},highlighter:function(item){var query=this.query.replace(/[\-\[\]{}()*+?.,\\\^$|#\s]/g,"\\$&");return item.replace(RegExp("("+query+")","ig"),function($1,match){return"<strong>"+match+"</strong>"})},render:function(items){var that=this;return items=$(items).map(function(i,item){return i=$(that.options.item).attr("data-value",item),i.find("a").html(that.highlighter(item)),i[0]}),items.first().addClass("active"),this.$menu.html(items),this},next:function(){var active=this.$menu.find(".active").removeClass("active"),next=active.next();next.length||(next=$(this.$menu.find("li")[0])),next.addClass("active")},prev:function(){var active=this.$menu.find(".active").removeClass("active"),prev=active.prev();prev.length||(prev=this.$menu.find("li").last()),prev.addClass("active")},listen:function(){this.$element.on("blur",$.proxy(this.blur,this)).on("keypress",$.proxy(this.keypress,this)).on("keyup",$.proxy(this.keyup,this)),this.eventSupported("keydown")&&this.$element.on("ke
 ydown",$.proxy(this.keydown,this)),this.$menu.on("click",$.proxy(this.click,this)).on("mouseenter","li",$.proxy(this.mouseenter,this))},eventSupported:function(eventName){var isSupported=eventName in this.$element;return isSupported||(this.$element.setAttribute(eventName,"return;"),isSupported="function"==typeof this.$element[eventName]),isSupported},move:function(e){if(this.shown){switch(e.keyCode){case 9:case 13:case 27:e.preventDefault();break;case 38:e.preventDefault(),this.prev();break;case 40:e.preventDefault(),this.next()}e.stopPropagation()}},keydown:function(e){this.suppressKeyPressRepeat=~$.inArray(e.keyCode,[40,38,9,13,27]),this.move(e)},keypress:function(e){this.suppressKeyPressRepeat||this.move(e)},keyup:function(e){switch(e.keyCode){case 40:case 38:case 16:case 17:case 18:break;case 9:case 13:if(!this.shown)return;this.select();break;case 27:if(!this.shown)return;this.hide();break;default:this.lookup()}e.stopPropagation(),e.preventDefault()},blur:function(){var
  that=this;setTimeout(function(){that.hide()},150)},click:function(e){e.stopPropagation(),e.preventDefault(),this.select()},mouseenter:function(e){this.$menu.find(".active").removeClass("active"),$(e.currentTarget).addClass("active")}};var old=$.fn.typeahead;$.fn.typeahead=function(option){return this.each(function(){var $this=$(this),data=$this.data("typeahead"),options="object"==typeof option&&option;data||$this.data("typeahead",data=new Typeahead(this,options)),"string"==typeof option&&data[option]()})},$.fn.typeahead.defaults={source:[],items:8,menu:'<ul class="typeahead dropdown-menu"></ul>',item:'<li><a href="#"></a></li>',minLength:1},$.fn.typeahead.Constructor=Typeahead,$.fn.typeahead.noConflict=function(){return $.fn.typeahead=old,this},$(document).on("focus.typeahead.data-api",'[data-provide="typeahead"]',function(e){var $this=$(this);$this.data("typeahead")||(e.preventDefault(),$this.typeahead($this.data()))})}(window.jQuery),!function($){"use strict";var Affix=fu
 nction(element,options){this.options=$.extend({},$.fn.affix.defaults,options),this.$window=$(window).on("scroll.affix.data-api",$.proxy(this.checkPosition,this)).on("click.affix.data-api",$.proxy(function(){setTimeout($.proxy(this.checkPosition,this),1)},this)),this.$element=$(element),this.checkPosition()};Affix.prototype.checkPosition=function(){if(this.$element.is(":visible")){var affix,scrollHeight=$(document).height(),scrollTop=this.$window.scrollTop(),position=this.$element.offset(),offset=this.options.offset,offsetBottom=offset.bottom,offsetTop=offset.top,reset="affix affix-top affix-bottom";"object"!=typeof offset&&(offsetBottom=offsetTop=offset),"function"==typeof offsetTop&&(offsetTop=offset.top()),"function"==typeof offsetBottom&&(offsetBottom=offset.bottom()),affix=null!=this.unpin&&scrollTop+this.unpin<=position.top?!1:null!=offsetBottom&&position.top+this.$element.height()>=scrollHeight-offsetBottom?"bottom":null!=offsetTop&&offsetTop>=scrollTop?"top":!1,this.a
 ffixed!==affix&&(this.affixed=affix,this.unpin="bottom"==affix?position.top-scrollTop:null,this.$element.removeClass(reset).addClass("affix"+(affix?"-"+affix:"")))}};var old=$.fn.affix;$.fn.affix=function(option){return this.each(function(){var $this=$(this),data=$this.data("affix"),options="object"==typeof option&&option;data||$this.data("affix",data=new Affix(this,options)),"string"==typeof option&&data[option]()})},$.fn.affix.Constructor=Affix,$.fn.affix.defaults={offset:0},$.fn.affix.noConflict=function(){return $.fn.affix=old,this},$(window).on("load",function(){$('[data-spy="affix"]').each(function(){var $spy=$(this),data=$spy.data();data.offset=data.offset||{},data.offsetBottom&&(data.offset.bottom=data.offsetBottom),data.offsetTop&&(data.offset.top=data.offsetTop),$spy.affix(data)})})}(window.jQuery);
\ No newline at end of file
diff --git a/docs/js/jquery-1.10.2.min.js b/docs/js/jquery-1.10.2.min.js
new file mode 100644
index 0000000..da41706
--- /dev/null
+++ b/docs/js/jquery-1.10.2.min.js
@@ -0,0 +1,6 @@
+/*! jQuery v1.10.2 | (c) 2005, 2013 jQuery Foundation, Inc. | jquery.org/license
+//@ sourceMappingURL=jquery-1.10.2.min.map
+*/
+(function(e,t){var n,r,i=typeof t,o=e.location,a=e.document,s=a.documentElement,l=e.jQuery,u=e.$,c={},p=[],f="1.10.2",d=p.concat,h=p.push,g=p.slice,m=p.indexOf,y=c.toString,v=c.hasOwnProperty,b=f.trim,x=function(e,t){return new x.fn.init(e,t,r)},w=/[+-]?(?:\d*\.|)\d+(?:[eE][+-]?\d+|)/.source,T=/\S+/g,C=/^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g,N=/^(?:\s*(<[\w\W]+>)[^>]*|#([\w-]*))$/,k=/^<(\w+)\s*\/?>(?:<\/\1>|)$/,E=/^[\],:{}\s]*$/,S=/(?:^|:|,)(?:\s*\[)+/g,A=/\\(?:["\\\/bfnrt]|u[\da-fA-F]{4})/g,j=/"[^"\\\r\n]*"|true|false|null|-?(?:\d+\.|)\d+(?:[eE][+-]?\d+|)/g,D=/^-ms-/,L=/-([\da-z])/gi,H=function(e,t){return t.toUpperCase()},q=function(e){(a.addEventListener||"load"===e.type||"complete"===a.readyState)&&(_(),x.ready())},_=function(){a.addEventListener?(a.removeEventListener("DOMContentLoaded",q,!1),e.removeEventListener("load",q,!1)):(a.detachEvent("onreadystatechange",q),e.detachEvent("onload",q))};x.fn=x.prototype={jquery:f,constructor:x,init:function(e,n,r){var i,o;if(!e)retu
 rn this;if("string"==typeof e){if(i="<"===e.charAt(0)&&">"===e.charAt(e.length-1)&&e.length>=3?[null,e,null]:N.exec(e),!i||!i[1]&&n)return!n||n.jquery?(n||r).find(e):this.constructor(n).find(e);if(i[1]){if(n=n instanceof x?n[0]:n,x.merge(this,x.parseHTML(i[1],n&&n.nodeType?n.ownerDocument||n:a,!0)),k.test(i[1])&&x.isPlainObject(n))for(i in n)x.isFunction(this[i])?this[i](n[i]):this.attr(i,n[i]);return this}if(o=a.getElementById(i[2]),o&&o.parentNode){if(o.id!==i[2])return r.find(e);this.length=1,this[0]=o}return this.context=a,this.selector=e,this}return e.nodeType?(this.context=this[0]=e,this.length=1,this):x.isFunction(e)?r.ready(e):(e.selector!==t&&(this.selector=e.selector,this.context=e.context),x.makeArray(e,this))},selector:"",length:0,toArray:function(){return g.call(this)},get:function(e){return null==e?this.toArray():0>e?this[this.length+e]:this[e]},pushStack:function(e){var t=x.merge(this.constructor(),e);return t.prevObject=this,t.context=this.context,t},each:fun
 ction(e,t){return x.each(this,e,t)},ready:function(e){return x.ready.promise().done(e),this},slice:function(){return this.pushStack(g.apply(this,arguments))},first:function(){return this.eq(0)},last:function(){return this.eq(-1)},eq:function(e){var t=this.length,n=+e+(0>e?t:0);return this.pushStack(n>=0&&t>n?[this[n]]:[])},map:function(e){return this.pushStack(x.map(this,function(t,n){return e.call(t,n,t)}))},end:function(){return this.prevObject||this.constructor(null)},push:h,sort:[].sort,splice:[].splice},x.fn.init.prototype=x.fn,x.extend=x.fn.extend=function(){var e,n,r,i,o,a,s=arguments[0]||{},l=1,u=arguments.length,c=!1;for("boolean"==typeof s&&(c=s,s=arguments[1]||{},l=2),"object"==typeof s||x.isFunction(s)||(s={}),u===l&&(s=this,--l);u>l;l++)if(null!=(o=arguments[l]))for(i in o)e=s[i],r=o[i],s!==r&&(c&&r&&(x.isPlainObject(r)||(n=x.isArray(r)))?(n?(n=!1,a=e&&x.isArray(e)?e:[]):a=e&&x.isPlainObject(e)?e:{},s[i]=x.extend(c,a,r)):r!==t&&(s[i]=r));return s},x.extend({expa
 ndo:"jQuery"+(f+Math.random()).replace(/\D/g,""),noConflict:function(t){return e.$===x&&(e.$=u),t&&e.jQuery===x&&(e.jQuery=l),x},isReady:!1,readyWait:1,holdReady:function(e){e?x.readyWait++:x.ready(!0)},ready:function(e){if(e===!0?!--x.readyWait:!x.isReady){if(!a.body)return setTimeout(x.ready);x.isReady=!0,e!==!0&&--x.readyWait>0||(n.resolveWith(a,[x]),x.fn.trigger&&x(a).trigger("ready").off("ready"))}},isFunction:function(e){return"function"===x.type(e)},isArray:Array.isArray||function(e){return"array"===x.type(e)},isWindow:function(e){return null!=e&&e==e.window},isNumeric:function(e){return!isNaN(parseFloat(e))&&isFinite(e)},type:function(e){return null==e?e+"":"object"==typeof e||"function"==typeof e?c[y.call(e)]||"object":typeof e},isPlainObject:function(e){var n;if(!e||"object"!==x.type(e)||e.nodeType||x.isWindow(e))return!1;try{if(e.constructor&&!v.call(e,"constructor")&&!v.call(e.constructor.prototype,"isPrototypeOf"))return!1}catch(r){return!1}if(x.support.ownLast)
 for(n in e)return v.call(e,n);for(n in e);return n===t||v.call(e,n)},isEmptyObject:function(e){var t;for(t in e)return!1;return!0},error:function(e){throw Error(e)},parseHTML:function(e,t,n){if(!e||"string"!=typeof e)return null;"boolean"==typeof t&&(n=t,t=!1),t=t||a;var r=k.exec(e),i=!n&&[];return r?[t.createElement(r[1])]:(r=x.buildFragment([e],t,i),i&&x(i).remove(),x.merge([],r.childNodes))},parseJSON:function(n){return e.JSON&&e.JSON.parse?e.JSON.parse(n):null===n?n:"string"==typeof n&&(n=x.trim(n),n&&E.test(n.replace(A,"@").replace(j,"]").replace(S,"")))?Function("return "+n)():(x.error("Invalid JSON: "+n),t)},parseXML:function(n){var r,i;if(!n||"string"!=typeof n)return null;try{e.DOMParser?(i=new DOMParser,r=i.parseFromString(n,"text/xml")):(r=new ActiveXObject("Microsoft.XMLDOM"),r.async="false",r.loadXML(n))}catch(o){r=t}return r&&r.documentElement&&!r.getElementsByTagName("parsererror").length||x.error("Invalid XML: "+n),r},noop:function(){},globalEval:function(t){
 t&&x.trim(t)&&(e.execScript||function(t){e.eval.call(e,t)})(t)},camelCase:function(e){return e.replace(D,"ms-").replace(L,H)},nodeName:function(e,t){return e.nodeName&&e.nodeName.toLowerCase()===t.toLowerCase()},each:function(e,t,n){var r,i=0,o=e.length,a=M(e);if(n){if(a){for(;o>i;i++)if(r=t.apply(e[i],n),r===!1)break}else for(i in e)if(r=t.apply(e[i],n),r===!1)break}else if(a){for(;o>i;i++)if(r=t.call(e[i],i,e[i]),r===!1)break}else for(i in e)if(r=t.call(e[i],i,e[i]),r===!1)break;return e},trim:b&&!b.call("\ufeff\u00a0")?function(e){return null==e?"":b.call(e)}:function(e){return null==e?"":(e+"").replace(C,"")},makeArray:function(e,t){var n=t||[];return null!=e&&(M(Object(e))?x.merge(n,"string"==typeof e?[e]:e):h.call(n,e)),n},inArray:function(e,t,n){var r;if(t){if(m)return m.call(t,e,n);for(r=t.length,n=n?0>n?Math.max(0,r+n):n:0;r>n;n++)if(n in t&&t[n]===e)return n}return-1},merge:function(e,n){var r=n.length,i=e.length,o=0;if("number"==typeof r)for(;r>o;o++)e[i++]=n[o];e
 lse while(n[o]!==t)e[i++]=n[o++];return e.length=i,e},grep:function(e,t,n){var r,i=[],o=0,a=e.length;for(n=!!n;a>o;o++)r=!!t(e[o],o),n!==r&&i.push(e[o]);return i},map:function(e,t,n){var r,i=0,o=e.length,a=M(e),s=[];if(a)for(;o>i;i++)r=t(e[i],i,n),null!=r&&(s[s.length]=r);else for(i in e)r=t(e[i],i,n),null!=r&&(s[s.length]=r);return d.apply([],s)},guid:1,proxy:function(e,n){var r,i,o;return"string"==typeof n&&(o=e[n],n=e,e=o),x.isFunction(e)?(r=g.call(arguments,2),i=function(){return e.apply(n||this,r.concat(g.call(arguments)))},i.guid=e.guid=e.guid||x.guid++,i):t},access:function(e,n,r,i,o,a,s){var l=0,u=e.length,c=null==r;if("object"===x.type(r)){o=!0;for(l in r)x.access(e,n,l,r[l],!0,a,s)}else if(i!==t&&(o=!0,x.isFunction(i)||(s=!0),c&&(s?(n.call(e,i),n=null):(c=n,n=function(e,t,n){return c.call(x(e),n)})),n))for(;u>l;l++)n(e[l],r,s?i:i.call(e[l],l,n(e[l],r)));return o?e:c?n.call(e):u?n(e[0],r):a},now:function(){return(new Date).getTime()},swap:function(e,t,n,r){var i,o,a
 ={};for(o in t)a[o]=e.style[o],e.style[o]=t[o];i=n.apply(e,r||[]);for(o in t)e.style[o]=a[o];return i}}),x.ready.promise=function(t){if(!n)if(n=x.Deferred(),"complete"===a.readyState)setTimeout(x.ready);else if(a.addEventListener)a.addEventListener("DOMContentLoaded",q,!1),e.addEventListener("load",q,!1);else{a.attachEvent("onreadystatechange",q),e.attachEvent("onload",q);var r=!1;try{r=null==e.frameElement&&a.documentElement}catch(i){}r&&r.doScroll&&function o(){if(!x.isReady){try{r.doScroll("left")}catch(e){return setTimeout(o,50)}_(),x.ready()}}()}return n.promise(t)},x.each("Boolean Number String Function Array Date RegExp Object Error".split(" "),function(e,t){c["[object "+t+"]"]=t.toLowerCase()});function M(e){var t=e.length,n=x.type(e);return x.isWindow(e)?!1:1===e.nodeType&&t?!0:"array"===n||"function"!==n&&(0===t||"number"==typeof t&&t>0&&t-1 in e)}r=x(a),function(e,t){var n,r,i,o,a,s,l,u,c,p,f,d,h,g,m,y,v,b="sizzle"+-new Date,w=e.document,T=0,C=0,N=st(),k=st(),E=st
 (),S=!1,A=function(e,t){return e===t?(S=!0,0):0},j=typeof t,D=1<<31,L={}.hasOwnProperty,H=[],q=H.pop,_=H.push,M=H.push,O=H.slice,F=H.indexOf||function(e){var t=0,n=this.length;for(;n>t;t++)if(this[t]===e)return t;return-1},B="checked|selected|async|autofocus|autoplay|controls|defer|disabled|hidden|ismap|loop|multiple|open|readonly|required|scoped",P="[\\x20\\t\\r\\n\\f]",R="(?:\\\\.|[\\w-]|[^\\x00-\\xa0])+",W=R.replace("w","w#"),$="\\["+P+"*("+R+")"+P+"*(?:([*^$|!~]?=)"+P+"*(?:(['\"])((?:\\\\.|[^\\\\])*?)\\3|("+W+")|)|)"+P+"*\\]",I=":("+R+")(?:\\(((['\"])((?:\\\\.|[^\\\\])*?)\\3|((?:\\\\.|[^\\\\()[\\]]|"+$.replace(3,8)+")*)|.*)\\)|)",z=RegExp("^"+P+"+|((?:^|[^\\\\])(?:\\\\.)*)"+P+"+$","g"),X=RegExp("^"+P+"*,"+P+"*"),U=RegExp("^"+P+"*([>+~]|"+P+")"+P+"*"),V=RegExp(P+"*[+~]"),Y=RegExp("="+P+"*([^\\]'\"]*)"+P+"*\\]","g"),J=RegExp(I),G=RegExp("^"+W+"$"),Q={ID:RegExp("^#("+R+")"),CLASS:RegExp("^\\.("+R+")"),TAG:RegExp("^("+R.replace("w","w*")+")"),ATTR:RegExp("^"+$),PSEUDO:RegExp
 ("^"+I),CHILD:RegExp("^:(only|first|last|nth|nth-last)-(child|of-type)(?:\\("+P+"*(even|odd|(([+-]|)(\\d*)n|)"+P+"*(?:([+-]|)"+P+"*(\\d+)|))"+P+"*\\)|)","i"),bool:RegExp("^(?:"+B+")$","i"),needsContext:RegExp("^"+P+"*[>+~]|:(even|odd|eq|gt|lt|nth|first|last)(?:\\("+P+"*((?:-\\d)?\\d*)"+P+"*\\)|)(?=[^-]|$)","i")},K=/^[^{]+\{\s*\[native \w/,Z=/^(?:#([\w-]+)|(\w+)|\.([\w-]+))$/,et=/^(?:input|select|textarea|button)$/i,tt=/^h\d$/i,nt=/'|\\/g,rt=RegExp("\\\\([\\da-f]{1,6}"+P+"?|("+P+")|.)","ig"),it=function(e,t,n){var r="0x"+t-65536;return r!==r||n?t:0>r?String.fromCharCode(r+65536):String.fromCharCode(55296|r>>10,56320|1023&r)};try{M.apply(H=O.call(w.childNodes),w.childNodes),H[w.childNodes.length].nodeType}catch(ot){M={apply:H.length?function(e,t){_.apply(e,O.call(t))}:function(e,t){var n=e.length,r=0;while(e[n++]=t[r++]);e.length=n-1}}}function at(e,t,n,i){var o,a,s,l,u,c,d,m,y,x;if((t?t.ownerDocument||t:w)!==f&&p(t),t=t||f,n=n||[],!e||"string"!=typeof e)return n;if(1!==(l=t.n
 odeType)&&9!==l)return[];if(h&&!i){if(o=Z.exec(e))if(s=o[1]){if(9===l){if(a=t.getElementById(s),!a||!a.parentNode)return n;if(a.id===s)return n.push(a),n}else if(t.ownerDocument&&(a=t.ownerDocument.getElementById(s))&&v(t,a)&&a.id===s)return n.push(a),n}else{if(o[2])return M.apply(n,t.getElementsByTagName(e)),n;if((s=o[3])&&r.getElementsByClassName&&t.getElementsByClassName)return M.apply(n,t.getElementsByClassName(s)),n}if(r.qsa&&(!g||!g.test(e))){if(m=d=b,y=t,x=9===l&&e,1===l&&"object"!==t.nodeName.toLowerCase()){c=mt(e),(d=t.getAttribute("id"))?m=d.replace(nt,"\\$&"):t.setAttribute("id",m),m="[id='"+m+"'] ",u=c.length;while(u--)c[u]=m+yt(c[u]);y=V.test(e)&&t.parentNode||t,x=c.join(",")}if(x)try{return M.apply(n,y.querySelectorAll(x)),n}catch(T){}finally{d||t.removeAttribute("id")}}}return kt(e.replace(z,"$1"),t,n,i)}function st(){var e=[];function t(n,r){return e.push(n+=" ")>o.cacheLength&&delete t[e.shift()],t[n]=r}return t}function lt(e){return e[b]=!0,e}function ut(e)
 {var t=f.createElement("div");try{return!!e(t)}catch(n){return!1}finally{t.parentNode&&t.parentNode.removeChild(t),t=null}}function ct(e,t){var n=e.split("|"),r=e.length;while(r--)o.attrHandle[n[r]]=t}function pt(e,t){var n=t&&e,r=n&&1===e.nodeType&&1===t.nodeType&&(~t.sourceIndex||D)-(~e.sourceIndex||D);if(r)return r;if(n)while(n=n.nextSibling)if(n===t)return-1;return e?1:-1}function ft(e){return function(t){var n=t.nodeName.toLowerCase();return"input"===n&&t.type===e}}function dt(e){return function(t){var n=t.nodeName.toLowerCase();return("input"===n||"button"===n)&&t.type===e}}function ht(e){return lt(function(t){return t=+t,lt(function(n,r){var i,o=e([],n.length,t),a=o.length;while(a--)n[i=o[a]]&&(n[i]=!(r[i]=n[i]))})})}s=at.isXML=function(e){var t=e&&(e.ownerDocument||e).documentElement;return t?"HTML"!==t.nodeName:!1},r=at.support={},p=at.setDocument=function(e){var n=e?e.ownerDocument||e:w,i=n.defaultView;return n!==f&&9===n.nodeType&&n.documentElement?(f=n,d=n.docume
 ntElement,h=!s(n),i&&i.attachEvent&&i!==i.top&&i.attachEvent("onbeforeunload",function(){p()}),r.attributes=ut(function(e){return e.className="i",!e.getAttribute("className")}),r.getElementsByTagName=ut(function(e){return e.appendChild(n.createComment("")),!e.getElementsByTagName("*").length}),r.getElementsByClassName=ut(function(e){return e.innerHTML="<div class='a'></div><div class='a i'></div>",e.firstChild.className="i",2===e.getElementsByClassName("i").length}),r.getById=ut(function(e){return d.appendChild(e).id=b,!n.getElementsByName||!n.getElementsByName(b).length}),r.getById?(o.find.ID=function(e,t){if(typeof t.getElementById!==j&&h){var n=t.getElementById(e);return n&&n.parentNode?[n]:[]}},o.filter.ID=function(e){var t=e.replace(rt,it);return function(e){return e.getAttribute("id")===t}}):(delete o.find.ID,o.filter.ID=function(e){var t=e.replace(rt,it);return function(e){var n=typeof e.getAttributeNode!==j&&e.getAttributeNode("id");return n&&n.value===t}}),o.find.TA
 G=r.getElementsByTagName?function(e,n){return typeof n.getElementsByTagName!==j?n.getElementsByTagName(e):t}:function(e,t){var n,r=[],i=0,o=t.getElementsByTagName(e);if("*"===e){while(n=o[i++])1===n.nodeType&&r.push(n);return r}return o},o.find.CLASS=r.getElementsByClassName&&function(e,n){return typeof n.getElementsByClassName!==j&&h?n.getElementsByClassName(e):t},m=[],g=[],(r.qsa=K.test(n.querySelectorAll))&&(ut(function(e){e.innerHTML="<select><option selected=''></option></select>",e.querySelectorAll("[selected]").length||g.push("\\["+P+"*(?:value|"+B+")"),e.querySelectorAll(":checked").length||g.push(":checked")}),ut(function(e){var t=n.createElement("input");t.setAttribute("type","hidden"),e.appendChild(t).setAttribute("t",""),e.querySelectorAll("[t^='']").length&&g.push("[*^$]="+P+"*(?:''|\"\")"),e.querySelectorAll(":enabled").length||g.push(":enabled",":disabled"),e.querySelectorAll("*,:x"),g.push(",.*:")})),(r.matchesSelector=K.test(y=d.webkitMatchesSelector||d.mozM
 atchesSelector||d.oMatchesSelector||d.msMatchesSelector))&&ut(function(e){r.disconnectedMatch=y.call(e,"div"),y.call(e,"[s!='']:x"),m.push("!=",I)}),g=g.length&&RegExp(g.join("|")),m=m.length&&RegExp(m.join("|")),v=K.test(d.contains)||d.compareDocumentPosition?function(e,t){var n=9===e.nodeType?e.documentElement:e,r=t&&t.parentNode;return e===r||!(!r||1!==r.nodeType||!(n.contains?n.contains(r):e.compareDocumentPosition&&16&e.compareDocumentPosition(r)))}:function(e,t){if(t)while(t=t.parentNode)if(t===e)return!0;return!1},A=d.compareDocumentPosition?function(e,t){if(e===t)return S=!0,0;var i=t.compareDocumentPosition&&e.compareDocumentPosition&&e.compareDocumentPosition(t);return i?1&i||!r.sortDetached&&t.compareDocumentPosition(e)===i?e===n||v(w,e)?-1:t===n||v(w,t)?1:c?F.call(c,e)-F.call(c,t):0:4&i?-1:1:e.compareDocumentPosition?-1:1}:function(e,t){var r,i=0,o=e.parentNode,a=t.parentNode,s=[e],l=[t];if(e===t)return S=!0,0;if(!o||!a)return e===n?-1:t===n?1:o?-1:a?1:c?F.call(c
 ,e)-F.call(c,t):0;if(o===a)return pt(e,t);r=e;while(r=r.parentNode)s.unshift(r);r=t;while(r=r.parentNode)l.unshift(r);while(s[i]===l[i])i++;return i?pt(s[i],l[i]):s[i]===w?-1:l[i]===w?1:0},n):f},at.matches=function(e,t){return at(e,null,null,t)},at.matchesSelector=function(e,t){if((e.ownerDocument||e)!==f&&p(e),t=t.replace(Y,"='$1']"),!(!r.matchesSelector||!h||m&&m.test(t)||g&&g.test(t)))try{var n=y.call(e,t);if(n||r.disconnectedMatch||e.document&&11!==e.document.nodeType)return n}catch(i){}return at(t,f,null,[e]).length>0},at.contains=function(e,t){return(e.ownerDocument||e)!==f&&p(e),v(e,t)},at.attr=function(e,n){(e.ownerDocument||e)!==f&&p(e);var i=o.attrHandle[n.toLowerCase()],a=i&&L.call(o.attrHandle,n.toLowerCase())?i(e,n,!h):t;return a===t?r.attributes||!h?e.getAttribute(n):(a=e.getAttributeNode(n))&&a.specified?a.value:null:a},at.error=function(e){throw Error("Syntax error, unrecognized expression: "+e)},at.uniqueSort=function(e){var t,n=[],i=0,o=0;if(S=!r.detectDupl
 icates,c=!r.sortStable&&e.slice(0),e.sort(A),S){while(t=e[o++])t===e[o]&&(i=n.push(o));while(i--)e.splice(n[i],1)}return e},a=at.getText=function(e){var t,n="",r=0,i=e.nodeType;if(i){if(1===i||9===i||11===i){if("string"==typeof e.textContent)return e.textContent;for(e=e.firstChild;e;e=e.nextSibling)n+=a(e)}else if(3===i||4===i)return e.nodeValue}else for(;t=e[r];r++)n+=a(t);return n},o=at.selectors={cacheLength:50,createPseudo:lt,match:Q,attrHandle:{},find:{},relative:{">":{dir:"parentNode",first:!0}," ":{dir:"parentNode"},"+":{dir:"previousSibling",first:!0},"~":{dir:"previousSibling"}},preFilter:{ATTR:function(e){return e[1]=e[1].replace(rt,it),e[3]=(e[4]||e[5]||"").replace(rt,it),"~="===e[2]&&(e[3]=" "+e[3]+" "),e.slice(0,4)},CHILD:function(e){return e[1]=e[1].toLowerCase(),"nth"===e[1].slice(0,3)?(e[3]||at.error(e[0]),e[4]=+(e[4]?e[5]+(e[6]||1):2*("even"===e[3]||"odd"===e[3])),e[5]=+(e[7]+e[8]||"odd"===e[3])):e[3]&&at.error(e[0]),e},PSEUDO:function(e){var n,r=!e[5]&&e[2]
 ;return Q.CHILD.test(e[0])?null:(e[3]&&e[4]!==t?e[2]=e[4]:r&&J.test(r)&&(n=mt(r,!0))&&(n=r.indexOf(")",r.length-n)-r.length)&&(e[0]=e[0].slice(0,n),e[2]=r.slice(0,n)),e.slice(0,3))}},filter:{TAG:function(e){var t=e.replace(rt,it).toLowerCase();return"*"===e?function(){return!0}:function(e){return e.nodeName&&e.nodeName.toLowerCase()===t}},CLASS:function(e){var t=N[e+" "];return t||(t=RegExp("(^|"+P+")"+e+"("+P+"|$)"))&&N(e,function(e){return t.test("string"==typeof e.className&&e.className||typeof e.getAttribute!==j&&e.getAttribute("class")||"")})},ATTR:function(e,t,n){return function(r){var i=at.attr(r,e);return null==i?"!="===t:t?(i+="","="===t?i===n:"!="===t?i!==n:"^="===t?n&&0===i.indexOf(n):"*="===t?n&&i.indexOf(n)>-1:"$="===t?n&&i.slice(-n.length)===n:"~="===t?(" "+i+" ").indexOf(n)>-1:"|="===t?i===n||i.slice(0,n.length+1)===n+"-":!1):!0}},CHILD:function(e,t,n,r,i){var o="nth"!==e.slice(0,3),a="last"!==e.slice(-4),s="of-type"===t;return 1===r&&0===i?function(e){return!
 !e.parentNode}:function(t,n,l){var u,c,p,f,d,h,g=o!==a?"nextSibling":"previousSibling",m=t.parentNode,y=s&&t.nodeName.toLowerCase(),v=!l&&!s;if(m){if(o){while(g){p=t;while(p=p[g])if(s?p.nodeName.toLowerCase()===y:1===p.nodeType)return!1;h=g="only"===e&&!h&&"nextSibling"}return!0}if(h=[a?m.firstChild:m.lastChild],a&&v){c=m[b]||(m[b]={}),u=c[e]||[],d=u[0]===T&&u[1],f=u[0]===T&&u[2],p=d&&m.childNodes[d];while(p=++d&&p&&p[g]||(f=d=0)||h.pop())if(1===p.nodeType&&++f&&p===t){c[e]=[T,d,f];break}}else if(v&&(u=(t[b]||(t[b]={}))[e])&&u[0]===T)f=u[1];else while(p=++d&&p&&p[g]||(f=d=0)||h.pop())if((s?p.nodeName.toLowerCase()===y:1===p.nodeType)&&++f&&(v&&((p[b]||(p[b]={}))[e]=[T,f]),p===t))break;return f-=i,f===r||0===f%r&&f/r>=0}}},PSEUDO:function(e,t){var n,r=o.pseudos[e]||o.setFilters[e.toLowerCase()]||at.error("unsupported pseudo: "+e);return r[b]?r(t):r.length>1?(n=[e,e,"",t],o.setFilters.hasOwnProperty(e.toLowerCase())?lt(function(e,n){var i,o=r(e,t),a=o.length;while(a--)i=F.call
 (e,o[a]),e[i]=!(n[i]=o[a])}):function(e){return r(e,0,n)}):r}},pseudos:{not:lt(function(e){var t=[],n=[],r=l(e.replace(z,"$1"));return r[b]?lt(function(e,t,n,i){var o,a=r(e,null,i,[]),s=e.length;while(s--)(o=a[s])&&(e[s]=!(t[s]=o))}):function(e,i,o){return t[0]=e,r(t,null,o,n),!n.pop()}}),has:lt(function(e){return function(t){return at(e,t).length>0}}),contains:lt(function(e){return function(t){return(t.textContent||t.innerText||a(t)).indexOf(e)>-1}}),lang:lt(function(e){return G.test(e||"")||at.error("unsupported lang: "+e),e=e.replace(rt,it).toLowerCase(),function(t){var n;do if(n=h?t.lang:t.getAttribute("xml:lang")||t.getAttribute("lang"))return n=n.toLowerCase(),n===e||0===n.indexOf(e+"-");while((t=t.parentNode)&&1===t.nodeType);return!1}}),target:function(t){var n=e.location&&e.location.hash;return n&&n.slice(1)===t.id},root:function(e){return e===d},focus:function(e){return e===f.activeElement&&(!f.hasFocus||f.hasFocus())&&!!(e.type||e.href||~e.tabIndex)},enabled:funct
 ion(e){return e.disabled===!1},disabled:function(e){return e.disabled===!0},checked:function(e){var t=e.nodeName.toLowerCase();return"input"===t&&!!e.checked||"option"===t&&!!e.selected},selected:function(e){return e.parentNode&&e.parentNode.selectedIndex,e.selected===!0},empty:function(e){for(e=e.firstChild;e;e=e.nextSibling)if(e.nodeName>"@"||3===e.nodeType||4===e.nodeType)return!1;return!0},parent:function(e){return!o.pseudos.empty(e)},header:function(e){return tt.test(e.nodeName)},input:function(e){return et.test(e.nodeName)},button:function(e){var t=e.nodeName.toLowerCase();return"input"===t&&"button"===e.type||"button"===t},text:function(e){var t;return"input"===e.nodeName.toLowerCase()&&"text"===e.type&&(null==(t=e.getAttribute("type"))||t.toLowerCase()===e.type)},first:ht(function(){return[0]}),last:ht(function(e,t){return[t-1]}),eq:ht(function(e,t,n){return[0>n?n+t:n]}),even:ht(function(e,t){var n=0;for(;t>n;n+=2)e.push(n);return e}),odd:ht(function(e,t){var n=1;for
 (;t>n;n+=2)e.push(n);return e}),lt:ht(function(e,t,n){var r=0>n?n+t:n;for(;--r>=0;)e.push(r);return e}),gt:ht(function(e,t,n){var r=0>n?n+t:n;for(;t>++r;)e.push(r);return e})}},o.pseudos.nth=o.pseudos.eq;for(n in{radio:!0,checkbox:!0,file:!0,password:!0,image:!0})o.pseudos[n]=ft(n);for(n in{submit:!0,reset:!0})o.pseudos[n]=dt(n);function gt(){}gt.prototype=o.filters=o.pseudos,o.setFilters=new gt;function mt(e,t){var n,r,i,a,s,l,u,c=k[e+" "];if(c)return t?0:c.slice(0);s=e,l=[],u=o.preFilter;while(s){(!n||(r=X.exec(s)))&&(r&&(s=s.slice(r[0].length)||s),l.push(i=[])),n=!1,(r=U.exec(s))&&(n=r.shift(),i.push({value:n,type:r[0].replace(z," ")}),s=s.slice(n.length));for(a in o.filter)!(r=Q[a].exec(s))||u[a]&&!(r=u[a](r))||(n=r.shift(),i.push({value:n,type:a,matches:r}),s=s.slice(n.length));if(!n)break}return t?s.length:s?at.error(e):k(e,l).slice(0)}function yt(e){var t=0,n=e.length,r="";for(;n>t;t++)r+=e[t].value;return r}function vt(e,t,n){var r=t.dir,o=n&&"parentNode"===r,a=C++;r
 eturn t.first?function(t,n,i){while(t=t[r])if(1===t.nodeType||o)return e(t,n,i)}:function(t,n,s){var l,u,c,p=T+" "+a;if(s){while(t=t[r])if((1===t.nodeType||o)&&e(t,n,s))return!0}else while(t=t[r])if(1===t.nodeType||o)if(c=t[b]||(t[b]={}),(u=c[r])&&u[0]===p){if((l=u[1])===!0||l===i)return l===!0}else if(u=c[r]=[p],u[1]=e(t,n,s)||i,u[1]===!0)return!0}}function bt(e){return e.length>1?function(t,n,r){var i=e.length;while(i--)if(!e[i](t,n,r))return!1;return!0}:e[0]}function xt(e,t,n,r,i){var o,a=[],s=0,l=e.length,u=null!=t;for(;l>s;s++)(o=e[s])&&(!n||n(o,r,i))&&(a.push(o),u&&t.push(s));return a}function wt(e,t,n,r,i,o){return r&&!r[b]&&(r=wt(r)),i&&!i[b]&&(i=wt(i,o)),lt(function(o,a,s,l){var u,c,p,f=[],d=[],h=a.length,g=o||Nt(t||"*",s.nodeType?[s]:s,[]),m=!e||!o&&t?g:xt(g,f,e,s,l),y=n?i||(o?e:h||r)?[]:a:m;if(n&&n(m,y,s,l),r){u=xt(y,d),r(u,[],s,l),c=u.length;while(c--)(p=u[c])&&(y[d[c]]=!(m[d[c]]=p))}if(o){if(i||e){if(i){u=[],c=y.length;while(c--)(p=y[c])&&u.push(m[c]=p);i(null,y
 =[],u,l)}c=y.length;while(c--)(p=y[c])&&(u=i?F.call(o,p):f[c])>-1&&(o[u]=!(a[u]=p))}}else y=xt(y===a?y.splice(h,y.length):y),i?i(null,a,y,l):M.apply(a,y)})}function Tt(e){var t,n,r,i=e.length,a=o.relative[e[0].type],s=a||o.relative[" "],l=a?1:0,c=vt(function(e){return e===t},s,!0),p=vt(function(e){return F.call(t,e)>-1},s,!0),f=[function(e,n,r){return!a&&(r||n!==u)||((t=n).nodeType?c(e,n,r):p(e,n,r))}];for(;i>l;l++)if(n=o.relative[e[l].type])f=[vt(bt(f),n)];else{if(n=o.filter[e[l].type].apply(null,e[l].matches),n[b]){for(r=++l;i>r;r++)if(o.relative[e[r].type])break;return wt(l>1&&bt(f),l>1&&yt(e.slice(0,l-1).concat({value:" "===e[l-2].type?"*":""})).replace(z,"$1"),n,r>l&&Tt(e.slice(l,r)),i>r&&Tt(e=e.slice(r)),i>r&&yt(e))}f.push(n)}return bt(f)}function Ct(e,t){var n=0,r=t.length>0,a=e.length>0,s=function(s,l,c,p,d){var h,g,m,y=[],v=0,b="0",x=s&&[],w=null!=d,C=u,N=s||a&&o.find.TAG("*",d&&l.parentNode||l),k=T+=null==C?1:Math.random()||.1;for(w&&(u=l!==f&&l,i=n);null!=(h=N[b])
 ;b++){if(a&&h){g=0;while(m=e[g++])if(m(h,l,c)){p.push(h);break}w&&(T=k,i=++n)}r&&((h=!m&&h)&&v--,s&&x.push(h))}if(v+=b,r&&b!==v){g=0;while(m=t[g++])m(x,y,l,c);if(s){if(v>0)while(b--)x[b]||y[b]||(y[b]=q.call(p));y=xt(y)}M.apply(p,y),w&&!s&&y.length>0&&v+t.length>1&&at.uniqueSort(p)}return w&&(T=k,u=C),x};return r?lt(s):s}l=at.compile=function(e,t){var n,r=[],i=[],o=E[e+" "];if(!o){t||(t=mt(e)),n=t.length;while(n--)o=Tt(t[n]),o[b]?r.push(o):i.push(o);o=E(e,Ct(i,r))}return o};function Nt(e,t,n){var r=0,i=t.length;for(;i>r;r++)at(e,t[r],n);return n}function kt(e,t,n,i){var a,s,u,c,p,f=mt(e);if(!i&&1===f.length){if(s=f[0]=f[0].slice(0),s.length>2&&"ID"===(u=s[0]).type&&r.getById&&9===t.nodeType&&h&&o.relative[s[1].type]){if(t=(o.find.ID(u.matches[0].replace(rt,it),t)||[])[0],!t)return n;e=e.slice(s.shift().value.length)}a=Q.needsContext.test(e)?0:s.length;while(a--){if(u=s[a],o.relative[c=u.type])break;if((p=o.find[c])&&(i=p(u.matches[0].replace(rt,it),V.test(s[0].type)&&t.parent
 Node||t))){if(s.splice(a,1),e=i.length&&yt(s),!e)return M.apply(n,i),n;break}}}return l(e,f)(i,t,!h,n,V.test(e)),n}r.sortStable=b.split("").sort(A).join("")===b,r.detectDuplicates=S,p(),r.sortDetached=ut(function(e){return 1&e.compareDocumentPosition(f.createElement("div"))}),ut(function(e){return e.innerHTML="<a href='#'></a>","#"===e.firstChild.getAttribute("href")})||ct("type|href|height|width",function(e,n,r){return r?t:e.getAttribute(n,"type"===n.toLowerCase()?1:2)}),r.attributes&&ut(function(e){return e.innerHTML="<input/>",e.firstChild.setAttribute("value",""),""===e.firstChild.getAttribute("value")})||ct("value",function(e,n,r){return r||"input"!==e.nodeName.toLowerCase()?t:e.defaultValue}),ut(function(e){return null==e.getAttribute("disabled")})||ct(B,function(e,n,r){var i;return r?t:(i=e.getAttributeNode(n))&&i.specified?i.value:e[n]===!0?n.toLowerCase():null}),x.find=at,x.expr=at.selectors,x.expr[":"]=x.expr.pseudos,x.unique=at.uniqueSort,x.text=at.getText,x.isXML
 Doc=at.isXML,x.contains=at.contains}(e);var O={};function F(e){var t=O[e]={};return x.each(e.match(T)||[],function(e,n){t[n]=!0}),t}x.Callbacks=function(e){e="string"==typeof e?O[e]||F(e):x.extend({},e);var n,r,i,o,a,s,l=[],u=!e.once&&[],c=function(t){for(r=e.memory&&t,i=!0,a=s||0,s=0,o=l.length,n=!0;l&&o>a;a++)if(l[a].apply(t[0],t[1])===!1&&e.stopOnFalse){r=!1;break}n=!1,l&&(u?u.length&&c(u.shift()):r?l=[]:p.disable())},p={add:function(){if(l){var t=l.length;(function i(t){x.each(t,function(t,n){var r=x.type(n);"function"===r?e.unique&&p.has(n)||l.push(n):n&&n.length&&"string"!==r&&i(n)})})(arguments),n?o=l.length:r&&(s=t,c(r))}return this},remove:function(){return l&&x.each(arguments,function(e,t){var r;while((r=x.inArray(t,l,r))>-1)l.splice(r,1),n&&(o>=r&&o--,a>=r&&a--)}),this},has:function(e){return e?x.inArray(e,l)>-1:!(!l||!l.length)},empty:function(){return l=[],o=0,this},disable:function(){return l=u=r=t,this},disabled:function(){return!l},lock:function(){return u=t,
 r||p.disable(),this},locked:function(){return!u},fireWith:function(e,t){return!l||i&&!u||(t=t||[],t=[e,t.slice?t.slice():t],n?u.push(t):c(t)),this},fire:function(){return p.fireWith(this,arguments),this},fired:function(){return!!i}};return p},x.extend({Deferred:function(e){var t=[["resolve","done",x.Callbacks("once memory"),"resolved"],["reject","fail",x.Callbacks("once memory"),"rejected"],["notify","progress",x.Callbacks("memory")]],n="pending",r={state:function(){return n},always:function(){return i.done(arguments).fail(arguments),this},then:function(){var e=arguments;return x.Deferred(function(n){x.each(t,function(t,o){var a=o[0],s=x.isFunction(e[t])&&e[t];i[o[1]](function(){var e=s&&s.apply(this,arguments);e&&x.isFunction(e.promise)?e.promise().done(n.resolve).fail(n.reject).progress(n.notify):n[a+"With"](this===r?n.promise():this,s?[e]:arguments)})}),e=null}).promise()},promise:function(e){return null!=e?x.extend(e,r):r}},i={};return r.pipe=r.then,x.each(t,function(e,o
 ){var a=o[2],s=o[3];r[o[1]]=a.add,s&&a.add(function(){n=s},t[1^e][2].disable,t[2][2].lock),i[o[0]]=function(){return i[o[0]+"With"](this===i?r:this,arguments),this},i[o[0]+"With"]=a.fireWith}),r.promise(i),e&&e.call(i,i),i},when:function(e){var t=0,n=g.call(arguments),r=n.length,i=1!==r||e&&x.isFunction(e.promise)?r:0,o=1===i?e:x.Deferred(),a=function(e,t,n){return function(r){t[e]=this,n[e]=arguments.length>1?g.call(arguments):r,n===s?o.notifyWith(t,n):--i||o.resolveWith(t,n)}},s,l,u;if(r>1)for(s=Array(r),l=Array(r),u=Array(r);r>t;t++)n[t]&&x.isFunction(n[t].promise)?n[t].promise().done(a(t,u,n)).fail(o.reject).progress(a(t,l,s)):--i;return i||o.resolveWith(u,n),o.promise()}}),x.support=function(t){var n,r,o,s,l,u,c,p,f,d=a.createElement("div");if(d.setAttribute("className","t"),d.innerHTML="  <link/><table></table><a href='/a'>a</a><input type='checkbox'/>",n=d.getElementsByTagName("*")||[],r=d.getElementsByTagName("a")[0],!r||!r.style||!n.length)return t;s=a.createElement
 ("select"),u=s.appendChild(a.createElement("option")),o=d.getElementsByTagName("input")[0],r.style.cssText="top:1px;float:left;opacity:.5",t.getSetAttribute="t"!==d.className,t.leadingWhitespace=3===d.firstChild.nodeType,t.tbody=!d.getElementsByTagName("tbody").length,t.htmlSerialize=!!d.getElementsByTagName("link").length,t.style=/top/.test(r.getAttribute("style")),t.hrefNormalized="/a"===r.getAttribute("href"),t.opacity=/^0.5/.test(r.style.opacity),t.cssFloat=!!r.style.cssFloat,t.checkOn=!!o.value,t.optSelected=u.selected,t.enctype=!!a.createElement("form").enctype,t.html5Clone="<:nav></:nav>"!==a.createElement("nav").cloneNode(!0).outerHTML,t.inlineBlockNeedsLayout=!1,t.shrinkWrapBlocks=!1,t.pixelPosition=!1,t.deleteExpando=!0,t.noCloneEvent=!0,t.reliableMarginRight=!0,t.boxSizingReliable=!0,o.checked=!0,t.noCloneChecked=o.cloneNode(!0).checked,s.disabled=!0,t.optDisabled=!u.disabled;try{delete d.test}catch(h){t.deleteExpando=!1}o=a.createElement("input"),o.setAttribute("
 value",""),t.input=""===o.getAttribute("value"),o.value="t",o.setAttribute("type","radio"),t.radioValue="t"===o.value,o.setAttribute("checked","t"),o.setAttribute("name","t"),l=a.createDocumentFragment(),l.appendChild(o),t.appendChecked=o.checked,t.checkClone=l.cloneNode(!0).cloneNode(!0).lastChild.checked,d.attachEvent&&(d.attachEvent("onclick",function(){t.noCloneEvent=!1}),d.cloneNode(!0).click());for(f in{submit:!0,change:!0,focusin:!0})d.setAttribute(c="on"+f,"t"),t[f+"Bubbles"]=c in e||d.attributes[c].expando===!1;d.style.backgroundClip="content-box",d.cloneNode(!0).style.backgroundClip="",t.clearCloneStyle="content-box"===d.style.backgroundClip;for(f in x(t))break;return t.ownLast="0"!==f,x(function(){var n,r,o,s="padding:0;margin:0;border:0;display:block;box-sizing:content-box;-moz-box-sizing:content-box;-webkit-box-sizing:content-box;",l=a.getElementsByTagName("body")[0];l&&(n=a.createElement("div"),n.style.cssText="border:0;width:0;height:0;position:absolute;top:0;
 left:-9999px;margin-top:1px",l.appendChild(n).appendChild(d),d.innerHTML="<table><tr><td></td><td>t</td></tr></table>",o=d.getElementsByTagName("td"),o[0].style.cssText="padding:0;margin:0;border:0;display:none",p=0===o[0].offsetHeight,o[0].style.display="",o[1].style.display="none",t.reliableHiddenOffsets=p&&0===o[0].offsetHeight,d.innerHTML="",d.style.cssText="box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;padding:1px;border:1px;display:block;width:4px;margin-top:1%;position:absolute;top:1%;",x.swap(l,null!=l.style.zoom?{zoom:1}:{},function(){t.boxSizing=4===d.offsetWidth}),e.getComputedStyle&&(t.pixelPosition="1%"!==(e.getComputedStyle(d,null)||{}).top,t.boxSizingReliable="4px"===(e.getComputedStyle(d,null)||{width:"4px"}).width,r=d.appendChild(a.createElement("div")),r.style.cssText=d.style.cssText=s,r.style.marginRight=r.style.width="0",d.style.width="1px",t.reliableMarginRight=!parseFloat((e.getComputedStyle(r,null)||{}).marginRight)),ty
 peof d.style.zoom!==i&&(d.innerHTML="",d.style.cssText=s+"width:1px;padding:1px;display:inline;zoom:1",t.inlineBlockNeedsLayout=3===d.offsetWidth,d.style.display="block",d.innerHTML="<div></div>",d.firstChild.style.width="5px",t.shrinkWrapBlocks=3!==d.offsetWidth,t.inlineBlockNeedsLayout&&(l.style.zoom=1)),l.removeChild(n),n=d=o=r=null)}),n=s=l=u=r=o=null,t
+}({});var B=/(?:\{[\s\S]*\}|\[[\s\S]*\])$/,P=/([A-Z])/g;function R(e,n,r,i){if(x.acceptData(e)){var o,a,s=x.expando,l=e.nodeType,u=l?x.cache:e,c=l?e[s]:e[s]&&s;if(c&&u[c]&&(i||u[c].data)||r!==t||"string"!=typeof n)return c||(c=l?e[s]=p.pop()||x.guid++:s),u[c]||(u[c]=l?{}:{toJSON:x.noop}),("object"==typeof n||"function"==typeof n)&&(i?u[c]=x.extend(u[c],n):u[c].data=x.extend(u[c].data,n)),a=u[c],i||(a.data||(a.data={}),a=a.data),r!==t&&(a[x.camelCase(n)]=r),"string"==typeof n?(o=a[n],null==o&&(o=a[x.camelCase(n)])):o=a,o}}function W(e,t,n){if(x.acceptData(e)){var r,i,o=e.nodeType,a=o?x.cache:e,s=o?e[x.expando]:x.expando;if(a[s]){if(t&&(r=n?a[s]:a[s].data)){x.isArray(t)?t=t.concat(x.map(t,x.camelCase)):t in r?t=[t]:(t=x.camelCase(t),t=t in r?[t]:t.split(" ")),i=t.length;while(i--)delete r[t[i]];if(n?!I(r):!x.isEmptyObject(r))return}(n||(delete a[s].data,I(a[s])))&&(o?x.cleanData([e],!0):x.support.deleteExpando||a!=a.window?delete a[s]:a[s]=null)}}}x.extend({cache:{},noData:{ap
 plet:!0,embed:!0,object:"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"},hasData:function(e){return e=e.nodeType?x.cache[e[x.expando]]:e[x.expando],!!e&&!I(e)},data:function(e,t,n){return R(e,t,n)},removeData:function(e,t){return W(e,t)},_data:function(e,t,n){return R(e,t,n,!0)},_removeData:function(e,t){return W(e,t,!0)},acceptData:function(e){if(e.nodeType&&1!==e.nodeType&&9!==e.nodeType)return!1;var t=e.nodeName&&x.noData[e.nodeName.toLowerCase()];return!t||t!==!0&&e.getAttribute("classid")===t}}),x.fn.extend({data:function(e,n){var r,i,o=null,a=0,s=this[0];if(e===t){if(this.length&&(o=x.data(s),1===s.nodeType&&!x._data(s,"parsedAttrs"))){for(r=s.attributes;r.length>a;a++)i=r[a].name,0===i.indexOf("data-")&&(i=x.camelCase(i.slice(5)),$(s,i,o[i]));x._data(s,"parsedAttrs",!0)}return o}return"object"==typeof e?this.each(function(){x.data(this,e)}):arguments.length>1?this.each(function(){x.data(this,e,n)}):s?$(s,e,x.data(s,e)):null},removeData:function(e){return this.each(functi
 on(){x.removeData(this,e)})}});function $(e,n,r){if(r===t&&1===e.nodeType){var i="data-"+n.replace(P,"-$1").toLowerCase();if(r=e.getAttribute(i),"string"==typeof r){try{r="true"===r?!0:"false"===r?!1:"null"===r?null:+r+""===r?+r:B.test(r)?x.parseJSON(r):r}catch(o){}x.data(e,n,r)}else r=t}return r}function I(e){var t;for(t in e)if(("data"!==t||!x.isEmptyObject(e[t]))&&"toJSON"!==t)return!1;return!0}x.extend({queue:function(e,n,r){var i;return e?(n=(n||"fx")+"queue",i=x._data(e,n),r&&(!i||x.isArray(r)?i=x._data(e,n,x.makeArray(r)):i.push(r)),i||[]):t},dequeue:function(e,t){t=t||"fx";var n=x.queue(e,t),r=n.length,i=n.shift(),o=x._queueHooks(e,t),a=function(){x.dequeue(e,t)};"inprogress"===i&&(i=n.shift(),r--),i&&("fx"===t&&n.unshift("inprogress"),delete o.stop,i.call(e,a,o)),!r&&o&&o.empty.fire()},_queueHooks:function(e,t){var n=t+"queueHooks";return x._data(e,n)||x._data(e,n,{empty:x.Callbacks("once memory").add(function(){x._removeData(e,t+"queue"),x._removeData(e,n)})})}}),x
 .fn.extend({queue:function(e,n){var r=2;return"string"!=typeof e&&(n=e,e="fx",r--),r>arguments.length?x.queue(this[0],e):n===t?this:this.each(function(){var t=x.queue(this,e,n);x._queueHooks(this,e),"fx"===e&&"inprogress"!==t[0]&&x.dequeue(this,e)})},dequeue:function(e){return this.each(function(){x.dequeue(this,e)})},delay:function(e,t){return e=x.fx?x.fx.speeds[e]||e:e,t=t||"fx",this.queue(t,function(t,n){var r=setTimeout(t,e);n.stop=function(){clearTimeout(r)}})},clearQueue:function(e){return this.queue(e||"fx",[])},promise:function(e,n){var r,i=1,o=x.Deferred(),a=this,s=this.length,l=function(){--i||o.resolveWith(a,[a])};"string"!=typeof e&&(n=e,e=t),e=e||"fx";while(s--)r=x._data(a[s],e+"queueHooks"),r&&r.empty&&(i++,r.empty.add(l));return l(),o.promise(n)}});var z,X,U=/[\t\r\n\f]/g,V=/\r/g,Y=/^(?:input|select|textarea|button|object)$/i,J=/^(?:a|area)$/i,G=/^(?:checked|selected)$/i,Q=x.support.getSetAttribute,K=x.support.input;x.fn.extend({attr:function(e,t){return x.acc
 ess(this,x.attr,e,t,arguments.length>1)},removeAttr:function(e){return this.each(function(){x.removeAttr(this,e)})},prop:function(e,t){return x.access(this,x.prop,e,t,arguments.length>1)},removeProp:function(e){return e=x.propFix[e]||e,this.each(function(){try{this[e]=t,delete this[e]}catch(n){}})},addClass:function(e){var t,n,r,i,o,a=0,s=this.length,l="string"==typeof e&&e;if(x.isFunction(e))return this.each(function(t){x(this).addClass(e.call(this,t,this.className))});if(l)for(t=(e||"").match(T)||[];s>a;a++)if(n=this[a],r=1===n.nodeType&&(n.className?(" "+n.className+" ").replace(U," "):" ")){o=0;while(i=t[o++])0>r.indexOf(" "+i+" ")&&(r+=i+" ");n.className=x.trim(r)}return this},removeClass:function(e){var t,n,r,i,o,a=0,s=this.length,l=0===arguments.length||"string"==typeof e&&e;if(x.isFunction(e))return this.each(function(t){x(this).removeClass(e.call(this,t,this.className))});if(l)for(t=(e||"").match(T)||[];s>a;a++)if(n=this[a],r=1===n.nodeType&&(n.className?(" "+n.clas
 sName+" ").replace(U," "):"")){o=0;while(i=t[o++])while(r.indexOf(" "+i+" ")>=0)r=r.replace(" "+i+" "," ");n.className=e?x.trim(r):""}return this},toggleClass:function(e,t){var n=typeof e;return"boolean"==typeof t&&"string"===n?t?this.addClass(e):this.removeClass(e):x.isFunction(e)?this.each(function(n){x(this).toggleClass(e.call(this,n,this.className,t),t)}):this.each(function(){if("string"===n){var t,r=0,o=x(this),a=e.match(T)||[];while(t=a[r++])o.hasClass(t)?o.removeClass(t):o.addClass(t)}else(n===i||"boolean"===n)&&(this.className&&x._data(this,"__className__",this.className),this.className=this.className||e===!1?"":x._data(this,"__className__")||"")})},hasClass:function(e){var t=" "+e+" ",n=0,r=this.length;for(;r>n;n++)if(1===this[n].nodeType&&(" "+this[n].className+" ").replace(U," ").indexOf(t)>=0)return!0;return!1},val:function(e){var n,r,i,o=this[0];{if(arguments.length)return i=x.isFunction(e),this.each(function(n){var o;1===this.nodeType&&(o=i?e.call(this,n,x(this
 ).val()):e,null==o?o="":"number"==typeof o?o+="":x.isArray(o)&&(o=x.map(o,function(e){return null==e?"":e+""})),r=x.valHooks[this.type]||x.valHooks[this.nodeName.toLowerCase()],r&&"set"in r&&r.set(this,o,"value")!==t||(this.value=o))});if(o)return r=x.valHooks[o.type]||x.valHooks[o.nodeName.toLowerCase()],r&&"get"in r&&(n=r.get(o,"value"))!==t?n:(n=o.value,"string"==typeof n?n.replace(V,""):null==n?"":n)}}}),x.extend({valHooks:{option:{get:function(e){var t=x.find.attr(e,"value");return null!=t?t:e.text}},select:{get:function(e){var t,n,r=e.options,i=e.selectedIndex,o="select-one"===e.type||0>i,a=o?null:[],s=o?i+1:r.length,l=0>i?s:o?i:0;for(;s>l;l++)if(n=r[l],!(!n.selected&&l!==i||(x.support.optDisabled?n.disabled:null!==n.getAttribute("disabled"))||n.parentNode.disabled&&x.nodeName(n.parentNode,"optgroup"))){if(t=x(n).val(),o)return t;a.push(t)}return a},set:function(e,t){var n,r,i=e.options,o=x.makeArray(t),a=i.length;while(a--)r=i[a],(r.selected=x.inArray(x(r).val(),o)>=0
 )&&(n=!0);return n||(e.selectedIndex=-1),o}}},attr:function(e,n,r){var o,a,s=e.nodeType;if(e&&3!==s&&8!==s&&2!==s)return typeof e.getAttribute===i?x.prop(e,n,r):(1===s&&x.isXMLDoc(e)||(n=n.toLowerCase(),o=x.attrHooks[n]||(x.expr.match.bool.test(n)?X:z)),r===t?o&&"get"in o&&null!==(a=o.get(e,n))?a:(a=x.find.attr(e,n),null==a?t:a):null!==r?o&&"set"in o&&(a=o.set(e,r,n))!==t?a:(e.setAttribute(n,r+""),r):(x.removeAttr(e,n),t))},removeAttr:function(e,t){var n,r,i=0,o=t&&t.match(T);if(o&&1===e.nodeType)while(n=o[i++])r=x.propFix[n]||n,x.expr.match.bool.test(n)?K&&Q||!G.test(n)?e[r]=!1:e[x.camelCase("default-"+n)]=e[r]=!1:x.attr(e,n,""),e.removeAttribute(Q?n:r)},attrHooks:{type:{set:function(e,t){if(!x.support.radioValue&&"radio"===t&&x.nodeName(e,"input")){var n=e.value;return e.setAttribute("type",t),n&&(e.value=n),t}}}},propFix:{"for":"htmlFor","class":"className"},prop:function(e,n,r){var i,o,a,s=e.nodeType;if(e&&3!==s&&8!==s&&2!==s)return a=1!==s||!x.isXMLDoc(e),a&&(n=x.propFi
 x[n]||n,o=x.propHooks[n]),r!==t?o&&"set"in o&&(i=o.set(e,r,n))!==t?i:e[n]=r:o&&"get"in o&&null!==(i=o.get(e,n))?i:e[n]},propHooks:{tabIndex:{get:function(e){var t=x.find.attr(e,"tabindex");return t?parseInt(t,10):Y.test(e.nodeName)||J.test(e.nodeName)&&e.href?0:-1}}}}),X={set:function(e,t,n){return t===!1?x.removeAttr(e,n):K&&Q||!G.test(n)?e.setAttribute(!Q&&x.propFix[n]||n,n):e[x.camelCase("default-"+n)]=e[n]=!0,n}},x.each(x.expr.match.bool.source.match(/\w+/g),function(e,n){var r=x.expr.attrHandle[n]||x.find.attr;x.expr.attrHandle[n]=K&&Q||!G.test(n)?function(e,n,i){var o=x.expr.attrHandle[n],a=i?t:(x.expr.attrHandle[n]=t)!=r(e,n,i)?n.toLowerCase():null;return x.expr.attrHandle[n]=o,a}:function(e,n,r){return r?t:e[x.camelCase("default-"+n)]?n.toLowerCase():null}}),K&&Q||(x.attrHooks.value={set:function(e,n,r){return x.nodeName(e,"input")?(e.defaultValue=n,t):z&&z.set(e,n,r)}}),Q||(z={set:function(e,n,r){var i=e.getAttributeNode(r);return i||e.setAttributeNode(i=e.ownerDocu
 ment.createAttribute(r)),i.value=n+="","value"===r||n===e.getAttribute(r)?n:t}},x.expr.attrHandle.id=x.expr.attrHandle.name=x.expr.attrHandle.coords=function(e,n,r){var i;return r?t:(i=e.getAttributeNode(n))&&""!==i.value?i.value:null},x.valHooks.button={get:function(e,n){var r=e.getAttributeNode(n);return r&&r.specified?r.value:t},set:z.set},x.attrHooks.contenteditable={set:function(e,t,n){z.set(e,""===t?!1:t,n)}},x.each(["width","height"],function(e,n){x.attrHooks[n]={set:function(e,r){return""===r?(e.setAttribute(n,"auto"),r):t}}})),x.support.hrefNormalized||x.each(["href","src"],function(e,t){x.propHooks[t]={get:function(e){return e.getAttribute(t,4)}}}),x.support.style||(x.attrHooks.style={get:function(e){return e.style.cssText||t},set:function(e,t){return e.style.cssText=t+""}}),x.support.optSelected||(x.propHooks.selected={get:function(e){var t=e.parentNode;return t&&(t.selectedIndex,t.parentNode&&t.parentNode.selectedIndex),null}}),x.each(["tabIndex","readOnly","maxL
 ength","cellSpacing","cellPadding","rowSpan","colSpan","useMap","frameBorder","contentEditable"],function(){x.propFix[this.toLowerCase()]=this}),x.support.enctype||(x.propFix.enctype="encoding"),x.each(["radio","checkbox"],function(){x.valHooks[this]={set:function(e,n){return x.isArray(n)?e.checked=x.inArray(x(e).val(),n)>=0:t}},x.support.checkOn||(x.valHooks[this].get=function(e){return null===e.getAttribute("value")?"on":e.value})});var Z=/^(?:input|select|textarea)$/i,et=/^key/,tt=/^(?:mouse|contextmenu)|click/,nt=/^(?:focusinfocus|focusoutblur)$/,rt=/^([^.]*)(?:\.(.+)|)$/;function it(){return!0}function ot(){return!1}function at(){try{return a.activeElement}catch(e){}}x.event={global:{},add:function(e,n,r,o,a){var s,l,u,c,p,f,d,h,g,m,y,v=x._data(e);if(v){r.handler&&(c=r,r=c.handler,a=c.selector),r.guid||(r.guid=x.guid++),(l=v.events)||(l=v.events={}),(f=v.handle)||(f=v.handle=function(e){return typeof x===i||e&&x.event.triggered===e.type?t:x.event.dispatch.apply(f.elem,a
 rguments)},f.elem=e),n=(n||"").match(T)||[""],u=n.length;while(u--)s=rt.exec(n[u])||[],g=y=s[1],m=(s[2]||"").split(".").sort(),g&&(p=x.event.special[g]||{},g=(a?p.delegateType:p.bindType)||g,p=x.event.special[g]||{},d=x.extend({type:g,origType:y,data:o,handler:r,guid:r.guid,selector:a,needsContext:a&&x.expr.match.needsContext.test(a),namespace:m.join(".")},c),(h=l[g])||(h=l[g]=[],h.delegateCount=0,p.setup&&p.setup.call(e,o,m,f)!==!1||(e.addEventListener?e.addEventListener(g,f,!1):e.attachEvent&&e.attachEvent("on"+g,f))),p.add&&(p.add.call(e,d),d.handler.guid||(d.handler.guid=r.guid)),a?h.splice(h.delegateCount++,0,d):h.push(d),x.event.global[g]=!0);e=null}},remove:function(e,t,n,r,i){var o,a,s,l,u,c,p,f,d,h,g,m=x.hasData(e)&&x._data(e);if(m&&(c=m.events)){t=(t||"").match(T)||[""],u=t.length;while(u--)if(s=rt.exec(t[u])||[],d=g=s[1],h=(s[2]||"").split(".").sort(),d){p=x.event.special[d]||{},d=(r?p.delegateType:p.bindType)||d,f=c[d]||[],s=s[2]&&RegExp("(^|\\.)"+h.join("\\.(?:.
 *\\.|)")+"(\\.|$)"),l=o=f.length;while(o--)a=f[o],!i&&g!==a.origType||n&&n.guid!==a.guid||s&&!s.test(a.namespace)||r&&r!==a.selector&&("**"!==r||!a.selector)||(f.splice(o,1),a.selector&&f.delegateCount--,p.remove&&p.remove.call(e,a));l&&!f.length&&(p.teardown&&p.teardown.call(e,h,m.handle)!==!1||x.removeEvent(e,d,m.handle),delete c[d])}else for(d in c)x.event.remove(e,d+t[u],n,r,!0);x.isEmptyObject(c)&&(delete m.handle,x._removeData(e,"events"))}},trigger:function(n,r,i,o){var s,l,u,c,p,f,d,h=[i||a],g=v.call(n,"type")?n.type:n,m=v.call(n,"namespace")?n.namespace.split("."):[];if(u=f=i=i||a,3!==i.nodeType&&8!==i.nodeType&&!nt.test(g+x.event.triggered)&&(g.indexOf(".")>=0&&(m=g.split("."),g=m.shift(),m.sort()),l=0>g.indexOf(":")&&"on"+g,n=n[x.expando]?n:new x.Event(g,"object"==typeof n&&n),n.isTrigger=o?2:3,n.namespace=m.join("."),n.namespace_re=n.namespace?RegExp("(^|\\.)"+m.join("\\.(?:.*\\.|)")+"(\\.|$)"):null,n.result=t,n.target||(n.target=i),r=null==r?[n]:x.makeArray(r,[n
 ]),p=x.event.special[g]||{},o||!p.trigger||p.trigger.apply(i,r)!==!1)){if(!o&&!p.noBubble&&!x.isWindow(i)){for(c=p.delegateType||g,nt.test(c+g)||(u=u.parentNode);u;u=u.parentNode)h.push(u),f=u;f===(i.ownerDocument||a)&&h.push(f.defaultView||f.parentWindow||e)}d=0;while((u=h[d++])&&!n.isPropagationStopped())n.type=d>1?c:p.bindType||g,s=(x._data(u,"events")||{})[n.type]&&x._data(u,"handle"),s&&s.apply(u,r),s=l&&u[l],s&&x.acceptData(u)&&s.apply&&s.apply(u,r)===!1&&n.preventDefault();if(n.type=g,!o&&!n.isDefaultPrevented()&&(!p._default||p._default.apply(h.pop(),r)===!1)&&x.acceptData(i)&&l&&i[g]&&!x.isWindow(i)){f=i[l],f&&(i[l]=null),x.event.triggered=g;try{i[g]()}catch(y){}x.event.triggered=t,f&&(i[l]=f)}return n.result}},dispatch:function(e){e=x.event.fix(e);var n,r,i,o,a,s=[],l=g.call(arguments),u=(x._data(this,"events")||{})[e.type]||[],c=x.event.special[e.type]||{};if(l[0]=e,e.delegateTarget=this,!c.preDispatch||c.preDispatch.call(this,e)!==!1){s=x.event.handlers.call(this
 ,e,u),n=0;while((o=s[n++])&&!e.isPropagationStopped()){e.currentTarget=o.elem,a=0;while((i=o.handlers[a++])&&!e.isImmediatePropagationStopped())(!e.namespace_re||e.namespace_re.test(i.namespace))&&(e.handleObj=i,e.data=i.data,r=((x.event.special[i.origType]||{}).handle||i.handler).apply(o.elem,l),r!==t&&(e.result=r)===!1&&(e.preventDefault(),e.stopPropagation()))}return c.postDispatch&&c.postDispatch.call(this,e),e.result}},handlers:function(e,n){var r,i,o,a,s=[],l=n.delegateCount,u=e.target;if(l&&u.nodeType&&(!e.button||"click"!==e.type))for(;u!=this;u=u.parentNode||this)if(1===u.nodeType&&(u.disabled!==!0||"click"!==e.type)){for(o=[],a=0;l>a;a++)i=n[a],r=i.selector+" ",o[r]===t&&(o[r]=i.needsContext?x(r,this).index(u)>=0:x.find(r,this,null,[u]).length),o[r]&&o.push(i);o.length&&s.push({elem:u,handlers:o})}return n.length>l&&s.push({elem:this,handlers:n.slice(l)}),s},fix:function(e){if(e[x.expando])return e;var t,n,r,i=e.type,o=e,s=this.fixHooks[i];s||(this.fixHooks[i]=s=tt
 .test(i)?this.mouseHooks:et.test(i)?this.keyHooks:{}),r=s.props?this.props.concat(s.props):this.props,e=new x.Event(o),t=r.length;while(t--)n=r[t],e[n]=o[n];return e.target||(e.target=o.srcElement||a),3===e.target.nodeType&&(e.target=e.target.parentNode),e.metaKey=!!e.metaKey,s.filter?s.filter(e,o):e},props:"altKey bubbles cancelable ctrlKey currentTarget eventPhase metaKey relatedTarget shiftKey target timeStamp view which".split(" "),fixHooks:{},keyHooks:{props:"char charCode key keyCode".split(" "),filter:function(e,t){return null==e.which&&(e.which=null!=t.charCode?t.charCode:t.keyCode),e}},mouseHooks:{props:"button buttons clientX clientY fromElement offsetX offsetY pageX pageY screenX screenY toElement".split(" "),filter:function(e,n){var r,i,o,s=n.button,l=n.fromElement;return null==e.pageX&&null!=n.clientX&&(i=e.target.ownerDocument||a,o=i.documentElement,r=i.body,e.pageX=n.clientX+(o&&o.scrollLeft||r&&r.scrollLeft||0)-(o&&o.clientLeft||r&&r.clientLeft||0),e.pageY=n.
 clientY+(o&&o.scrollTop||r&&r.scrollTop||0)-(o&&o.clientTop||r&&r.clientTop||0)),!e.relatedTarget&&l&&(e.relatedTarget=l===e.target?n.toElement:l),e.which||s===t||(e.which=1&s?1:2&s?3:4&s?2:0),e}},special:{load:{noBubble:!0},focus:{trigger:function(){if(this!==at()&&this.focus)try{return this.focus(),!1}catch(e){}},delegateType:"focusin"},blur:{trigger:function(){return this===at()&&this.blur?(this.blur(),!1):t},delegateType:"focusout"},click:{trigger:function(){return x.nodeName(this,"input")&&"checkbox"===this.type&&this.click?(this.click(),!1):t},_default:function(e){return x.nodeName(e.target,"a")}},beforeunload:{postDispatch:function(e){e.result!==t&&(e.originalEvent.returnValue=e.result)}}},simulate:function(e,t,n,r){var i=x.extend(new x.Event,n,{type:e,isSimulated:!0,originalEvent:{}});r?x.event.trigger(i,null,t):x.event.dispatch.call(t,i),i.isDefaultPrevented()&&n.preventDefault()}},x.removeEvent=a.removeEventListener?function(e,t,n){e.removeEventListener&&e.removeEv
 entListener(t,n,!1)}:function(e,t,n){var r="on"+t;e.detachEvent&&(typeof e[r]===i&&(e[r]=null),e.detachEvent(r,n))},x.Event=function(e,n){return this instanceof x.Event?(e&&e.type?(this.originalEvent=e,this.type=e.type,this.isDefaultPrevented=e.defaultPrevented||e.returnValue===!1||e.getPreventDefault&&e.getPreventDefault()?it:ot):this.type=e,n&&x.extend(this,n),this.timeStamp=e&&e.timeStamp||x.now(),this[x.expando]=!0,t):new x.Event(e,n)},x.Event.prototype={isDefaultPrevented:ot,isPropagationStopped:ot,isImmediatePropagationStopped:ot,preventDefault:function(){var e=this.originalEvent;this.isDefaultPrevented=it,e&&(e.preventDefault?e.preventDefault():e.returnValue=!1)},stopPropagation:function(){var e=this.originalEvent;this.isPropagationStopped=it,e&&(e.stopPropagation&&e.stopPropagation(),e.cancelBubble=!0)},stopImmediatePropagation:function(){this.isImmediatePropagationStopped=it,this.stopPropagation()}},x.each({mouseenter:"mouseover",mouseleave:"mouseout"},function(e,t)
 {x.event.special[e]={delegateType:t,bindType:t,handle:function(e){var n,r=this,i=e.relatedTarget,o=e.handleObj;return(!i||i!==r&&!x.contains(r,i))&&(e.type=o.origType,n=o.handler.apply(this,arguments),e.type=t),n}}}),x.support.submitBubbles||(x.event.special.submit={setup:function(){return x.nodeName(this,"form")?!1:(x.event.add(this,"click._submit keypress._submit",function(e){var n=e.target,r=x.nodeName(n,"input")||x.nodeName(n,"button")?n.form:t;r&&!x._data(r,"submitBubbles")&&(x.event.add(r,"submit._submit",function(e){e._submit_bubble=!0}),x._data(r,"submitBubbles",!0))}),t)},postDispatch:function(e){e._submit_bubble&&(delete e._submit_bubble,this.parentNode&&!e.isTrigger&&x.event.simulate("submit",this.parentNode,e,!0))},teardown:function(){return x.nodeName(this,"form")?!1:(x.event.remove(this,"._submit"),t)}}),x.support.changeBubbles||(x.event.special.change={setup:function(){return Z.test(this.nodeName)?(("checkbox"===this.type||"radio"===this.type)&&(x.event.add(th
 is,"propertychange._change",function(e){"checked"===e.originalEvent.propertyName&&(this._just_changed=!0)}),x.event.add(this,"click._change",function(e){this._just_changed&&!e.isTrigger&&(this._just_changed=!1),x.event.simulate("change",this,e,!0)})),!1):(x.event.add(this,"beforeactivate._change",function(e){var t=e.target;Z.test(t.nodeName)&&!x._data(t,"changeBubbles")&&(x.event.add(t,"change._change",function(e){!this.parentNode||e.isSimulated||e.isTrigger||x.event.simulate("change",this.parentNode,e,!0)}),x._data(t,"changeBubbles",!0))}),t)},handle:function(e){var n=e.target;return this!==n||e.isSimulated||e.isTrigger||"radio"!==n.type&&"checkbox"!==n.type?e.handleObj.handler.apply(this,arguments):t},teardown:function(){return x.event.remove(this,"._change"),!Z.test(this.nodeName)}}),x.support.focusinBubbles||x.each({focus:"focusin",blur:"focusout"},function(e,t){var n=0,r=function(e){x.event.simulate(t,e.target,x.event.fix(e),!0)};x.event.special[t]={setup:function(){0==
 =n++&&a.addEventListener(e,r,!0)},teardown:function(){0===--n&&a.removeEventListener(e,r,!0)}}}),x.fn.extend({on:function(e,n,r,i,o){var a,s;if("object"==typeof e){"string"!=typeof n&&(r=r||n,n=t);for(a in e)this.on(a,n,r,e[a],o);return this}if(null==r&&null==i?(i=n,r=n=t):null==i&&("string"==typeof n?(i=r,r=t):(i=r,r=n,n=t)),i===!1)i=ot;else if(!i)return this;return 1===o&&(s=i,i=function(e){return x().off(e),s.apply(this,arguments)},i.guid=s.guid||(s.guid=x.guid++)),this.each(function(){x.event.add(this,e,i,r,n)})},one:function(e,t,n,r){return this.on(e,t,n,r,1)},off:function(e,n,r){var i,o;if(e&&e.preventDefault&&e.handleObj)return i=e.handleObj,x(e.delegateTarget).off(i.namespace?i.origType+"."+i.namespace:i.origType,i.selector,i.handler),this;if("object"==typeof e){for(o in e)this.off(o,n,e[o]);return this}return(n===!1||"function"==typeof n)&&(r=n,n=t),r===!1&&(r=ot),this.each(function(){x.event.remove(this,e,r,n)})},trigger:function(e,t){return this.each(function(){x.
 event.trigger(e,t,this)})},triggerHandler:function(e,n){var r=this[0];return r?x.event.trigger(e,n,r,!0):t}});var st=/^.[^:#\[\.,]*$/,lt=/^(?:parents|prev(?:Until|All))/,ut=x.expr.match.needsContext,ct={children:!0,contents:!0,next:!0,prev:!0};x.fn.extend({find:function(e){var t,n=[],r=this,i=r.length;if("string"!=typeof e)return this.pushStack(x(e).filter(function(){for(t=0;i>t;t++)if(x.contains(r[t],this))return!0}));for(t=0;i>t;t++)x.find(e,r[t],n);return n=this.pushStack(i>1?x.unique(n):n),n.selector=this.selector?this.selector+" "+e:e,n},has:function(e){var t,n=x(e,this),r=n.length;return this.filter(function(){for(t=0;r>t;t++)if(x.contains(this,n[t]))return!0})},not:function(e){return this.pushStack(ft(this,e||[],!0))},filter:function(e){return this.pushStack(ft(this,e||[],!1))},is:function(e){return!!ft(this,"string"==typeof e&&ut.test(e)?x(e):e||[],!1).length},closest:function(e,t){var n,r=0,i=this.length,o=[],a=ut.test(e)||"string"!=typeof e?x(e,t||this.context):0;f
 or(;i>r;r++)for(n=this[r];n&&n!==t;n=n.parentNode)if(11>n.nodeType&&(a?a.index(n)>-1:1===n.nodeType&&x.find.matchesSelector(n,e))){n=o.push(n);break}return this.pushStack(o.length>1?x.unique(o):o)},index:function(e){return e?"string"==typeof e?x.inArray(this[0],x(e)):x.inArray(e.jquery?e[0]:e,this):this[0]&&this[0].parentNode?this.first().prevAll().length:-1},add:function(e,t){var n="string"==typeof e?x(e,t):x.makeArray(e&&e.nodeType?[e]:e),r=x.merge(this.get(),n);return this.pushStack(x.unique(r))},addBack:function(e){return this.add(null==e?this.prevObject:this.prevObject.filter(e))}});function pt(e,t){do e=e[t];while(e&&1!==e.nodeType);return e}x.each({parent:function(e){var t=e.parentNode;return t&&11!==t.nodeType?t:null},parents:function(e){return x.dir(e,"parentNode")},parentsUntil:function(e,t,n){return x.dir(e,"parentNode",n)},next:function(e){return pt(e,"nextSibling")},prev:function(e){return pt(e,"previousSibling")},nextAll:function(e){return x.dir(e,"nextSibling"
 )},prevAll:function(e){return x.dir(e,"previousSibling")},nextUntil:function(e,t,n){return x.dir(e,"nextSibling",n)},prevUntil:function(e,t,n){return x.dir(e,"previousSibling",n)},siblings:function(e){return x.sibling((e.parentNode||{}).firstChild,e)},children:function(e){return x.sibling(e.firstChild)},contents:function(e){return x.nodeName(e,"iframe")?e.contentDocument||e.contentWindow.document:x.merge([],e.childNodes)}},function(e,t){x.fn[e]=function(n,r){var i=x.map(this,t,n);return"Until"!==e.slice(-5)&&(r=n),r&&"string"==typeof r&&(i=x.filter(r,i)),this.length>1&&(ct[e]||(i=x.unique(i)),lt.test(e)&&(i=i.reverse())),this.pushStack(i)}}),x.extend({filter:function(e,t,n){var r=t[0];return n&&(e=":not("+e+")"),1===t.length&&1===r.nodeType?x.find.matchesSelector(r,e)?[r]:[]:x.find.matches(e,x.grep(t,function(e){return 1===e.nodeType}))},dir:function(e,n,r){var i=[],o=e[n];while(o&&9!==o.nodeType&&(r===t||1!==o.nodeType||!x(o).is(r)))1===o.nodeType&&i.push(o),o=o[n];return i
 },sibling:function(e,t){var n=[];for(;e;e=e.nextSibling)1===e.nodeType&&e!==t&&n.push(e);return n}});function ft(e,t,n){if(x.isFunction(t))return x.grep(e,function(e,r){return!!t.call(e,r,e)!==n});if(t.nodeType)return x.grep(e,function(e){return e===t!==n});if("string"==typeof t){if(st.test(t))return x.filter(t,e,n);t=x.filter(t,e)}return x.grep(e,function(e){return x.inArray(e,t)>=0!==n})}function dt(e){var t=ht.split("|"),n=e.createDocumentFragment();if(n.createElement)while(t.length)n.createElement(t.pop());return n}var ht="abbr|article|aside|audio|bdi|canvas|data|datalist|details|figcaption|figure|footer|header|hgroup|mark|meter|nav|output|progress|section|summary|time|video",gt=/ jQuery\d+="(?:null|\d+)"/g,mt=RegExp("<(?:"+ht+")[\\s/>]","i"),yt=/^\s+/,vt=/<(?!area|br|col|embed|hr|img|input|link|meta|param)(([\w:]+)[^>]*)\/>/gi,bt=/<([\w:]+)/,xt=/<tbody/i,wt=/<|&#?\w+;/,Tt=/<(?:script|style|link)/i,Ct=/^(?:checkbox|radio)$/i,Nt=/checked\s*(?:[^=]|=\s*.checked.)/i,kt=/^$|
 \/(?:java|ecma)script/i,Et=/^true\/(.*)/,St=/^\s*<!(?:\[CDATA\[|--)|(?:\]\]|--)>\s*$/g,At={option:[1,"<select multiple='multiple'>","</select>"],legend:[1,"<fieldset>","</fieldset>"],area:[1,"<map>","</map>"],param:[1,"<object>","</object>"],thead:[1,"<table>","</table>"],tr:[2,"<table><tbody>","</tbody></table>"],col:[2,"<table><tbody></tbody><colgroup>","</colgroup></table>"],td:[3,"<table><tbody><tr>","</tr></tbody></table>"],_default:x.support.htmlSerialize?[0,"",""]:[1,"X<div>","</div>"]},jt=dt(a),Dt=jt.appendChild(a.createElement("div"));At.optgroup=At.option,At.tbody=At.tfoot=At.colgroup=At.caption=At.thead,At.th=At.td,x.fn.extend({text:function(e){return x.access(this,function(e){return e===t?x.text(this):this.empty().append((this[0]&&this[0].ownerDocument||a).createTextNode(e))},null,e,arguments.length)},append:function(){return this.domManip(arguments,function(e){if(1===this.nodeType||11===this.nodeType||9===this.nodeType){var t=Lt(this,e);t.appendChild(e)}})},prep
 end:function(){return this.domManip(arguments,function(e){if(1===this.nodeType||11===this.nodeType||9===this.nodeType){var t=Lt(this,e);t.insertBefore(e,t.firstChild)}})},before:function(){return this.domManip(arguments,function(e){this.parentNode&&this.parentNode.insertBefore(e,this)})},after:function(){return this.domManip(arguments,function(e){this.parentNode&&this.parentNode.insertBefore(e,this.nextSibling)})},remove:function(e,t){var n,r=e?x.filter(e,this):this,i=0;for(;null!=(n=r[i]);i++)t||1!==n.nodeType||x.cleanData(Ft(n)),n.parentNode&&(t&&x.contains(n.ownerDocument,n)&&_t(Ft(n,"script")),n.parentNode.removeChild(n));return this},empty:function(){var e,t=0;for(;null!=(e=this[t]);t++){1===e.nodeType&&x.cleanData(Ft(e,!1));while(e.firstChild)e.removeChild(e.firstChild);e.options&&x.nodeName(e,"select")&&(e.options.length=0)}return this},clone:function(e,t){return e=null==e?!1:e,t=null==t?e:t,this.map(function(){return x.clone(this,e,t)})},html:function(e){return x.acc
 ess(this,function(e){var n=this[0]||{},r=0,i=this.length;if(e===t)return 1===n.nodeType?n.innerHTML.replace(gt,""):t;if(!("string"!=typeof e||Tt.test(e)||!x.support.htmlSerialize&&mt.test(e)||!x.support.leadingWhitespace&&yt.test(e)||At[(bt.exec(e)||["",""])[1].toLowerCase()])){e=e.replace(vt,"<$1></$2>");try{for(;i>r;r++)n=this[r]||{},1===n.nodeType&&(x.cleanData(Ft(n,!1)),n.innerHTML=e);n=0}catch(o){}}n&&this.empty().append(e)},null,e,arguments.length)},replaceWith:function(){var e=x.map(this,function(e){return[e.nextSibling,e.parentNode]}),t=0;return this.domManip(arguments,function(n){var r=e[t++],i=e[t++];i&&(r&&r.parentNode!==i&&(r=this.nextSibling),x(this).remove(),i.insertBefore(n,r))},!0),t?this:this.remove()},detach:function(e){return this.remove(e,!0)},domManip:function(e,t,n){e=d.apply([],e);var r,i,o,a,s,l,u=0,c=this.length,p=this,f=c-1,h=e[0],g=x.isFunction(h);if(g||!(1>=c||"string"!=typeof h||x.support.checkClone)&&Nt.test(h))return this.each(function(r){var i
 =p.eq(r);g&&(e[0]=h.call(this,r,i.html())),i.domManip(e,t,n)});if(c&&(l=x.buildFragment(e,this[0].ownerDocument,!1,!n&&this),r=l.firstChild,1===l.childNodes.length&&(l=r),r)){for(a=x.map(Ft(l,"script"),Ht),o=a.length;c>u;u++)i=l,u!==f&&(i=x.clone(i,!0,!0),o&&x.merge(a,Ft(i,"script"))),t.call(this[u],i,u);if(o)for(s=a[a.length-1].ownerDocument,x.map(a,qt),u=0;o>u;u++)i=a[u],kt.test(i.type||"")&&!x._data(i,"globalEval")&&x.contains(s,i)&&(i.src?x._evalUrl(i.src):x.globalEval((i.text||i.textContent||i.innerHTML||"").replace(St,"")));l=r=null}return this}});function Lt(e,t){return x.nodeName(e,"table")&&x.nodeName(1===t.nodeType?t:t.firstChild,"tr")?e.getElementsByTagName("tbody")[0]||e.appendChild(e.ownerDocument.createElement("tbody")):e}function Ht(e){return e.type=(null!==x.find.attr(e,"type"))+"/"+e.type,e}function qt(e){var t=Et.exec(e.type);return t?e.type=t[1]:e.removeAttribute("type"),e}function _t(e,t){var n,r=0;for(;null!=(n=e[r]);r++)x._data(n,"globalEval",!t||x._dat
 a(t[r],"globalEval"))}function Mt(e,t){if(1===t.nodeType&&x.hasData(e)){var n,r,i,o=x._data(e),a=x._data(t,o),s=o.events;if(s){delete a.handle,a.events={};for(n in s)for(r=0,i=s[n].length;i>r;r++)x.event.add(t,n,s[n][r])}a.data&&(a.data=x.extend({},a.data))}}function Ot(e,t){var n,r,i;if(1===t.nodeType){if(n=t.nodeName.toLowerCase(),!x.support.noCloneEvent&&t[x.expando]){i=x._data(t);for(r in i.events)x.removeEvent(t,r,i.handle);t.removeAttribute(x.expando)}"script"===n&&t.text!==e.text?(Ht(t).text=e.text,qt(t)):"object"===n?(t.parentNode&&(t.outerHTML=e.outerHTML),x.support.html5Clone&&e.innerHTML&&!x.trim(t.innerHTML)&&(t.innerHTML=e.innerHTML)):"input"===n&&Ct.test(e.type)?(t.defaultChecked=t.checked=e.checked,t.value!==e.value&&(t.value=e.value)):"option"===n?t.defaultSelected=t.selected=e.defaultSelected:("input"===n||"textarea"===n)&&(t.defaultValue=e.defaultValue)}}x.each({appendTo:"append",prependTo:"prepend",insertBefore:"before",insertAfter:"after",replaceAll:"repl
 aceWith"},function(e,t){x.fn[e]=function(e){var n,r=0,i=[],o=x(e),a=o.length-1;for(;a>=r;r++)n=r===a?this:this.clone(!0),x(o[r])[t](n),h.apply(i,n.get());return this.pushStack(i)}});function Ft(e,n){var r,o,a=0,s=typeof e.getElementsByTagName!==i?e.getElementsByTagName(n||"*"):typeof e.querySelectorAll!==i?e.querySelectorAll(n||"*"):t;if(!s)for(s=[],r=e.childNodes||e;null!=(o=r[a]);a++)!n||x.nodeName(o,n)?s.push(o):x.merge(s,Ft(o,n));return n===t||n&&x.nodeName(e,n)?x.merge([e],s):s}function Bt(e){Ct.test(e.type)&&(e.defaultChecked=e.checked)}x.extend({clone:function(e,t,n){var r,i,o,a,s,l=x.contains(e.ownerDocument,e);if(x.support.html5Clone||x.isXMLDoc(e)||!mt.test("<"+e.nodeName+">")?o=e.cloneNode(!0):(Dt.innerHTML=e.outerHTML,Dt.removeChild(o=Dt.firstChild)),!(x.support.noCloneEvent&&x.support.noCloneChecked||1!==e.nodeType&&11!==e.nodeType||x.isXMLDoc(e)))for(r=Ft(o),s=Ft(e),a=0;null!=(i=s[a]);++a)r[a]&&Ot(i,r[a]);if(t)if(n)for(s=s||Ft(e),r=r||Ft(o),a=0;null!=(i=s[a]);a
 ++)Mt(i,r[a]);else Mt(e,o);return r=Ft(o,"script"),r.length>0&&_t(r,!l&&Ft(e,"script")),r=s=i=null,o},buildFragment:function(e,t,n,r){var i,o,a,s,l,u,c,p=e.length,f=dt(t),d=[],h=0;for(;p>h;h++)if(o=e[h],o||0===o)if("object"===x.type(o))x.merge(d,o.nodeType?[o]:o);else if(wt.test(o)){s=s||f.appendChild(t.createElement("div")),l=(bt.exec(o)||["",""])[1].toLowerCase(),c=At[l]||At._default,s.innerHTML=c[1]+o.replace(vt,"<$1></$2>")+c[2],i=c[0];while(i--)s=s.lastChild;if(!x.support.leadingWhitespace&&yt.test(o)&&d.push(t.createTextNode(yt.exec(o)[0])),!x.support.tbody){o="table"!==l||xt.test(o)?"<table>"!==c[1]||xt.test(o)?0:s:s.firstChild,i=o&&o.childNodes.length;while(i--)x.nodeName(u=o.childNodes[i],"tbody")&&!u.childNodes.length&&o.removeChild(u)}x.merge(d,s.childNodes),s.textContent="";while(s.firstChild)s.removeChild(s.firstChild);s=f.lastChild}else d.push(t.createTextNode(o));s&&f.removeChild(s),x.support.appendChecked||x.grep(Ft(d,"input"),Bt),h=0;while(o=d[h++])if((!r||-
 1===x.inArray(o,r))&&(a=x.contains(o.ownerDocument,o),s=Ft(f.appendChild(o),"script"),a&&_t(s),n)){i=0;while(o=s[i++])kt.test(o.type||"")&&n.push(o)}return s=null,f},cleanData:function(e,t){var n,r,o,a,s=0,l=x.expando,u=x.cache,c=x.support.deleteExpando,f=x.event.special;for(;null!=(n=e[s]);s++)if((t||x.acceptData(n))&&(o=n[l],a=o&&u[o])){if(a.events)for(r in a.events)f[r]?x.event.remove(n,r):x.removeEvent(n,r,a.handle);
+u[o]&&(delete u[o],c?delete n[l]:typeof n.removeAttribute!==i?n.removeAttribute(l):n[l]=null,p.push(o))}},_evalUrl:function(e){return x.ajax({url:e,type:"GET",dataType:"script",async:!1,global:!1,"throws":!0})}}),x.fn.extend({wrapAll:function(e){if(x.isFunction(e))return this.each(function(t){x(this).wrapAll(e.call(this,t))});if(this[0]){var t=x(e,this[0].ownerDocument).eq(0).clone(!0);this[0].parentNode&&t.insertBefore(this[0]),t.map(function(){var e=this;while(e.firstChild&&1===e.firstChild.nodeType)e=e.firstChild;return e}).append(this)}return this},wrapInner:function(e){return x.isFunction(e)?this.each(function(t){x(this).wrapInner(e.call(this,t))}):this.each(function(){var t=x(this),n=t.contents();n.length?n.wrapAll(e):t.append(e)})},wrap:function(e){var t=x.isFunction(e);return this.each(function(n){x(this).wrapAll(t?e.call(this,n):e)})},unwrap:function(){return this.parent().each(function(){x.nodeName(this,"body")||x(this).replaceWith(this.childNodes)}).end()}});var P
 t,Rt,Wt,$t=/alpha\([^)]*\)/i,It=/opacity\s*=\s*([^)]*)/,zt=/^(top|right|bottom|left)$/,Xt=/^(none|table(?!-c[ea]).+)/,Ut=/^margin/,Vt=RegExp("^("+w+")(.*)$","i"),Yt=RegExp("^("+w+")(?!px)[a-z%]+$","i"),Jt=RegExp("^([+-])=("+w+")","i"),Gt={BODY:"block"},Qt={position:"absolute",visibility:"hidden",display:"block"},Kt={letterSpacing:0,fontWeight:400},Zt=["Top","Right","Bottom","Left"],en=["Webkit","O","Moz","ms"];function tn(e,t){if(t in e)return t;var n=t.charAt(0).toUpperCase()+t.slice(1),r=t,i=en.length;while(i--)if(t=en[i]+n,t in e)return t;return r}function nn(e,t){return e=t||e,"none"===x.css(e,"display")||!x.contains(e.ownerDocument,e)}function rn(e,t){var n,r,i,o=[],a=0,s=e.length;for(;s>a;a++)r=e[a],r.style&&(o[a]=x._data(r,"olddisplay"),n=r.style.display,t?(o[a]||"none"!==n||(r.style.display=""),""===r.style.display&&nn(r)&&(o[a]=x._data(r,"olddisplay",ln(r.nodeName)))):o[a]||(i=nn(r),(n&&"none"!==n||!i)&&x._data(r,"olddisplay",i?n:x.css(r,"display"))));for(a=0;s>a;a+
 +)r=e[a],r.style&&(t&&"none"!==r.style.display&&""!==r.style.display||(r.style.display=t?o[a]||"":"none"));return e}x.fn.extend({css:function(e,n){return x.access(this,function(e,n,r){var i,o,a={},s=0;if(x.isArray(n)){for(o=Rt(e),i=n.length;i>s;s++)a[n[s]]=x.css(e,n[s],!1,o);return a}return r!==t?x.style(e,n,r):x.css(e,n)},e,n,arguments.length>1)},show:function(){return rn(this,!0)},hide:function(){return rn(this)},toggle:function(e){return"boolean"==typeof e?e?this.show():this.hide():this.each(function(){nn(this)?x(this).show():x(this).hide()})}}),x.extend({cssHooks:{opacity:{get:function(e,t){if(t){var n=Wt(e,"opacity");return""===n?"1":n}}}},cssNumber:{columnCount:!0,fillOpacity:!0,fontWeight:!0,lineHeight:!0,opacity:!0,order:!0,orphans:!0,widows:!0,zIndex:!0,zoom:!0},cssProps:{"float":x.support.cssFloat?"cssFloat":"styleFloat"},style:function(e,n,r,i){if(e&&3!==e.nodeType&&8!==e.nodeType&&e.style){var o,a,s,l=x.camelCase(n),u=e.style;if(n=x.cssProps[l]||(x.cssProps[l]=tn
 (u,l)),s=x.cssHooks[n]||x.cssHooks[l],r===t)return s&&"get"in s&&(o=s.get(e,!1,i))!==t?o:u[n];if(a=typeof r,"string"===a&&(o=Jt.exec(r))&&(r=(o[1]+1)*o[2]+parseFloat(x.css(e,n)),a="number"),!(null==r||"number"===a&&isNaN(r)||("number"!==a||x.cssNumber[l]||(r+="px"),x.support.clearCloneStyle||""!==r||0!==n.indexOf("background")||(u[n]="inherit"),s&&"set"in s&&(r=s.set(e,r,i))===t)))try{u[n]=r}catch(c){}}},css:function(e,n,r,i){var o,a,s,l=x.camelCase(n);return n=x.cssProps[l]||(x.cssProps[l]=tn(e.style,l)),s=x.cssHooks[n]||x.cssHooks[l],s&&"get"in s&&(a=s.get(e,!0,r)),a===t&&(a=Wt(e,n,i)),"normal"===a&&n in Kt&&(a=Kt[n]),""===r||r?(o=parseFloat(a),r===!0||x.isNumeric(o)?o||0:a):a}}),e.getComputedStyle?(Rt=function(t){return e.getComputedStyle(t,null)},Wt=function(e,n,r){var i,o,a,s=r||Rt(e),l=s?s.getPropertyValue(n)||s[n]:t,u=e.style;return s&&(""!==l||x.contains(e.ownerDocument,e)||(l=x.style(e,n)),Yt.test(l)&&Ut.test(n)&&(i=u.width,o=u.minWidth,a=u.maxWidth,u.minWidth=u.max
 Width=u.width=l,l=s.width,u.width=i,u.minWidth=o,u.maxWidth=a)),l}):a.documentElement.currentStyle&&(Rt=function(e){return e.currentStyle},Wt=function(e,n,r){var i,o,a,s=r||Rt(e),l=s?s[n]:t,u=e.style;return null==l&&u&&u[n]&&(l=u[n]),Yt.test(l)&&!zt.test(n)&&(i=u.left,o=e.runtimeStyle,a=o&&o.left,a&&(o.left=e.currentStyle.left),u.left="fontSize"===n?"1em":l,l=u.pixelLeft+"px",u.left=i,a&&(o.left=a)),""===l?"auto":l});function on(e,t,n){var r=Vt.exec(t);return r?Math.max(0,r[1]-(n||0))+(r[2]||"px"):t}function an(e,t,n,r,i){var o=n===(r?"border":"content")?4:"width"===t?1:0,a=0;for(;4>o;o+=2)"margin"===n&&(a+=x.css(e,n+Zt[o],!0,i)),r?("content"===n&&(a-=x.css(e,"padding"+Zt[o],!0,i)),"margin"!==n&&(a-=x.css(e,"border"+Zt[o]+"Width",!0,i))):(a+=x.css(e,"padding"+Zt[o],!0,i),"padding"!==n&&(a+=x.css(e,"border"+Zt[o]+"Width",!0,i)));return a}function sn(e,t,n){var r=!0,i="width"===t?e.offsetWidth:e.offsetHeight,o=Rt(e),a=x.support.boxSizing&&"border-box"===x.css(e,"boxSizing",!1,
 o);if(0>=i||null==i){if(i=Wt(e,t,o),(0>i||null==i)&&(i=e.style[t]),Yt.test(i))return i;r=a&&(x.support.boxSizingReliable||i===e.style[t]),i=parseFloat(i)||0}return i+an(e,t,n||(a?"border":"content"),r,o)+"px"}function ln(e){var t=a,n=Gt[e];return n||(n=un(e,t),"none"!==n&&n||(Pt=(Pt||x("<iframe frameborder='0' width='0' height='0'/>").css("cssText","display:block !important")).appendTo(t.documentElement),t=(Pt[0].contentWindow||Pt[0].contentDocument).document,t.write("<!doctype html><html><body>"),t.close(),n=un(e,t),Pt.detach()),Gt[e]=n),n}function un(e,t){var n=x(t.createElement(e)).appendTo(t.body),r=x.css(n[0],"display");return n.remove(),r}x.each(["height","width"],function(e,n){x.cssHooks[n]={get:function(e,r,i){return r?0===e.offsetWidth&&Xt.test(x.css(e,"display"))?x.swap(e,Qt,function(){return sn(e,n,i)}):sn(e,n,i):t},set:function(e,t,r){var i=r&&Rt(e);return on(e,t,r?an(e,n,r,x.support.boxSizing&&"border-box"===x.css(e,"boxSizing",!1,i),i):0)}}}),x.support.opacity|
 |(x.cssHooks.opacity={get:function(e,t){return It.test((t&&e.currentStyle?e.currentStyle.filter:e.style.filter)||"")?.01*parseFloat(RegExp.$1)+"":t?"1":""},set:function(e,t){var n=e.style,r=e.currentStyle,i=x.isNumeric(t)?"alpha(opacity="+100*t+")":"",o=r&&r.filter||n.filter||"";n.zoom=1,(t>=1||""===t)&&""===x.trim(o.replace($t,""))&&n.removeAttribute&&(n.removeAttribute("filter"),""===t||r&&!r.filter)||(n.filter=$t.test(o)?o.replace($t,i):o+" "+i)}}),x(function(){x.support.reliableMarginRight||(x.cssHooks.marginRight={get:function(e,n){return n?x.swap(e,{display:"inline-block"},Wt,[e,"marginRight"]):t}}),!x.support.pixelPosition&&x.fn.position&&x.each(["top","left"],function(e,n){x.cssHooks[n]={get:function(e,r){return r?(r=Wt(e,n),Yt.test(r)?x(e).position()[n]+"px":r):t}}})}),x.expr&&x.expr.filters&&(x.expr.filters.hidden=function(e){return 0>=e.offsetWidth&&0>=e.offsetHeight||!x.support.reliableHiddenOffsets&&"none"===(e.style&&e.style.display||x.css(e,"display"))},x.expr
 .filters.visible=function(e){return!x.expr.filters.hidden(e)}),x.each({margin:"",padding:"",border:"Width"},function(e,t){x.cssHooks[e+t]={expand:function(n){var r=0,i={},o="string"==typeof n?n.split(" "):[n];for(;4>r;r++)i[e+Zt[r]+t]=o[r]||o[r-2]||o[0];return i}},Ut.test(e)||(x.cssHooks[e+t].set=on)});var cn=/%20/g,pn=/\[\]$/,fn=/\r?\n/g,dn=/^(?:submit|button|image|reset|file)$/i,hn=/^(?:input|select|textarea|keygen)/i;x.fn.extend({serialize:function(){return x.param(this.serializeArray())},serializeArray:function(){return this.map(function(){var e=x.prop(this,"elements");return e?x.makeArray(e):this}).filter(function(){var e=this.type;return this.name&&!x(this).is(":disabled")&&hn.test(this.nodeName)&&!dn.test(e)&&(this.checked||!Ct.test(e))}).map(function(e,t){var n=x(this).val();return null==n?null:x.isArray(n)?x.map(n,function(e){return{name:t.name,value:e.replace(fn,"\r\n")}}):{name:t.name,value:n.replace(fn,"\r\n")}}).get()}}),x.param=function(e,n){var r,i=[],o=functi
 on(e,t){t=x.isFunction(t)?t():null==t?"":t,i[i.length]=encodeURIComponent(e)+"="+encodeURIComponent(t)};if(n===t&&(n=x.ajaxSettings&&x.ajaxSettings.traditional),x.isArray(e)||e.jquery&&!x.isPlainObject(e))x.each(e,function(){o(this.name,this.value)});else for(r in e)gn(r,e[r],n,o);return i.join("&").replace(cn,"+")};function gn(e,t,n,r){var i;if(x.isArray(t))x.each(t,function(t,i){n||pn.test(e)?r(e,i):gn(e+"["+("object"==typeof i?t:"")+"]",i,n,r)});else if(n||"object"!==x.type(t))r(e,t);else for(i in t)gn(e+"["+i+"]",t[i],n,r)}x.each("blur focus focusin focusout load resize scroll unload click dblclick mousedown mouseup mousemove mouseover mouseout mouseenter mouseleave change select submit keydown keypress keyup error contextmenu".split(" "),function(e,t){x.fn[t]=function(e,n){return arguments.length>0?this.on(t,null,e,n):this.trigger(t)}}),x.fn.extend({hover:function(e,t){return this.mouseenter(e).mouseleave(t||e)},bind:function(e,t,n){return this.on(e,null,t,n)},unbind:fu
 nction(e,t){return this.off(e,null,t)},delegate:function(e,t,n,r){return this.on(t,e,n,r)},undelegate:function(e,t,n){return 1===arguments.length?this.off(e,"**"):this.off(t,e||"**",n)}});var mn,yn,vn=x.now(),bn=/\?/,xn=/#.*$/,wn=/([?&])_=[^&]*/,Tn=/^(.*?):[ \t]*([^\r\n]*)\r?$/gm,Cn=/^(?:about|app|app-storage|.+-extension|file|res|widget):$/,Nn=/^(?:GET|HEAD)$/,kn=/^\/\//,En=/^([\w.+-]+:)(?:\/\/([^\/?#:]*)(?::(\d+)|)|)/,Sn=x.fn.load,An={},jn={},Dn="*/".concat("*");try{yn=o.href}catch(Ln){yn=a.createElement("a"),yn.href="",yn=yn.href}mn=En.exec(yn.toLowerCase())||[];function Hn(e){return function(t,n){"string"!=typeof t&&(n=t,t="*");var r,i=0,o=t.toLowerCase().match(T)||[];if(x.isFunction(n))while(r=o[i++])"+"===r[0]?(r=r.slice(1)||"*",(e[r]=e[r]||[]).unshift(n)):(e[r]=e[r]||[]).push(n)}}function qn(e,n,r,i){var o={},a=e===jn;function s(l){var u;return o[l]=!0,x.each(e[l]||[],function(e,l){var c=l(n,r,i);return"string"!=typeof c||a||o[c]?a?!(u=c):t:(n.dataTypes.unshift(c),s(c
 ),!1)}),u}return s(n.dataTypes[0])||!o["*"]&&s("*")}function _n(e,n){var r,i,o=x.ajaxSettings.flatOptions||{};for(i in n)n[i]!==t&&((o[i]?e:r||(r={}))[i]=n[i]);return r&&x.extend(!0,e,r),e}x.fn.load=function(e,n,r){if("string"!=typeof e&&Sn)return Sn.apply(this,arguments);var i,o,a,s=this,l=e.indexOf(" ");return l>=0&&(i=e.slice(l,e.length),e=e.slice(0,l)),x.isFunction(n)?(r=n,n=t):n&&"object"==typeof n&&(a="POST"),s.length>0&&x.ajax({url:e,type:a,dataType:"html",data:n}).done(function(e){o=arguments,s.html(i?x("<div>").append(x.parseHTML(e)).find(i):e)}).complete(r&&function(e,t){s.each(r,o||[e.responseText,t,e])}),this},x.each(["ajaxStart","ajaxStop","ajaxComplete","ajaxError","ajaxSuccess","ajaxSend"],function(e,t){x.fn[t]=function(e){return this.on(t,e)}}),x.extend({active:0,lastModified:{},etag:{},ajaxSettings:{url:yn,type:"GET",isLocal:Cn.test(mn[1]),global:!0,processData:!0,async:!0,contentType:"application/x-www-form-urlencoded; charset=UTF-8",accepts:{"*":Dn,text:"t
 ext/plain",html:"text/html",xml:"application/xml, text/xml",json:"application/json, text/javascript"},contents:{xml:/xml/,html:/html/,json:/json/},responseFields:{xml:"responseXML",text:"responseText",json:"responseJSON"},converters:{"* text":String,"text html":!0,"text json":x.parseJSON,"text xml":x.parseXML},flatOptions:{url:!0,context:!0}},ajaxSetup:function(e,t){return t?_n(_n(e,x.ajaxSettings),t):_n(x.ajaxSettings,e)},ajaxPrefilter:Hn(An),ajaxTransport:Hn(jn),ajax:function(e,n){"object"==typeof e&&(n=e,e=t),n=n||{};var r,i,o,a,s,l,u,c,p=x.ajaxSetup({},n),f=p.context||p,d=p.context&&(f.nodeType||f.jquery)?x(f):x.event,h=x.Deferred(),g=x.Callbacks("once memory"),m=p.statusCode||{},y={},v={},b=0,w="canceled",C={readyState:0,getResponseHeader:function(e){var t;if(2===b){if(!c){c={};while(t=Tn.exec(a))c[t[1].toLowerCase()]=t[2]}t=c[e.toLowerCase()]}return null==t?null:t},getAllResponseHeaders:function(){return 2===b?a:null},setRequestHeader:function(e,t){var n=e.toLowerCase(
 );return b||(e=v[n]=v[n]||e,y[e]=t),this},overrideMimeType:function(e){return b||(p.mimeType=e),this},statusCode:function(e){var t;if(e)if(2>b)for(t in e)m[t]=[m[t],e[t]];else C.always(e[C.status]);return this},abort:function(e){var t=e||w;return u&&u.abort(t),k(0,t),this}};if(h.promise(C).complete=g.add,C.success=C.done,C.error=C.fail,p.url=((e||p.url||yn)+"").replace(xn,"").replace(kn,mn[1]+"//"),p.type=n.method||n.type||p.method||p.type,p.dataTypes=x.trim(p.dataType||"*").toLowerCase().match(T)||[""],null==p.crossDomain&&(r=En.exec(p.url.toLowerCase()),p.crossDomain=!(!r||r[1]===mn[1]&&r[2]===mn[2]&&(r[3]||("http:"===r[1]?"80":"443"))===(mn[3]||("http:"===mn[1]?"80":"443")))),p.data&&p.processData&&"string"!=typeof p.data&&(p.data=x.param(p.data,p.traditional)),qn(An,p,n,C),2===b)return C;l=p.global,l&&0===x.active++&&x.event.trigger("ajaxStart"),p.type=p.type.toUpperCase(),p.hasContent=!Nn.test(p.type),o=p.url,p.hasContent||(p.data&&(o=p.url+=(bn.test(o)?"&":"?")+p.data,
 delete p.data),p.cache===!1&&(p.url=wn.test(o)?o.replace(wn,"$1_="+vn++):o+(bn.test(o)?"&":"?")+"_="+vn++)),p.ifModified&&(x.lastModified[o]&&C.setRequestHeader("If-Modified-Since",x.lastModified[o]),x.etag[o]&&C.setRequestHeader("If-None-Match",x.etag[o])),(p.data&&p.hasContent&&p.contentType!==!1||n.contentType)&&C.setRequestHeader("Content-Type",p.contentType),C.setRequestHeader("Accept",p.dataTypes[0]&&p.accepts[p.dataTypes[0]]?p.accepts[p.dataTypes[0]]+("*"!==p.dataTypes[0]?", "+Dn+"; q=0.01":""):p.accepts["*"]);for(i in p.headers)C.setRequestHeader(i,p.headers[i]);if(p.beforeSend&&(p.beforeSend.call(f,C,p)===!1||2===b))return C.abort();w="abort";for(i in{success:1,error:1,complete:1})C[i](p[i]);if(u=qn(jn,p,n,C)){C.readyState=1,l&&d.trigger("ajaxSend",[C,p]),p.async&&p.timeout>0&&(s=setTimeout(function(){C.abort("timeout")},p.timeout));try{b=1,u.send(y,k)}catch(N){if(!(2>b))throw N;k(-1,N)}}else k(-1,"No Transport");function k(e,n,r,i){var c,y,v,w,T,N=n;2!==b&&(b=2,s&&
 clearTimeout(s),u=t,a=i||"",C.readyState=e>0?4:0,c=e>=200&&300>e||304===e,r&&(w=Mn(p,C,r)),w=On(p,w,C,c),c?(p.ifModified&&(T=C.getResponseHeader("Last-Modified"),T&&(x.lastModified[o]=T),T=C.getResponseHeader("etag"),T&&(x.etag[o]=T)),204===e||"HEAD"===p.type?N="nocontent":304===e?N="notmodified":(N=w.state,y=w.data,v=w.error,c=!v)):(v=N,(e||!N)&&(N="error",0>e&&(e=0))),C.status=e,C.statusText=(n||N)+"",c?h.resolveWith(f,[y,N,C]):h.rejectWith(f,[C,N,v]),C.statusCode(m),m=t,l&&d.trigger(c?"ajaxSuccess":"ajaxError",[C,p,c?y:v]),g.fireWith(f,[C,N]),l&&(d.trigger("ajaxComplete",[C,p]),--x.active||x.event.trigger("ajaxStop")))}return C},getJSON:function(e,t,n){return x.get(e,t,n,"json")},getScript:function(e,n){return x.get(e,t,n,"script")}}),x.each(["get","post"],function(e,n){x[n]=function(e,r,i,o){return x.isFunction(r)&&(o=o||i,i=r,r=t),x.ajax({url:e,type:n,dataType:o,data:r,success:i})}});function Mn(e,n,r){var i,o,a,s,l=e.contents,u=e.dataTypes;while("*"===u[0])u.shift(),o=
 ==t&&(o=e.mimeType||n.getResponseHeader("Content-Type"));if(o)for(s in l)if(l[s]&&l[s].test(o)){u.unshift(s);break}if(u[0]in r)a=u[0];else{for(s in r){if(!u[0]||e.converters[s+" "+u[0]]){a=s;break}i||(i=s)}a=a||i}return a?(a!==u[0]&&u.unshift(a),r[a]):t}function On(e,t,n,r){var i,o,a,s,l,u={},c=e.dataTypes.slice();if(c[1])for(a in e.converters)u[a.toLowerCase()]=e.converters[a];o=c.shift();while(o)if(e.responseFields[o]&&(n[e.responseFields[o]]=t),!l&&r&&e.dataFilter&&(t=e.dataFilter(t,e.dataType)),l=o,o=c.shift())if("*"===o)o=l;else if("*"!==l&&l!==o){if(a=u[l+" "+o]||u["* "+o],!a)for(i in u)if(s=i.split(" "),s[1]===o&&(a=u[l+" "+s[0]]||u["* "+s[0]])){a===!0?a=u[i]:u[i]!==!0&&(o=s[0],c.unshift(s[1]));break}if(a!==!0)if(a&&e["throws"])t=a(t);else try{t=a(t)}catch(p){return{state:"parsererror",error:a?p:"No conversion from "+l+" to "+o}}}return{state:"success",data:t}}x.ajaxSetup({accepts:{script:"text/javascript, application/javascript, application/ecmascript, application/x-
 ecmascript"},contents:{script:/(?:java|ecma)script/},converters:{"text script":function(e){return x.globalEval(e),e}}}),x.ajaxPrefilter("script",function(e){e.cache===t&&(e.cache=!1),e.crossDomain&&(e.type="GET",e.global=!1)}),x.ajaxTransport("script",function(e){if(e.crossDomain){var n,r=a.head||x("head")[0]||a.documentElement;return{send:function(t,i){n=a.createElement("script"),n.async=!0,e.scriptCharset&&(n.charset=e.scriptCharset),n.src=e.url,n.onload=n.onreadystatechange=function(e,t){(t||!n.readyState||/loaded|complete/.test(n.readyState))&&(n.onload=n.onreadystatechange=null,n.parentNode&&n.parentNode.removeChild(n),n=null,t||i(200,"success"))},r.insertBefore(n,r.firstChild)},abort:function(){n&&n.onload(t,!0)}}}});var Fn=[],Bn=/(=)\?(?=&|$)|\?\?/;x.ajaxSetup({jsonp:"callback",jsonpCallback:function(){var e=Fn.pop()||x.expando+"_"+vn++;return this[e]=!0,e}}),x.ajaxPrefilter("json jsonp",function(n,r,i){var o,a,s,l=n.jsonp!==!1&&(Bn.test(n.url)?"url":"string"==typeof 
 n.data&&!(n.contentType||"").indexOf("application/x-www-form-urlencoded")&&Bn.test(n.data)&&"data");return l||"jsonp"===n.dataTypes[0]?(o=n.jsonpCallback=x.isFunction(n.jsonpCallback)?n.jsonpCallback():n.jsonpCallback,l?n[l]=n[l].replace(Bn,"$1"+o):n.jsonp!==!1&&(n.url+=(bn.test(n.url)?"&":"?")+n.jsonp+"="+o),n.converters["script json"]=function(){return s||x.error(o+" was not called"),s[0]},n.dataTypes[0]="json",a=e[o],e[o]=function(){s=arguments},i.always(function(){e[o]=a,n[o]&&(n.jsonpCallback=r.jsonpCallback,Fn.push(o)),s&&x.isFunction(a)&&a(s[0]),s=a=t}),"script"):t});var Pn,Rn,Wn=0,$n=e.ActiveXObject&&function(){var e;for(e in Pn)Pn[e](t,!0)};function In(){try{return new e.XMLHttpRequest}catch(t){}}function zn(){try{return new e.ActiveXObject("Microsoft.XMLHTTP")}catch(t){}}x.ajaxSettings.xhr=e.ActiveXObject?function(){return!this.isLocal&&In()||zn()}:In,Rn=x.ajaxSettings.xhr(),x.support.cors=!!Rn&&"withCredentials"in Rn,Rn=x.support.ajax=!!Rn,Rn&&x.ajaxTransport(func
 tion(n){if(!n.crossDomain||x.support.cors){var r;return{send:function(i,o){var a,s,l=n.xhr();if(n.username?l.open(n.type,n.url,n.async,n.username,n.password):l.open(n.type,n.url,n.async),n.xhrFields)for(s in n.xhrFields)l[s]=n.xhrFields[s];n.mimeType&&l.overrideMimeType&&l.overrideMimeType(n.mimeType),n.crossDomain||i["X-Requested-With"]||(i["X-Requested-With"]="XMLHttpRequest");try{for(s in i)l.setRequestHeader(s,i[s])}catch(u){}l.send(n.hasContent&&n.data||null),r=function(e,i){var s,u,c,p;try{if(r&&(i||4===l.readyState))if(r=t,a&&(l.onreadystatechange=x.noop,$n&&delete Pn[a]),i)4!==l.readyState&&l.abort();else{p={},s=l.status,u=l.getAllResponseHeaders(),"string"==typeof l.responseText&&(p.text=l.responseText);try{c=l.statusText}catch(f){c=""}s||!n.isLocal||n.crossDomain?1223===s&&(s=204):s=p.text?200:404}}catch(d){i||o(-1,d)}p&&o(s,c,p,u)},n.async?4===l.readyState?setTimeout(r):(a=++Wn,$n&&(Pn||(Pn={},x(e).unload($n)),Pn[a]=r),l.onreadystatechange=r):r()},abort:function()
 {r&&r(t,!0)}}}});var Xn,Un,Vn=/^(?:toggle|show|hide)$/,Yn=RegExp("^(?:([+-])=|)("+w+")([a-z%]*)$","i"),Jn=/queueHooks$/,Gn=[nr],Qn={"*":[function(e,t){var n=this.createTween(e,t),r=n.cur(),i=Yn.exec(t),o=i&&i[3]||(x.cssNumber[e]?"":"px"),a=(x.cssNumber[e]||"px"!==o&&+r)&&Yn.exec(x.css(n.elem,e)),s=1,l=20;if(a&&a[3]!==o){o=o||a[3],i=i||[],a=+r||1;do s=s||".5",a/=s,x.style(n.elem,e,a+o);while(s!==(s=n.cur()/r)&&1!==s&&--l)}return i&&(a=n.start=+a||+r||0,n.unit=o,n.end=i[1]?a+(i[1]+1)*i[2]:+i[2]),n}]};function Kn(){return setTimeout(function(){Xn=t}),Xn=x.now()}function Zn(e,t,n){var r,i=(Qn[t]||[]).concat(Qn["*"]),o=0,a=i.length;for(;a>o;o++)if(r=i[o].call(n,t,e))return r}function er(e,t,n){var r,i,o=0,a=Gn.length,s=x.Deferred().always(function(){delete l.elem}),l=function(){if(i)return!1;var t=Xn||Kn(),n=Math.max(0,u.startTime+u.duration-t),r=n/u.duration||0,o=1-r,a=0,l=u.tweens.length;for(;l>a;a++)u.tweens[a].run(o);return s.notifyWith(e,[u,o,n]),1>o&&l?n:(s.resolveWith(e,[u
 ]),!1)},u=s.promise({elem:e,props:x.extend({},t),opts:x.extend(!0,{specialEasing:{}},n),originalProperties:t,originalOptions:n,startTime:Xn||Kn(),duration:n.duration,tweens:[],createTween:function(t,n){var r=x.Tween(e,u.opts,t,n,u.opts.specialEasing[t]||u.opts.easing);return u.tweens.push(r),r},stop:function(t){var n=0,r=t?u.tweens.length:0;if(i)return this;for(i=!0;r>n;n++)u.tweens[n].run(1);return t?s.resolveWith(e,[u,t]):s.rejectWith(e,[u,t]),this}}),c=u.props;for(tr(c,u.opts.specialEasing);a>o;o++)if(r=Gn[o].call(u,e,c,u.opts))return r;return x.map(c,Zn,u),x.isFunction(u.opts.start)&&u.opts.start.call(e,u),x.fx.timer(x.extend(l,{elem:e,anim:u,queue:u.opts.queue})),u.progress(u.opts.progress).done(u.opts.done,u.opts.complete).fail(u.opts.fail).always(u.opts.always)}function tr(e,t){var n,r,i,o,a;for(n in e)if(r=x.camelCase(n),i=t[r],o=e[n],x.isArray(o)&&(i=o[1],o=e[n]=o[0]),n!==r&&(e[r]=o,delete e[n]),a=x.cssHooks[r],a&&"expand"in a){o=a.expand(o),delete e[r];for(n in o)n
  in e||(e[n]=o[n],t[n]=i)}else t[r]=i}x.Animation=x.extend(er,{tweener:function(e,t){x.isFunction(e)?(t=e,e=["*"]):e=e.split(" ");var n,r=0,i=e.length;for(;i>r;r++)n=e[r],Qn[n]=Qn[n]||[],Qn[n].unshift(t)},prefilter:function(e,t){t?Gn.unshift(e):Gn.push(e)}});function nr(e,t,n){var r,i,o,a,s,l,u=this,c={},p=e.style,f=e.nodeType&&nn(e),d=x._data(e,"fxshow");n.queue||(s=x._queueHooks(e,"fx"),null==s.unqueued&&(s.unqueued=0,l=s.empty.fire,s.empty.fire=function(){s.unqueued||l()}),s.unqueued++,u.always(function(){u.always(function(){s.unqueued--,x.queue(e,"fx").length||s.empty.fire()})})),1===e.nodeType&&("height"in t||"width"in t)&&(n.overflow=[p.overflow,p.overflowX,p.overflowY],"inline"===x.css(e,"display")&&"none"===x.css(e,"float")&&(x.support.inlineBlockNeedsLayout&&"inline"!==ln(e.nodeName)?p.zoom=1:p.display="inline-block")),n.overflow&&(p.overflow="hidden",x.support.shrinkWrapBlocks||u.always(function(){p.overflow=n.overflow[0],p.overflowX=n.overflow[1],p.overflowY=n.ove
 rflow[2]}));for(r in t)if(i=t[r],Vn.exec(i)){if(delete t[r],o=o||"toggle"===i,i===(f?"hide":"show"))continue;c[r]=d&&d[r]||x.style(e,r)}if(!x.isEmptyObject(c)){d?"hidden"in d&&(f=d.hidden):d=x._data(e,"fxshow",{}),o&&(d.hidden=!f),f?x(e).show():u.done(function(){x(e).hide()}),u.done(function(){var t;x._removeData(e,"fxshow");for(t in c)x.style(e,t,c[t])});for(r in c)a=Zn(f?d[r]:0,r,u),r in d||(d[r]=a.start,f&&(a.end=a.start,a.start="width"===r||"height"===r?1:0))}}function rr(e,t,n,r,i){return new rr.prototype.init(e,t,n,r,i)}x.Tween=rr,rr.prototype={constructor:rr,init:function(e,t,n,r,i,o){this.elem=e,this.prop=n,this.easing=i||"swing",this.options=t,this.start=this.now=this.cur(),this.end=r,this.unit=o||(x.cssNumber[n]?"":"px")},cur:function(){var e=rr.propHooks[this.prop];return e&&e.get?e.get(this):rr.propHooks._default.get(this)},run:function(e){var t,n=rr.propHooks[this.prop];return this.pos=t=this.options.duration?x.easing[this.easing](e,this.options.duration*e,0,1,t
 his.options.duration):e,this.now=(this.end-this.start)*t+this.start,this.options.step&&this.options.step.call(this.elem,this.now,this),n&&n.set?n.set(this):rr.propHooks._default.set(this),this}},rr.prototype.init.prototype=rr.prototype,rr.propHooks={_default:{get:function(e){var t;return null==e.elem[e.prop]||e.elem.style&&null!=e.elem.style[e.prop]?(t=x.css(e.elem,e.prop,""),t&&"auto"!==t?t:0):e.elem[e.prop]},set:function(e){x.fx.step[e.prop]?x.fx.step[e.prop](e):e.elem.style&&(null!=e.elem.style[x.cssProps[e.prop]]||x.cssHooks[e.prop])?x.style(e.elem,e.prop,e.now+e.unit):e.elem[e.prop]=e.now}}},rr.propHooks.scrollTop=rr.propHooks.scrollLeft={set:function(e){e.elem.nodeType&&e.elem.parentNode&&(e.elem[e.prop]=e.now)}},x.each(["toggle","show","hide"],function(e,t){var n=x.fn[t];x.fn[t]=function(e,r,i){return null==e||"boolean"==typeof e?n.apply(this,arguments):this.animate(ir(t,!0),e,r,i)}}),x.fn.extend({fadeTo:function(e,t,n,r){return this.filter(nn).css("opacity",0).show()
 .end().animate({opacity:t},e,n,r)},animate:function(e,t,n,r){var i=x.isEmptyObject(e),o=x.speed(t,n,r),a=function(){var t=er(this,x.extend({},e),o);(i||x._data(this,"finish"))&&t.stop(!0)};return a.finish=a,i||o.queue===!1?this.each(a):this.queue(o.queue,a)},stop:function(e,n,r){var i=function(e){var t=e.stop;delete e.stop,t(r)};return"string"!=typeof e&&(r=n,n=e,e=t),n&&e!==!1&&this.queue(e||"fx",[]),this.each(function(){var t=!0,n=null!=e&&e+"queueHooks",o=x.timers,a=x._data(this);if(n)a[n]&&a[n].stop&&i(a[n]);else for(n in a)a[n]&&a[n].stop&&Jn.test(n)&&i(a[n]);for(n=o.length;n--;)o[n].elem!==this||null!=e&&o[n].queue!==e||(o[n].anim.stop(r),t=!1,o.splice(n,1));(t||!r)&&x.dequeue(this,e)})},finish:function(e){return e!==!1&&(e=e||"fx"),this.each(function(){var t,n=x._data(this),r=n[e+"queue"],i=n[e+"queueHooks"],o=x.timers,a=r?r.length:0;for(n.finish=!0,x.queue(this,e,[]),i&&i.stop&&i.stop.call(this,!0),t=o.length;t--;)o[t].elem===this&&o[t].queue===e&&(o[t].anim.stop(!0)
 ,o.splice(t,1));for(t=0;a>t;t++)r[t]&&r[t].finish&&r[t].finish.call(this);delete n.finish})}});function ir(e,t){var n,r={height:e},i=0;for(t=t?1:0;4>i;i+=2-t)n=Zt[i],r["margin"+n]=r["padding"+n]=e;return t&&(r.opacity=r.width=e),r}x.each({slideDown:ir("show"),slideUp:ir("hide"),slideToggle:ir("toggle"),fadeIn:{opacity:"show"},fadeOut:{opacity:"hide"},fadeToggle:{opacity:"toggle"}},function(e,t){x.fn[e]=function(e,n,r){return this.animate(t,e,n,r)}}),x.speed=function(e,t,n){var r=e&&"object"==typeof e?x.extend({},e):{complete:n||!n&&t||x.isFunction(e)&&e,duration:e,easing:n&&t||t&&!x.isFunction(t)&&t};return r.duration=x.fx.off?0:"number"==typeof r.duration?r.duration:r.duration in x.fx.speeds?x.fx.speeds[r.duration]:x.fx.speeds._default,(null==r.queue||r.queue===!0)&&(r.queue="fx"),r.old=r.complete,r.complete=function(){x.isFunction(r.old)&&r.old.call(this),r.queue&&x.dequeue(this,r.queue)},r},x.easing={linear:function(e){return e},swing:function(e){return.5-Math.cos(e*Math.
 PI)/2}},x.timers=[],x.fx=rr.prototype.init,x.fx.tick=function(){var e,n=x.timers,r=0;for(Xn=x.now();n.length>r;r++)e=n[r],e()||n[r]!==e||n.splice(r--,1);n.length||x.fx.stop(),Xn=t},x.fx.timer=function(e){e()&&x.timers.push(e)&&x.fx.start()},x.fx.interval=13,x.fx.start=function(){Un||(Un=setInterval(x.fx.tick,x.fx.interval))},x.fx.stop=function(){clearInterval(Un),Un=null},x.fx.speeds={slow:600,fast:200,_default:400},x.fx.step={},x.expr&&x.expr.filters&&(x.expr.filters.animated=function(e){return x.grep(x.timers,function(t){return e===t.elem}).length}),x.fn.offset=function(e){if(arguments.length)return e===t?this:this.each(function(t){x.offset.setOffset(this,e,t)});var n,r,o={top:0,left:0},a=this[0],s=a&&a.ownerDocument;if(s)return n=s.documentElement,x.contains(n,a)?(typeof a.getBoundingClientRect!==i&&(o=a.getBoundingClientRect()),r=or(s),{top:o.top+(r.pageYOffset||n.scrollTop)-(n.clientTop||0),left:o.left+(r.pageXOffset||n.scrollLeft)-(n.clientLeft||0)}):o},x.offset={setOf
 fset:function(e,t,n){var r=x.css(e,"position");"static"===r&&(e.style.position="relative");var i=x(e),o=i.offset(),a=x.css(e,"top"),s=x.css(e,"left"),l=("absolute"===r||"fixed"===r)&&x.inArray("auto",[a,s])>-1,u={},c={},p,f;l?(c=i.position(),p=c.top,f=c.left):(p=parseFloat(a)||0,f=parseFloat(s)||0),x.isFunction(t)&&(t=t.call(e,n,o)),null!=t.top&&(u.top=t.top-o.top+p),null!=t.left&&(u.left=t.left-o.left+f),"using"in t?t.using.call(e,u):i.css(u)}},x.fn.extend({position:function(){if(this[0]){var e,t,n={top:0,left:0},r=this[0];return"fixed"===x.css(r,"position")?t=r.getBoundingClientRect():(e=this.offsetParent(),t=this.offset(),x.nodeName(e[0],"html")||(n=e.offset()),n.top+=x.css(e[0],"borderTopWidth",!0),n.left+=x.css(e[0],"borderLeftWidth",!0)),{top:t.top-n.top-x.css(r,"marginTop",!0),left:t.left-n.left-x.css(r,"marginLeft",!0)}}},offsetParent:function(){return this.map(function(){var e=this.offsetParent||s;while(e&&!x.nodeName(e,"html")&&"static"===x.css(e,"position"))e=e.of
 fsetParent;return e||s})}}),x.each({scrollLeft:"pageXOffset",scrollTop:"pageYOffset"},function(e,n){var r=/Y/.test(n);x.fn[e]=function(i){return x.access(this,function(e,i,o){var a=or(e);return o===t?a?n in a?a[n]:a.document.documentElement[i]:e[i]:(a?a.scrollTo(r?x(a).scrollLeft():o,r?o:x(a).scrollTop()):e[i]=o,t)},e,i,arguments.length,null)}});function or(e){return x.isWindow(e)?e:9===e.nodeType?e.defaultView||e.parentWindow:!1}x.each({Height:"height",Width:"width"},function(e,n){x.each({padding:"inner"+e,content:n,"":"outer"+e},function(r,i){x.fn[i]=function(i,o){var a=arguments.length&&(r||"boolean"!=typeof i),s=r||(i===!0||o===!0?"margin":"border");return x.access(this,function(n,r,i){var o;return x.isWindow(n)?n.document.documentElement["client"+e]:9===n.nodeType?(o=n.documentElement,Math.max(n.body["scroll"+e],o["scroll"+e],n.body["offset"+e],o["offset"+e],o["client"+e])):i===t?x.css(n,r,s):x.style(n,r,i,s)},n,a?i:t,a,null)}})}),x.fn.size=function(){return this.length
 },x.fn.andSelf=x.fn.addBack,"object"==typeof module&&module&&"object"==typeof module.exports?module.exports=x:(e.jQuery=e.$=x,"function"==typeof define&&define.amd&&define("jquery",[],function(){return x}))})(window);
-- 
1.8.5.3
