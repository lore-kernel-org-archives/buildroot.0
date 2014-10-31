From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 31 Oct 2014 16:50:50 +0100
Subject: [Buildroot] [PATCH 1/2] docs: RWD website - upgrading
	bootstrap/jquery
In-Reply-To: <1414770651-23358-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1414770651-23358-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1414770651-23358-2-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Upgrading to Bootstrap 3.2.0
* Upgrading to Jquery 1.11.1
* Removing older files

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 docs/css/bootstrap-responsive.css     | 1092 ------
 docs/css/bootstrap-responsive.min.css |    9 -
 docs/css/bootstrap.css                | 6039 ---------------------------------
 docs/css/bootstrap.min.css            | 2360 ++++++++-----
 docs/js/bootstrap.js                  | 2159 ------------
 docs/js/bootstrap.min.js              |   10 +-
 docs/js/jquery-1.10.2.min.js          |    6 -
 docs/js/jquery-1.11.1.min.js          |    4 +
 8 files changed, 1488 insertions(+), 10191 deletions(-)
 delete mode 100644 docs/css/bootstrap-responsive.css
 delete mode 100644 docs/css/bootstrap-responsive.min.css
 delete mode 100644 docs/css/bootstrap.css
 delete mode 100644 docs/js/bootstrap.js
 delete mode 100644 docs/js/jquery-1.10.2.min.js
 create mode 100644 docs/js/jquery-1.11.1.min.js

diff --git a/docs/css/bootstrap-responsive.css b/docs/css/bootstrap-responsive.css
deleted file mode 100644
index a3352d7..0000000
--- a/docs/css/bootstrap-responsive.css
+++ /dev/null
@@ -1,1092 +0,0 @@
-/*!
- * Bootstrap Responsive v2.2.2
- *
- * Copyright 2012 Twitter, Inc
- * Licensed under the Apache License v2.0
- * http://www.apache.org/licenses/LICENSE-2.0
- *
- * Designed and built with all the love in the world @twitter by @mdo and @fat.
- */
-
- at -ms-viewport {
-  width: device-width;
-}
-
-.clearfix {
-  *zoom: 1;
-}
-
-.clearfix:before,
-.clearfix:after {
-  display: table;
-  line-height: 0;
-  content: "";
-}
-
-.clearfix:after {
-  clear: both;
-}
-
-.hide-text {
-  font: 0/0 a;
-  color: transparent;
-  text-shadow: none;
-  background-color: transparent;
-  border: 0;
-}
-
-.input-block-level {
-  display: block;
-  width: 100%;
-  min-height: 30px;
-  -webkit-box-sizing: border-box;
-     -moz-box-sizing: border-box;
-          box-sizing: border-box;
-}
-
-.hidden {
-  display: none;
-  visibility: hidden;
-}
-
-.visible-phone {
-  display: none !important;
-}
-
-.visible-tablet {
-  display: none !important;
-}
-
-.hidden-desktop {
-  display: none !important;
-}
-
-.visible-desktop {
-  display: inherit !important;
-}
-
- at media (min-width: 768px) and (max-width: 979px) {
-  .hidden-desktop {
-    display: inherit !important;
-  }
-  .visible-desktop {
-    display: none !important ;
-  }
-  .visible-tablet {
-    display: inherit !important;
-  }
-  .hidden-tablet {
-    display: none !important;
-  }
-}
-
- at media (max-width: 767px) {
-  .hidden-desktop {
-    display: inherit !important;
-  }
-  .visible-desktop {
-    display: none !important;
-  }
-  .visible-phone {
-    display: inherit !important;
-  }
-  .hidden-phone {
-    display: none !important;
-  }
-}
-
- at media (min-width: 1200px) {
-  .row {
-    margin-left: -30px;
-    *zoom: 1;
-  }
-  .row:before,
-  .row:after {
-    display: table;
-    line-height: 0;
-    content: "";
-  }
-  .row:after {
-    clear: both;
-  }
-  [class*="span"] {
-    float: left;
-    min-height: 1px;
-    margin-left: 30px;
-  }
-  .container,
-  .navbar-static-top .container,
-  .navbar-fixed-top .container,
-  .navbar-fixed-bottom .container {
-    width: 1170px;
-  }
-  .span12 {
-    width: 1170px;
-  }
-  .span11 {
-    width: 1070px;
-  }
-  .span10 {
-    width: 970px;
-  }
-  .span9 {
-    width: 870px;
-  }
-  .span8 {
-    width: 770px;
-  }
-  .span7 {
-    width: 670px;
-  }
-  .span6 {
-    width: 570px;
-  }
-  .span5 {
-    width: 470px;
-  }
-  .span4 {
-    width: 370px;
-  }
-  .span3 {
-    width: 270px;
-  }
-  .span2 {
-    width: 170px;
-  }
-  .span1 {
-    width: 70px;
-  }
-  .offset12 {
-    margin-left: 1230px;
-  }
-  .offset11 {
-    margin-left: 1130px;
-  }
-  .offset10 {
-    margin-left: 1030px;
-  }
-  .offset9 {
-    margin-left: 930px;
-  }
-  .offset8 {
-    margin-left: 830px;
-  }
-  .offset7 {
-    margin-left: 730px;
-  }
-  .offset6 {
-    margin-left: 630px;
-  }
-  .offset5 {
-    margin-left: 530px;
-  }
-  .offset4 {
-    margin-left: 430px;
-  }
-  .offset3 {
-    margin-left: 330px;
-  }
-  .offset2 {
-    margin-left: 230px;
-  }
-  .offset1 {
-    margin-left: 130px;
-  }
-  .row-fluid {
-    width: 100%;
-    *zoom: 1;
-  }
-  .row-fluid:before,
-  .row-fluid:after {
-    display: table;
-    line-height: 0;
-    content: "";
-  }
-  .row-fluid:after {
-    clear: both;
-  }
-  .row-fluid [class*="span"] {
-    display: block;
-    float: left;
-    width: 100%;
-    min-height: 30px;
-    margin-left: 2.564102564102564%;
-    *margin-left: 2.5109110747408616%;
-    -webkit-box-sizing: border-box;
-       -moz-box-sizing: border-box;
-            box-sizing: border-box;
-  }
-  .row-fluid [class*="span"]:first-child {
-    margin-left: 0;
-  }
-  .row-fluid .controls-row [class*="span"] + [class*="span"] {
-    margin-left: 2.564102564102564%;
-  }
-  .row-fluid .span12 {
-    width: 100%;
-    *width: 99.94680851063829%;
-  }
-  .row-fluid .span11 {
-    width: 91.45299145299145%;
-    *width: 91.39979996362975%;
-  }
-  .row-fluid .span10 {
-    width: 82.90598290598291%;
-    *width: 82.8527914166212%;
-  }
-  .row-fluid .span9 {
-    width: 74.35897435897436%;
-    *width: 74.30578286961266%;
-  }
-  .row-fluid .span8 {
-    width: 65.81196581196582%;
-    *width: 65.75877432260411%;
-  }
-  .row-fluid .span7 {
-    width: 57.26495726495726%;
-    *width: 57.21176577559556%;
-  }
-  .row-fluid .span6 {
-    width: 48.717948717948715%;
-    *width: 48.664757228587014%;
-  }
-  .row-fluid .span5 {
-    width: 40.17094017094017%;
-    *width: 40.11774868157847%;
-  }
-  .row-fluid .span4 {
-    width: 31.623931623931625%;
-    *width: 31.570740134569924%;
-  }
-  .row-fluid .span3 {
-    width: 23.076923076923077%;
-    *width: 23.023731587561375%;
-  }
-  .row-fluid .span2 {
-    width: 14.52991452991453%;
-    *width: 14.476723040552828%;
-  }
-  .row-fluid .span1 {
-    width: 5.982905982905983%;
-    *width: 5.929714493544281%;
-  }
-  .row-fluid .offset12 {
-    margin-left: 105.12820512820512%;
-    *margin-left: 105.02182214948171%;
-  }
-  .row-fluid .offset12:first-child {
-    margin-left: 102.56410256410257%;
-    *margin-left: 102.45771958537915%;
-  }
-  .row-fluid .offset11 {
-    margin-left: 96.58119658119658%;
-    *margin-left: 96.47481360247316%;
-  }
-  .row-fluid .offset11:first-child {
-    margin-left: 94.01709401709402%;
-    *margin-left: 93.91071103837061%;
-  }
-  .row-fluid .offset10 {
-    margin-left: 88.03418803418803%;
-    *margin-left: 87.92780505546462%;
-  }
-  .row-fluid .offset10:first-child {
-    margin-left: 85.47008547008548%;
-    *margin-left: 85.36370249136206%;
-  }
-  .row-fluid .offset9 {
-    margin-left: 79.48717948717949%;
-    *margin-left: 79.38079650845607%;
-  }
-  .row-fluid .offset9:first-child {
-    margin-left: 76.92307692307693%;
-    *margin-left: 76.81669394435352%;
-  }
-  .row-fluid .offset8 {
-    margin-left: 70.94017094017094%;
-    *margin-left: 70.83378796144753%;
-  }
-  .row-fluid .offset8:first-child {
-    margin-left: 68.37606837606839%;
-    *margin-left: 68.26968539734497%;
-  }
-  .row-fluid .offset7 {
-    margin-left: 62.393162393162385%;
-    *margin-left: 62.28677941443899%;
-  }
-  .row-fluid .offset7:first-child {
-    margin-left: 59.82905982905982%;
-    *margin-left: 59.72267685033642%;
-  }
-  .row-fluid .offset6 {
-    margin-left: 53.84615384615384%;
-    *margin-left: 53.739770867430444%;
-  }
-  .row-fluid .offset6:first-child {
-    margin-left: 51.28205128205128%;
-    *margin-left: 51.175668303327875%;
-  }
-  .row-fluid .offset5 {
-    margin-left: 45.299145299145295%;
-    *margin-left: 45.1927623204219%;
-  }
-  .row-fluid .offset5:first-child {
-    margin-left: 42.73504273504273%;
-    *margin-left: 42.62865975631933%;
-  }
-  .row-fluid .offset4 {
-    margin-left: 36.75213675213675%;
-    *margin-left: 36.645753773413354%;
-  }
-  .row-fluid .offset4:first-child {
-    margin-left: 34.18803418803419%;
-    *margin-left: 34.081651209310785%;
-  }
-  .row-fluid .offset3 {
-    margin-left: 28.205128205128204%;
-    *margin-left: 28.0987452264048%;
-  }
-  .row-fluid .offset3:first-child {
-    margin-left: 25.641025641025642%;
-    *margin-left: 25.53464266230224%;
-  }
-  .row-fluid .offset2 {
-    margin-left: 19.65811965811966%;
-    *margin-left: 19.551736679396257%;
-  }
-  .row-fluid .offset2:first-child {
-    margin-left: 17.094017094017094%;
-    *margin-left: 16.98763411529369%;
-  }
-  .row-fluid .offset1 {
-    margin-left: 11.11111111111111%;
-    *margin-left: 11.004728132387708%;
-  }
-  .row-fluid .offset1:first-child {
-    margin-left: 8.547008547008547%;
-    *margin-left: 8.440625568285142%;
-  }
-  input,
-  textarea,
-  .uneditable-input {
-    margin-left: 0;
-  }
-  .controls-row [class*="span"] + [class*="span"] {
-    margin-left: 30px;
-  }
-  input.span12,
-  textarea.span12,
-  .uneditable-input.span12 {
-    width: 1156px;
-  }
-  input.span11,
-  textarea.span11,
-  .uneditable-input.span11 {
-    width: 1056px;
-  }
-  input.span10,
-  textarea.span10,
-  .uneditable-input.span10 {
-    width: 956px;
-  }
-  input.span9,
-  textarea.span9,
-  .uneditable-input.span9 {
-    width: 856px;
-  }
-  input.span8,
-  textarea.span8,
-  .uneditable-input.span8 {
-    width: 756px;
-  }
-  input.span7,
-  textarea.span7,
-  .uneditable-input.span7 {
-    width: 656px;
-  }
-  input.span6,
-  textarea.span6,
-  .uneditable-input.span6 {
-    width: 556px;
-  }
-  input.span5,
-  textarea.span5,
-  .uneditable-input.span5 {
-    width: 456px;
-  }
-  input.span4,
-  textarea.span4,
-  .uneditable-input.span4 {
-    width: 356px;
-  }
-  input.span3,
-  textarea.span3,
-  .uneditable-input.span3 {
-    width: 256px;
-  }
-  input.span2,
-  textarea.span2,
-  .uneditable-input.span2 {
-    width: 156px;
-  }
-  input.span1,
-  textarea.span1,
-  .uneditable-input.span1 {
-    width: 56px;
-  }
-  .thumbnails {
-    margin-left: -30px;
-  }
-  .thumbnails > li {
-    margin-left: 30px;
-  }
-  .row-fluid .thumbnails {
-    margin-left: 0;
-  }
-}
-
- at media (min-width: 768px) and (max-width: 979px) {
-  .row {
-    margin-left: -20px;
-    *zoom: 1;
-  }
-  .row:before,
-  .row:after {
-    display: table;
-    line-height: 0;
-    content: "";
-  }
-  .row:after {
-    clear: both;
-  }
-  [class*="span"] {
-    float: left;
-    min-height: 1px;
-    margin-left: 20px;
-  }
-  .container,
-  .navbar-static-top .container,
-  .navbar-fixed-top .container,
-  .navbar-fixed-bottom .container {
-    width: 724px;
-  }
-  .span12 {
-    width: 724px;
-  }
-  .span11 {
-    width: 662px;
-  }
-  .span10 {
-    width: 600px;
-  }
-  .span9 {
-    width: 538px;
-  }
-  .span8 {
-    width: 476px;
-  }
-  .span7 {
-    width: 414px;
-  }
-  .span6 {
-    width: 352px;
-  }
-  .span5 {
-    width: 290px;
-  }
-  .span4 {
-    width: 228px;
-  }
-  .span3 {
-    width: 166px;
-  }
-  .span2 {
-    width: 104px;
-  }
-  .span1 {
-    width: 42px;
-  }
-  .offset12 {
-    margin-left: 764px;
-  }
-  .offset11 {
-    margin-left: 702px;
-  }
-  .offset10 {
-    margin-left: 640px;
-  }
-  .offset9 {
-    margin-left: 578px;
-  }
-  .offset8 {
-    margin-left: 516px;
-  }
-  .offset7 {
-    margin-left: 454px;
-  }
-  .offset6 {
-    margin-left: 392px;
-  }
-  .offset5 {
-    margin-left: 330px;
-  }
-  .offset4 {
-    margin-left: 268px;
-  }
-  .offset3 {
-    margin-left: 206px;
-  }
-  .offset2 {
-    margin-left: 144px;
-  }
-  .offset1 {
-    margin-left: 82px;
-  }
-  .row-fluid {
-    width: 100%;
-    *zoom: 1;
-  }
-  .row-fluid:before,
-  .row-fluid:after {
-    display: table;
-    line-height: 0;
-    content: "";
-  }
-  .row-fluid:after {
-    clear: both;
-  }
-  .row-fluid [class*="span"] {
-    display: block;
-    float: left;
-    width: 100%;
-    min-height: 30px;
-    margin-left: 2.7624309392265194%;
-    *margin-left: 2.709239449864817%;
-    -webkit-box-sizing: border-box;
-       -moz-box-sizing: border-box;
-            box-sizing: border-box;
-  }
-  .row-fluid [class*="span"]:first-child {
-    margin-left: 0;
-  }
-  .row-fluid .controls-row [class*="span"] + [class*="span"] {
-    margin-left: 2.7624309392265194%;
-  }
-  .row-fluid .span12 {
-    width: 100%;
-    *width: 99.94680851063829%;
-  }
-  .row-fluid .span11 {
-    width: 91.43646408839778%;
-    *width: 91.38327259903608%;
-  }
-  .row-fluid .span10 {
-    width: 82.87292817679558%;
-    *width: 82.81973668743387%;
-  }
-  .row-fluid .span9 {
-    width: 74.30939226519337%;
-    *width: 74.25620077583166%;
-  }
-  .row-fluid .span8 {
-    width: 65.74585635359117%;
-    *width: 65.69266486422946%;
-  }
-  .row-fluid .span7 {
-    width: 57.18232044198895%;
-    *width: 57.12912895262725%;
-  }
-  .row-fluid .span6 {
-    width: 48.61878453038674%;
-    *width: 48.56559304102504%;
-  }
-  .row-fluid .span5 {
-    width: 40.05524861878453%;
-    *width: 40.00205712942283%;
-  }
-  .row-fluid .span4 {
-    width: 31.491712707182323%;
-    *width: 31.43852121782062%;
-  }
-  .row-fluid .span3 {
-    width: 22.92817679558011%;
-    *width: 22.87498530621841%;
-  }
-  .row-fluid .span2 {
-    width: 14.3646408839779%;
-    *width: 14.311449394616199%;
-  }
-  .row-fluid .span1 {
-    width: 5.801104972375691%;
-    *width: 5.747913483013988%;
-  }
-  .row-fluid .offset12 {
-    margin-left: 105.52486187845304%;
-    *margin-left: 105.41847889972962%;
-  }
-  .row-fluid .offset12:first-child {
-    margin-left: 102.76243093922652%;
-    *margin-left: 102.6560479605031%;
-  }
-  .row-fluid .offset11 {
-    margin-left: 96.96132596685082%;
-    *margin-left: 96.8549429881274%;
-  }
-  .row-fluid .offset11:first-child {
-    margin-left: 94.1988950276243%;
-    *margin-left: 94.09251204890089%;
-  }
-  .row-fluid .offset10 {
-    margin-left: 88.39779005524862%;
-    *margin-left: 88.2914070765252%;
-  }
-  .row-fluid .offset10:first-child {
-    margin-left: 85.6353591160221%;
-    *margin-left: 85.52897613729868%;
-  }
-  .row-fluid .offset9 {
-    margin-left: 79.8342541436464%;
-    *margin-left: 79.72787116492299%;
-  }
-  .row-fluid .offset9:first-child {
-    margin-left: 77.07182320441989%;
-    *margin-left: 76.96544022569647%;
-  }
-  .row-fluid .offset8 {
-    margin-left: 71.2707182320442%;
-    *margin-left: 71.16433525332079%;
-  }
-  .row-fluid .offset8:first-child {
-    margin-left: 68.50828729281768%;
-    *margin-left: 68.40190431409427%;
-  }
-  .row-fluid .offset7 {
-    margin-left: 62.70718232044199%;
-    *margin-left: 62.600799341718584%;
-  }
-  .row-fluid .offset7:first-child {
-    margin-left: 59.94475138121547%;
-    *margin-left: 59.838368402492065%;
-  }
-  .row-fluid .offset6 {
-    margin-left: 54.14364640883978%;
-    *margin-left: 54.037263430116376%;
-  }
-  .row-fluid .offset6:first-child {
-    margin-left: 51.38121546961326%;
-    *margin-left: 51.27483249088986%;
-  }
-  .row-fluid .offset5 {
-    margin-left: 45.58011049723757%;
-    *margin-left: 45.47372751851417%;
-  }
-  .row-fluid .offset5:first-child {
-    margin-left: 42.81767955801105%;
-    *margin-left: 42.71129657928765%;
-  }
-  .row-fluid .offset4 {
-    margin-left: 37.01657458563536%;
-    *margin-left: 36.91019160691196%;
-  }
-  .row-fluid .offset4:first-child {
-    margin-left: 34.25414364640884%;
-    *margin-left: 34.14776066768544%;
-  }
-  .row-fluid .offset3 {
-    margin-left: 28.45303867403315%;
-    *margin-left: 28.346655695309746%;
-  }
-  .row-fluid .offset3:first-child {
-    margin-left: 25.69060773480663%;
-    *margin-left: 25.584224756083227%;
-  }
-  .row-fluid .offset2 {
-    margin-left: 19.88950276243094%;
-    *margin-left: 19.783119783707537%;
-  }
-  .row-fluid .offset2:first-child {
-    margin-left: 17.12707182320442%;
-    *margin-left: 17.02068884448102%;
-  }
-  .row-fluid .offset1 {
-    margin-left: 11.32596685082873%;
-    *margin-left: 11.219583872105325%;
-  }
-  .row-fluid .offset1:first-child {
-    margin-left: 8.56353591160221%;
-    *margin-left: 8.457152932878806%;
-  }
-  input,
-  textarea,
-  .uneditable-input {
-    margin-left: 0;
-  }
-  .controls-row [class*="span"] + [class*="span"] {
-    margin-left: 20px;
-  }
-  input.span12,
-  textarea.span12,
-  .uneditable-input.span12 {
-    width: 710px;
-  }
-  input.span11,
-  textarea.span11,
-  .uneditable-input.span11 {
-    width: 648px;
-  }
-  input.span10,
-  textarea.span10,
-  .uneditable-input.span10 {
-    width: 586px;
-  }
-  input.span9,
-  textarea.span9,
-  .uneditable-input.span9 {
-    width: 524px;
-  }
-  input.span8,
-  textarea.span8,
-  .uneditable-input.span8 {
-    width: 462px;
-  }
-  input.span7,
-  textarea.span7,
-  .uneditable-input.span7 {
-    width: 400px;
-  }
-  input.span6,
-  textarea.span6,
-  .uneditable-input.span6 {
-    width: 338px;
-  }
-  input.span5,
-  textarea.span5,
-  .uneditable-input.span5 {
-    width: 276px;
-  }
-  input.span4,
-  textarea.span4,
-  .uneditable-input.span4 {
-    width: 214px;
-  }
-  input.span3,
-  textarea.span3,
-  .uneditable-input.span3 {
-    width: 152px;
-  }
-  input.span2,
-  textarea.span2,
-  .uneditable-input.span2 {
-    width: 90px;
-  }
-  input.span1,
-  textarea.span1,
-  .uneditable-input.span1 {
-    width: 28px;
-  }
-}
-
- at media (max-width: 767px) {
-  body {
-    padding-right: 20px;
-    padding-left: 20px;
-  }
-  .navbar-fixed-top,
-  .navbar-fixed-bottom,
-  .navbar-static-top {
-    margin-right: -20px;
-    margin-left: -20px;
-  }
-  .container-fluid {
-    padding: 0;
-  }
-  .dl-horizontal dt {
-    float: none;
-    width: auto;
-    clear: none;
-    text-align: left;
-  }
-  .dl-horizontal dd {
-    margin-left: 0;
-  }
-  .container {
-    width: auto;
-  }
-  .row-fluid {
-    width: 100%;
-  }
-  .row,
-  .thumbnails {
-    margin-left: 0;
-  }
-  .thumbnails > li {
-    float: none;
-    margin-left: 0;
-  }
-  [class*="span"],
-  .uneditable-input[class*="span"],
-  .row-fluid [class*="span"] {
-    display: block;
-    float: none;
-    width: 100%;
-    margin-left: 0;
-    -webkit-box-sizing: border-box;
-       -moz-box-sizing: border-box;
-            box-sizing: border-box;
-  }
-  .span12,
-  .row-fluid .span12 {
-    width: 100%;
-    -webkit-box-sizing: border-box;
-       -moz-box-sizing: border-box;
-            box-sizing: border-box;
-  }
-  .row-fluid [class*="offset"]:first-child {
-    margin-left: 0;
-  }
-  .input-large,
-  .input-xlarge,
-  .input-xxlarge,
-  input[class*="span"],
-  select[class*="span"],
-  textarea[class*="span"],
-  .uneditable-input {
-    display: block;
-    width: 100%;
-    min-height: 30px;
-    -webkit-box-sizing: border-box;
-       -moz-box-sizing: border-box;
-            box-sizing: border-box;
-  }
-  .input-prepend input,
-  .input-append input,
-  .input-prepend input[class*="span"],
-  .input-append input[class*="span"] {
-    display: inline-block;
-    width: auto;
-  }
-  .controls-row [class*="span"] + [class*="span"] {
-    margin-left: 0;
-  }
-  .modal {
-    position: fixed;
-    top: 20px;
-    right: 20px;
-    left: 20px;
-    width: auto;
-    margin: 0;
-  }
-  .modal.fade {
-    top: -100px;
-  }
-  .modal.fade.in {
-    top: 20px;
-  }
-}
-
- at media (max-width: 480px) {
-  .nav-collapse {
-    -webkit-transform: translate3d(0, 0, 0);
-  }
-  .page-header h1 small {
-    display: block;
-    line-height: 20px;
-  }
-  input[type="checkbox"],
-  input[type="radio"] {
-    border: 1px solid #ccc;
-  }
-  .form-horizontal .control-label {
-    float: none;
-    width: auto;
-    padding-top: 0;
-    text-align: left;
-  }
-  .form-horizontal .controls {
-    margin-left: 0;
-  }
-  .form-horizontal .control-list {
-    padding-top: 0;
-  }
-  .form-horizontal .form-actions {
-    padding-right: 10px;
-    padding-left: 10px;
-  }
-  .media .pull-left,
-  .media .pull-right {
-    display: block;
-    float: none;
-    margin-bottom: 10px;
-  }
-  .media-object {
-    margin-right: 0;
-    margin-left: 0;
-  }
-  .modal {
-    top: 10px;
-    right: 10px;
-    left: 10px;
-  }
-  .modal-header .close {
-    padding: 10px;
-    margin: -10px;
-  }
-  .carousel-caption {
-    position: static;
-  }
-}
-
- at media (max-width: 979px) {
-  body {
-    padding-top: 0;
-  }
-  .navbar-fixed-top,
-  .navbar-fixed-bottom {
-    position: static;
-  }
-  .navbar-fixed-top {
-    margin-bottom: 20px;
-  }
-  .navbar-fixed-bottom {
-    margin-top: 20px;
-  }
-  .navbar-fixed-top .navbar-inner,
-  .navbar-fixed-bottom .navbar-inner {
-    padding: 5px;
-  }
-  .navbar .container {
-    width: auto;
-    padding: 0;
-  }
-  .navbar .brand {
-    padding-right: 10px;
-    padding-left: 10px;
-    margin: 0 0 0 -5px;
-  }
-  .nav-collapse {
-    clear: both;
-  }
-  .nav-collapse .nav {
-    float: none;
-    margin: 0 0 10px;
-  }
-  .nav-collapse .nav > li {
-    float: none;
-  }
-  .nav-collapse .nav > li > a {
-    margin-bottom: 2px;
-  }
-  .nav-collapse .nav > .divider-vertical {
-    display: none;
-  }
-  .nav-collapse .nav .nav-header {
-    color: #777777;
-    text-shadow: none;
-  }
-  .nav-collapse .nav > li > a,
-  .nav-collapse .dropdown-menu a {
-    padding: 9px 15px;
-    font-weight: bold;
-    color: #777777;
-    -webkit-border-radius: 3px;
-       -moz-border-radius: 3px;
-            border-radius: 3px;
-  }
-  .nav-collapse .btn {
-    padding: 4px 10px 4px;
-    font-weight: normal;
-    -webkit-border-radius: 4px;
-       -moz-border-radius: 4px;
-            border-radius: 4px;
-  }
-  .nav-collapse .dropdown-menu li + li a {
-    margin-bottom: 2px;
-  }
-  .nav-collapse .nav > li > a:hover,
-  .nav-collapse .dropdown-menu a:hover {
-    background-color: #f2f2f2;
-  }
-  .navbar-inverse .nav-collapse .nav > li > a,
-  .navbar-inverse .nav-collapse .dropdown-menu a {
-    color: #999999;
-  }
-  .navbar-inverse .nav-collapse .nav > li > a:hover,
-  .navbar-inverse .nav-collapse .dropdown-menu a:hover {
-    background-color: #111111;
-  }
-  .nav-collapse.in .btn-group {
-    padding: 0;
-    margin-top: 5px;
-  }
-  .nav-collapse .dropdown-menu {
-    position: static;
-    top: auto;
-    left: auto;
-    display: none;
-    float: none;
-    max-width: none;
-    padding: 0;
-    margin: 0 15px;
-    background-color: transparent;
-    border: none;
-    -webkit-border-radius: 0;
-       -moz-border-radius: 0;
-            border-radius: 0;
-    -webkit-box-shadow: none;
-       -moz-box-shadow: none;
-            box-shadow: none;
-  }
-  .nav-collapse .open > .dropdown-menu {
-    display: block;
-  }
-  .nav-collapse .dropdown-menu:before,
-  .nav-collapse .dropdown-menu:after {
-    display: none;
-  }
-  .nav-collapse .dropdown-menu .divider {
-    display: none;
-  }
-  .nav-collapse .nav > li > .dropdown-menu:before,
-  .nav-collapse .nav > li > .dropdown-menu:after {
-    display: none;
-  }
-  .nav-collapse .navbar-form,
-  .nav-collapse .navbar-search {
-    float: none;
-    padding: 10px 15px;
-    margin: 10px 0;
-    border-top: 1px solid #f2f2f2;
-    border-bottom: 1px solid #f2f2f2;
-    -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.1), 0 1px 0 rgba(255, 255, 255, 0.1);
-       -moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.1), 0 1px 0 rgba(255, 255, 255, 0.1);
-            box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.1), 0 1px 0 rgba(255, 255, 255, 0.1);
-  }
-  .navbar-inverse .nav-collapse .navbar-form,
-  .navbar-inverse .nav-collapse .navbar-search {
-    border-top-color: #111111;
-    border-bottom-color: #111111;
-  }
-  .navbar .nav-collapse .nav.pull-right {
-    float: none;
-    margin-left: 0;
-  }
-  .nav-collapse,
-  .nav-collapse.collapse {
-    height: 0;
-    overflow: hidden;
-  }
-  .navbar .btn-navbar {
-    display: block;
-  }
-  .navbar-static .navbar-inner {
-    padding-right: 10px;
-    padding-left: 10px;
-  }
-}
-
- at media (min-width: 980px) {
-  .nav-collapse.collapse {
-    height: auto !important;
-    overflow: visible !important;
-  }
-}
diff --git a/docs/css/bootstrap-responsive.min.css b/docs/css/bootstrap-responsive.min.css
deleted file mode 100644
index 5cb833f..0000000
--- a/docs/css/bootstrap-responsive.min.css
+++ /dev/null
@@ -1,9 +0,0 @@
-/*!
- * Bootstrap Responsive v2.2.2
- *
- * Copyright 2012 Twitter, Inc
- * Licensed under the Apache License v2.0
- * http://www.apache.org/licenses/LICENSE-2.0
- *
- * Designed and built with all the love in the world @twitter by @mdo and @fat.
- */@-ms-viewport{width:device-width}.clearfix{*zoom:1}.clearfix:before,.clearfix:after{display:table;line-height:0;content:""}.clearfix:after{clear:both}.hide-text{font:0/0 a;color:transparent;text-shadow:none;background-color:transparent;border:0}.input-block-level{display:block;width:100%;min-height:30px;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}.hidden{display:none;visibility:hidden}.visible-phone{display:none!important}.visible-tablet{display:none!important}.hidden-desktop{display:none!important}.visible-desktop{display:inherit!important}@media(min-width:768px) and (max-width:979px){.hidden-desktop{display:inherit!important}.visible-desktop{display:none!important}.visible-tablet{display:inherit!important}.hidden-tablet{display:none!important}}@media(max-width:767px){.hidden-desktop{display:inherit!important}.visible-desktop{display:none!important}.visible-phone{display:inherit!important}.hidden-phone{display:none!important}}@media(min
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
deleted file mode 100644
index 294b08a..0000000
--- a/docs/css/bootstrap.css
+++ /dev/null
@@ -1,6039 +0,0 @@
-/*!
- * Bootstrap v2.2.2
- *
- * Copyright 2012 Twitter, Inc
- * Licensed under the Apache License v2.0
- * http://www.apache.org/licenses/LICENSE-2.0
- *
- * Designed and built with all the love in the world @twitter by @mdo and @fat.
- */
-
-article,
-aside,
-details,
-figcaption,
-figure,
-footer,
-header,
-hgroup,
-nav,
-section {
-  display: block;
-}
-
-audio,
-canvas,
-video {
-  display: inline-block;
-  *display: inline;
-  *zoom: 1;
-}
-
-audio:not([controls]) {
-  display: none;
-}
-
-html {
-  font-size: 100%;
-  -webkit-text-size-adjust: 100%;
-      -ms-text-size-adjust: 100%;
-}
-
-a:focus {
-  outline: thin dotted #333;
-  outline: 5px auto -webkit-focus-ring-color;
-  outline-offset: -2px;
-}
-
-a:hover,
-a:active {
-  outline: 0;
-}
-
-sub,
-sup {
-  position: relative;
-  font-size: 75%;
-  line-height: 0;
-  vertical-align: baseline;
-}
-
-sup {
-  top: -0.5em;
-}
-
-sub {
-  bottom: -0.25em;
-}
-
-img {
-  width: auto\9;
-  height: auto;
-  max-width: 100%;
-  vertical-align: middle;
-  border: 0;
-  -ms-interpolation-mode: bicubic;
-}
-
-#map_canvas img,
-.google-maps img {
-  max-width: none;
-}
-
-button,
-input,
-select,
-textarea {
-  margin: 0;
-  font-size: 100%;
-  vertical-align: middle;
-}
-
-button,
-input {
-  *overflow: visible;
-  line-height: normal;
-}
-
-button::-moz-focus-inner,
-input::-moz-focus-inner {
-  padding: 0;
-  border: 0;
-}
-
-button,
-html input[type="button"],
-input[type="reset"],
-input[type="submit"] {
-  cursor: pointer;
-  -webkit-appearance: button;
-}
-
-label,
-select,
-button,
-input[type="button"],
-input[type="reset"],
-input[type="submit"],
-input[type="radio"],
-input[type="checkbox"] {
-  cursor: pointer;
-}
-
-input[type="search"] {
-  -webkit-box-sizing: content-box;
-     -moz-box-sizing: content-box;
-          box-sizing: content-box;
-  -webkit-appearance: textfield;
-}
-
-input[type="search"]::-webkit-search-decoration,
-input[type="search"]::-webkit-search-cancel-button {
-  -webkit-appearance: none;
-}
-
-textarea {
-  overflow: auto;
-  vertical-align: top;
-}
-
- at media print {
-  * {
-    color: #000 !important;
-    text-shadow: none !important;
-    background: transparent !important;
-    box-shadow: none !important;
-  }
-  a,
-  a:visited {
-    text-decoration: underline;
-  }
-  a[href]:after {
-    content: " (" attr(href) ")";
-  }
-  abbr[title]:after {
-    content: " (" attr(title) ")";
-  }
-  .ir a:after,
-  a[href^="javascript:"]:after,
-  a[href^="#"]:after {
-    content: "";
-  }
-  pre,
-  blockquote {
-    border: 1px solid #999;
-    page-break-inside: avoid;
-  }
-  thead {
-    display: table-header-group;
-  }
-  tr,
-  img {
-    page-break-inside: avoid;
-  }
-  img {
-    max-width: 100% !important;
-  }
-  @page  {
-    margin: 0.5cm;
-  }
-  p,
-  h2,
-  h3 {
-    orphans: 3;
-    widows: 3;
-  }
-  h2,
-  h3 {
-    page-break-after: avoid;
-  }
-}
-
-.clearfix {
-  *zoom: 1;
-}
-
-.clearfix:before,
-.clearfix:after {
-  display: table;
-  line-height: 0;
-  content: "";
-}
-
-.clearfix:after {
-  clear: both;
-}
-
-.hide-text {
-  font: 0/0 a;
-  color: transparent;
-  text-shadow: none;
-  background-color: transparent;
-  border: 0;
-}
-
-.input-block-level {
-  display: block;
-  width: 100%;
-  min-height: 30px;
-  -webkit-box-sizing: border-box;
-     -moz-box-sizing: border-box;
-          box-sizing: border-box;
-}
-
-body {
-  margin: 0;
-  font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
-  font-size: 14px;
-  line-height: 20px;
-  color: #333333;
-  background-color: #ffffff;
-}
-
-a {
-  color: #0088cc;
-  text-decoration: none;
-}
-
-a:hover {
-  color: #005580;
-  text-decoration: underline;
-}
-
-.img-rounded {
-  -webkit-border-radius: 6px;
-     -moz-border-radius: 6px;
-          border-radius: 6px;
-}
-
-.img-polaroid {
-  padding: 4px;
-  background-color: #fff;
-  border: 1px solid #ccc;
-  border: 1px solid rgba(0, 0, 0, 0.2);
-  -webkit-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
-     -moz-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
-          box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
-}
-
-.img-circle {
-  -webkit-border-radius: 500px;
-     -moz-border-radius: 500px;
-          border-radius: 500px;
-}
-
-.row {
-  margin-left: -20px;
-  *zoom: 1;
-}
-
-.row:before,
-.row:after {
-  display: table;
-  line-height: 0;
-  content: "";
-}
-
-.row:after {
-  clear: both;
-}
-
-[class*="span"] {
-  float: left;
-  min-height: 1px;
-  margin-left: 20px;
-}
-
-.container,
-.navbar-static-top .container,
-.navbar-fixed-top .container,
-.navbar-fixed-bottom .container {
-  width: 940px;
-}
-
-.span12 {
-  width: 940px;
-}
-
-.span11 {
-  width: 860px;
-}
-
-.span10 {
-  width: 780px;
-}
-
-.span9 {
-  width: 700px;
-}
-
-.span8 {
-  width: 620px;
-}
-
-.span7 {
-  width: 540px;
-}
-
-.span6 {
-  width: 460px;
-}
-
-.span5 {
-  width: 380px;
-}
-
-.span4 {
-  width: 300px;
-}
-
-.span3 {
-  width: 220px;
-}
-
-.span2 {
-  width: 140px;
-}
-
-.span1 {
-  width: 60px;
-}
-
-.offset12 {
-  margin-left: 980px;
-}
-
-.offset11 {
-  margin-left: 900px;
-}
-
-.offset10 {
-  margin-left: 820px;
-}
-
-.offset9 {
-  margin-left: 740px;
-}
-
-.offset8 {
-  margin-left: 660px;
-}
-
-.offset7 {
-  margin-left: 580px;
-}
-
-.offset6 {
-  margin-left: 500px;
-}
-
-.offset5 {
-  margin-left: 420px;
-}
-
-.offset4 {
-  margin-left: 340px;
-}
-
-.offset3 {
-  margin-left: 260px;
-}
-
-.offset2 {
-  margin-left: 180px;
-}
-
-.offset1 {
-  margin-left: 100px;
-}
-
-.row-fluid {
-  width: 100%;
-  *zoom: 1;
-}
-
-.row-fluid:before,
-.row-fluid:after {
-  display: table;
-  line-height: 0;
-  content: "";
-}
-
-.row-fluid:after {
-  clear: both;
-}
-
-.row-fluid [class*="span"] {
-  display: block;
-  float: left;
-  width: 100%;
-  min-height: 30px;
-  margin-left: 2.127659574468085%;
-  *margin-left: 2.074468085106383%;
-  -webkit-box-sizing: border-box;
-     -moz-box-sizing: border-box;
-          box-sizing: border-box;
-}
-
-.row-fluid [class*="span"]:first-child {
-  margin-left: 0;
-}
-
-.row-fluid .controls-row [class*="span"] + [class*="span"] {
-  margin-left: 2.127659574468085%;
-}
-
-.row-fluid .span12 {
-  width: 100%;
-  *width: 99.94680851063829%;
-}
-
-.row-fluid .span11 {
-  width: 91.48936170212765%;
-  *width: 91.43617021276594%;
-}
-
-.row-fluid .span10 {
-  width: 82.97872340425532%;
-  *width: 82.92553191489361%;
-}
-
-.row-fluid .span9 {
-  width: 74.46808510638297%;
-  *width: 74.41489361702126%;
-}
-
-.row-fluid .span8 {
-  width: 65.95744680851064%;
-  *width: 65.90425531914893%;
-}
-
-.row-fluid .span7 {
-  width: 57.44680851063829%;
-  *width: 57.39361702127659%;
-}
-
-.row-fluid .span6 {
-  width: 48.93617021276595%;
-  *width: 48.88297872340425%;
-}
-
-.row-fluid .span5 {
-  width: 40.42553191489362%;
-  *width: 40.37234042553192%;
-}
-
-.row-fluid .span4 {
-  width: 31.914893617021278%;
-  *width: 31.861702127659576%;
-}
-
-.row-fluid .span3 {
-  width: 23.404255319148934%;
-  *width: 23.351063829787233%;
-}
-
-.row-fluid .span2 {
-  width: 14.893617021276595%;
-  *width: 14.840425531914894%;
-}
-
-.row-fluid .span1 {
-  width: 6.382978723404255%;
-  *width: 6.329787234042553%;
-}
-
-.row-fluid .offset12 {
-  margin-left: 104.25531914893617%;
-  *margin-left: 104.14893617021275%;
-}
-
-.row-fluid .offset12:first-child {
-  margin-left: 102.12765957446808%;
-  *margin-left: 102.02127659574467%;
-}
-
-.row-fluid .offset11 {
-  margin-left: 95.74468085106382%;
-  *margin-left: 95.6382978723404%;
-}
-
-.row-fluid .offset11:first-child {
-  margin-left: 93.61702127659574%;
-  *margin-left: 93.51063829787232%;
-}
-
-.row-fluid .offset10 {
-  margin-left: 87.23404255319149%;
-  *margin-left: 87.12765957446807%;
-}
-
-.row-fluid .offset10:first-child {
-  margin-left: 85.1063829787234%;
-  *margin-left: 84.99999999999999%;
-}
-
-.row-fluid .offset9 {
-  margin-left: 78.72340425531914%;
-  *margin-left: 78.61702127659572%;
-}
-
-.row-fluid .offset9:first-child {
-  margin-left: 76.59574468085106%;
-  *margin-left: 76.48936170212764%;
-}
-
-.row-fluid .offset8 {
-  margin-left: 70.2127659574468%;
-  *margin-left: 70.10638297872339%;
-}
-
-.row-fluid .offset8:first-child {
-  margin-left: 68.08510638297872%;
-  *margin-left: 67.9787234042553%;
-}
-
-.row-fluid .offset7 {
-  margin-left: 61.70212765957446%;
-  *margin-left: 61.59574468085106%;
-}
-
-.row-fluid .offset7:first-child {
-  margin-left: 59.574468085106375%;
-  *margin-left: 59.46808510638297%;
-}
-
-.row-fluid .offset6 {
-  margin-left: 53.191489361702125%;
-  *margin-left: 53.085106382978715%;
-}
-
-.row-fluid .offset6:first-child {
-  margin-left: 51.063829787234035%;
-  *margin-left: 50.95744680851063%;
-}
-
-.row-fluid .offset5 {
-  margin-left: 44.68085106382979%;
-  *margin-left: 44.57446808510638%;
-}
-
-.row-fluid .offset5:first-child {
-  margin-left: 42.5531914893617%;
-  *margin-left: 42.4468085106383%;
-}
-
-.row-fluid .offset4 {
-  margin-left: 36.170212765957444%;
-  *margin-left: 36.06382978723405%;
-}
-
-.row-fluid .offset4:first-child {
-  margin-left: 34.04255319148936%;
-  *margin-left: 33.93617021276596%;
-}
-
-.row-fluid .offset3 {
-  margin-left: 27.659574468085104%;
-  *margin-left: 27.5531914893617%;
-}
-
-.row-fluid .offset3:first-child {
-  margin-left: 25.53191489361702%;
-  *margin-left: 25.425531914893618%;
-}
-
-.row-fluid .offset2 {
-  margin-left: 19.148936170212764%;
-  *margin-left: 19.04255319148936%;
-}
-
-.row-fluid .offset2:first-child {
-  margin-left: 17.02127659574468%;
-  *margin-left: 16.914893617021278%;
-}
-
-.row-fluid .offset1 {
-  margin-left: 10.638297872340425%;
-  *margin-left: 10.53191489361702%;
-}
-
-.row-fluid .offset1:first-child {
-  margin-left: 8.51063829787234%;
-  *margin-left: 8.404255319148938%;
-}
-
-[class*="span"].hide,
-.row-fluid [class*="span"].hide {
-  display: none;
-}
-
-[class*="span"].pull-right,
-.row-fluid [class*="span"].pull-right {
-  float: right;
-}
-
-.container {
-  margin-right: auto;
-  margin-left: auto;
-  *zoom: 1;
-}
-
-.container:before,
-.container:after {
-  display: table;
-  line-height: 0;
-  content: "";
-}
-
-.container:after {
-  clear: both;
-}
-
-.container-fluid {
-  padding-right: 20px;
-  padding-left: 20px;
-  *zoom: 1;
-}
-
-.container-fluid:before,
-.container-fluid:after {
-  display: table;
-  line-height: 0;
-  content: "";
-}
-
-.container-fluid:after {
-  clear: both;
-}
-
-p {
-  margin: 0 0 10px;
-}
-
-.lead {
-  margin-bottom: 20px;
-  font-size: 21px;
-  font-weight: 200;
-  line-height: 30px;
-}
-
-small {
-  font-size: 85%;
-}
-
-strong {
-  font-weight: bold;
-}
-
-em {
-  font-style: italic;
-}
-
-cite {
-  font-style: normal;
-}
-
-.muted {
-  color: #999999;
-}
-
-a.muted:hover {
-  color: #808080;
-}
-
-.text-warning {
-  color: #c09853;
-}
-
-a.text-warning:hover {
-  color: #a47e3c;
-}
-
-.text-error {
-  color: #b94a48;
-}
-
-a.text-error:hover {
-  color: #953b39;
-}
-
-.text-info {
-  color: #3a87ad;
-}
-
-a.text-info:hover {
-  color: #2d6987;
-}
-
-.text-success {
-  color: #468847;
-}
-
-a.text-success:hover {
-  color: #356635;
-}
-
-h1,
-h2,
-h3,
-h4,
-h5,
-h6 {
-  margin: 10px 0;
-  font-family: inherit;
-  font-weight: bold;
-  line-height: 20px;
-  color: inherit;
-  text-rendering: optimizelegibility;
-}
-
-h1 small,
-h2 small,
-h3 small,
-h4 small,
-h5 small,
-h6 small {
-  font-weight: normal;
-  line-height: 1;
-  color: #999999;
-}
-
-h1,
-h2,
-h3 {
-  line-height: 40px;
-}
-
-h1 {
-  font-size: 38.5px;
-}
-
-h2 {
-  font-size: 31.5px;
-}
-
-h3 {
-  font-size: 24.5px;
-}
-
-h4 {
-  font-size: 17.5px;
-}
-
-h5 {
-  font-size: 14px;
-}
-
-h6 {
-  font-size: 11.9px;
-}
-
-h1 small {
-  font-size: 24.5px;
-}
-
-h2 small {
-  font-size: 17.5px;
-}
-
-h3 small {
-  font-size: 14px;
-}
-
-h4 small {
-  font-size: 14px;
-}
-
-.page-header {
-  padding-bottom: 9px;
-  margin: 20px 0 30px;
-  border-bottom: 1px solid #eeeeee;
-}
-
-ul,
-ol {
-  padding: 0;
-  margin: 0 0 10px 25px;
-}
-
-ul ul,
-ul ol,
-ol ol,
-ol ul {
-  margin-bottom: 0;
-}
-
-li {
-  line-height: 20px;
-}
-
-ul.unstyled,
-ol.unstyled {
-  margin-left: 0;
-  list-style: none;
-}
-
-ul.inline,
-ol.inline {
-  margin-left: 0;
-  list-style: none;
-}
-
-ul.inline > li,
-ol.inline > li {
-  display: inline-block;
-  padding-right: 5px;
-  padding-left: 5px;
-}
-
-dl {
-  margin-bottom: 20px;
-}
-
-dt,
-dd {
-  line-height: 20px;
-}
-
-dt {
-  font-weight: bold;
-}
-
-dd {
-  margin-left: 10px;
-}
-
-.dl-horizontal {
-  *zoom: 1;
-}
-
-.dl-horizontal:before,
-.dl-horizontal:after {
-  display: table;
-  line-height: 0;
-  content: "";
-}
-
-.dl-horizontal:after {
-  clear: both;
-}
-
-.dl-horizontal dt {
-  float: left;
-  width: 160px;
-  overflow: hidden;
-  clear: left;
-  text-align: right;
-  text-overflow: ellipsis;
-  white-space: nowrap;
-}
-
-.dl-horizontal dd {
-  margin-left: 180px;
-}
-
-hr {
-  margin: 20px 0;
-  border: 0;
-  border-top: 1px solid #eeeeee;
-  border-bottom: 1px solid #ffffff;
-}
-
-abbr[title],
-abbr[data-original-title] {
-  cursor: help;
-  border-bottom: 1px dotted #999999;
-}
-
-abbr.initialism {
-  font-size: 90%;
-  text-transform: uppercase;
-}
-
-blockquote {
-  padding: 0 0 0 15px;
-  margin: 0 0 20px;
-  border-left: 5px solid #eeeeee;
-}
-
-blockquote p {
-  margin-bottom: 0;
-  font-size: 16px;
-  font-weight: 300;
-  line-height: 25px;
-}
-
-blockquote small {
-  display: block;
-  line-height: 20px;
-  color: #999999;
-}
-
-blockquote small:before {
-  content: '\2014 \00A0';
-}
-
-blockquote.pull-right {
-  float: right;
-  padding-right: 15px;
-  padding-left: 0;
-  border-right: 5px solid #eeeeee;
-  border-left: 0;
-}
-
-blockquote.pull-right p,
-blockquote.pull-right small {
-  text-align: right;
-}
-
-blockquote.pull-right small:before {
-  content: '';
-}
-
-blockquote.pull-right small:after {
-  content: '\00A0 \2014';
-}
-
-q:before,
-q:after,
-blockquote:before,
-blockquote:after {
-  content: "";
-}
-
-address {
-  display: block;
-  margin-bottom: 20px;
-  font-style: normal;
-  line-height: 20px;
-}
-
-code,
-pre {
-  padding: 0 3px 2px;
-  font-family: Monaco, Menlo, Consolas, "Courier New", monospace;
-  font-size: 12px;
-  color: #333333;
-  -webkit-border-radius: 3px;
-     -moz-border-radius: 3px;
-          border-radius: 3px;
-}
-
-code {
-  padding: 2px 4px;
-  color: #d14;
-  white-space: nowrap;
-  background-color: #f7f7f9;
-  border: 1px solid #e1e1e8;
-}
-
-pre {
-  display: block;
-  padding: 9.5px;
-  margin: 0 0 10px;
-  font-size: 13px;
-  line-height: 20px;
-  word-break: break-all;
-  word-wrap: break-word;
-  white-space: pre;
-  white-space: pre-wrap;
-  background-color: #f5f5f5;
-  border: 1px solid #ccc;
-  border: 1px solid rgba(0, 0, 0, 0.15);
-  -webkit-border-radius: 4px;
-     -moz-border-radius: 4px;
-          border-radius: 4px;
-}
-
-pre.prettyprint {
-  margin-bottom: 20px;
-}
-
-pre code {
-  padding: 0;
-  color: inherit;
-  white-space: pre;
-  white-space: pre-wrap;
-  background-color: transparent;
-  border: 0;
-}
-
-.pre-scrollable {
-  max-height: 340px;
-  overflow-y: scroll;
-}
-
-form {
-  margin: 0 0 20px;
-}
-
-fieldset {
-  padding: 0;
-  margin: 0;
-  border: 0;
-}
-
-legend {
-  display: block;
-  width: 100%;
-  padding: 0;
-  margin-bottom: 20px;
-  font-size: 21px;
-  line-height: 40px;
-  color: #333333;
-  border: 0;
-  border-bottom: 1px solid #e5e5e5;
-}
-
-legend small {
-  font-size: 15px;
-  color: #999999;
-}
-
-label,
-input,
-button,
-select,
-textarea {
-  font-size: 14px;
-  font-weight: normal;
-  line-height: 20px;
-}
-
-input,
-button,
-select,
-textarea {
-  font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
-}
-
-label {
-  display: block;
-  margin-bottom: 5px;
-}
-
-select,
-textarea,
-input[type="text"],
-input[type="password"],
-input[type="datetime"],
-input[type="datetime-local"],
-input[type="date"],
-input[type="month"],
-input[type="time"],
-input[type="week"],
-input[type="number"],
-input[type="email"],
-input[type="url"],
-input[type="search"],
-input[type="tel"],
-input[type="color"],
-.uneditable-input {
-  display: inline-block;
-  height: 20px;
-  padding: 4px 6px;
-  margin-bottom: 10px;
-  font-size: 14px;
-  line-height: 20px;
-  color: #555555;
-  vertical-align: middle;
-  -webkit-border-radius: 4px;
-     -moz-border-radius: 4px;
-          border-radius: 4px;
-}
-
-input,
-textarea,
-.uneditable-input {
-  width: 206px;
-}
-
-textarea {
-  height: auto;
-}
-
-textarea,
-input[type="text"],
-input[type="password"],
-input[type="datetime"],
-input[type="datetime-local"],
-input[type="date"],
-input[type="month"],
-input[type="time"],
-input[type="week"],
-input[type="number"],
-input[type="email"],
-input[type="url"],
-input[type="search"],
-input[type="tel"],
-input[type="color"],
-.uneditable-input {
-  background-color: #ffffff;
-  border: 1px solid #cccccc;
-  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
-     -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
-          box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
-  -webkit-transition: border linear 0.2s, box-shadow linear 0.2s;
-     -moz-transition: border linear 0.2s, box-shadow linear 0.2s;
-       -o-transition: border linear 0.2s, box-shadow linear 0.2s;
-          transition: border linear 0.2s, box-shadow linear 0.2s;
-}
-
-textarea:focus,
-input[type="text"]:focus,
-input[type="password"]:focus,
-input[type="datetime"]:focus,
-input[type="datetime-local"]:focus,
-input[type="date"]:focus,
-input[type="month"]:focus,
-input[type="time"]:focus,
-input[type="week"]:focus,
-input[type="number"]:focus,
-input[type="email"]:focus,
-input[type="url"]:focus,
-input[type="search"]:focus,
-input[type="tel"]:focus,
-input[type="color"]:focus,
-.uneditable-input:focus {
-  border-color: rgba(82, 168, 236, 0.8);
-  outline: 0;
-  outline: thin dotted \9;
-  /* IE6-9 */
-
-  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(82, 168, 236, 0.6);
-     -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(82, 168, 236, 0.6);
-          box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(82, 168, 236, 0.6);
-}
-
-input[type="radio"],
-input[type="checkbox"] {
-  margin: 4px 0 0;
-  margin-top: 1px \9;
-  *margin-top: 0;
-  line-height: normal;
-}
-
-input[type="file"],
-input[type="image"],
-input[type="submit"],
-input[type="reset"],
-input[type="button"],
-input[type="radio"],
-input[type="checkbox"] {
-  width: auto;
-}
-
-select,
-input[type="file"] {
-  height: 30px;
-  /* In IE7, the height of the select element cannot be changed by height, only font-size */
-
-  *margin-top: 4px;
-  /* For IE7, add top margin to align select with labels */
-
-  line-height: 30px;
-}
-
-select {
-  width: 220px;
-  background-color: #ffffff;
-  border: 1px solid #cccccc;
-}
-
-select[multiple],
-select[size] {
-  height: auto;
-}
-
-select:focus,
-input[type="file"]:focus,
-input[type="radio"]:focus,
-input[type="checkbox"]:focus {
-  outline: thin dotted #333;
-  outline: 5px auto -webkit-focus-ring-color;
-  outline-offset: -2px;
-}
-
-.uneditable-input,
-.uneditable-textarea {
-  color: #999999;
-  cursor: not-allowed;
-  background-color: #fcfcfc;
-  border-color: #cccccc;
-  -webkit-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.025);
-     -moz-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.025);
-          box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.025);
-}
-
-.uneditable-input {
-  overflow: hidden;
-  white-space: nowrap;
-}
-
-.uneditable-textarea {
-  width: auto;
-  height: auto;
-}
-
-input:-moz-placeholder,
-textarea:-moz-placeholder {
-  color: #999999;
-}
-
-input:-ms-input-placeholder,
-textarea:-ms-input-placeholder {
-  color: #999999;
-}
-
-input::-webkit-input-placeholder,
-textarea::-webkit-input-placeholder {
-  color: #999999;
-}
-
-.radio,
-.checkbox {
-  min-height: 20px;
-  padding-left: 20px;
-}
-
-.radio input[type="radio"],
-.checkbox input[type="checkbox"] {
-  float: left;
-  margin-left: -20px;
-}
-
-.controls > .radio:first-child,
-.controls > .checkbox:first-child {
-  padding-top: 5px;
-}
-
-.radio.inline,
-.checkbox.inline {
-  display: inline-block;
-  padding-top: 5px;
-  margin-bottom: 0;
-  vertical-align: middle;
-}
-
-.radio.inline + .radio.inline,
-.checkbox.inline + .checkbox.inline {
-  margin-left: 10px;
-}
-
-.input-mini {
-  width: 60px;
-}
-
-.input-small {
-  width: 90px;
-}
-
-.input-medium {
-  width: 150px;
-}
-
-.input-large {
-  width: 210px;
-}
-
-.input-xlarge {
-  width: 270px;
-}
-
-.input-xxlarge {
-  width: 530px;
-}
-
-input[class*="span"],
-select[class*="span"],
-textarea[class*="span"],
-.uneditable-input[class*="span"],
-.row-fluid input[class*="span"],
-.row-fluid select[class*="span"],
-.row-fluid textarea[class*="span"],
-.row-fluid .uneditable-input[class*="span"] {
-  float: none;
-  margin-left: 0;
-}
-
-.input-append input[class*="span"],
-.input-append .uneditable-input[class*="span"],
-.input-prepend input[class*="span"],
-.input-prepend .uneditable-input[class*="span"],
-.row-fluid input[class*="span"],
-.row-fluid select[class*="span"],
-.row-fluid textarea[class*="span"],
-.row-fluid .uneditable-input[class*="span"],
-.row-fluid .input-prepend [class*="span"],
-.row-fluid .input-append [class*="span"] {
-  display: inline-block;
-}
-
-input,
-textarea,
-.uneditable-input {
-  margin-left: 0;
-}
-
-.controls-row [class*="span"] + [class*="span"] {
-  margin-left: 20px;
-}
-
-input.span12,
-textarea.span12,
-.uneditable-input.span12 {
-  width: 926px;
-}
-
-input.span11,
-textarea.span11,
-.uneditable-input.span11 {
-  width: 846px;
-}
-
-input.span10,
-textarea.span10,
-.uneditable-input.span10 {
-  width: 766px;
-}
-
-input.span9,
-textarea.span9,
-.uneditable-input.span9 {
-  width: 686px;
-}
-
-input.span8,
-textarea.span8,
-.uneditable-input.span8 {
-  width: 606px;
-}
-
-input.span7,
-textarea.span7,
-.uneditable-input.span7 {
-  width: 526px;
-}
-
-input.span6,
-textarea.span6,
-.uneditable-input.span6 {
-  width: 446px;
-}
-
-input.span5,
-textarea.span5,
-.uneditable-input.span5 {
-  width: 366px;
-}
-
-input.span4,
-textarea.span4,
-.uneditable-input.span4 {
-  width: 286px;
-}
-
-input.span3,
-textarea.span3,
-.uneditable-input.span3 {
-  width: 206px;
-}
-
-input.span2,
-textarea.span2,
-.uneditable-input.span2 {
-  width: 126px;
-}
-
-input.span1,
-textarea.span1,
-.uneditable-input.span1 {
-  width: 46px;
-}
-
-.controls-row {
-  *zoom: 1;
-}
-
-.controls-row:before,
-.controls-row:after {
-  display: table;
-  line-height: 0;
-  content: "";
-}
-
-.controls-row:after {
-  clear: both;
-}
-
-.controls-row [class*="span"],
-.row-fluid .controls-row [class*="span"] {
-  float: left;
-}
-
-.controls-row .checkbox[class*="span"],
-.controls-row .radio[class*="span"] {
-  padding-top: 5px;
-}
-
-input[disabled],
-select[disabled],
-textarea[disabled],
-input[readonly],
-select[readonly],
-textarea[readonly] {
-  cursor: not-allowed;
-  background-color: #eeeeee;
-}
-
-input[type="radio"][disabled],
-input[type="checkbox"][disabled],
-input[type="radio"][readonly],
-input[type="checkbox"][readonly] {
-  background-color: transparent;
-}
-
-.control-group.warning .control-label,
-.control-group.warning .help-block,
-.control-group.warning .help-inline {
-  color: #c09853;
-}
-
-.control-group.warning .checkbox,
-.control-group.warning .radio,
-.control-group.warning input,
-.control-group.warning select,
-.control-group.warning textarea {
-  color: #c09853;
-}
-
-.control-group.warning input,
-.control-group.warning select,
-.control-group.warning textarea {
-  border-color: #c09853;
-  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
-     -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
-          box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
-}
-
-.control-group.warning input:focus,
-.control-group.warning select:focus,
-.control-group.warning textarea:focus {
-  border-color: #a47e3c;
-  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #dbc59e;
-     -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #dbc59e;
-          box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #dbc59e;
-}
-
-.control-group.warning .input-prepend .add-on,
-.control-group.warning .input-append .add-on {
-  color: #c09853;
-  background-color: #fcf8e3;
-  border-color: #c09853;
-}
-
-.control-group.error .control-label,
-.control-group.error .help-block,
-.control-group.error .help-inline {
-  color: #b94a48;
-}
-
-.control-group.error .checkbox,
-.control-group.error .radio,
-.control-group.error input,
-.control-group.error select,
-.control-group.error textarea {
-  color: #b94a48;
-}
-
-.control-group.error input,
-.control-group.error select,
-.control-group.error textarea {
-  border-color: #b94a48;
-  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
-     -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
-          box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
-}
-
-.control-group.error input:focus,
-.control-group.error select:focus,
-.control-group.error textarea:focus {
-  border-color: #953b39;
-  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #d59392;
-     -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #d59392;
-          box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #d59392;
-}
-
-.control-group.error .input-prepend .add-on,
-.control-group.error .input-append .add-on {
-  color: #b94a48;
-  background-color: #f2dede;
-  border-color: #b94a48;
-}
-
-.control-group.success .control-label,
-.control-group.success .help-block,
-.control-group.success .help-inline {
-  color: #468847;
-}
-
-.control-group.success .checkbox,
-.control-group.success .radio,
-.control-group.success input,
-.control-group.success select,
-.control-group.success textarea {
-  color: #468847;
-}
-
-.control-group.success input,
-.control-group.success select,
-.control-group.success textarea {
-  border-color: #468847;
-  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
-     -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
-          box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
-}
-
-.control-group.success input:focus,
-.control-group.success select:focus,
-.control-group.success textarea:focus {
-  border-color: #356635;
-  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #7aba7b;
-     -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #7aba7b;
-          box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #7aba7b;
-}
-
-.control-group.success .input-prepend .add-on,
-.control-group.success .input-append .add-on {
-  color: #468847;
-  background-color: #dff0d8;
-  border-color: #468847;
-}
-
-.control-group.info .control-label,
-.control-group.info .help-block,
-.control-group.info .help-inline {
-  color: #3a87ad;
-}
-
-.control-group.info .checkbox,
-.control-group.info .radio,
-.control-group.info input,
-.control-group.info select,
-.control-group.info textarea {
-  color: #3a87ad;
-}
-
-.control-group.info input,
-.control-group.info select,
-.control-group.info textarea {
-  border-color: #3a87ad;
-  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
-     -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
-          box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
-}
-
-.control-group.info input:focus,
-.control-group.info select:focus,
-.control-group.info textarea:focus {
-  border-color: #2d6987;
-  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #7ab5d3;
-     -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #7ab5d3;
-          box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #7ab5d3;
-}
-
-.control-group.info .input-prepend .add-on,
-.control-group.info .input-append .add-on {
-  color: #3a87ad;
-  background-color: #d9edf7;
-  border-color: #3a87ad;
-}
-
-input:focus:invalid,
-textarea:focus:invalid,
-select:focus:invalid {
-  color: #b94a48;
-  border-color: #ee5f5b;
-}
-
-input:focus:invalid:focus,
-textarea:focus:invalid:focus,
-select:focus:invalid:focus {
-  border-color: #e9322d;
-  -webkit-box-shadow: 0 0 6px #f8b9b7;
-     -moz-box-shadow: 0 0 6px #f8b9b7;
-          box-shadow: 0 0 6px #f8b9b7;
-}
-
-.form-actions {
-  padding: 19px 20px 20px;
-  margin-top: 20px;
-  margin-bottom: 20px;
-  background-color: #f5f5f5;
-  border-top: 1px solid #e5e5e5;
-  *zoom: 1;
-}
-
-.form-actions:before,
-.form-actions:after {
-  display: table;
-  line-height: 0;
-  content: "";
-}
-
-.form-actions:after {
-  clear: both;
-}
-
-.help-block,
-.help-inline {
-  color: #595959;
-}
-
-.help-block {
-  display: block;
-  margin-bottom: 10px;
-}
-
-.help-inline {
-  display: inline-block;
-  *display: inline;
-  padding-left: 5px;
-  vertical-align: middle;
-  *zoom: 1;
-}
-
-.input-append,
-.input-prepend {
-  margin-bottom: 5px;
-  font-size: 0;
-  white-space: nowrap;
-}
-
-.input-append input,
-.input-prepend input,
-.input-append select,
-.input-prepend select,
-.input-append .uneditable-input,
-.input-prepend .uneditable-input,
-.input-append .dropdown-menu,
-.input-prepend .dropdown-menu {
-  font-size: 14px;
-}
-
-.input-append input,
-.input-prepend input,
-.input-append select,
-.input-prepend select,
-.input-append .uneditable-input,
-.input-prepend .uneditable-input {
-  position: relative;
-  margin-bottom: 0;
-  *margin-left: 0;
-  vertical-align: top;
-  -webkit-border-radius: 0 4px 4px 0;
-     -moz-border-radius: 0 4px 4px 0;
-          border-radius: 0 4px 4px 0;
-}
-
-.input-append input:focus,
-.input-prepend input:focus,
-.input-append select:focus,
-.input-prepend select:focus,
-.input-append .uneditable-input:focus,
-.input-prepend .uneditable-input:focus {
-  z-index: 2;
-}
-
-.input-append .add-on,
-.input-prepend .add-on {
-  display: inline-block;
-  width: auto;
-  height: 20px;
-  min-width: 16px;
-  padding: 4px 5px;
-  font-size: 14px;
-  font-weight: normal;
-  line-height: 20px;
-  text-align: center;
-  text-shadow: 0 1px 0 #ffffff;
-  background-color: #eeeeee;
-  border: 1px solid #ccc;
-}
-
-.input-append .add-on,
-.input-prepend .add-on,
-.input-append .btn,
-.input-prepend .btn,
-.input-append .btn-group > .dropdown-toggle,
-.input-prepend .btn-group > .dropdown-toggle {
-  vertical-align: top;
-  -webkit-border-radius: 0;
-     -moz-border-radius: 0;
-          border-radius: 0;
-}
-
-.input-append .active,
-.input-prepend .active {
-  background-color: #a9dba9;
-  border-color: #46a546;
-}
-
-.input-prepend .add-on,
-.input-prepend .btn {
-  margin-right: -1px;
-}
-
-.input-prepend .add-on:first-child,
-.input-prepend .btn:first-child {
-  -webkit-border-radius: 4px 0 0 4px;
-     -moz-border-radius: 4px 0 0 4px;
-          border-radius: 4px 0 0 4px;
-}
-
-.input-append input,
-.input-append select,
-.input-append .uneditable-input {
-  -webkit-border-radius: 4px 0 0 4px;
-     -moz-border-radius: 4px 0 0 4px;
-          border-radius: 4px 0 0 4px;
-}
-
-.input-append input + .btn-group .btn:last-child,
-.input-append select + .btn-group .btn:last-child,
-.input-append .uneditable-input + .btn-group .btn:last-child {
-  -webkit-border-radius: 0 4px 4px 0;
-     -moz-border-radius: 0 4px 4px 0;
-          border-radius: 0 4px 4px 0;
-}
-
-.input-append .add-on,
-.input-append .btn,
-.input-append .btn-group {
-  margin-left: -1px;
-}
-
-.input-append .add-on:last-child,
-.input-append .btn:last-child,
-.input-append .btn-group:last-child > .dropdown-toggle {
-  -webkit-border-radius: 0 4px 4px 0;
-     -moz-border-radius: 0 4px 4px 0;
-          border-radius: 0 4px 4px 0;
-}
-
-.input-prepend.input-append input,
-.input-prepend.input-append select,
-.input-prepend.input-append .uneditable-input {
-  -webkit-border-radius: 0;
-     -moz-border-radius: 0;
-          border-radius: 0;
-}
-
-.input-prepend.input-append input + .btn-group .btn,
-.input-prepend.input-append select + .btn-group .btn,
-.input-prepend.input-append .uneditable-input + .btn-group .btn {
-  -webkit-border-radius: 0 4px 4px 0;
-     -moz-border-radius: 0 4px 4px 0;
-          border-radius: 0 4px 4px 0;
-}
-
-.input-prepend.input-append .add-on:first-child,
-.input-prepend.input-append .btn:first-child {
-  margin-right: -1px;
-  -webkit-border-radius: 4px 0 0 4px;
-     -moz-border-radius: 4px 0 0 4px;
-          border-radius: 4px 0 0 4px;
-}
-
-.input-prepend.input-append .add-on:last-child,
-.input-prepend.input-append .btn:last-child {
-  margin-left: -1px;
-  -webkit-border-radius: 0 4px 4px 0;
-     -moz-border-radius: 0 4px 4px 0;
-          border-radius: 0 4px 4px 0;
-}
-
-.input-prepend.input-append .btn-group:first-child {
-  margin-left: 0;
-}
-
-input.search-query {
-  padding-right: 14px;
-  padding-right: 4px \9;
-  padding-left: 14px;
-  padding-left: 4px \9;
-  /* IE7-8 doesn't have border-radius, so don't indent the padding */
-
-  margin-bottom: 0;
-  -webkit-border-radius: 15px;
-     -moz-border-radius: 15px;
-          border-radius: 15px;
-}
-
-/* Allow for input prepend/append in search forms */
-
-.form-search .input-append .search-query,
-.form-search .input-prepend .search-query {
-  -webkit-border-radius: 0;
-     -moz-border-radius: 0;
-          border-radius: 0;
-}
-
-.form-search .input-append .search-query {
-  -webkit-border-radius: 14px 0 0 14px;
-     -moz-border-radius: 14px 0 0 14px;
-          border-radius: 14px 0 0 14px;
-}
-
-.form-search .input-append .btn {
-  -webkit-border-radius: 0 14px 14px 0;
-     -moz-border-radius: 0 14px 14px 0;
-          border-radius: 0 14px 14px 0;
-}
-
-.form-search .input-prepend .search-query {
-  -webkit-border-radius: 0 14px 14px 0;
-     -moz-border-radius: 0 14px 14px 0;
-          border-radius: 0 14px 14px 0;
-}
-
-.form-search .input-prepend .btn {
-  -webkit-border-radius: 14px 0 0 14px;
-     -moz-border-radius: 14px 0 0 14px;
-          border-radius: 14px 0 0 14px;
-}
-
-.form-search input,
-.form-inline input,
-.form-horizontal input,
-.form-search textarea,
-.form-inline textarea,
-.form-horizontal textarea,
-.form-search select,
-.form-inline select,
-.form-horizontal select,
-.form-search .help-inline,
-.form-inline .help-inline,
-.form-horizontal .help-inline,
-.form-search .uneditable-input,
-.form-inline .uneditable-input,
-.form-horizontal .uneditable-input,
-.form-search .input-prepend,
-.form-inline .input-prepend,
-.form-horizontal .input-prepend,
-.form-search .input-append,
-.form-inline .input-append,
-.form-horizontal .input-append {
-  display: inline-block;
-  *display: inline;
-  margin-bottom: 0;
-  vertical-align: middle;
-  *zoom: 1;
-}
-
-.form-search .hide,
-.form-inline .hide,
-.form-horizontal .hide {
-  display: none;
-}
-
-.form-search label,
-.form-inline label,
-.form-search .btn-group,
-.form-inline .btn-group {
-  display: inline-block;
-}
-
-.form-search .input-append,
-.form-inline .input-append,
-.form-search .input-prepend,
-.form-inline .input-prepend {
-  margin-bottom: 0;
-}
-
-.form-search .radio,
-.form-search .checkbox,
-.form-inline .radio,
-.form-inline .checkbox {
-  padding-left: 0;
-  margin-bottom: 0;
-  vertical-align: middle;
-}
-
-.form-search .radio input[type="radio"],
-.form-search .checkbox input[type="checkbox"],
-.form-inline .radio input[type="radio"],
-.form-inline .checkbox input[type="checkbox"] {
-  float: left;
-  margin-right: 3px;
-  margin-left: 0;
-}
-
-.control-group {
-  margin-bottom: 10px;
-}
-
-legend + .control-group {
-  margin-top: 20px;
-  -webkit-margin-top-collapse: separate;
-}
-
-.form-horizontal .control-group {
-  margin-bottom: 20px;
-  *zoom: 1;
-}
-
-.form-horizontal .control-group:before,
-.form-horizontal .control-group:after {
-  display: table;
-  line-height: 0;
-  content: "";
-}
-
-.form-horizontal .control-group:after {
-  clear: both;
-}
-
-.form-horizontal .control-label {
-  float: left;
-  width: 160px;
-  padding-top: 5px;
-  text-align: right;
-}
-
-.form-horizontal .controls {
-  *display: inline-block;
-  *padding-left: 20px;
-  margin-left: 180px;
-  *margin-left: 0;
-}
-
-.form-horizontal .controls:first-child {
-  *padding-left: 180px;
-}
-
-.form-horizontal .help-block {
-  margin-bottom: 0;
-}
-
-.form-horizontal input + .help-block,
-.form-horizontal select + .help-block,
-.form-horizontal textarea + .help-block,
-.form-horizontal .uneditable-input + .help-block,
-.form-horizontal .input-prepend + .help-block,
-.form-horizontal .input-append + .help-block {
-  margin-top: 10px;
-}
-
-.form-horizontal .form-actions {
-  padding-left: 180px;
-}
-
-table {
-  max-width: 100%;
-  background-color: transparent;
-  border-collapse: collapse;
-  border-spacing: 0;
-}
-
-.table {
-  width: 100%;
-  margin-bottom: 20px;
-}
-
-.table th,
-.table td {
-  padding: 8px;
-  line-height: 20px;
-  text-align: left;
-  vertical-align: top;
-  border-top: 1px solid #dddddd;
-}
-
-.table th {
-  font-weight: bold;
-}
-
-.table thead th {
-  vertical-align: bottom;
-}
-
-.table caption + thead tr:first-child th,
-.table caption + thead tr:first-child td,
-.table colgroup + thead tr:first-child th,
-.table colgroup + thead tr:first-child td,
-.table thead:first-child tr:first-child th,
-.table thead:first-child tr:first-child td {
-  border-top: 0;
-}
-
-.table tbody + tbody {
-  border-top: 2px solid #dddddd;
-}
-
-.table .table {
-  background-color: #ffffff;
-}
-
-.table-condensed th,
-.table-condensed td {
-  padding: 4px 5px;
-}
-
-.table-bordered {
-  border: 1px solid #dddddd;
-  border-collapse: separate;
-  *border-collapse: collapse;
-  border-left: 0;
-  -webkit-border-radius: 4px;
-     -moz-border-radius: 4px;
-          border-radius: 4px;
-}
-
-.table-bordered th,
-.table-bordered td {
-  border-left: 1px solid #dddddd;
-}
-
-.table-bordered caption + thead tr:first-child th,
-.table-bordered caption + tbody tr:first-child th,
-.table-bordered caption + tbody tr:first-child td,
-.table-bordered colgroup + thead tr:first-child th,
-.table-bordered colgroup + tbody tr:first-child th,
-.table-bordered colgroup + tbody tr:first-child td,
-.table-bordered thead:first-child tr:first-child th,
-.table-bordered tbody:first-child tr:first-child th,
-.table-bordered tbody:first-child tr:first-child td {
-  border-top: 0;
-}
-
-.table-bordered thead:first-child tr:first-child > th:first-child,
-.table-bordered tbody:first-child tr:first-child > td:first-child {
-  -webkit-border-top-left-radius: 4px;
-          border-top-left-radius: 4px;
-  -moz-border-radius-topleft: 4px;
-}
-
-.table-bordered thead:first-child tr:first-child > th:last-child,
-.table-bordered tbody:first-child tr:first-child > td:last-child {
-  -webkit-border-top-right-radius: 4px;
-          border-top-right-radius: 4px;
-  -moz-border-radius-topright: 4px;
-}
-
-.table-bordered thead:last-child tr:last-child > th:first-child,
-.table-bordered tbody:last-child tr:last-child > td:first-child,
-.table-bordered tfoot:last-child tr:last-child > td:first-child {
-  -webkit-border-bottom-left-radius: 4px;
-          border-bottom-left-radius: 4px;
-  -moz-border-radius-bottomleft: 4px;
-}
-
-.table-bordered thead:last-child tr:last-child > th:last-child,
-.table-bordered tbody:last-child tr:last-child > td:last-child,
-.table-bordered tfoot:last-child tr:last-child > td:last-child {
-  -webkit-border-bottom-right-radius: 4px;
-          border-bottom-right-radius: 4px;
-  -moz-border-radius-bottomright: 4px;
-}
-
-.table-bordered tfoot + tbody:last-child tr:last-child td:first-child {
-  -webkit-border-bottom-left-radius: 0;
-          border-bottom-left-radius: 0;
-  -moz-border-radius-bottomleft: 0;
-}
-
-.table-bordered tfoot + tbody:last-child tr:last-child td:last-child {
-  -webkit-border-bottom-right-radius: 0;
-          border-bottom-right-radius: 0;
-  -moz-border-radius-bottomright: 0;
-}
-
-.table-bordered caption + thead tr:first-child th:first-child,
-.table-bordered caption + tbody tr:first-child td:first-child,
-.table-bordered colgroup + thead tr:first-child th:first-child,
-.table-bordered colgroup + tbody tr:first-child td:first-child {
-  -webkit-border-top-left-radius: 4px;
-          border-top-left-radius: 4px;
-  -moz-border-radius-topleft: 4px;
-}
-
-.table-bordered caption + thead tr:first-child th:last-child,
-.table-bordered caption + tbody tr:first-child td:last-child,
-.table-bordered colgroup + thead tr:first-child th:last-child,
-.table-bordered colgroup + tbody tr:first-child td:last-child {
-  -webkit-border-top-right-radius: 4px;
-          border-top-right-radius: 4px;
-  -moz-border-radius-topright: 4px;
-}
-
-.table-striped tbody > tr:nth-child(odd) > td,
-.table-striped tbody > tr:nth-child(odd) > th {
-  background-color: #f9f9f9;
-}
-
-.table-hover tbody tr:hover td,
-.table-hover tbody tr:hover th {
-  background-color: #f5f5f5;
-}
-
-table td[class*="span"],
-table th[class*="span"],
-.row-fluid table td[class*="span"],
-.row-fluid table th[class*="span"] {
-  display: table-cell;
-  float: none;
-  margin-left: 0;
-}
-
-.table td.span1,
-.table th.span1 {
-  float: none;
-  width: 44px;
-  margin-left: 0;
-}
-
-.table td.span2,
-.table th.span2 {
-  float: none;
-  width: 124px;
-  margin-left: 0;
-}
-
-.table td.span3,
-.table th.span3 {
-  float: none;
-  width: 204px;
-  margin-left: 0;
-}
-
-.table td.span4,
-.table th.span4 {
-  float: none;
-  width: 284px;
-  margin-left: 0;
-}
-
-.table td.span5,
-.table th.span5 {
-  float: none;
-  width: 364px;
-  margin-left: 0;
-}
-
-.table td.span6,
-.table th.span6 {
-  float: none;
-  width: 444px;
-  margin-left: 0;
-}
-
-.table td.span7,
-.table th.span7 {
-  float: none;
-  width: 524px;
-  margin-left: 0;
-}
-
-.table td.span8,
-.table th.span8 {
-  float: none;
-  width: 604px;
-  margin-left: 0;
-}
-
-.table td.span9,
-.table th.span9 {
-  float: none;
-  width: 684px;
-  margin-left: 0;
-}
-
-.table td.span10,
-.table th.span10 {
-  float: none;
-  width: 764px;
-  margin-left: 0;
-}
-
-.table td.span11,
-.table th.span11 {
-  float: none;
-  width: 844px;
-  margin-left: 0;
-}
-
-.table td.span12,
-.table th.span12 {
-  float: none;
-  width: 924px;
-  margin-left: 0;
-}
-
-.table tbody tr.success td {
-  background-color: #dff0d8;
-}
-
-.table tbody tr.error td {
-  background-color: #f2dede;
-}
-
-.table tbody tr.warning td {
-  background-color: #fcf8e3;
-}
-
-.table tbody tr.info td {
-  background-color: #d9edf7;
-}
-
-.table-hover tbody tr.success:hover td {
-  background-color: #d0e9c6;
-}
-
-.table-hover tbody tr.error:hover td {
-  background-color: #ebcccc;
-}
-
-.table-hover tbody tr.warning:hover td {
-  background-color: #faf2cc;
-}
-
-.table-hover tbody tr.info:hover td {
-  background-color: #c4e3f3;
-}
-
-[class^="icon-"],
-[class*=" icon-"] {
-  display: inline-block;
-  width: 14px;
-  height: 14px;
-  margin-top: 1px;
-  *margin-right: .3em;
-  line-height: 14px;
-  vertical-align: text-top;
-  background-image: url("../images/glyphicons-halflings.png");
-  background-position: 14px 14px;
-  background-repeat: no-repeat;
-}
-
-/* White icons with optional class, or on hover/active states of certain elements */
-
-.icon-white,
-.nav-pills > .active > a > [class^="icon-"],
-.nav-pills > .active > a > [class*=" icon-"],
-.nav-list > .active > a > [class^="icon-"],
-.nav-list > .active > a > [class*=" icon-"],
-.navbar-inverse .nav > .active > a > [class^="icon-"],
-.navbar-inverse .nav > .active > a > [class*=" icon-"],
-.dropdown-menu > li > a:hover > [class^="icon-"],
-.dropdown-menu > li > a:hover > [class*=" icon-"],
-.dropdown-menu > .active > a > [class^="icon-"],
-.dropdown-menu > .active > a > [class*=" icon-"],
-.dropdown-submenu:hover > a > [class^="icon-"],
-.dropdown-submenu:hover > a > [class*=" icon-"] {
-  background-image: url("../images/glyphicons-halflings-white.png");
-}
-
-.icon-glass {
-  background-position: 0      0;
-}
-
-.icon-music {
-  background-position: -24px 0;
-}
-
-.icon-search {
-  background-position: -48px 0;
-}
-
-.icon-envelope {
-  background-position: -72px 0;
-}
-
-.icon-heart {
-  background-position: -96px 0;
-}
-
-.icon-star {
-  background-position: -120px 0;
-}
-
-.icon-star-empty {
-  background-position: -144px 0;
-}
-
-.icon-user {
-  background-position: -168px 0;
-}
-
-.icon-film {
-  background-position: -192px 0;
-}
-
-.icon-th-large {
-  background-position: -216px 0;
-}
-
-.icon-th {
-  background-position: -240px 0;
-}
-
-.icon-th-list {
-  background-position: -264px 0;
-}
-
-.icon-ok {
-  background-position: -288px 0;
-}
-
-.icon-remove {
-  background-position: -312px 0;
-}
-
-.icon-zoom-in {
-  background-position: -336px 0;
-}
-
-.icon-zoom-out {
-  background-position: -360px 0;
-}
-
-.icon-off {
-  background-position: -384px 0;
-}
-
-.icon-signal {
-  background-position: -408px 0;
-}
-
-.icon-cog {
-  background-position: -432px 0;
-}
-
-.icon-trash {
-  background-position: -456px 0;
-}
-
-.icon-home {
-  background-position: 0 -24px;
-}
-
-.icon-file {
-  background-position: -24px -24px;
-}
-
-.icon-time {
-  background-position: -48px -24px;
-}
-
-.icon-road {
-  background-position: -72px -24px;
-}
-
-.icon-download-alt {
-  background-position: -96px -24px;
-}
-
-.icon-download {
-  background-position: -120px -24px;
-}
-
-.icon-upload {
-  background-position: -144px -24px;
-}
-
-.icon-inbox {
-  background-position: -168px -24px;
-}
-
-.icon-play-circle {
-  background-position: -192px -24px;
-}
-
-.icon-repeat {
-  background-position: -216px -24px;
-}
-
-.icon-refresh {
-  background-position: -240px -24px;
-}
-
-.icon-list-alt {
-  background-position: -264px -24px;
-}
-
-.icon-lock {
-  background-position: -287px -24px;
-}
-
-.icon-flag {
-  background-position: -312px -24px;
-}
-
-.icon-headphones {
-  background-position: -336px -24px;
-}
-
-.icon-volume-off {
-  background-position: -360px -24px;
-}
-
-.icon-volume-down {
-  background-position: -384px -24px;
-}
-
-.icon-volume-up {
-  background-position: -408px -24px;
-}
-
-.icon-qrcode {
-  background-position: -432px -24px;
-}
-
-.icon-barcode {
-  background-position: -456px -24px;
-}
-
-.icon-tag {
-  background-position: 0 -48px;
-}
-
-.icon-tags {
-  background-position: -25px -48px;
-}
-
-.icon-book {
-  background-position: -48px -48px;
-}
-
-.icon-bookmark {
-  background-position: -72px -48px;
-}
-
-.icon-print {
-  background-position: -96px -48px;
-}
-
-.icon-camera {
-  background-position: -120px -48px;
-}
-
-.icon-font {
-  background-position: -144px -48px;
-}
-
-.icon-bold {
-  background-position: -167px -48px;
-}
-
-.icon-italic {
-  background-position: -192px -48px;
-}
-
-.icon-text-height {
-  background-position: -216px -48px;
-}
-
-.icon-text-width {
-  background-position: -240px -48px;
-}
-
-.icon-align-left {
-  background-position: -264px -48px;
-}
-
-.icon-align-center {
-  background-position: -288px -48px;
-}
-
-.icon-align-right {
-  background-position: -312px -48px;
-}
-
-.icon-align-justify {
-  background-position: -336px -48px;
-}
-
-.icon-list {
-  background-position: -360px -48px;
-}
-
-.icon-indent-left {
-  background-position: -384px -48px;
-}
-
-.icon-indent-right {
-  background-position: -408px -48px;
-}
-
-.icon-facetime-video {
-  background-position: -432px -48px;
-}
-
-.icon-picture {
-  background-position: -456px -48px;
-}
-
-.icon-pencil {
-  background-position: 0 -72px;
-}
-
-.icon-map-marker {
-  background-position: -24px -72px;
-}
-
-.icon-adjust {
-  background-position: -48px -72px;
-}
-
-.icon-tint {
-  background-position: -72px -72px;
-}
-
-.icon-edit {
-  background-position: -96px -72px;
-}
-
-.icon-share {
-  background-position: -120px -72px;
-}
-
-.icon-check {
-  background-position: -144px -72px;
-}
-
-.icon-move {
-  background-position: -168px -72px;
-}
-
-.icon-step-backward {
-  background-position: -192px -72px;
-}
-
-.icon-fast-backward {
-  background-position: -216px -72px;
-}
-
-.icon-backward {
-  background-position: -240px -72px;
-}
-
-.icon-play {
-  background-position: -264px -72px;
-}
-
-.icon-pause {
-  background-position: -288px -72px;
-}
-
-.icon-stop {
-  background-position: -312px -72px;
-}
-
-.icon-forward {
-  background-position: -336px -72px;
-}
-
-.icon-fast-forward {
-  background-position: -360px -72px;
-}
-
-.icon-step-forward {
-  background-position: -384px -72px;
-}
-
-.icon-eject {
-  background-position: -408px -72px;
-}
-
-.icon-chevron-left {
-  background-position: -432px -72px;
-}
-
-.icon-chevron-right {
-  background-position: -456px -72px;
-}
-
-.icon-plus-sign {
-  background-position: 0 -96px;
-}
-
-.icon-minus-sign {
-  background-position: -24px -96px;
-}
-
-.icon-remove-sign {
-  background-position: -48px -96px;
-}
-
-.icon-ok-sign {
-  background-position: -72px -96px;
-}
-
-.icon-question-sign {
-  background-position: -96px -96px;
-}
-
-.icon-info-sign {
-  background-position: -120px -96px;
-}
-
-.icon-screenshot {
-  background-position: -144px -96px;
-}
-
-.icon-remove-circle {
-  background-position: -168px -96px;
-}
-
-.icon-ok-circle {
-  background-position: -192px -96px;
-}
-
-.icon-ban-circle {
-  background-position: -216px -96px;
-}
-
-.icon-arrow-left {
-  background-position: -240px -96px;
-}
-
-.icon-arrow-right {
-  background-position: -264px -96px;
-}
-
-.icon-arrow-up {
-  background-position: -289px -96px;
-}
-
-.icon-arrow-down {
-  background-position: -312px -96px;
-}
-
-.icon-share-alt {
-  background-position: -336px -96px;
-}
-
-.icon-resize-full {
-  background-position: -360px -96px;
-}
-
-.icon-resize-small {
-  background-position: -384px -96px;
-}
-
-.icon-plus {
-  background-position: -408px -96px;
-}
-
-.icon-minus {
-  background-position: -433px -96px;
-}
-
-.icon-asterisk {
-  background-position: -456px -96px;
-}
-
-.icon-exclamation-sign {
-  background-position: 0 -120px;
-}
-
-.icon-gift {
-  background-position: -24px -120px;
-}
-
-.icon-leaf {
-  background-position: -48px -120px;
-}
-
-.icon-fire {
-  background-position: -72px -120px;
-}
-
-.icon-eye-open {
-  background-position: -96px -120px;
-}
-
-.icon-eye-close {
-  background-position: -120px -120px;
-}
-
-.icon-warning-sign {
-  background-position: -144px -120px;
-}
-
-.icon-plane {
-  background-position: -168px -120px;
-}
-
-.icon-calendar {
-  background-position: -192px -120px;
-}
-
-.icon-random {
-  width: 16px;
-  background-position: -216px -120px;
-}
-
-.icon-comment {
-  background-position: -240px -120px;
-}
-
-.icon-magnet {
-  background-position: -264px -120px;
-}
-
-.icon-chevron-up {
-  background-position: -288px -120px;
-}
-
-.icon-chevron-down {
-  background-position: -313px -119px;
-}
-
-.icon-retweet {
-  background-position: -336px -120px;
-}
-
-.icon-shopping-cart {
-  background-position: -360px -120px;
-}
-
-.icon-folder-close {
-  background-position: -384px -120px;
-}
-
-.icon-folder-open {
-  width: 16px;
-  background-position: -408px -120px;
-}
-
-.icon-resize-vertical {
-  background-position: -432px -119px;
-}
-
-.icon-resize-horizontal {
-  background-position: -456px -118px;
-}
-
-.icon-hdd {
-  background-position: 0 -144px;
-}
-
-.icon-bullhorn {
-  background-position: -24px -144px;
-}
-
-.icon-bell {
-  background-position: -48px -144px;
-}
-
-.icon-certificate {
-  background-position: -72px -144px;
-}
-
-.icon-thumbs-up {
-  background-position: -96px -144px;
-}
-
-.icon-thumbs-down {
-  background-position: -120px -144px;
-}
-
-.icon-hand-right {
-  background-position: -144px -144px;
-}
-
-.icon-hand-left {
-  background-position: -168px -144px;
-}
-
-.icon-hand-up {
-  background-position: -192px -144px;
-}
-
-.icon-hand-down {
-  background-position: -216px -144px;
-}
-
-.icon-circle-arrow-right {
-  background-position: -240px -144px;
-}
-
-.icon-circle-arrow-left {
-  background-position: -264px -144px;
-}
-
-.icon-circle-arrow-up {
-  background-position: -288px -144px;
-}
-
-.icon-circle-arrow-down {
-  background-position: -312px -144px;
-}
-
-.icon-globe {
-  background-position: -336px -144px;
-}
-
-.icon-wrench {
-  background-position: -360px -144px;
-}
-
-.icon-tasks {
-  background-position: -384px -144px;
-}
-
-.icon-filter {
-  background-position: -408px -144px;
-}
-
-.icon-briefcase {
-  background-position: -432px -144px;
-}
-
-.icon-fullscreen {
-  background-position: -456px -144px;
-}
-
-.dropup,
-.dropdown {
-  position: relative;
-}
-
-.dropdown-toggle {
-  *margin-bottom: -3px;
-}
-
-.dropdown-toggle:active,
-.open .dropdown-toggle {
-  outline: 0;
-}
-
-.caret {
-  display: inline-block;
-  width: 0;
-  height: 0;
-  vertical-align: top;
-  border-top: 4px solid #000000;
-  border-right: 4px solid transparent;
-  border-left: 4px solid transparent;
-  content: "";
-}
-
-.dropdown .caret {
-  margin-top: 8px;
-  margin-left: 2px;
-}
-
-.dropdown-menu {
-  position: absolute;
-  top: 100%;
-  left: 0;
-  z-index: 1000;
-  display: none;
-  float: left;
-  min-width: 160px;
-  padding: 5px 0;
-  margin: 2px 0 0;
-  list-style: none;
-  background-color: #ffffff;
-  border: 1px solid #ccc;
-  border: 1px solid rgba(0, 0, 0, 0.2);
-  *border-right-width: 2px;
-  *border-bottom-width: 2px;
-  -webkit-border-radius: 6px;
-     -moz-border-radius: 6px;
-          border-radius: 6px;
-  -webkit-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
-     -moz-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
-          box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
-  -webkit-background-clip: padding-box;
-     -moz-background-clip: padding;
-          background-clip: padding-box;
-}
-
-.dropdown-menu.pull-right {
-  right: 0;
-  left: auto;
-}
-
-.dropdown-menu .divider {
-  *width: 100%;
-  height: 1px;
-  margin: 9px 1px;
-  *margin: -5px 0 5px;
-  overflow: hidden;
-  background-color: #e5e5e5;
-  border-bottom: 1px solid #ffffff;
-}
-
-.dropdown-menu li > a {
-  display: block;
-  padding: 3px 20px;
-  clear: both;
-  font-weight: normal;
-  line-height: 20px;
-  color: #333333;
-  white-space: nowrap;
-}
-
-.dropdown-menu li > a:hover,
-.dropdown-menu li > a:focus,
-.dropdown-submenu:hover > a {
-  color: #ffffff;
-  text-decoration: none;
-  background-color: #0081c2;
-  background-image: -moz-linear-gradient(top, #0088cc, #0077b3);
-  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#0088cc), to(#0077b3));
-  background-image: -webkit-linear-gradient(top, #0088cc, #0077b3);
-  background-image: -o-linear-gradient(top, #0088cc, #0077b3);
-  background-image: linear-gradient(to bottom, #0088cc, #0077b3);
-  background-repeat: repeat-x;
-  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff0088cc', endColorstr='#ff0077b3', GradientType=0);
-}
-
-.dropdown-menu .active > a,
-.dropdown-menu .active > a:hover {
-  color: #ffffff;
-  text-decoration: none;
-  background-color: #0081c2;
-  background-image: -moz-linear-gradient(top, #0088cc, #0077b3);
-  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#0088cc), to(#0077b3));
-  background-image: -webkit-linear-gradient(top, #0088cc, #0077b3);
-  background-image: -o-linear-gradient(top, #0088cc, #0077b3);
-  background-image: linear-gradient(to bottom, #0088cc, #0077b3);
-  background-repeat: repeat-x;
-  outline: 0;
-  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff0088cc', endColorstr='#ff0077b3', GradientType=0);
-}
-
-.dropdown-menu .disabled > a,
-.dropdown-menu .disabled > a:hover {
-  color: #999999;
-}
-
-.dropdown-menu .disabled > a:hover {
-  text-decoration: none;
-  cursor: default;
-  background-color: transparent;
-  background-image: none;
-  filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
-}
-
-.open {
-  *z-index: 1000;
-}
-
-.open > .dropdown-menu {
-  display: block;
-}
-
-.pull-right > .dropdown-menu {
-  right: 0;
-  left: auto;
-}
-
-.dropup .caret,
-.navbar-fixed-bottom .dropdown .caret {
-  border-top: 0;
-  border-bottom: 4px solid #000000;
-  content: "";
-}
-
-.dropup .dropdown-menu,
-.navbar-fixed-bottom .dropdown .dropdown-menu {
-  top: auto;
-  bottom: 100%;
-  margin-bottom: 1px;
-}
-
-.dropdown-submenu {
-  position: relative;
-}
-
-.dropdown-submenu > .dropdown-menu {
-  top: 0;
-  left: 100%;
-  margin-top: -6px;
-  margin-left: -1px;
-  -webkit-border-radius: 0 6px 6px 6px;
-     -moz-border-radius: 0 6px 6px 6px;
-          border-radius: 0 6px 6px 6px;
-}
-
-.dropdown-submenu:hover > .dropdown-menu {
-  display: block;
-}
-
-.dropup .dropdown-submenu > .dropdown-menu {
-  top: auto;
-  bottom: 0;
-  margin-top: 0;
-  margin-bottom: -2px;
-  -webkit-border-radius: 5px 5px 5px 0;
-     -moz-border-radius: 5px 5px 5px 0;
-          border-radius: 5px 5px 5px 0;
-}
-
-.dropdown-submenu > a:after {
-  display: block;
-  float: right;
-  width: 0;
-  height: 0;
-  margin-top: 5px;
-  margin-right: -10px;
-  border-color: transparent;
-  border-left-color: #cccccc;
-  border-style: solid;
-  border-width: 5px 0 5px 5px;
-  content: " ";
-}
-
-.dropdown-submenu:hover > a:after {
-  border-left-color: #ffffff;
-}
-
-.dropdown-submenu.pull-left {
-  float: none;
-}
-
-.dropdown-submenu.pull-left > .dropdown-menu {
-  left: -100%;
-  margin-left: 10px;
-  -webkit-border-radius: 6px 0 6px 6px;
-     -moz-border-radius: 6px 0 6px 6px;
-          border-radius: 6px 0 6px 6px;
-}
-
-.dropdown .dropdown-menu .nav-header {
-  padding-right: 20px;
-  padding-left: 20px;
-}
-
-.typeahead {
-  z-index: 1051;
-  margin-top: 2px;
-  -webkit-border-radius: 4px;
-     -moz-border-radius: 4px;
-          border-radius: 4px;
-}
-
-.well {
-  min-height: 20px;
-  padding: 19px;
-  margin-bottom: 20px;
-  background-color: #f5f5f5;
-  border: 1px solid #e3e3e3;
-  -webkit-border-radius: 4px;
-     -moz-border-radius: 4px;
-          border-radius: 4px;
-  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);
-     -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);
-          box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);
-}
-
-.well blockquote {
-  border-color: #ddd;
-  border-color: rgba(0, 0, 0, 0.15);
-}
-
-.well-large {
-  padding: 24px;
-  -webkit-border-radius: 6px;
-     -moz-border-radius: 6px;
-          border-radius: 6px;
-}
-
-.well-small {
-  padding: 9px;
-  -webkit-border-radius: 3px;
-     -moz-border-radius: 3px;
-          border-radius: 3px;
-}
-
-.fade {
-  opacity: 0;
-  -webkit-transition: opacity 0.15s linear;
-     -moz-transition: opacity 0.15s linear;
-       -o-transition: opacity 0.15s linear;
-          transition: opacity 0.15s linear;
-}
-
-.fade.in {
-  opacity: 1;
-}
-
-.collapse {
-  position: relative;
-  height: 0;
-  overflow: hidden;
-  -webkit-transition: height 0.35s ease;
-     -moz-transition: height 0.35s ease;
-       -o-transition: height 0.35s ease;
-          transition: height 0.35s ease;
-}
-
-.collapse.in {
-  height: auto;
-}
-
-.close {
-  float: right;
-  font-size: 20px;
-  font-weight: bold;
-  line-height: 20px;
-  color: #000000;
-  text-shadow: 0 1px 0 #ffffff;
-  opacity: 0.2;
-  filter: alpha(opacity=20);
-}
-
-.close:hover {
-  color: #000000;
-  text-decoration: none;
-  cursor: pointer;
-  opacity: 0.4;
-  filter: alpha(opacity=40);
-}
-
-button.close {
-  padding: 0;
-  cursor: pointer;
-  background: transparent;
-  border: 0;
-  -webkit-appearance: none;
-}
-
-.btn {
-  display: inline-block;
-  *display: inline;
-  padding: 4px 12px;
-  margin-bottom: 0;
-  *margin-left: .3em;
-  font-size: 14px;
-  line-height: 20px;
-  color: #333333;
-  text-align: center;
-  text-shadow: 0 1px 1px rgba(255, 255, 255, 0.75);
-  vertical-align: middle;
-  cursor: pointer;
-  background-color: #f5f5f5;
-  *background-color: #e6e6e6;
-  background-image: -moz-linear-gradient(top, #ffffff, #e6e6e6);
-  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#ffffff), to(#e6e6e6));
-  background-image: -webkit-linear-gradient(top, #ffffff, #e6e6e6);
-  background-image: -o-linear-gradient(top, #ffffff, #e6e6e6);
-  background-image: linear-gradient(to bottom, #ffffff, #e6e6e6);
-  background-repeat: repeat-x;
-  border: 1px solid #bbbbbb;
-  *border: 0;
-  border-color: #e6e6e6 #e6e6e6 #bfbfbf;
-  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
-  border-bottom-color: #a2a2a2;
-  -webkit-border-radius: 4px;
-     -moz-border-radius: 4px;
-          border-radius: 4px;
-  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff', endColorstr='#ffe6e6e6', GradientType=0);
-  filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
-  *zoom: 1;
-  -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
-     -moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
-          box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
-}
-
-.btn:hover,
-.btn:active,
-.btn.active,
-.btn.disabled,
-.btn[disabled] {
-  color: #333333;
-  background-color: #e6e6e6;
-  *background-color: #d9d9d9;
-}
-
-.btn:active,
-.btn.active {
-  background-color: #cccccc \9;
-}
-
-.btn:first-child {
-  *margin-left: 0;
-}
-
-.btn:hover {
-  color: #333333;
-  text-decoration: none;
-  background-position: 0 -15px;
-  -webkit-transition: background-position 0.1s linear;
-     -moz-transition: background-position 0.1s linear;
-       -o-transition: background-position 0.1s linear;
-          transition: background-position 0.1s linear;
-}
-
-.btn:focus {
-  outline: thin dotted #333;
-  outline: 5px auto -webkit-focus-ring-color;
-  outline-offset: -2px;
-}
-
-.btn.active,
-.btn:active {
-  background-image: none;
-  outline: 0;
-  -webkit-box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
-     -moz-box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
-          box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
-}
-
-.btn.disabled,
-.btn[disabled] {
-  cursor: default;
-  background-image: none;
-  opacity: 0.65;
-  filter: alpha(opacity=65);
-  -webkit-box-shadow: none;
-     -moz-box-shadow: none;
-          box-shadow: none;
-}
-
-.btn-large {
-  padding: 11px 19px;
-  font-size: 17.5px;
-  -webkit-border-radius: 6px;
-     -moz-border-radius: 6px;
-          border-radius: 6px;
-}
-
-.btn-large [class^="icon-"],
-.btn-large [class*=" icon-"] {
-  margin-top: 4px;
-}
-
-.btn-small {
-  padding: 2px 10px;
-  font-size: 11.9px;
-  -webkit-border-radius: 3px;
-     -moz-border-radius: 3px;
-          border-radius: 3px;
-}
-
-.btn-small [class^="icon-"],
-.btn-small [class*=" icon-"] {
-  margin-top: 0;
-}
-
-.btn-mini [class^="icon-"],
-.btn-mini [class*=" icon-"] {
-  margin-top: -1px;
-}
-
-.btn-mini {
-  padding: 0 6px;
-  font-size: 10.5px;
-  -webkit-border-radius: 3px;
-     -moz-border-radius: 3px;
-          border-radius: 3px;
-}
-
-.btn-block {
-  display: block;
-  width: 100%;
-  padding-right: 0;
-  padding-left: 0;
-  -webkit-box-sizing: border-box;
-     -moz-box-sizing: border-box;
-          box-sizing: border-box;
-}
-
-.btn-block + .btn-block {
-  margin-top: 5px;
-}
-
-input[type="submit"].btn-block,
-input[type="reset"].btn-block,
-input[type="button"].btn-block {
-  width: 100%;
-}
-
-.btn-primary.active,
-.btn-warning.active,
-.btn-danger.active,
-.btn-success.active,
-.btn-info.active,
-.btn-inverse.active {
-  color: rgba(255, 255, 255, 0.75);
-}
-
-.btn {
-  border-color: #c5c5c5;
-  border-color: rgba(0, 0, 0, 0.15) rgba(0, 0, 0, 0.15) rgba(0, 0, 0, 0.25);
-}
-
-.btn-primary {
-  color: #ffffff;
-  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
-  background-color: #006dcc;
-  *background-color: #0044cc;
-  background-image: -moz-linear-gradient(top, #0088cc, #0044cc);
-  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#0088cc), to(#0044cc));
-  background-image: -webkit-linear-gradient(top, #0088cc, #0044cc);
-  background-image: -o-linear-gradient(top, #0088cc, #0044cc);
-  background-image: linear-gradient(to bottom, #0088cc, #0044cc);
-  background-repeat: repeat-x;
-  border-color: #0044cc #0044cc #002a80;
-  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
-  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff0088cc', endColorstr='#ff0044cc', GradientType=0);
-  filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
-}
-
-.btn-primary:hover,
-.btn-primary:active,
-.btn-primary.active,
-.btn-primary.disabled,
-.btn-primary[disabled] {
-  color: #ffffff;
-  background-color: #0044cc;
-  *background-color: #003bb3;
-}
-
-.btn-primary:active,
-.btn-primary.active {
-  background-color: #003399 \9;
-}
-
-.btn-warning {
-  color: #ffffff;
-  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
-  background-color: #faa732;
-  *background-color: #f89406;
-  background-image: -moz-linear-gradient(top, #fbb450, #f89406);
-  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#fbb450), to(#f89406));
-  background-image: -webkit-linear-gradient(top, #fbb450, #f89406);
-  background-image: -o-linear-gradient(top, #fbb450, #f89406);
-  background-image: linear-gradient(to bottom, #fbb450, #f89406);
-  background-repeat: repeat-x;
-  border-color: #f89406 #f89406 #ad6704;
-  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
-  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#fffbb450', endColorstr='#fff89406', GradientType=0);
-  filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
-}
-
-.btn-warning:hover,
-.btn-warning:active,
-.btn-warning.active,
-.btn-warning.disabled,
-.btn-warning[disabled] {
-  color: #ffffff;
-  background-color: #f89406;
-  *background-color: #df8505;
-}
-
-.btn-warning:active,
-.btn-warning.active {
-  background-color: #c67605 \9;
-}
-
-.btn-danger {
-  color: #ffffff;
-  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
-  background-color: #da4f49;
-  *background-color: #bd362f;
-  background-image: -moz-linear-gradient(top, #ee5f5b, #bd362f);
-  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#ee5f5b), to(#bd362f));
-  background-image: -webkit-linear-gradient(top, #ee5f5b, #bd362f);
-  background-image: -o-linear-gradient(top, #ee5f5b, #bd362f);
-  background-image: linear-gradient(to bottom, #ee5f5b, #bd362f);
-  background-repeat: repeat-x;
-  border-color: #bd362f #bd362f #802420;
-  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
-  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffee5f5b', endColorstr='#ffbd362f', GradientType=0);
-  filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
-}
-
-.btn-danger:hover,
-.btn-danger:active,
-.btn-danger.active,
-.btn-danger.disabled,
-.btn-danger[disabled] {
-  color: #ffffff;
-  background-color: #bd362f;
-  *background-color: #a9302a;
-}
-
-.btn-danger:active,
-.btn-danger.active {
-  background-color: #942a25 \9;
-}
-
-.btn-success {
-  color: #ffffff;
-  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
-  background-color: #5bb75b;
-  *background-color: #51a351;
-  background-image: -moz-linear-gradient(top, #62c462, #51a351);
-  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#62c462), to(#51a351));
-  background-image: -webkit-linear-gradient(top, #62c462, #51a351);
-  background-image: -o-linear-gradient(top, #62c462, #51a351);
-  background-image: linear-gradient(to bottom, #62c462, #51a351);
-  background-repeat: repeat-x;
-  border-color: #51a351 #51a351 #387038;
-  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
-  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff62c462', endColorstr='#ff51a351', GradientType=0);
-  filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
-}
-
-.btn-success:hover,
-.btn-success:active,
-.btn-success.active,
-.btn-success.disabled,
-.btn-success[disabled] {
-  color: #ffffff;
-  background-color: #51a351;
-  *background-color: #499249;
-}
-
-.btn-success:active,
-.btn-success.active {
-  background-color: #408140 \9;
-}
-
-.btn-info {
-  color: #ffffff;
-  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
-  background-color: #49afcd;
-  *background-color: #2f96b4;
-  background-image: -moz-linear-gradient(top, #5bc0de, #2f96b4);
-  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#5bc0de), to(#2f96b4));
-  background-image: -webkit-linear-gradient(top, #5bc0de, #2f96b4);
-  background-image: -o-linear-gradient(top, #5bc0de, #2f96b4);
-  background-image: linear-gradient(to bottom, #5bc0de, #2f96b4);
-  background-repeat: repeat-x;
-  border-color: #2f96b4 #2f96b4 #1f6377;
-  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
-  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff5bc0de', endColorstr='#ff2f96b4', GradientType=0);
-  filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
-}
-
-.btn-info:hover,
-.btn-info:active,
-.btn-info.active,
-.btn-info.disabled,
-.btn-info[disabled] {
-  color: #ffffff;
-  background-color: #2f96b4;
-  *background-color: #2a85a0;
-}
-
-.btn-info:active,
-.btn-info.active {
-  background-color: #24748c \9;
-}
-
-.btn-inverse {
-  color: #ffffff;
-  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
-  background-color: #363636;
-  *background-color: #222222;
-  background-image: -moz-linear-gradient(top, #444444, #222222);
-  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#444444), to(#222222));
-  background-image: -webkit-linear-gradient(top, #444444, #222222);
-  background-image: -o-linear-gradient(top, #444444, #222222);
-  background-image: linear-gradient(to bottom, #444444, #222222);
-  background-repeat: repeat-x;
-  border-color: #222222 #222222 #000000;
-  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
-  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff444444', endColorstr='#ff222222', GradientType=0);
-  filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
-}
-
-.btn-inverse:hover,
-.btn-inverse:active,
-.btn-inverse.active,
-.btn-inverse.disabled,
-.btn-inverse[disabled] {
-  color: #ffffff;
-  background-color: #222222;
-  *background-color: #151515;
-}
-
-.btn-inverse:active,
-.btn-inverse.active {
-  background-color: #080808 \9;
-}
-
-button.btn,
-input[type="submit"].btn {
-  *padding-top: 3px;
-  *padding-bottom: 3px;
-}
-
-button.btn::-moz-focus-inner,
-input[type="submit"].btn::-moz-focus-inner {
-  padding: 0;
-  border: 0;
-}
-
-button.btn.btn-large,
-input[type="submit"].btn.btn-large {
-  *padding-top: 7px;
-  *padding-bottom: 7px;
-}
-
-button.btn.btn-small,
-input[type="submit"].btn.btn-small {
-  *padding-top: 3px;
-  *padding-bottom: 3px;
-}
-
-button.btn.btn-mini,
-input[type="submit"].btn.btn-mini {
-  *padding-top: 1px;
-  *padding-bottom: 1px;
-}
-
-.btn-link,
-.btn-link:active,
-.btn-link[disabled] {
-  background-color: transparent;
-  background-image: none;
-  -webkit-box-shadow: none;
-     -moz-box-shadow: none;
-          box-shadow: none;
-}
-
-.btn-link {
-  color: #0088cc;
-  cursor: pointer;
-  border-color: transparent;
-  -webkit-border-radius: 0;
-     -moz-border-radius: 0;
-          border-radius: 0;
-}
-
-.btn-link:hover {
-  color: #005580;
-  text-decoration: underline;
-  background-color: transparent;
-}
-
-.btn-link[disabled]:hover {
-  color: #333333;
-  text-decoration: none;
-}
-
-.btn-group {
-  position: relative;
-  display: inline-block;
-  *display: inline;
-  *margin-left: .3em;
-  font-size: 0;
-  white-space: nowrap;
-  vertical-align: middle;
-  *zoom: 1;
-}
-
-.btn-group:first-child {
-  *margin-left: 0;
-}
-
-.btn-group + .btn-group {
-  margin-left: 5px;
-}
-
-.btn-toolbar {
-  margin-top: 10px;
-  margin-bottom: 10px;
-  font-size: 0;
-}
-
-.btn-toolbar > .btn + .btn,
-.btn-toolbar > .btn-group + .btn,
-.btn-toolbar > .btn + .btn-group {
-  margin-left: 5px;
-}
-
-.btn-group > .btn {
-  position: relative;
-  -webkit-border-radius: 0;
-     -moz-border-radius: 0;
-          border-radius: 0;
-}
-
-.btn-group > .btn + .btn {
-  margin-left: -1px;
-}
-
-.btn-group > .btn,
-.btn-group > .dropdown-menu,
-.btn-group > .popover {
-  font-size: 14px;
-}
-
-.btn-group > .btn-mini {
-  font-size: 10.5px;
-}
-
-.btn-group > .btn-small {
-  font-size: 11.9px;
-}
-
-.btn-group > .btn-large {
-  font-size: 17.5px;
-}
-
-.btn-group > .btn:first-child {
-  margin-left: 0;
-  -webkit-border-bottom-left-radius: 4px;
-          border-bottom-left-radius: 4px;
-  -webkit-border-top-left-radius: 4px;
-          border-top-left-radius: 4px;
-  -moz-border-radius-bottomleft: 4px;
-  -moz-border-radius-topleft: 4px;
-}
-
-.btn-group > .btn:last-child,
-.btn-group > .dropdown-toggle {
-  -webkit-border-top-right-radius: 4px;
-          border-top-right-radius: 4px;
-  -webkit-border-bottom-right-radius: 4px;
-          border-bottom-right-radius: 4px;
-  -moz-border-radius-topright: 4px;
-  -moz-border-radius-bottomright: 4px;
-}
-
-.btn-group > .btn.large:first-child {
-  margin-left: 0;
-  -webkit-border-bottom-left-radius: 6px;
-          border-bottom-left-radius: 6px;
-  -webkit-border-top-left-radius: 6px;
-          border-top-left-radius: 6px;
-  -moz-border-radius-bottomleft: 6px;
-  -moz-border-radius-topleft: 6px;
-}
-
-.btn-group > .btn.large:last-child,
-.btn-group > .large.dropdown-toggle {
-  -webkit-border-top-right-radius: 6px;
-          border-top-right-radius: 6px;
-  -webkit-border-bottom-right-radius: 6px;
-          border-bottom-right-radius: 6px;
-  -moz-border-radius-topright: 6px;
-  -moz-border-radius-bottomright: 6px;
-}
-
-.btn-group > .btn:hover,
-.btn-group > .btn:focus,
-.btn-group > .btn:active,
-.btn-group > .btn.active {
-  z-index: 2;
-}
-
-.btn-group .dropdown-toggle:active,
-.btn-group.open .dropdown-toggle {
-  outline: 0;
-}
-
-.btn-group > .btn + .dropdown-toggle {
-  *padding-top: 5px;
-  padding-right: 8px;
-  *padding-bottom: 5px;
-  padding-left: 8px;
-  -webkit-box-shadow: inset 1px 0 0 rgba(255, 255, 255, 0.125), inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
-     -moz-box-shadow: inset 1px 0 0 rgba(255, 255, 255, 0.125), inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
-          box-shadow: inset 1px 0 0 rgba(255, 255, 255, 0.125), inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
-}
-
-.btn-group > .btn-mini + .dropdown-toggle {
-  *padding-top: 2px;
-  padding-right: 5px;
-  *padding-bottom: 2px;
-  padding-left: 5px;
-}
-
-.btn-group > .btn-small + .dropdown-toggle {
-  *padding-top: 5px;
-  *padding-bottom: 4px;
-}
-
-.btn-group > .btn-large + .dropdown-toggle {
-  *padding-top: 7px;
-  padding-right: 12px;
-  *padding-bottom: 7px;
-  padding-left: 12px;
-}
-
-.btn-group.open .dropdown-toggle {
-  background-image: none;
-  -webkit-box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
-     -moz-box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
-          box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
-}
-
-.btn-group.open .btn.dropdown-toggle {
-  background-color: #e6e6e6;
-}
-
-.btn-group.open .btn-primary.dropdown-toggle {
-  background-color: #0044cc;
-}
-
-.btn-group.open .btn-warning.dropdown-toggle {
-  background-color: #f89406;
-}
-
-.btn-group.open .btn-danger.dropdown-toggle {
-  background-color: #bd362f;
-}
-
-.btn-group.open .btn-success.dropdown-toggle {
-  background-color: #51a351;
-}
-
-.btn-group.open .btn-info.dropdown-toggle {
-  background-color: #2f96b4;
-}
-
-.btn-group.open .btn-inverse.dropdown-toggle {
-  background-color: #222222;
-}
-
-.btn .caret {
-  margin-top: 8px;
-  margin-left: 0;
-}
-
-.btn-mini .caret,
-.btn-small .caret,
-.btn-large .caret {
-  margin-top: 6px;
-}
-
-.btn-large .caret {
-  border-top-width: 5px;
-  border-right-width: 5px;
-  border-left-width: 5px;
-}
-
-.dropup .btn-large .caret {
-  border-bottom-width: 5px;
-}
-
-.btn-primary .caret,
-.btn-warning .caret,
-.btn-danger .caret,
-.btn-info .caret,
-.btn-success .caret,
-.btn-inverse .caret {
-  border-top-color: #ffffff;
-  border-bottom-color: #ffffff;
-}
-
-.btn-group-vertical {
-  display: inline-block;
-  *display: inline;
-  /* IE7 inline-block hack */
-
-  *zoom: 1;
-}
-
-.btn-group-vertical > .btn {
-  display: block;
-  float: none;
-  max-width: 100%;
-  -webkit-border-radius: 0;
-     -moz-border-radius: 0;
-          border-radius: 0;
-}
-
-.btn-group-vertical > .btn + .btn {
-  margin-top: -1px;
-  margin-left: 0;
-}
-
-.btn-group-vertical > .btn:first-child {
-  -webkit-border-radius: 4px 4px 0 0;
-     -moz-border-radius: 4px 4px 0 0;
-          border-radius: 4px 4px 0 0;
-}
-
-.btn-group-vertical > .btn:last-child {
-  -webkit-border-radius: 0 0 4px 4px;
-     -moz-border-radius: 0 0 4px 4px;
-          border-radius: 0 0 4px 4px;
-}
-
-.btn-group-vertical > .btn-large:first-child {
-  -webkit-border-radius: 6px 6px 0 0;
-     -moz-border-radius: 6px 6px 0 0;
-          border-radius: 6px 6px 0 0;
-}
-
-.btn-group-vertical > .btn-large:last-child {
-  -webkit-border-radius: 0 0 6px 6px;
-     -moz-border-radius: 0 0 6px 6px;
-          border-radius: 0 0 6px 6px;
-}
-
-.alert {
-  padding: 8px 35px 8px 14px;
-  margin-bottom: 20px;
-  text-shadow: 0 1px 0 rgba(255, 255, 255, 0.5);
-  background-color: #fcf8e3;
-  border: 1px solid #fbeed5;
-  -webkit-border-radius: 4px;
-     -moz-border-radius: 4px;
-          border-radius: 4px;
-}
-
-.alert,
-.alert h4 {
-  color: #c09853;
-}
-
-.alert h4 {
-  margin: 0;
-}
-
-.alert .close {
-  position: relative;
-  top: -2px;
-  right: -21px;
-  line-height: 20px;
-}
-
-.alert-success {
-  color: #468847;
-  background-color: #dff0d8;
-  border-color: #d6e9c6;
-}
-
-.alert-success h4 {
-  color: #468847;
-}
-
-.alert-danger,
-.alert-error {
-  color: #b94a48;
-  background-color: #f2dede;
-  border-color: #eed3d7;
-}
-
-.alert-danger h4,
-.alert-error h4 {
-  color: #b94a48;
-}
-
-.alert-info {
-  color: #3a87ad;
-  background-color: #d9edf7;
-  border-color: #bce8f1;
-}
-
-.alert-info h4 {
-  color: #3a87ad;
-}
-
-.alert-block {
-  padding-top: 14px;
-  padding-bottom: 14px;
-}
-
-.alert-block > p,
-.alert-block > ul {
-  margin-bottom: 0;
-}
-
-.alert-block p + p {
-  margin-top: 5px;
-}
-
-.nav {
-  margin-bottom: 20px;
-  margin-left: 0;
-  list-style: none;
-}
-
-.nav > li > a {
-  display: block;
-}
-
-.nav > li > a:hover {
-  text-decoration: none;
-  background-color: #eeeeee;
-}
-
-.nav > li > a > img {
-  max-width: none;
-}
-
-.nav > .pull-right {
-  float: right;
-}
-
-.nav-header {
-  display: block;
-  padding: 3px 15px;
-  font-size: 11px;
-  font-weight: bold;
-  line-height: 20px;
-  color: #999999;
-  text-shadow: 0 1px 0 rgba(255, 255, 255, 0.5);
-  text-transform: uppercase;
-}
-
-.nav li + .nav-header {
-  margin-top: 9px;
-}
-
-.nav-list {
-  padding-right: 15px;
-  padding-left: 15px;
-  margin-bottom: 0;
-}
-
-.nav-list > li > a,
-.nav-list .nav-header {
-  margin-right: -15px;
-  margin-left: -15px;
-  text-shadow: 0 1px 0 rgba(255, 255, 255, 0.5);
-}
-
-.nav-list > li > a {
-  padding: 3px 15px;
-}
-
-.nav-list > .active > a,
-.nav-list > .active > a:hover {
-  color: #ffffff;
-  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.2);
-  background-color: #0088cc;
-}
-
-.nav-list [class^="icon-"],
-.nav-list [class*=" icon-"] {
-  margin-right: 2px;
-}
-
-.nav-list .divider {
-  *width: 100%;
-  height: 1px;
-  margin: 9px 1px;
-  *margin: -5px 0 5px;
-  overflow: hidden;
-  background-color: #e5e5e5;
-  border-bottom: 1px solid #ffffff;
-}
-
-.nav-tabs,
-.nav-pills {
-  *zoom: 1;
-}
-
-.nav-tabs:before,
-.nav-pills:before,
-.nav-tabs:after,
-.nav-pills:after {
-  display: table;
-  line-height: 0;
-  content: "";
-}
-
-.nav-tabs:after,
-.nav-pills:after {
-  clear: both;
-}
-
-.nav-tabs > li,
-.nav-pills > li {
-  float: left;
-}
-
-.nav-tabs > li > a,
-.nav-pills > li > a {
-  padding-right: 12px;
-  padding-left: 12px;
-  margin-right: 2px;
-  line-height: 14px;
-}
-
-.nav-tabs {
-  border-bottom: 1px solid #ddd;
-}
-
-.nav-tabs > li {
-  margin-bottom: -1px;
-}
-
-.nav-tabs > li > a {
-  padding-top: 8px;
-  padding-bottom: 8px;
-  line-height: 20px;
-  border: 1px solid transparent;
-  -webkit-border-radius: 4px 4px 0 0;
-     -moz-border-radius: 4px 4px 0 0;
-          border-radius: 4px 4px 0 0;
-}
-
-.nav-tabs > li > a:hover {
-  border-color: #eeeeee #eeeeee #dddddd;
-}
-
-.nav-tabs > .active > a,
-.nav-tabs > .active > a:hover {
-  color: #555555;
-  cursor: default;
-  background-color: #ffffff;
-  border: 1px solid #ddd;
-  border-bottom-color: transparent;
-}
-
-.nav-pills > li > a {
-  padding-top: 8px;
-  padding-bottom: 8px;
-  margin-top: 2px;
-  margin-bottom: 2px;
-  -webkit-border-radius: 5px;
-     -moz-border-radius: 5px;
-          border-radius: 5px;
-}
-
-.nav-pills > .active > a,
-.nav-pills > .active > a:hover {
-  color: #ffffff;
-  background-color: #0088cc;
-}
-
-.nav-stacked > li {
-  float: none;
-}
-
-.nav-stacked > li > a {
-  margin-right: 0;
-}
-
-.nav-tabs.nav-stacked {
-  border-bottom: 0;
-}
-
-.nav-tabs.nav-stacked > li > a {
-  border: 1px solid #ddd;
-  -webkit-border-radius: 0;
-     -moz-border-radius: 0;
-          border-radius: 0;
-}
-
-.nav-tabs.nav-stacked > li:first-child > a {
-  -webkit-border-top-right-radius: 4px;
-          border-top-right-radius: 4px;
-  -webkit-border-top-left-radius: 4px;
-          border-top-left-radius: 4px;
-  -moz-border-radius-topright: 4px;
-  -moz-border-radius-topleft: 4px;
-}
-
-.nav-tabs.nav-stacked > li:last-child > a {
-  -webkit-border-bottom-right-radius: 4px;
-          border-bottom-right-radius: 4px;
-  -webkit-border-bottom-left-radius: 4px;
-          border-bottom-left-radius: 4px;
-  -moz-border-radius-bottomright: 4px;
-  -moz-border-radius-bottomleft: 4px;
-}
-
-.nav-tabs.nav-stacked > li > a:hover {
-  z-index: 2;
-  border-color: #ddd;
-}
-
-.nav-pills.nav-stacked > li > a {
-  margin-bottom: 3px;
-}
-
-.nav-pills.nav-stacked > li:last-child > a {
-  margin-bottom: 1px;
-}
-
-.nav-tabs .dropdown-menu {
-  -webkit-border-radius: 0 0 6px 6px;
-     -moz-border-radius: 0 0 6px 6px;
-          border-radius: 0 0 6px 6px;
-}
-
-.nav-pills .dropdown-menu {
-  -webkit-border-radius: 6px;
-     -moz-border-radius: 6px;
-          border-radius: 6px;
-}
-
-.nav .dropdown-toggle .caret {
-  margin-top: 6px;
-  border-top-color: #0088cc;
-  border-bottom-color: #0088cc;
-}
-
-.nav .dropdown-toggle:hover .caret {
-  border-top-color: #005580;
-  border-bottom-color: #005580;
-}
-
-/* move down carets for tabs */
-
-.nav-tabs .dropdown-toggle .caret {
-  margin-top: 8px;
-}
-
-.nav .active .dropdown-toggle .caret {
-  border-top-color: #fff;
-  border-bottom-color: #fff;
-}
-
-.nav-tabs .active .dropdown-toggle .caret {
-  border-top-color: #555555;
-  border-bottom-color: #555555;
-}
-
-.nav > .dropdown.active > a:hover {
-  cursor: pointer;
-}
-
-.nav-tabs .open .dropdown-toggle,
-.nav-pills .open .dropdown-toggle,
-.nav > li.dropdown.open.active > a:hover {
-  color: #ffffff;
-  background-color: #999999;
-  border-color: #999999;
-}
-
-.nav li.dropdown.open .caret,
-.nav li.dropdown.open.active .caret,
-.nav li.dropdown.open a:hover .caret {
-  border-top-color: #ffffff;
-  border-bottom-color: #ffffff;
-  opacity: 1;
-  filter: alpha(opacity=100);
-}
-
-.tabs-stacked .open > a:hover {
-  border-color: #999999;
-}
-
-.tabbable {
-  *zoom: 1;
-}
-
-.tabbable:before,
-.tabbable:after {
-  display: table;
-  line-height: 0;
-  content: "";
-}
-
-.tabbable:after {
-  clear: both;
-}
-
-.tab-content {
-  overflow: auto;
-}
-
-.tabs-below > .nav-tabs,
-.tabs-right > .nav-tabs,
-.tabs-left > .nav-tabs {
-  border-bottom: 0;
-}
-
-.tab-content > .tab-pane,
-.pill-content > .pill-pane {
-  display: none;
-}
-
-.tab-content > .active,
-.pill-content > .active {
-  display: block;
-}
-
-.tabs-below > .nav-tabs {
-  border-top: 1px solid #ddd;
-}
-
-.tabs-below > .nav-tabs > li {
-  margin-top: -1px;
-  margin-bottom: 0;
-}
-
-.tabs-below > .nav-tabs > li > a {
-  -webkit-border-radius: 0 0 4px 4px;
-     -moz-border-radius: 0 0 4px 4px;
-          border-radius: 0 0 4px 4px;
-}
-
-.tabs-below > .nav-tabs > li > a:hover {
-  border-top-color: #ddd;
-  border-bottom-color: transparent;
-}
-
-.tabs-below > .nav-tabs > .active > a,
-.tabs-below > .nav-tabs > .active > a:hover {
-  border-color: transparent #ddd #ddd #ddd;
-}
-
-.tabs-left > .nav-tabs > li,
-.tabs-right > .nav-tabs > li {
-  float: none;
-}
-
-.tabs-left > .nav-tabs > li > a,
-.tabs-right > .nav-tabs > li > a {
-  min-width: 74px;
-  margin-right: 0;
-  margin-bottom: 3px;
-}
-
-.tabs-left > .nav-tabs {
-  float: left;
-  margin-right: 19px;
-  border-right: 1px solid #ddd;
-}
-
-.tabs-left > .nav-tabs > li > a {
-  margin-right: -1px;
-  -webkit-border-radius: 4px 0 0 4px;
-     -moz-border-radius: 4px 0 0 4px;
-          border-radius: 4px 0 0 4px;
-}
-
-.tabs-left > .nav-tabs > li > a:hover {
-  border-color: #eeeeee #dddddd #eeeeee #eeeeee;
-}
-
-.tabs-left > .nav-tabs .active > a,
-.tabs-left > .nav-tabs .active > a:hover {
-  border-color: #ddd transparent #ddd #ddd;
-  *border-right-color: #ffffff;
-}
-
-.tabs-right > .nav-tabs {
-  float: right;
-  margin-left: 19px;
-  border-left: 1px solid #ddd;
-}
-
-.tabs-right > .nav-tabs > li > a {
-  margin-left: -1px;
-  -webkit-border-radius: 0 4px 4px 0;
-     -moz-border-radius: 0 4px 4px 0;
-          border-radius: 0 4px 4px 0;
-}
-
-.tabs-right > .nav-tabs > li > a:hover {
-  border-color: #eeeeee #eeeeee #eeeeee #dddddd;
-}
-
-.tabs-right > .nav-tabs .active > a,
-.tabs-right > .nav-tabs .active > a:hover {
-  border-color: #ddd #ddd #ddd transparent;
-  *border-left-color: #ffffff;
-}
-
-.nav > .disabled > a {
-  color: #999999;
-}
-
-.nav > .disabled > a:hover {
-  text-decoration: none;
-  cursor: default;
-  background-color: transparent;
-}
-
-.navbar {
-  *position: relative;
-  *z-index: 2;
-  margin-bottom: 20px;
-  overflow: visible;
-}
-
-.navbar-inner {
-  min-height: 40px;
-  padding-right: 20px;
-  padding-left: 20px;
-  background-color: #fafafa;
-  background-image: -moz-linear-gradient(top, #ffffff, #f2f2f2);
-  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#ffffff), to(#f2f2f2));
-  background-image: -webkit-linear-gradient(top, #ffffff, #f2f2f2);
-  background-image: -o-linear-gradient(top, #ffffff, #f2f2f2);
-  background-image: linear-gradient(to bottom, #ffffff, #f2f2f2);
-  background-repeat: repeat-x;
-  border: 1px solid #d4d4d4;
-  -webkit-border-radius: 4px;
-     -moz-border-radius: 4px;
-          border-radius: 4px;
-  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff', endColorstr='#fff2f2f2', GradientType=0);
-  *zoom: 1;
-  -webkit-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.065);
-     -moz-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.065);
-          box-shadow: 0 1px 4px rgba(0, 0, 0, 0.065);
-}
-
-.navbar-inner:before,
-.navbar-inner:after {
-  display: table;
-  line-height: 0;
-  content: "";
-}
-
-.navbar-inner:after {
-  clear: both;
-}
-
-.navbar .container {
-  width: auto;
-}
-
-.nav-collapse.collapse {
-  height: auto;
-  overflow: visible;
-}
-
-.navbar .brand {
-  display: block;
-  float: left;
-  padding: 10px 20px 10px;
-  margin-left: -20px;
-  font-size: 20px;
-  font-weight: 200;
-  color: #777777;
-  text-shadow: 0 1px 0 #ffffff;
-}
-
-.navbar .brand:hover {
-  text-decoration: none;
-}
-
-.navbar-text {
-  margin-bottom: 0;
-  line-height: 40px;
-  color: #777777;
-}
-
-.navbar-link {
-  color: #777777;
-}
-
-.navbar-link:hover {
-  color: #333333;
-}
-
-.navbar .divider-vertical {
-  height: 40px;
-  margin: 0 9px;
-  border-right: 1px solid #ffffff;
-  border-left: 1px solid #f2f2f2;
-}
-
-.navbar .btn,
-.navbar .btn-group {
-  margin-top: 5px;
-}
-
-.navbar .btn-group .btn,
-.navbar .input-prepend .btn,
-.navbar .input-append .btn {
-  margin-top: 0;
-}
-
-.navbar-form {
-  margin-bottom: 0;
-  *zoom: 1;
-}
-
-.navbar-form:before,
-.navbar-form:after {
-  display: table;
-  line-height: 0;
-  content: "";
-}
-
-.navbar-form:after {
-  clear: both;
-}
-
-.navbar-form input,
-.navbar-form select,
-.navbar-form .radio,
-.navbar-form .checkbox {
-  margin-top: 5px;
-}
-
-.navbar-form input,
-.navbar-form select,
-.navbar-form .btn {
-  display: inline-block;
-  margin-bottom: 0;
-}
-
-.navbar-form input[type="image"],
-.navbar-form input[type="checkbox"],
-.navbar-form input[type="radio"] {
-  margin-top: 3px;
-}
-
-.navbar-form .input-append,
-.navbar-form .input-prepend {
-  margin-top: 5px;
-  white-space: nowrap;
-}
-
-.navbar-form .input-append input,
-.navbar-form .input-prepend input {
-  margin-top: 0;
-}
-
-.navbar-search {
-  position: relative;
-  float: left;
-  margin-top: 5px;
-  margin-bottom: 0;
-}
-
-.navbar-search .search-query {
-  padding: 4px 14px;
-  margin-bottom: 0;
-  font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
-  font-size: 13px;
-  font-weight: normal;
-  line-height: 1;
-  -webkit-border-radius: 15px;
-     -moz-border-radius: 15px;
-          border-radius: 15px;
-}
-
-.navbar-static-top {
-  position: static;
-  margin-bottom: 0;
-}
-
-.navbar-static-top .navbar-inner {
-  -webkit-border-radius: 0;
-     -moz-border-radius: 0;
-          border-radius: 0;
-}
-
-.navbar-fixed-top,
-.navbar-fixed-bottom {
-  position: fixed;
-  right: 0;
-  left: 0;
-  z-index: 1030;
-  margin-bottom: 0;
-}
-
-.navbar-fixed-top .navbar-inner,
-.navbar-static-top .navbar-inner {
-  border-width: 0 0 1px;
-}
-
-.navbar-fixed-bottom .navbar-inner {
-  border-width: 1px 0 0;
-}
-
-.navbar-fixed-top .navbar-inner,
-.navbar-fixed-bottom .navbar-inner {
-  padding-right: 0;
-  padding-left: 0;
-  -webkit-border-radius: 0;
-     -moz-border-radius: 0;
-          border-radius: 0;
-}
-
-.navbar-static-top .container,
-.navbar-fixed-top .container,
-.navbar-fixed-bottom .container {
-  width: 940px;
-}
-
-.navbar-fixed-top {
-  top: 0;
-}
-
-.navbar-fixed-top .navbar-inner,
-.navbar-static-top .navbar-inner {
-  -webkit-box-shadow: 0 1px 10px rgba(0, 0, 0, 0.1);
-     -moz-box-shadow: 0 1px 10px rgba(0, 0, 0, 0.1);
-          box-shadow: 0 1px 10px rgba(0, 0, 0, 0.1);
-}
-
-.navbar-fixed-bottom {
-  bottom: 0;
-}
-
-.navbar-fixed-bottom .navbar-inner {
-  -webkit-box-shadow: 0 -1px 10px rgba(0, 0, 0, 0.1);
-     -moz-box-shadow: 0 -1px 10px rgba(0, 0, 0, 0.1);
-          box-shadow: 0 -1px 10px rgba(0, 0, 0, 0.1);
-}
-
-.navbar .nav {
-  position: relative;
-  left: 0;
-  display: block;
-  float: left;
-  margin: 0 10px 0 0;
-}
-
-.navbar .nav.pull-right {
-  float: right;
-  margin-right: 0;
-}
-
-.navbar .nav > li {
-  float: left;
-}
-
-.navbar .nav > li > a {
-  float: none;
-  padding: 10px 15px 10px;
-  color: #777777;
-  text-decoration: none;
-  text-shadow: 0 1px 0 #ffffff;
-}
-
-.navbar .nav .dropdown-toggle .caret {
-  margin-top: 8px;
-}
-
-.navbar .nav > li > a:focus,
-.navbar .nav > li > a:hover {
-  color: #333333;
-  text-decoration: none;
-  background-color: transparent;
-}
-
-.navbar .nav > .active > a,
-.navbar .nav > .active > a:hover,
-.navbar .nav > .active > a:focus {
-  color: #555555;
-  text-decoration: none;
-  background-color: #e5e5e5;
-  -webkit-box-shadow: inset 0 3px 8px rgba(0, 0, 0, 0.125);
-     -moz-box-shadow: inset 0 3px 8px rgba(0, 0, 0, 0.125);
-          box-shadow: inset 0 3px 8px rgba(0, 0, 0, 0.125);
-}
-
-.navbar .btn-navbar {
-  display: none;
-  float: right;
-  padding: 7px 10px;
-  margin-right: 5px;
-  margin-left: 5px;
-  color: #ffffff;
-  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
-  background-color: #ededed;
-  *background-color: #e5e5e5;
-  background-image: -moz-linear-gradient(top, #f2f2f2, #e5e5e5);
-  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#f2f2f2), to(#e5e5e5));
-  background-image: -webkit-linear-gradient(top, #f2f2f2, #e5e5e5);
-  background-image: -o-linear-gradient(top, #f2f2f2, #e5e5e5);
-  background-image: linear-gradient(to bottom, #f2f2f2, #e5e5e5);
-  background-repeat: repeat-x;
-  border-color: #e5e5e5 #e5e5e5 #bfbfbf;
-  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
-  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#fff2f2f2', endColorstr='#ffe5e5e5', GradientType=0);
-  filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
-  -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.1), 0 1px 0 rgba(255, 255, 255, 0.075);
-     -moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.1), 0 1px 0 rgba(255, 255, 255, 0.075);
-          box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.1), 0 1px 0 rgba(255, 255, 255, 0.075);
-}
-
-.navbar .btn-navbar:hover,
-.navbar .btn-navbar:active,
-.navbar .btn-navbar.active,
-.navbar .btn-navbar.disabled,
-.navbar .btn-navbar[disabled] {
-  color: #ffffff;
-  background-color: #e5e5e5;
-  *background-color: #d9d9d9;
-}
-
-.navbar .btn-navbar:active,
-.navbar .btn-navbar.active {
-  background-color: #cccccc \9;
-}
-
-.navbar .btn-navbar .icon-bar {
-  display: block;
-  width: 18px;
-  height: 2px;
-  background-color: #f5f5f5;
-  -webkit-border-radius: 1px;
-     -moz-border-radius: 1px;
-          border-radius: 1px;
-  -webkit-box-shadow: 0 1px 0 rgba(0, 0, 0, 0.25);
-     -moz-box-shadow: 0 1px 0 rgba(0, 0, 0, 0.25);
-          box-shadow: 0 1px 0 rgba(0, 0, 0, 0.25);
-}
-
-.btn-navbar .icon-bar + .icon-bar {
-  margin-top: 3px;
-}
-
-.navbar .nav > li > .dropdown-menu:before {
-  position: absolute;
-  top: -7px;
-  left: 9px;
-  display: inline-block;
-  border-right: 7px solid transparent;
-  border-bottom: 7px solid #ccc;
-  border-left: 7px solid transparent;
-  border-bottom-color: rgba(0, 0, 0, 0.2);
-  content: '';
-}
-
-.navbar .nav > li > .dropdown-menu:after {
-  position: absolute;
-  top: -6px;
-  left: 10px;
-  display: inline-block;
-  border-right: 6px solid transparent;
-  border-bottom: 6px solid #ffffff;
-  border-left: 6px solid transparent;
-  content: '';
-}
-
-.navbar-fixed-bottom .nav > li > .dropdown-menu:before {
-  top: auto;
-  bottom: -7px;
-  border-top: 7px solid #ccc;
-  border-bottom: 0;
-  border-top-color: rgba(0, 0, 0, 0.2);
-}
-
-.navbar-fixed-bottom .nav > li > .dropdown-menu:after {
-  top: auto;
-  bottom: -6px;
-  border-top: 6px solid #ffffff;
-  border-bottom: 0;
-}
-
-.navbar .nav li.dropdown > a:hover .caret {
-  border-top-color: #555555;
-  border-bottom-color: #555555;
-}
-
-.navbar .nav li.dropdown.open > .dropdown-toggle,
-.navbar .nav li.dropdown.active > .dropdown-toggle,
-.navbar .nav li.dropdown.open.active > .dropdown-toggle {
-  color: #555555;
-  background-color: #e5e5e5;
-}
-
-.navbar .nav li.dropdown > .dropdown-toggle .caret {
-  border-top-color: #777777;
-  border-bottom-color: #777777;
-}
-
-.navbar .nav li.dropdown.open > .dropdown-toggle .caret,
-.navbar .nav li.dropdown.active > .dropdown-toggle .caret,
-.navbar .nav li.dropdown.open.active > .dropdown-toggle .caret {
-  border-top-color: #555555;
-  border-bottom-color: #555555;
-}
-
-.navbar .pull-right > li > .dropdown-menu,
-.navbar .nav > li > .dropdown-menu.pull-right {
-  right: 0;
-  left: auto;
-}
-
-.navbar .pull-right > li > .dropdown-menu:before,
-.navbar .nav > li > .dropdown-menu.pull-right:before {
-  right: 12px;
-  left: auto;
-}
-
-.navbar .pull-right > li > .dropdown-menu:after,
-.navbar .nav > li > .dropdown-menu.pull-right:after {
-  right: 13px;
-  left: auto;
-}
-
-.navbar .pull-right > li > .dropdown-menu .dropdown-menu,
-.navbar .nav > li > .dropdown-menu.pull-right .dropdown-menu {
-  right: 100%;
-  left: auto;
-  margin-right: -1px;
-  margin-left: 0;
-  -webkit-border-radius: 6px 0 6px 6px;
-     -moz-border-radius: 6px 0 6px 6px;
-          border-radius: 6px 0 6px 6px;
-}
-
-.navbar-inverse .navbar-inner {
-  background-color: #1b1b1b;
-  background-image: -moz-linear-gradient(top, #222222, #111111);
-  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#222222), to(#111111));
-  background-image: -webkit-linear-gradient(top, #222222, #111111);
-  background-image: -o-linear-gradient(top, #222222, #111111);
-  background-image: linear-gradient(to bottom, #222222, #111111);
-  background-repeat: repeat-x;
-  border-color: #252525;
-  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff222222', endColorstr='#ff111111', GradientType=0);
-}
-
-.navbar-inverse .brand,
-.navbar-inverse .nav > li > a {
-  color: #999999;
-  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
-}
-
-.navbar-inverse .brand:hover,
-.navbar-inverse .nav > li > a:hover {
-  color: #ffffff;
-}
-
-.navbar-inverse .brand {
-  color: #999999;
-}
-
-.navbar-inverse .navbar-text {
-  color: #999999;
-}
-
-.navbar-inverse .nav > li > a:focus,
-.navbar-inverse .nav > li > a:hover {
-  color: #ffffff;
-  background-color: transparent;
-}
-
-.navbar-inverse .nav .active > a,
-.navbar-inverse .nav .active > a:hover,
-.navbar-inverse .nav .active > a:focus {
-  color: #ffffff;
-  background-color: #111111;
-}
-
-.navbar-inverse .navbar-link {
-  color: #999999;
-}
-
-.navbar-inverse .navbar-link:hover {
-  color: #ffffff;
-}
-
-.navbar-inverse .divider-vertical {
-  border-right-color: #222222;
-  border-left-color: #111111;
-}
-
-.navbar-inverse .nav li.dropdown.open > .dropdown-toggle,
-.navbar-inverse .nav li.dropdown.active > .dropdown-toggle,
-.navbar-inverse .nav li.dropdown.open.active > .dropdown-toggle {
-  color: #ffffff;
-  background-color: #111111;
-}
-
-.navbar-inverse .nav li.dropdown > a:hover .caret {
-  border-top-color: #ffffff;
-  border-bottom-color: #ffffff;
-}
-
-.navbar-inverse .nav li.dropdown > .dropdown-toggle .caret {
-  border-top-color: #999999;
-  border-bottom-color: #999999;
-}
-
-.navbar-inverse .nav li.dropdown.open > .dropdown-toggle .caret,
-.navbar-inverse .nav li.dropdown.active > .dropdown-toggle .caret,
-.navbar-inverse .nav li.dropdown.open.active > .dropdown-toggle .caret {
-  border-top-color: #ffffff;
-  border-bottom-color: #ffffff;
-}
-
-.navbar-inverse .navbar-search .search-query {
-  color: #ffffff;
-  background-color: #515151;
-  border-color: #111111;
-  -webkit-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1), 0 1px 0 rgba(255, 255, 255, 0.15);
-     -moz-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1), 0 1px 0 rgba(255, 255, 255, 0.15);
-          box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1), 0 1px 0 rgba(255, 255, 255, 0.15);
-  -webkit-transition: none;
-     -moz-transition: none;
-       -o-transition: none;
-          transition: none;
-}
-
-.navbar-inverse .navbar-search .search-query:-moz-placeholder {
-  color: #cccccc;
-}
-
-.navbar-inverse .navbar-search .search-query:-ms-input-placeholder {
-  color: #cccccc;
-}
-
-.navbar-inverse .navbar-search .search-query::-webkit-input-placeholder {
-  color: #cccccc;
-}
-
-.navbar-inverse .navbar-search .search-query:focus,
-.navbar-inverse .navbar-search .search-query.focused {
-  padding: 5px 15px;
-  color: #333333;
-  text-shadow: 0 1px 0 #ffffff;
-  background-color: #ffffff;
-  border: 0;
-  outline: 0;
-  -webkit-box-shadow: 0 0 3px rgba(0, 0, 0, 0.15);
-     -moz-box-shadow: 0 0 3px rgba(0, 0, 0, 0.15);
-          box-shadow: 0 0 3px rgba(0, 0, 0, 0.15);
-}
-
-.navbar-inverse .btn-navbar {
-  color: #ffffff;
-  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
-  background-color: #0e0e0e;
-  *background-color: #040404;
-  background-image: -moz-linear-gradient(top, #151515, #040404);
-  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#151515), to(#040404));
-  background-image: -webkit-linear-gradient(top, #151515, #040404);
-  background-image: -o-linear-gradient(top, #151515, #040404);
-  background-image: linear-gradient(to bottom, #151515, #040404);
-  background-repeat: repeat-x;
-  border-color: #040404 #040404 #000000;
-  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
-  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff151515', endColorstr='#ff040404', GradientType=0);
-  filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
-}
-
-.navbar-inverse .btn-navbar:hover,
-.navbar-inverse .btn-navbar:active,
-.navbar-inverse .btn-navbar.active,
-.navbar-inverse .btn-navbar.disabled,
-.navbar-inverse .btn-navbar[disabled] {
-  color: #ffffff;
-  background-color: #040404;
-  *background-color: #000000;
-}
-
-.navbar-inverse .btn-navbar:active,
-.navbar-inverse .btn-navbar.active {
-  background-color: #000000 \9;
-}
-
-.breadcrumb {
-  padding: 8px 15px;
-  margin: 0 0 20px;
-  list-style: none;
-  background-color: #f5f5f5;
-  -webkit-border-radius: 4px;
-     -moz-border-radius: 4px;
-          border-radius: 4px;
-}
-
-.breadcrumb > li {
-  display: inline-block;
-  *display: inline;
-  text-shadow: 0 1px 0 #ffffff;
-  *zoom: 1;
-}
-
-.breadcrumb > li > .divider {
-  padding: 0 5px;
-  color: #ccc;
-}
-
-.breadcrumb > .active {
-  color: #999999;
-}
-
-.pagination {
-  margin: 20px 0;
-}
-
-.pagination ul {
-  display: inline-block;
-  *display: inline;
-  margin-bottom: 0;
-  margin-left: 0;
-  -webkit-border-radius: 4px;
-     -moz-border-radius: 4px;
-          border-radius: 4px;
-  *zoom: 1;
-  -webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
-     -moz-box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
-          box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
-}
-
-.pagination ul > li {
-  display: inline;
-}
-
-.pagination ul > li > a,
-.pagination ul > li > span {
-  float: left;
-  padding: 4px 12px;
-  line-height: 20px;
-  text-decoration: none;
-  background-color: #ffffff;
-  border: 1px solid #dddddd;
-  border-left-width: 0;
-}
-
-.pagination ul > li > a:hover,
-.pagination ul > .active > a,
-.pagination ul > .active > span {
-  background-color: #f5f5f5;
-}
-
-.pagination ul > .active > a,
-.pagination ul > .active > span {
-  color: #999999;
-  cursor: default;
-}
-
-.pagination ul > .disabled > span,
-.pagination ul > .disabled > a,
-.pagination ul > .disabled > a:hover {
-  color: #999999;
-  cursor: default;
-  background-color: transparent;
-}
-
-.pagination ul > li:first-child > a,
-.pagination ul > li:first-child > span {
-  border-left-width: 1px;
-  -webkit-border-bottom-left-radius: 4px;
-          border-bottom-left-radius: 4px;
-  -webkit-border-top-left-radius: 4px;
-          border-top-left-radius: 4px;
-  -moz-border-radius-bottomleft: 4px;
-  -moz-border-radius-topleft: 4px;
-}
-
-.pagination ul > li:last-child > a,
-.pagination ul > li:last-child > span {
-  -webkit-border-top-right-radius: 4px;
-          border-top-right-radius: 4px;
-  -webkit-border-bottom-right-radius: 4px;
-          border-bottom-right-radius: 4px;
-  -moz-border-radius-topright: 4px;
-  -moz-border-radius-bottomright: 4px;
-}
-
-.pagination-centered {
-  text-align: center;
-}
-
-.pagination-right {
-  text-align: right;
-}
-
-.pagination-large ul > li > a,
-.pagination-large ul > li > span {
-  padding: 11px 19px;
-  font-size: 17.5px;
-}
-
-.pagination-large ul > li:first-child > a,
-.pagination-large ul > li:first-child > span {
-  -webkit-border-bottom-left-radius: 6px;
-          border-bottom-left-radius: 6px;
-  -webkit-border-top-left-radius: 6px;
-          border-top-left-radius: 6px;
-  -moz-border-radius-bottomleft: 6px;
-  -moz-border-radius-topleft: 6px;
-}
-
-.pagination-large ul > li:last-child > a,
-.pagination-large ul > li:last-child > span {
-  -webkit-border-top-right-radius: 6px;
-          border-top-right-radius: 6px;
-  -webkit-border-bottom-right-radius: 6px;
-          border-bottom-right-radius: 6px;
-  -moz-border-radius-topright: 6px;
-  -moz-border-radius-bottomright: 6px;
-}
-
-.pagination-mini ul > li:first-child > a,
-.pagination-small ul > li:first-child > a,
-.pagination-mini ul > li:first-child > span,
-.pagination-small ul > li:first-child > span {
-  -webkit-border-bottom-left-radius: 3px;
-          border-bottom-left-radius: 3px;
-  -webkit-border-top-left-radius: 3px;
-          border-top-left-radius: 3px;
-  -moz-border-radius-bottomleft: 3px;
-  -moz-border-radius-topleft: 3px;
-}
-
-.pagination-mini ul > li:last-child > a,
-.pagination-small ul > li:last-child > a,
-.pagination-mini ul > li:last-child > span,
-.pagination-small ul > li:last-child > span {
-  -webkit-border-top-right-radius: 3px;
-          border-top-right-radius: 3px;
-  -webkit-border-bottom-right-radius: 3px;
-          border-bottom-right-radius: 3px;
-  -moz-border-radius-topright: 3px;
-  -moz-border-radius-bottomright: 3px;
-}
-
-.pagination-small ul > li > a,
-.pagination-small ul > li > span {
-  padding: 2px 10px;
-  font-size: 11.9px;
-}
-
-.pagination-mini ul > li > a,
-.pagination-mini ul > li > span {
-  padding: 0 6px;
-  font-size: 10.5px;
-}
-
-.pager {
-  margin: 20px 0;
-  text-align: center;
-  list-style: none;
-  *zoom: 1;
-}
-
-.pager:before,
-.pager:after {
-  display: table;
-  line-height: 0;
-  content: "";
-}
-
-.pager:after {
-  clear: both;
-}
-
-.pager li {
-  display: inline;
-}
-
-.pager li > a,
-.pager li > span {
-  display: inline-block;
-  padding: 5px 14px;
-  background-color: #fff;
-  border: 1px solid #ddd;
-  -webkit-border-radius: 15px;
-     -moz-border-radius: 15px;
-          border-radius: 15px;
-}
-
-.pager li > a:hover {
-  text-decoration: none;
-  background-color: #f5f5f5;
-}
-
-.pager .next > a,
-.pager .next > span {
-  float: right;
-}
-
-.pager .previous > a,
-.pager .previous > span {
-  float: left;
-}
-
-.pager .disabled > a,
-.pager .disabled > a:hover,
-.pager .disabled > span {
-  color: #999999;
-  cursor: default;
-  background-color: #fff;
-}
-
-.modal-backdrop {
-  position: fixed;
-  top: 0;
-  right: 0;
-  bottom: 0;
-  left: 0;
-  z-index: 1040;
-  background-color: #000000;
-}
-
-.modal-backdrop.fade {
-  opacity: 0;
-}
-
-.modal-backdrop,
-.modal-backdrop.fade.in {
-  opacity: 0.8;
-  filter: alpha(opacity=80);
-}
-
-.modal {
-  position: fixed;
-  top: 10%;
-  left: 50%;
-  z-index: 1050;
-  width: 560px;
-  margin-left: -280px;
-  background-color: #ffffff;
-  border: 1px solid #999;
-  border: 1px solid rgba(0, 0, 0, 0.3);
-  *border: 1px solid #999;
-  -webkit-border-radius: 6px;
-     -moz-border-radius: 6px;
-          border-radius: 6px;
-  outline: none;
-  -webkit-box-shadow: 0 3px 7px rgba(0, 0, 0, 0.3);
-     -moz-box-shadow: 0 3px 7px rgba(0, 0, 0, 0.3);
-          box-shadow: 0 3px 7px rgba(0, 0, 0, 0.3);
-  -webkit-background-clip: padding-box;
-     -moz-background-clip: padding-box;
-          background-clip: padding-box;
-}
-
-.modal.fade {
-  top: -25%;
-  -webkit-transition: opacity 0.3s linear, top 0.3s ease-out;
-     -moz-transition: opacity 0.3s linear, top 0.3s ease-out;
-       -o-transition: opacity 0.3s linear, top 0.3s ease-out;
-          transition: opacity 0.3s linear, top 0.3s ease-out;
-}
-
-.modal.fade.in {
-  top: 10%;
-}
-
-.modal-header {
-  padding: 9px 15px;
-  border-bottom: 1px solid #eee;
-}
-
-.modal-header .close {
-  margin-top: 2px;
-}
-
-.modal-header h3 {
-  margin: 0;
-  line-height: 30px;
-}
-
-.modal-body {
-  position: relative;
-  max-height: 400px;
-  padding: 15px;
-  overflow-y: auto;
-}
-
-.modal-form {
-  margin-bottom: 0;
-}
-
-.modal-footer {
-  padding: 14px 15px 15px;
-  margin-bottom: 0;
-  text-align: right;
-  background-color: #f5f5f5;
-  border-top: 1px solid #ddd;
-  -webkit-border-radius: 0 0 6px 6px;
-     -moz-border-radius: 0 0 6px 6px;
-          border-radius: 0 0 6px 6px;
-  *zoom: 1;
-  -webkit-box-shadow: inset 0 1px 0 #ffffff;
-     -moz-box-shadow: inset 0 1px 0 #ffffff;
-          box-shadow: inset 0 1px 0 #ffffff;
-}
-
-.modal-footer:before,
-.modal-footer:after {
-  display: table;
-  line-height: 0;
-  content: "";
-}
-
-.modal-footer:after {
-  clear: both;
-}
-
-.modal-footer .btn + .btn {
-  margin-bottom: 0;
-  margin-left: 5px;
-}
-
-.modal-footer .btn-group .btn + .btn {
-  margin-left: -1px;
-}
-
-.modal-footer .btn-block + .btn-block {
-  margin-left: 0;
-}
-
-.tooltip {
-  position: absolute;
-  z-index: 1030;
-  display: block;
-  padding: 5px;
-  font-size: 11px;
-  opacity: 0;
-  filter: alpha(opacity=0);
-  visibility: visible;
-}
-
-.tooltip.in {
-  opacity: 0.8;
-  filter: alpha(opacity=80);
-}
-
-.tooltip.top {
-  margin-top: -3px;
-}
-
-.tooltip.right {
-  margin-left: 3px;
-}
-
-.tooltip.bottom {
-  margin-top: 3px;
-}
-
-.tooltip.left {
-  margin-left: -3px;
-}
-
-.tooltip-inner {
-  max-width: 200px;
-  padding: 3px 8px;
-  color: #ffffff;
-  text-align: center;
-  text-decoration: none;
-  background-color: #000000;
-  -webkit-border-radius: 4px;
-     -moz-border-radius: 4px;
-          border-radius: 4px;
-}
-
-.tooltip-arrow {
-  position: absolute;
-  width: 0;
-  height: 0;
-  border-color: transparent;
-  border-style: solid;
-}
-
-.tooltip.top .tooltip-arrow {
-  bottom: 0;
-  left: 50%;
-  margin-left: -5px;
-  border-top-color: #000000;
-  border-width: 5px 5px 0;
-}
-
-.tooltip.right .tooltip-arrow {
-  top: 50%;
-  left: 0;
-  margin-top: -5px;
-  border-right-color: #000000;
-  border-width: 5px 5px 5px 0;
-}
-
-.tooltip.left .tooltip-arrow {
-  top: 50%;
-  right: 0;
-  margin-top: -5px;
-  border-left-color: #000000;
-  border-width: 5px 0 5px 5px;
-}
-
-.tooltip.bottom .tooltip-arrow {
-  top: 0;
-  left: 50%;
-  margin-left: -5px;
-  border-bottom-color: #000000;
-  border-width: 0 5px 5px;
-}
-
-.popover {
-  position: absolute;
-  top: 0;
-  left: 0;
-  z-index: 1010;
-  display: none;
-  width: 236px;
-  padding: 1px;
-  text-align: left;
-  white-space: normal;
-  background-color: #ffffff;
-  border: 1px solid #ccc;
-  border: 1px solid rgba(0, 0, 0, 0.2);
-  -webkit-border-radius: 6px;
-     -moz-border-radius: 6px;
-          border-radius: 6px;
-  -webkit-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
-     -moz-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
-          box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
-  -webkit-background-clip: padding-box;
-     -moz-background-clip: padding;
-          background-clip: padding-box;
-}
-
-.popover.top {
-  margin-top: -10px;
-}
-
-.popover.right {
-  margin-left: 10px;
-}
-
-.popover.bottom {
-  margin-top: 10px;
-}
-
-.popover.left {
-  margin-left: -10px;
-}
-
-.popover-title {
-  padding: 8px 14px;
-  margin: 0;
-  font-size: 14px;
-  font-weight: normal;
-  line-height: 18px;
-  background-color: #f7f7f7;
-  border-bottom: 1px solid #ebebeb;
-  -webkit-border-radius: 5px 5px 0 0;
-     -moz-border-radius: 5px 5px 0 0;
-          border-radius: 5px 5px 0 0;
-}
-
-.popover-content {
-  padding: 9px 14px;
-}
-
-.popover .arrow,
-.popover .arrow:after {
-  position: absolute;
-  display: block;
-  width: 0;
-  height: 0;
-  border-color: transparent;
-  border-style: solid;
-}
-
-.popover .arrow {
-  border-width: 11px;
-}
-
-.popover .arrow:after {
-  border-width: 10px;
-  content: "";
-}
-
-.popover.top .arrow {
-  bottom: -11px;
-  left: 50%;
-  margin-left: -11px;
-  border-top-color: #999;
-  border-top-color: rgba(0, 0, 0, 0.25);
-  border-bottom-width: 0;
-}
-
-.popover.top .arrow:after {
-  bottom: 1px;
-  margin-left: -10px;
-  border-top-color: #ffffff;
-  border-bottom-width: 0;
-}
-
-.popover.right .arrow {
-  top: 50%;
-  left: -11px;
-  margin-top: -11px;
-  border-right-color: #999;
-  border-right-color: rgba(0, 0, 0, 0.25);
-  border-left-width: 0;
-}
-
-.popover.right .arrow:after {
-  bottom: -10px;
-  left: 1px;
-  border-right-color: #ffffff;
-  border-left-width: 0;
-}
-
-.popover.bottom .arrow {
-  top: -11px;
-  left: 50%;
-  margin-left: -11px;
-  border-bottom-color: #999;
-  border-bottom-color: rgba(0, 0, 0, 0.25);
-  border-top-width: 0;
-}
-
-.popover.bottom .arrow:after {
-  top: 1px;
-  margin-left: -10px;
-  border-bottom-color: #ffffff;
-  border-top-width: 0;
-}
-
-.popover.left .arrow {
-  top: 50%;
-  right: -11px;
-  margin-top: -11px;
-  border-left-color: #999;
-  border-left-color: rgba(0, 0, 0, 0.25);
-  border-right-width: 0;
-}
-
-.popover.left .arrow:after {
-  right: 1px;
-  bottom: -10px;
-  border-left-color: #ffffff;
-  border-right-width: 0;
-}
-
-.thumbnails {
-  margin-left: -20px;
-  list-style: none;
-  *zoom: 1;
-}
-
-.thumbnails:before,
-.thumbnails:after {
-  display: table;
-  line-height: 0;
-  content: "";
-}
-
-.thumbnails:after {
-  clear: both;
-}
-
-.row-fluid .thumbnails {
-  margin-left: 0;
-}
-
-.thumbnails > li {
-  float: left;
-  margin-bottom: 20px;
-  margin-left: 20px;
-}
-
-.thumbnail {
-  display: block;
-  padding: 4px;
-  line-height: 20px;
-  border: 1px solid #ddd;
-  -webkit-border-radius: 4px;
-     -moz-border-radius: 4px;
-          border-radius: 4px;
-  -webkit-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.055);
-     -moz-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.055);
-          box-shadow: 0 1px 3px rgba(0, 0, 0, 0.055);
-  -webkit-transition: all 0.2s ease-in-out;
-     -moz-transition: all 0.2s ease-in-out;
-       -o-transition: all 0.2s ease-in-out;
-          transition: all 0.2s ease-in-out;
-}
-
-a.thumbnail:hover {
-  border-color: #0088cc;
-  -webkit-box-shadow: 0 1px 4px rgba(0, 105, 214, 0.25);
-     -moz-box-shadow: 0 1px 4px rgba(0, 105, 214, 0.25);
-          box-shadow: 0 1px 4px rgba(0, 105, 214, 0.25);
-}
-
-.thumbnail > img {
-  display: block;
-  max-width: 100%;
-  margin-right: auto;
-  margin-left: auto;
-}
-
-.thumbnail .caption {
-  padding: 9px;
-  color: #555555;
-}
-
-.media,
-.media-body {
-  overflow: hidden;
-  *overflow: visible;
-  zoom: 1;
-}
-
-.media,
-.media .media {
-  margin-top: 15px;
-}
-
-.media:first-child {
-  margin-top: 0;
-}
-
-.media-object {
-  display: block;
-}
-
-.media-heading {
-  margin: 0 0 5px;
-}
-
-.media .pull-left {
-  margin-right: 10px;
-}
-
-.media .pull-right {
-  margin-left: 10px;
-}
-
-.media-list {
-  margin-left: 0;
-  list-style: none;
-}
-
-.label,
-.badge {
-  display: inline-block;
-  padding: 2px 4px;
-  font-size: 11.844px;
-  font-weight: bold;
-  line-height: 14px;
-  color: #ffffff;
-  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
-  white-space: nowrap;
-  vertical-align: baseline;
-  background-color: #999999;
-}
-
-.label {
-  -webkit-border-radius: 3px;
-     -moz-border-radius: 3px;
-          border-radius: 3px;
-}
-
-.badge {
-  padding-right: 9px;
-  padding-left: 9px;
-  -webkit-border-radius: 9px;
-     -moz-border-radius: 9px;
-          border-radius: 9px;
-}
-
-.label:empty,
-.badge:empty {
-  display: none;
-}
-
-a.label:hover,
-a.badge:hover {
-  color: #ffffff;
-  text-decoration: none;
-  cursor: pointer;
-}
-
-.label-important,
-.badge-important {
-  background-color: #b94a48;
-}
-
-.label-important[href],
-.badge-important[href] {
-  background-color: #953b39;
-}
-
-.label-warning,
-.badge-warning {
-  background-color: #f89406;
-}
-
-.label-warning[href],
-.badge-warning[href] {
-  background-color: #c67605;
-}
-
-.label-success,
-.badge-success {
-  background-color: #468847;
-}
-
-.label-success[href],
-.badge-success[href] {
-  background-color: #356635;
-}
-
-.label-info,
-.badge-info {
-  background-color: #3a87ad;
-}
-
-.label-info[href],
-.badge-info[href] {
-  background-color: #2d6987;
-}
-
-.label-inverse,
-.badge-inverse {
-  background-color: #333333;
-}
-
-.label-inverse[href],
-.badge-inverse[href] {
-  background-color: #1a1a1a;
-}
-
-.btn .label,
-.btn .badge {
-  position: relative;
-  top: -1px;
-}
-
-.btn-mini .label,
-.btn-mini .badge {
-  top: 0;
-}
-
- at -webkit-keyframes progress-bar-stripes {
-  from {
-    background-position: 40px 0;
-  }
-  to {
-    background-position: 0 0;
-  }
-}
-
- at -moz-keyframes progress-bar-stripes {
-  from {
-    background-position: 40px 0;
-  }
-  to {
-    background-position: 0 0;
-  }
-}
-
- at -ms-keyframes progress-bar-stripes {
-  from {
-    background-position: 40px 0;
-  }
-  to {
-    background-position: 0 0;
-  }
-}
-
- at -o-keyframes progress-bar-stripes {
-  from {
-    background-position: 0 0;
-  }
-  to {
-    background-position: 40px 0;
-  }
-}
-
- at keyframes progress-bar-stripes {
-  from {
-    background-position: 40px 0;
-  }
-  to {
-    background-position: 0 0;
-  }
-}
-
-.progress {
-  height: 20px;
-  margin-bottom: 20px;
-  overflow: hidden;
-  background-color: #f7f7f7;
-  background-image: -moz-linear-gradient(top, #f5f5f5, #f9f9f9);
-  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#f5f5f5), to(#f9f9f9));
-  background-image: -webkit-linear-gradient(top, #f5f5f5, #f9f9f9);
-  background-image: -o-linear-gradient(top, #f5f5f5, #f9f9f9);
-  background-image: linear-gradient(to bottom, #f5f5f5, #f9f9f9);
-  background-repeat: repeat-x;
-  -webkit-border-radius: 4px;
-     -moz-border-radius: 4px;
-          border-radius: 4px;
-  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#fff5f5f5', endColorstr='#fff9f9f9', GradientType=0);
-  -webkit-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
-     -moz-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
-          box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
-}
-
-.progress .bar {
-  float: left;
-  width: 0;
-  height: 100%;
-  font-size: 12px;
-  color: #ffffff;
-  text-align: center;
-  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
-  background-color: #0e90d2;
-  background-image: -moz-linear-gradient(top, #149bdf, #0480be);
-  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#149bdf), to(#0480be));
-  background-image: -webkit-linear-gradient(top, #149bdf, #0480be);
-  background-image: -o-linear-gradient(top, #149bdf, #0480be);
-  background-image: linear-gradient(to bottom, #149bdf, #0480be);
-  background-repeat: repeat-x;
-  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff149bdf', endColorstr='#ff0480be', GradientType=0);
-  -webkit-box-shadow: inset 0 -1px 0 rgba(0, 0, 0, 0.15);
-     -moz-box-shadow: inset 0 -1px 0 rgba(0, 0, 0, 0.15);
-          box-shadow: inset 0 -1px 0 rgba(0, 0, 0, 0.15);
-  -webkit-box-sizing: border-box;
-     -moz-box-sizing: border-box;
-          box-sizing: border-box;
-  -webkit-transition: width 0.6s ease;
-     -moz-transition: width 0.6s ease;
-       -o-transition: width 0.6s ease;
-          transition: width 0.6s ease;
-}
-
-.progress .bar + .bar {
-  -webkit-box-shadow: inset 1px 0 0 rgba(0, 0, 0, 0.15), inset 0 -1px 0 rgba(0, 0, 0, 0.15);
-     -moz-box-shadow: inset 1px 0 0 rgba(0, 0, 0, 0.15), inset 0 -1px 0 rgba(0, 0, 0, 0.15);
-          box-shadow: inset 1px 0 0 rgba(0, 0, 0, 0.15), inset 0 -1px 0 rgba(0, 0, 0, 0.15);
-}
-
-.progress-striped .bar {
-  background-color: #149bdf;
-  background-image: -webkit-gradient(linear, 0 100%, 100% 0, color-stop(0.25, rgba(255, 255, 255, 0.15)), color-stop(0.25, transparent), color-stop(0.5, transparent), color-stop(0.5, rgba(255, 255, 255, 0.15)), color-stop(0.75, rgba(255, 255, 255, 0.15)), color-stop(0.75, transparent), to(transparent));
-  background-image: -webkit-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
-  background-image: -moz-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
-  background-image: -o-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
-  background-image: linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
-  -webkit-background-size: 40px 40px;
-     -moz-background-size: 40px 40px;
-       -o-background-size: 40px 40px;
-          background-size: 40px 40px;
-}
-
-.progress.active .bar {
-  -webkit-animation: progress-bar-stripes 2s linear infinite;
-     -moz-animation: progress-bar-stripes 2s linear infinite;
-      -ms-animation: progress-bar-stripes 2s linear infinite;
-       -o-animation: progress-bar-stripes 2s linear infinite;
-          animation: progress-bar-stripes 2s linear infinite;
-}
-
-.progress-danger .bar,
-.progress .bar-danger {
-  background-color: #dd514c;
-  background-image: -moz-linear-gradient(top, #ee5f5b, #c43c35);
-  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#ee5f5b), to(#c43c35));
-  background-image: -webkit-linear-gradient(top, #ee5f5b, #c43c35);
-  background-image: -o-linear-gradient(top, #ee5f5b, #c43c35);
-  background-image: linear-gradient(to bottom, #ee5f5b, #c43c35);
-  background-repeat: repeat-x;
-  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffee5f5b', endColorstr='#ffc43c35', GradientType=0);
-}
-
-.progress-danger.progress-striped .bar,
-.progress-striped .bar-danger {
-  background-color: #ee5f5b;
-  background-image: -webkit-gradient(linear, 0 100%, 100% 0, color-stop(0.25, rgba(255, 255, 255, 0.15)), color-stop(0.25, transparent), color-stop(0.5, transparent), color-stop(0.5, rgba(255, 255, 255, 0.15)), color-stop(0.75, rgba(255, 255, 255, 0.15)), color-stop(0.75, transparent), to(transparent));
-  background-image: -webkit-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
-  background-image: -moz-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
-  background-image: -o-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
-  background-image: linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
-}
-
-.progress-success .bar,
-.progress .bar-success {
-  background-color: #5eb95e;
-  background-image: -moz-linear-gradient(top, #62c462, #57a957);
-  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#62c462), to(#57a957));
-  background-image: -webkit-linear-gradient(top, #62c462, #57a957);
-  background-image: -o-linear-gradient(top, #62c462, #57a957);
-  background-image: linear-gradient(to bottom, #62c462, #57a957);
-  background-repeat: repeat-x;
-  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff62c462', endColorstr='#ff57a957', GradientType=0);
-}
-
-.progress-success.progress-striped .bar,
-.progress-striped .bar-success {
-  background-color: #62c462;
-  background-image: -webkit-gradient(linear, 0 100%, 100% 0, color-stop(0.25, rgba(255, 255, 255, 0.15)), color-stop(0.25, transparent), color-stop(0.5, transparent), color-stop(0.5, rgba(255, 255, 255, 0.15)), color-stop(0.75, rgba(255, 255, 255, 0.15)), color-stop(0.75, transparent), to(transparent));
-  background-image: -webkit-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
-  background-image: -moz-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
-  background-image: -o-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
-  background-image: linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
-}
-
-.progress-info .bar,
-.progress .bar-info {
-  background-color: #4bb1cf;
-  background-image: -moz-linear-gradient(top, #5bc0de, #339bb9);
-  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#5bc0de), to(#339bb9));
-  background-image: -webkit-linear-gradient(top, #5bc0de, #339bb9);
-  background-image: -o-linear-gradient(top, #5bc0de, #339bb9);
-  background-image: linear-gradient(to bottom, #5bc0de, #339bb9);
-  background-repeat: repeat-x;
-  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff5bc0de', endColorstr='#ff339bb9', GradientType=0);
-}
-
-.progress-info.progress-striped .bar,
-.progress-striped .bar-info {
-  background-color: #5bc0de;
-  background-image: -webkit-gradient(linear, 0 100%, 100% 0, color-stop(0.25, rgba(255, 255, 255, 0.15)), color-stop(0.25, transparent), color-stop(0.5, transparent), color-stop(0.5, rgba(255, 255, 255, 0.15)), color-stop(0.75, rgba(255, 255, 255, 0.15)), color-stop(0.75, transparent), to(transparent));
-  background-image: -webkit-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
-  background-image: -moz-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
-  background-image: -o-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
-  background-image: linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
-}
-
-.progress-warning .bar,
-.progress .bar-warning {
-  background-color: #faa732;
-  background-image: -moz-linear-gradient(top, #fbb450, #f89406);
-  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#fbb450), to(#f89406));
-  background-image: -webkit-linear-gradient(top, #fbb450, #f89406);
-  background-image: -o-linear-gradient(top, #fbb450, #f89406);
-  background-image: linear-gradient(to bottom, #fbb450, #f89406);
-  background-repeat: repeat-x;
-  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#fffbb450', endColorstr='#fff89406', GradientType=0);
-}
-
-.progress-warning.progress-striped .bar,
-.progress-striped .bar-warning {
-  background-color: #fbb450;
-  background-image: -webkit-gradient(linear, 0 100%, 100% 0, color-stop(0.25, rgba(255, 255, 255, 0.15)), color-stop(0.25, transparent), color-stop(0.5, transparent), color-stop(0.5, rgba(255, 255, 255, 0.15)), color-stop(0.75, rgba(255, 255, 255, 0.15)), color-stop(0.75, transparent), to(transparent));
-  background-image: -webkit-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
-  background-image: -moz-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
-  background-image: -o-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
-  background-image: linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
-}
-
-.accordion {
-  margin-bottom: 20px;
-}
-
-.accordion-group {
-  margin-bottom: 2px;
-  border: 1px solid #e5e5e5;
-  -webkit-border-radius: 4px;
-     -moz-border-radius: 4px;
-          border-radius: 4px;
-}
-
-.accordion-heading {
-  border-bottom: 0;
-}
-
-.accordion-heading .accordion-toggle {
-  display: block;
-  padding: 8px 15px;
-}
-
-.accordion-toggle {
-  cursor: pointer;
-}
-
-.accordion-inner {
-  padding: 9px 15px;
-  border-top: 1px solid #e5e5e5;
-}
-
-.carousel {
-  position: relative;
-  margin-bottom: 20px;
-  line-height: 1;
-}
-
-.carousel-inner {
-  position: relative;
-  width: 100%;
-  overflow: hidden;
-}
-
-.carousel-inner > .item {
-  position: relative;
-  display: none;
-  -webkit-transition: 0.6s ease-in-out left;
-     -moz-transition: 0.6s ease-in-out left;
-       -o-transition: 0.6s ease-in-out left;
-          transition: 0.6s ease-in-out left;
-}
-
-.carousel-inner > .item > img {
-  display: block;
-  line-height: 1;
-}
-
-.carousel-inner > .active,
-.carousel-inner > .next,
-.carousel-inner > .prev {
-  display: block;
-}
-
-.carousel-inner > .active {
-  left: 0;
-}
-
-.carousel-inner > .next,
-.carousel-inner > .prev {
-  position: absolute;
-  top: 0;
-  width: 100%;
-}
-
-.carousel-inner > .next {
-  left: 100%;
-}
-
-.carousel-inner > .prev {
-  left: -100%;
-}
-
-.carousel-inner > .next.left,
-.carousel-inner > .prev.right {
-  left: 0;
-}
-
-.carousel-inner > .active.left {
-  left: -100%;
-}
-
-.carousel-inner > .active.right {
-  left: 100%;
-}
-
-.carousel-control {
-  position: absolute;
-  top: 40%;
-  left: 15px;
-  width: 40px;
-  height: 40px;
-  margin-top: -20px;
-  font-size: 60px;
-  font-weight: 100;
-  line-height: 30px;
-  color: #ffffff;
-  text-align: center;
-  background: #222222;
-  border: 3px solid #ffffff;
-  -webkit-border-radius: 23px;
-     -moz-border-radius: 23px;
-          border-radius: 23px;
-  opacity: 0.5;
-  filter: alpha(opacity=50);
-}
-
-.carousel-control.right {
-  right: 15px;
-  left: auto;
-}
-
-.carousel-control:hover {
-  color: #ffffff;
-  text-decoration: none;
-  opacity: 0.9;
-  filter: alpha(opacity=90);
-}
-
-.carousel-caption {
-  position: absolute;
-  right: 0;
-  bottom: 0;
-  left: 0;
-  padding: 15px;
-  background: #333333;
-  background: rgba(0, 0, 0, 0.75);
-}
-
-.carousel-caption h4,
-.carousel-caption p {
-  line-height: 20px;
-  color: #ffffff;
-}
-
-.carousel-caption h4 {
-  margin: 0 0 5px;
-}
-
-.carousel-caption p {
-  margin-bottom: 0;
-}
-
-.hero-unit {
-  padding: 60px;
-  margin-bottom: 30px;
-  font-size: 18px;
-  font-weight: 200;
-  line-height: 30px;
-  color: inherit;
-  background-color: #eeeeee;
-  -webkit-border-radius: 6px;
-     -moz-border-radius: 6px;
-          border-radius: 6px;
-}
-
-.hero-unit h1 {
-  margin-bottom: 0;
-  font-size: 60px;
-  line-height: 1;
-  letter-spacing: -1px;
-  color: inherit;
-}
-
-.hero-unit li {
-  line-height: 30px;
-}
-
-.pull-right {
-  float: right;
-}
-
-.pull-left {
-  float: left;
-}
-
-.hide {
-  display: none;
-}
-
-.show {
-  display: block;
-}
-
-.invisible {
-  visibility: hidden;
-}
-
-.affix {
-  position: fixed;
-}
diff --git a/docs/css/bootstrap.min.css b/docs/css/bootstrap.min.css
index 0a54023..8d319a3 100644
--- a/docs/css/bootstrap.min.css
+++ b/docs/css/bootstrap.min.css
@@ -1,882 +1,1480 @@
 @import url(//fonts.googleapis.com/css?family=Telex);
-article,aside,details,figcaption,figure,footer,header,hgroup,nav,section{display:block;}
-footer{line-height:3px;font-size:80%;}
-audio,canvas,video{display:inline-block;*display:inline;*zoom:1;}
-audio:not([controls]){display:none;}
-html{font-size:100%;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%;}
-a:focus{outline:thin dotted #333;outline:5px auto -webkit-focus-ring-color;outline-offset:-2px;}
-a:hover,a:active{outline:0;}
-sub,sup{position:relative;font-size:75%;line-height:0;vertical-align:baseline;}
-sup{top:-0.5em;}
-sub{bottom:-0.25em;}
-img{max-width:100%;width:auto\9;height:auto;vertical-align:middle;border:0;-ms-interpolation-mode:bicubic;}
-#map_canvas img,.google-maps img{max-width:none;}
-button,input,select,textarea{margin:0;font-size:100%;vertical-align:middle;}
-button,input{*overflow:visible;line-height:normal;}
-button::-moz-focus-inner,input::-moz-focus-inner{padding:0;border:0;}
-button,html input[type="button"],input[type="reset"],input[type="submit"]{-webkit-appearance:button;cursor:pointer;}
-label,select,button,input[type="button"],input[type="reset"],input[type="submit"],input[type="radio"],input[type="checkbox"]{cursor:pointer;}
-input[type="search"]{-webkit-box-sizing:content-box;-moz-box-sizing:content-box;box-sizing:content-box;-webkit-appearance:textfield;}
-input[type="search"]::-webkit-search-decoration,input[type="search"]::-webkit-search-cancel-button{-webkit-appearance:none;}
-textarea{overflow:auto;vertical-align:top;}
- at media print{*{text-shadow:none !important;color:#000 !important;background:transparent !important;box-shadow:none !important;} a,a:visited{text-decoration:underline;} a[href]:after{content:" (" attr(href) ")";} abbr[title]:after{content:" (" attr(title) ")";} .ir a:after,a[href^="javascript:"]:after,a[href^="#"]:after{content:"";} pre,blockquote{border:1px solid #999;page-break-inside:avoid;} thead{display:table-header-group;} tr,img{page-break-inside:avoid;} img{max-width:100% !important;} @page {margin:0.5cm;}p,h2,h3{orphans:3;widows:3;} h2,h3{page-break-after:avoid;}}.clearfix{*zoom:1;}.clearfix:before,.clearfix:after{display:table;content:"";line-height:0;}
-.clearfix:after{clear:both;}
-.hide-text{font:0/0 a;color:transparent;text-shadow:none;background-color:transparent;border:0;}
-.input-block-level{display:block;width:100%;min-height:30px;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;}
-body{margin:0;font-family:"Helvetica Neue",Helvetica,Arial,sans-serif;font-size:14px;line-height:20px;color:#555555;background-color:#ffffff;}
-a{color:#2fa4e7;text-decoration:none;}
-a:hover{color:#157ab5;text-decoration:underline;}
-.img-rounded{-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px;}
-.img-polaroid{padding:4px;background-color:#fff;border:1px solid #ccc;border:1px solid rgba(0, 0, 0, 0.2);-webkit-box-shadow:0 1px 3px rgba(0, 0, 0, 0.1);-moz-box-shadow:0 1px 3px rgba(0, 0, 0, 0.1);box-shadow:0 1px 3px rgba(0, 0, 0, 0.1);}
-.img-circle{-webkit-border-radius:500px;-moz-border-radius:500px;border-radius:500px;}
-.row{margin-left:-20px;*zoom:1;}.row:before,.row:after{display:table;content:"";line-height:0;}
-.row:after{clear:both;}
-[class*="span"]{float:left;min-height:1px;margin-left:20px;}
-.container,.navbar-static-top .container,.navbar-fixed-top .container,.navbar-fixed-bottom .container{width:940px;}
-.span12{width:940px;}
-.span11{width:860px;}
-.span10{width:780px;}
-.span9{width:700px;}
-.span8{width:620px;}
-.span7{width:540px;}
-.span6{width:460px;}
-.span5{width:380px;}
-.span4{width:300px;}
-.span3{width:220px;}
-.span2{width:140px;}
-.span1{width:60px;}
-.offset12{margin-left:980px;}
-.offset11{margin-left:900px;}
-.offset10{margin-left:820px;}
-.offset9{margin-left:740px;}
-.offset8{margin-left:660px;}
-.offset7{margin-left:580px;}
-.offset6{margin-left:500px;}
-.offset5{margin-left:420px;}
-.offset4{margin-left:340px;}
-.offset3{margin-left:260px;}
-.offset2{margin-left:180px;}
-.offset1{margin-left:100px;}
-.row-fluid{width:100%;*zoom:1;}.row-fluid:before,.row-fluid:after{display:table;content:"";line-height:0;}
-.row-fluid:after{clear:both;}
-.row-fluid [class*="span"]{display:block;width:100%;min-height:30px;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;float:left;margin-left:2.127659574468085%;*margin-left:2.074468085106383%;}
-.row-fluid [class*="span"]:first-child{margin-left:0;}
-.row-fluid .controls-row [class*="span"]+[class*="span"]{margin-left:2.127659574468085%;}
-.row-fluid .span12{width:100%;*width:99.94680851063829%;}
-.row-fluid .span11{width:91.48936170212765%;*width:91.43617021276594%;}
-.row-fluid .span10{width:82.97872340425532%;*width:82.92553191489361%;}
-.row-fluid .span9{width:74.46808510638297%;*width:74.41489361702126%;}
-.row-fluid .span8{width:65.95744680851064%;*width:65.90425531914893%;}
-.row-fluid .span7{width:57.44680851063829%;*width:57.39361702127659%;}
-.row-fluid .span6{width:48.93617021276595%;*width:48.88297872340425%;}
-.row-fluid .span5{width:40.42553191489362%;*width:40.37234042553192%;}
-.row-fluid .span4{width:31.914893617021278%;*width:31.861702127659576%;}
-.row-fluid .span3{width:23.404255319148934%;*width:23.351063829787233%;}
-.row-fluid .span2{width:14.893617021276595%;*width:14.840425531914894%;}
-.row-fluid .span1{width:6.382978723404255%;*width:6.329787234042553%;}
-.row-fluid .offset12{margin-left:104.25531914893617%;*margin-left:104.14893617021275%;}
-.row-fluid .offset12:first-child{margin-left:102.12765957446808%;*margin-left:102.02127659574467%;}
-.row-fluid .offset11{margin-left:95.74468085106382%;*margin-left:95.6382978723404%;}
-.row-fluid .offset11:first-child{margin-left:93.61702127659574%;*margin-left:93.51063829787232%;}
-.row-fluid .offset10{margin-left:87.23404255319149%;*margin-left:87.12765957446807%;}
-.row-fluid .offset10:first-child{margin-left:85.1063829787234%;*margin-left:84.99999999999999%;}
-.row-fluid .offset9{margin-left:78.72340425531914%;*margin-left:78.61702127659572%;}
-.row-fluid .offset9:first-child{margin-left:76.59574468085106%;*margin-left:76.48936170212764%;}
-.row-fluid .offset8{margin-left:70.2127659574468%;*margin-left:70.10638297872339%;}
-.row-fluid .offset8:first-child{margin-left:68.08510638297872%;*margin-left:67.9787234042553%;}
-.row-fluid .offset7{margin-left:61.70212765957446%;*margin-left:61.59574468085106%;}
-.row-fluid .offset7:first-child{margin-left:59.574468085106375%;*margin-left:59.46808510638297%;}
-.row-fluid .offset6{margin-left:53.191489361702125%;*margin-left:53.085106382978715%;}
-.row-fluid .offset6:first-child{margin-left:51.063829787234035%;*margin-left:50.95744680851063%;}
-.row-fluid .offset5{margin-left:44.68085106382979%;*margin-left:44.57446808510638%;}
-.row-fluid .offset5:first-child{margin-left:42.5531914893617%;*margin-left:42.4468085106383%;}
-.row-fluid .offset4{margin-left:36.170212765957444%;*margin-left:36.06382978723405%;}
-.row-fluid .offset4:first-child{margin-left:34.04255319148936%;*margin-left:33.93617021276596%;}
-.row-fluid .offset3{margin-left:27.659574468085104%;*margin-left:27.5531914893617%;}
-.row-fluid .offset3:first-child{margin-left:25.53191489361702%;*margin-left:25.425531914893618%;}
-.row-fluid .offset2{margin-left:19.148936170212764%;*margin-left:19.04255319148936%;}
-.row-fluid .offset2:first-child{margin-left:17.02127659574468%;*margin-left:16.914893617021278%;}
-.row-fluid .offset1{margin-left:10.638297872340425%;*margin-left:10.53191489361702%;}
-.row-fluid .offset1:first-child{margin-left:8.51063829787234%;*margin-left:8.404255319148938%;}
-[class*="span"].hide,.row-fluid [class*="span"].hide{display:none;}
-[class*="span"].pull-right,.row-fluid [class*="span"].pull-right{float:right;}
-.container{margin-right:auto;margin-left:auto;*zoom:1;}.container:before,.container:after{display:table;content:"";line-height:0;}
-.container:after{clear:both;}
-.container-fluid{padding-right:20px;padding-left:20px;*zoom:1;}.container-fluid:before,.container-fluid:after{display:table;content:"";line-height:0;}
-.container-fluid:after{clear:both;}
-p{margin:0 0 10px;}
-.lead{margin-bottom:20px;font-size:21px;font-weight:200;line-height:30px;}
-small{font-size:85%;}
-strong{font-weight:bold;}
-em{font-style:italic;}
-cite{font-style:normal;}
-.muted{color:#999999;}
-a.muted:hover{color:#808080;}
-.text-warning{color:#dd5600;}
-a.text-warning:hover{color:#aa4200;}
-.text-error{color:#bd4247;}
-a.text-error:hover{color:#983538;}
-.text-info{color:#817b58;}
-a.text-info:hover{color:#625e43;}
-.text-success{color:#669533;}
-a.text-success:hover{color:#4c6f26;}
-h1,h2,h3,h4,h5,h6{margin:10px 0;font-family:'Telex',sans-serif;font-weight:bold;line-height:20px;color:#317eac;text-rendering:optimizelegibility;}h1 small,h2 small,h3 small,h4 small,h5 small,h6 small{font-weight:normal;line-height:1;color:#999999;}
-h1,h2,h3{line-height:40px;}
-h1{font-size:38.5px;}
-h2{font-size:31.5px;}
-h3{font-size:24.5px;}
-h4{font-size:17.5px;}
-h5{font-size:14px;}
-h6{font-size:11.9px;}
-h1 small{font-size:24.5px;}
-h2 small{font-size:17.5px;}
-h3 small{font-size:14px;}
-h4 small{font-size:14px;}
-.page-header{padding-bottom:9px;margin:20px 0 30px;border-bottom:1px solid #f5f5f5;}
-ul,ol{padding:0;margin:0 0 10px 25px;}
-ul ul,ul ol,ol ol,ol ul{margin-bottom:0;}
-li{line-height:20px;}
-ul.unstyled,ol.unstyled{margin-left:0;list-style:none;}
-ul.inline,ol.inline{margin-left:0;list-style:none;}ul.inline >li,ol.inline >li{display:inline-block;padding-left:5px;padding-right:5px;}
-dl{margin-bottom:20px;}
-dt,dd{line-height:20px;}
-dt{font-weight:bold;}
-dd{margin-left:10px;}
-.dl-horizontal{*zoom:1;}.dl-horizontal:before,.dl-horizontal:after{display:table;content:"";line-height:0;}
-.dl-horizontal:after{clear:both;}
-.dl-horizontal dt{float:left;width:160px;clear:left;text-align:right;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;}
-.dl-horizontal dd{margin-left:180px;}
-hr{margin:20px 0;border:0;border-top:1px solid #f5f5f5;border-bottom:1px solid #ffffff;}
-abbr[title],abbr[data-original-title]{cursor:help;border-bottom:1px dotted #999999;}
-abbr.initialism{font-size:90%;text-transform:uppercase;}
-blockquote{padding:0 0 0 15px;margin:0 0 20px;border-left:5px solid #f5f5f5;}blockquote p{margin-bottom:0;font-size:16px;font-weight:300;line-height:25px;}
-blockquote small{display:block;line-height:20px;color:#999999;}blockquote small:before{content:'\2014 \00A0';}
-blockquote.pull-right{float:right;padding-right:15px;padding-left:0;border-right:5px solid #f5f5f5;border-left:0;}blockquote.pull-right p,blockquote.pull-right small{text-align:right;}
-blockquote.pull-right small:before{content:'';}
-blockquote.pull-right small:after{content:'\00A0 \2014';}
-q:before,q:after,blockquote:before,blockquote:after{content:"";}
-address{display:block;margin-bottom:20px;font-style:normal;line-height:20px;}
-code,pre{padding:0 3px 2px;font-family:Menlo,Monaco,Consolas,"Courier New",monospace;font-size:12px;color:#333333;-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px;}
-code{padding:2px 4px;color:#d14;background-color:#f7f7f9;border:1px solid #e1e1e8;white-space:nowrap;}
-pre{display:block;padding:9.5px;margin:0 0 10px;font-size:13px;line-height:20px;word-break:break-all;word-wrap:break-word;white-space:pre;white-space:pre-wrap;background-color:#f5f5f5;border:1px solid #ccc;border:1px solid rgba(0, 0, 0, 0.15);-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;}pre.prettyprint{margin-bottom:20px;}
-pre code{padding:0;color:inherit;white-space:pre;white-space:pre-wrap;background-color:transparent;border:0;}
-.pre-scrollable{max-height:340px;overflow-y:scroll;}
-form{margin:0 0 20px;}
-fieldset{padding:0;margin:0;border:0;}
-legend{display:block;width:100%;padding:0;margin-bottom:20px;font-size:21px;line-height:40px;color:#333333;border:0;border-bottom:1px solid #e5e5e5;}legend small{font-size:15px;color:#999999;}
-label,input,button,select,textarea{font-size:14px;font-weight:normal;line-height:20px;}
-input,button,select,textarea{font-family:"Helvetica Neue",Helvetica,Arial,sans-serif;}
-label{display:block;margin-bottom:5px;}
-select,textarea,input[type="text"],input[type="password"],input[type="datetime"],input[type="datetime-local"],input[type="date"],input[type="month"],input[type="time"],input[type="week"],input[type="number"],input[type="email"],input[type="url"],input[type="search"],input[type="tel"],input[type="color"],.uneditable-input{display:inline-block;height:20px;padding:4px 6px;margin-bottom:10px;font-size:14px;line-height:20px;color:#555555;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;vertical-align:middle;}
-input,textarea,.uneditable-input{width:206px;}
-textarea{height:auto;}
-textarea,input[type="text"],input[type="password"],input[type="datetime"],input[type="datetime-local"],input[type="date"],input[type="month"],input[type="time"],input[type="week"],input[type="number"],input[type="email"],input[type="url"],input[type="search"],input[type="tel"],input[type="color"],.uneditable-input{background-color:#ffffff;border:1px solid #cccccc;-webkit-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075);-moz-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075);box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075);-webkit-transition:border linear .2s, box-shadow linear .2s;-moz-transition:border linear .2s, box-shadow linear .2s;-o-transition:border linear .2s, box-shadow linear .2s;transition:border linear .2s, box-shadow linear .2s;}textarea:focus,input[type="text"]:focus,input[type="password"]:focus,input[type="datetime"]:focus,input[type="datetime-local"]:focus,input[type="date"]:focus,input[type="month"]:focus,input[type="time"]:focus,input[type="week"]:focus,input[t
 ype="number"]:focus,input[type="email"]:focus,input[type="url"]:focus,input[type="search"]:focus,input[type="tel"]:focus,input[type="color"]:focus,.uneditable-input:focus{border-color:rgba(82, 168, 236, 0.8);outline:0;outline:thin dotted \9;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(82,168,236,.6);-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(82,168,236,.6);box-shadow:inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(82,168,236,.6);}
-input[type="radio"],input[type="checkbox"]{margin:4px 0 0;*margin-top:0;margin-top:1px \9;line-height:normal;}
-input[type="file"],input[type="image"],input[type="submit"],input[type="reset"],input[type="button"],input[type="radio"],input[type="checkbox"]{width:auto;}
-select,input[type="file"]{height:30px;*margin-top:4px;line-height:30px;}
-select{width:220px;border:1px solid #cccccc;background-color:#ffffff;}
-select[multiple],select[size]{height:auto;}
-select:focus,input[type="file"]:focus,input[type="radio"]:focus,input[type="checkbox"]:focus{outline:thin dotted #333;outline:5px auto -webkit-focus-ring-color;outline-offset:-2px;}
-.uneditable-input,.uneditable-textarea{color:#999999;background-color:#fcfcfc;border-color:#cccccc;-webkit-box-shadow:inset 0 1px 2px rgba(0, 0, 0, 0.025);-moz-box-shadow:inset 0 1px 2px rgba(0, 0, 0, 0.025);box-shadow:inset 0 1px 2px rgba(0, 0, 0, 0.025);cursor:not-allowed;}
-.uneditable-input{overflow:hidden;white-space:nowrap;}
-.uneditable-textarea{width:auto;height:auto;}
-input:-moz-placeholder,textarea:-moz-placeholder{color:#999999;}
-input:-ms-input-placeholder,textarea:-ms-input-placeholder{color:#999999;}
-input::-webkit-input-placeholder,textarea::-webkit-input-placeholder{color:#999999;}
-.radio,.checkbox{min-height:20px;padding-left:20px;}
-.radio input[type="radio"],.checkbox input[type="checkbox"]{float:left;margin-left:-20px;}
-.controls>.radio:first-child,.controls>.checkbox:first-child{padding-top:5px;}
-.radio.inline,.checkbox.inline{display:inline-block;padding-top:5px;margin-bottom:0;vertical-align:middle;}
-.radio.inline+.radio.inline,.checkbox.inline+.checkbox.inline{margin-left:10px;}
-.input-mini{width:60px;}
-.input-small{width:90px;}
-.input-medium{width:150px;}
-.input-large{width:210px;}
-.input-xlarge{width:270px;}
-.input-xxlarge{width:530px;}
-input[class*="span"],select[class*="span"],textarea[class*="span"],.uneditable-input[class*="span"],.row-fluid input[class*="span"],.row-fluid select[class*="span"],.row-fluid textarea[class*="span"],.row-fluid .uneditable-input[class*="span"]{float:none;margin-left:0;}
-.input-append input[class*="span"],.input-append .uneditable-input[class*="span"],.input-prepend input[class*="span"],.input-prepend .uneditable-input[class*="span"],.row-fluid input[class*="span"],.row-fluid select[class*="span"],.row-fluid textarea[class*="span"],.row-fluid .uneditable-input[class*="span"],.row-fluid .input-prepend [class*="span"],.row-fluid .input-append [class*="span"]{display:inline-block;}
-input,textarea,.uneditable-input{margin-left:0;}
-.controls-row [class*="span"]+[class*="span"]{margin-left:20px;}
-input.span12, textarea.span12, .uneditable-input.span12{width:926px;}
-input.span11, textarea.span11, .uneditable-input.span11{width:846px;}
-input.span10, textarea.span10, .uneditable-input.span10{width:766px;}
-input.span9, textarea.span9, .uneditable-input.span9{width:686px;}
-input.span8, textarea.span8, .uneditable-input.span8{width:606px;}
-input.span7, textarea.span7, .uneditable-input.span7{width:526px;}
-input.span6, textarea.span6, .uneditable-input.span6{width:446px;}
-input.span5, textarea.span5, .uneditable-input.span5{width:366px;}
-input.span4, textarea.span4, .uneditable-input.span4{width:286px;}
-input.span3, textarea.span3, .uneditable-input.span3{width:206px;}
-input.span2, textarea.span2, .uneditable-input.span2{width:126px;}
-input.span1, textarea.span1, .uneditable-input.span1{width:46px;}
-.controls-row{*zoom:1;}.controls-row:before,.controls-row:after{display:table;content:"";line-height:0;}
-.controls-row:after{clear:both;}
-.controls-row [class*="span"],.row-fluid .controls-row [class*="span"]{float:left;}
-.controls-row .checkbox[class*="span"],.controls-row .radio[class*="span"]{padding-top:5px;}
-input[disabled],select[disabled],textarea[disabled],input[readonly],select[readonly],textarea[readonly]{cursor:not-allowed;background-color:#f5f5f5;}
-input[type="radio"][disabled],input[type="checkbox"][disabled],input[type="radio"][readonly],input[type="checkbox"][readonly]{background-color:transparent;}
-.control-group.warning .control-label,.control-group.warning .help-block,.control-group.warning .help-inline{color:#dd5600;}
-.control-group.warning .checkbox,.control-group.warning .radio,.control-group.warning input,.control-group.warning select,.control-group.warning textarea{color:#dd5600;}
-.control-group.warning input,.control-group.warning select,.control-group.warning textarea{border-color:#dd5600;-webkit-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075);-moz-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075);box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075);}.control-group.warning input:focus,.control-group.warning select:focus,.control-group.warning textarea:focus{border-color:#aa4200;-webkit-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075),0 0 6px #ff8d44;-moz-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075),0 0 6px #ff8d44;box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075),0 0 6px #ff8d44;}
-.control-group.warning .input-prepend .add-on,.control-group.warning .input-append .add-on{color:#dd5600;background-color:#f1ceab;border-color:#dd5600;}
-.control-group.error .control-label,.control-group.error .help-block,.control-group.error .help-inline{color:#bd4247;}
-.control-group.error .checkbox,.control-group.error .radio,.control-group.error input,.control-group.error select,.control-group.error textarea{color:#bd4247;}
-.control-group.error input,.control-group.error select,.control-group.error textarea{border-color:#bd4247;-webkit-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075);-moz-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075);box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075);}.control-group.error input:focus,.control-group.error select:focus,.control-group.error textarea:focus{border-color:#983538;-webkit-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075),0 0 6px #d88e90;-moz-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075),0 0 6px #d88e90;box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075),0 0 6px #d88e90;}
-.control-group.error .input-prepend .add-on,.control-group.error .input-append .add-on{color:#bd4247;background-color:#f2bdb1;border-color:#bd4247;}
-.control-group.success .control-label,.control-group.success .help-block,.control-group.success .help-inline{color:#669533;}
-.control-group.success .checkbox,.control-group.success .radio,.control-group.success input,.control-group.success select,.control-group.success textarea{color:#669533;}
-.control-group.success input,.control-group.success select,.control-group.success textarea{border-color:#669533;-webkit-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075);-moz-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075);box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075);}.control-group.success input:focus,.control-group.success select:focus,.control-group.success textarea:focus{border-color:#4c6f26;-webkit-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075),0 0 6px #99ca63;-moz-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075),0 0 6px #99ca63;box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075),0 0 6px #99ca63;}
-.control-group.success .input-prepend .add-on,.control-group.success .input-append .add-on{color:#669533;background-color:#d5ecbf;border-color:#669533;}
-.control-group.info .control-label,.control-group.info .help-block,.control-group.info .help-inline{color:#817b58;}
-.control-group.info .checkbox,.control-group.info .radio,.control-group.info input,.control-group.info select,.control-group.info textarea{color:#817b58;}
-.control-group.info input,.control-group.info select,.control-group.info textarea{border-color:#817b58;-webkit-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075);-moz-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075);box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075);}.control-group.info input:focus,.control-group.info select:focus,.control-group.info textarea:focus{border-color:#625e43;-webkit-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075),0 0 6px #b1ad8d;-moz-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075),0 0 6px #b1ad8d;box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.075),0 0 6px #b1ad8d;}
-.control-group.info .input-prepend .add-on,.control-group.info .input-append .add-on{color:#817b58;background-color:#a7dff1;border-color:#817b58;}
-input:focus:invalid,textarea:focus:invalid,select:focus:invalid{color:#b94a48;border-color:#ee5f5b;}input:focus:invalid:focus,textarea:focus:invalid:focus,select:focus:invalid:focus{border-color:#e9322d;-webkit-box-shadow:0 0 6px #f8b9b7;-moz-box-shadow:0 0 6px #f8b9b7;box-shadow:0 0 6px #f8b9b7;}
-.form-actions{padding:19px 20px 20px;margin-top:20px;margin-bottom:20px;background-color:#f5f5f5;border-top:1px solid #e5e5e5;*zoom:1;}.form-actions:before,.form-actions:after{display:table;content:"";line-height:0;}
-.form-actions:after{clear:both;}
-.help-block,.help-inline{color:#7b7b7b;}
-.help-block{display:block;margin-bottom:10px;}
-.help-inline{display:inline-block;*display:inline;*zoom:1;vertical-align:middle;padding-left:5px;}
-.input-append,.input-prepend{margin-bottom:5px;font-size:0;white-space:nowrap;}.input-append input,.input-prepend input,.input-append select,.input-prepend select,.input-append .uneditable-input,.input-prepend .uneditable-input,.input-append .dropdown-menu,.input-prepend .dropdown-menu{font-size:14px;}
-.input-append input,.input-prepend input,.input-append select,.input-prepend select,.input-append .uneditable-input,.input-prepend .uneditable-input{position:relative;margin-bottom:0;*margin-left:0;vertical-align:top;-webkit-border-radius:0 4px 4px 0;-moz-border-radius:0 4px 4px 0;border-radius:0 4px 4px 0;}.input-append input:focus,.input-prepend input:focus,.input-append select:focus,.input-prepend select:focus,.input-append .uneditable-input:focus,.input-prepend .uneditable-input:focus{z-index:2;}
-.input-append .add-on,.input-prepend .add-on{display:inline-block;width:auto;height:20px;min-width:16px;padding:4px 5px;font-size:14px;font-weight:normal;line-height:20px;text-align:center;text-shadow:0 1px 0 #ffffff;background-color:#f5f5f5;border:1px solid #ccc;}
-.input-append .add-on,.input-prepend .add-on,.input-append .btn,.input-prepend .btn,.input-append .btn-group>.dropdown-toggle,.input-prepend .btn-group>.dropdown-toggle{vertical-align:top;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0;}
-.input-append .active,.input-prepend .active{background-color:#bede9c;border-color:#73a839;}
-.input-prepend .add-on,.input-prepend .btn{margin-right:-1px;}
-.input-prepend .add-on:first-child,.input-prepend .btn:first-child{-webkit-border-radius:4px 0 0 4px;-moz-border-radius:4px 0 0 4px;border-radius:4px 0 0 4px;}
-.input-append input,.input-append select,.input-append .uneditable-input{-webkit-border-radius:4px 0 0 4px;-moz-border-radius:4px 0 0 4px;border-radius:4px 0 0 4px;}.input-append input+.btn-group .btn:last-child,.input-append select+.btn-group .btn:last-child,.input-append .uneditable-input+.btn-group .btn:last-child{-webkit-border-radius:0 4px 4px 0;-moz-border-radius:0 4px 4px 0;border-radius:0 4px 4px 0;}
-.input-append .add-on,.input-append .btn,.input-append .btn-group{margin-left:-1px;}
-.input-append .add-on:last-child,.input-append .btn:last-child,.input-append .btn-group:last-child>.dropdown-toggle{-webkit-border-radius:0 4px 4px 0;-moz-border-radius:0 4px 4px 0;border-radius:0 4px 4px 0;}
-.input-prepend.input-append input,.input-prepend.input-append select,.input-prepend.input-append .uneditable-input{-webkit-border-radius:0;-moz-border-radius:0;border-radius:0;}.input-prepend.input-append input+.btn-group .btn,.input-prepend.input-append select+.btn-group .btn,.input-prepend.input-append .uneditable-input+.btn-group .btn{-webkit-border-radius:0 4px 4px 0;-moz-border-radius:0 4px 4px 0;border-radius:0 4px 4px 0;}
-.input-prepend.input-append .add-on:first-child,.input-prepend.input-append .btn:first-child{margin-right:-1px;-webkit-border-radius:4px 0 0 4px;-moz-border-radius:4px 0 0 4px;border-radius:4px 0 0 4px;}
-.input-prepend.input-append .add-on:last-child,.input-prepend.input-append .btn:last-child{margin-left:-1px;-webkit-border-radius:0 4px 4px 0;-moz-border-radius:0 4px 4px 0;border-radius:0 4px 4px 0;}
-.input-prepend.input-append .btn-group:first-child{margin-left:0;}
-input.search-query{padding-right:14px;padding-right:4px \9;padding-left:14px;padding-left:4px \9;margin-bottom:0;-webkit-border-radius:15px;-moz-border-radius:15px;border-radius:15px;}
-.form-search .input-append .search-query,.form-search .input-prepend .search-query{-webkit-border-radius:0;-moz-border-radius:0;border-radius:0;}
-.form-search .input-append .search-query{-webkit-border-radius:14px 0 0 14px;-moz-border-radius:14px 0 0 14px;border-radius:14px 0 0 14px;}
-.form-search .input-append .btn{-webkit-border-radius:0 14px 14px 0;-moz-border-radius:0 14px 14px 0;border-radius:0 14px 14px 0;}
-.form-search .input-prepend .search-query{-webkit-border-radius:0 14px 14px 0;-moz-border-radius:0 14px 14px 0;border-radius:0 14px 14px 0;}
-.form-search .input-prepend .btn{-webkit-border-radius:14px 0 0 14px;-moz-border-radius:14px 0 0 14px;border-radius:14px 0 0 14px;}
-.form-search input,.form-inline input,.form-horizontal input,.form-search textarea,.form-inline textarea,.form-horizontal textarea,.form-search select,.form-inline select,.form-horizontal select,.form-search .help-inline,.form-inline .help-inline,.form-horizontal .help-inline,.form-search .uneditable-input,.form-inline .uneditable-input,.form-horizontal .uneditable-input,.form-search .input-prepend,.form-inline .input-prepend,.form-horizontal .input-prepend,.form-search .input-append,.form-inline .input-append,.form-horizontal .input-append{display:inline-block;*display:inline;*zoom:1;margin-bottom:0;vertical-align:middle;}
-.form-search .hide,.form-inline .hide,.form-horizontal .hide{display:none;}
-.form-search label,.form-inline label,.form-search .btn-group,.form-inline .btn-group{display:inline-block;}
-.form-search .input-append,.form-inline .input-append,.form-search .input-prepend,.form-inline .input-prepend{margin-bottom:0;}
-.form-search .radio,.form-search .checkbox,.form-inline .radio,.form-inline .checkbox{padding-left:0;margin-bottom:0;vertical-align:middle;}
-.form-search .radio input[type="radio"],.form-search .checkbox input[type="checkbox"],.form-inline .radio input[type="radio"],.form-inline .checkbox input[type="checkbox"]{float:left;margin-right:3px;margin-left:0;}
-.control-group{margin-bottom:10px;}
-legend+.control-group{margin-top:20px;-webkit-margin-top-collapse:separate;}
-.form-horizontal .control-group{margin-bottom:20px;*zoom:1;}.form-horizontal .control-group:before,.form-horizontal .control-group:after{display:table;content:"";line-height:0;}
-.form-horizontal .control-group:after{clear:both;}
-.form-horizontal .control-label{float:left;width:160px;padding-top:5px;text-align:right;}
-.form-horizontal .controls{*display:inline-block;*padding-left:20px;margin-left:180px;*margin-left:0;}.form-horizontal .controls:first-child{*padding-left:180px;}
-.form-horizontal .help-block{margin-bottom:0;}
-.form-horizontal input+.help-block,.form-horizontal select+.help-block,.form-horizontal textarea+.help-block,.form-horizontal .uneditable-input+.help-block,.form-horizontal .input-prepend+.help-block,.form-horizontal .input-append+.help-block{margin-top:10px;}
-.form-horizontal .form-actions{padding-left:180px;}
-table{max-width:100%;background-color:transparent;border-collapse:collapse;border-spacing:0;}
-.table{width:100%;margin-bottom:20px;}.table th,.table td{padding:8px;line-height:20px;text-align:left;vertical-align:top;border-top:1px solid #dddddd;}
-.table th{font-weight:bold;}
-.table thead th{vertical-align:bottom;}
-.table caption+thead tr:first-child th,.table caption+thead tr:first-child td,.table colgroup+thead tr:first-child th,.table colgroup+thead tr:first-child td,.table thead:first-child tr:first-child th,.table thead:first-child tr:first-child td{border-top:0;}
-.table tbody+tbody{border-top:2px solid #dddddd;}
-.table .table{background-color:#ffffff;}
-.table-condensed th,.table-condensed td{padding:4px 5px;}
-.table-bordered{border:1px solid #dddddd;border-collapse:separate;*border-collapse:collapse;border-left:0;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;}.table-bordered th,.table-bordered td{border-left:1px solid #dddddd;}
-.table-bordered caption+thead tr:first-child th,.table-bordered caption+tbody tr:first-child th,.table-bordered caption+tbody tr:first-child td,.table-bordered colgroup+thead tr:first-child th,.table-bordered colgroup+tbody tr:first-child th,.table-bordered colgroup+tbody tr:first-child td,.table-bordered thead:first-child tr:first-child th,.table-bordered tbody:first-child tr:first-child th,.table-bordered tbody:first-child tr:first-child td{border-top:0;}
-.table-bordered thead:first-child tr:first-child>th:first-child,.table-bordered tbody:first-child tr:first-child>td:first-child{-webkit-border-top-left-radius:4px;-moz-border-radius-topleft:4px;border-top-left-radius:4px;}
-.table-bordered thead:first-child tr:first-child>th:last-child,.table-bordered tbody:first-child tr:first-child>td:last-child{-webkit-border-top-right-radius:4px;-moz-border-radius-topright:4px;border-top-right-radius:4px;}
-.table-bordered thead:last-child tr:last-child>th:first-child,.table-bordered tbody:last-child tr:last-child>td:first-child,.table-bordered tfoot:last-child tr:last-child>td:first-child{-webkit-border-bottom-left-radius:4px;-moz-border-radius-bottomleft:4px;border-bottom-left-radius:4px;}
-.table-bordered thead:last-child tr:last-child>th:last-child,.table-bordered tbody:last-child tr:last-child>td:last-child,.table-bordered tfoot:last-child tr:last-child>td:last-child{-webkit-border-bottom-right-radius:4px;-moz-border-radius-bottomright:4px;border-bottom-right-radius:4px;}
-.table-bordered tfoot+tbody:last-child tr:last-child td:first-child{-webkit-border-bottom-left-radius:0;-moz-border-radius-bottomleft:0;border-bottom-left-radius:0;}
-.table-bordered tfoot+tbody:last-child tr:last-child td:last-child{-webkit-border-bottom-right-radius:0;-moz-border-radius-bottomright:0;border-bottom-right-radius:0;}
-.table-bordered caption+thead tr:first-child th:first-child,.table-bordered caption+tbody tr:first-child td:first-child,.table-bordered colgroup+thead tr:first-child th:first-child,.table-bordered colgroup+tbody tr:first-child td:first-child{-webkit-border-top-left-radius:4px;-moz-border-radius-topleft:4px;border-top-left-radius:4px;}
-.table-bordered caption+thead tr:first-child th:last-child,.table-bordered caption+tbody tr:first-child td:last-child,.table-bordered colgroup+thead tr:first-child th:last-child,.table-bordered colgroup+tbody tr:first-child td:last-child{-webkit-border-top-right-radius:4px;-moz-border-radius-topright:4px;border-top-right-radius:4px;}
-.table-striped tbody>tr:nth-child(odd)>td,.table-striped tbody>tr:nth-child(odd)>th{background-color:#f9f9f9;}
-.table-hover tbody tr:hover td,.table-hover tbody tr:hover th{background-color:#f5f5f5;}
-table td[class*="span"],table th[class*="span"],.row-fluid table td[class*="span"],.row-fluid table th[class*="span"]{display:table-cell;float:none;margin-left:0;}
-.table td.span1,.table th.span1{float:none;width:44px;margin-left:0;}
-.table td.span2,.table th.span2{float:none;width:124px;margin-left:0;}
-.table td.span3,.table th.span3{float:none;width:204px;margin-left:0;}
-.table td.span4,.table th.span4{float:none;width:284px;margin-left:0;}
-.table td.span5,.table th.span5{float:none;width:364px;margin-left:0;}
-.table td.span6,.table th.span6{float:none;width:444px;margin-left:0;}
-.table td.span7,.table th.span7{float:none;width:524px;margin-left:0;}
-.table td.span8,.table th.span8{float:none;width:604px;margin-left:0;}
-.table td.span9,.table th.span9{float:none;width:684px;margin-left:0;}
-.table td.span10,.table th.span10{float:none;width:764px;margin-left:0;}
-.table td.span11,.table th.span11{float:none;width:844px;margin-left:0;}
-.table td.span12,.table th.span12{float:none;width:924px;margin-left:0;}
-.table tbody tr.success td{background-color:#d5ecbf;}
-.table tbody tr.error td{background-color:#f2bdb1;}
-.table tbody tr.warning td{background-color:#f1ceab;}
-.table tbody tr.info td{background-color:#a7dff1;}
-.table-hover tbody tr.success:hover td{background-color:#c8e6ab;}
-.table-hover tbody tr.error:hover td{background-color:#eeab9b;}
-.table-hover tbody tr.warning:hover td{background-color:#edc195;}
-.table-hover tbody tr.info:hover td{background-color:#91d7ee;}
-[class^="icon-"],[class*=" icon-"]{display:inline-block;width:14px;height:14px;*margin-right:.3em;line-height:14px;vertical-align:text-top;background-image:url("../images/glyphicons-halflings.png");background-position:14px 14px;background-repeat:no-repeat;margin-top:1px;}
-.icon-white,.nav-pills>.active>a>[class^="icon-"],.nav-pills>.active>a>[class*=" icon-"],.nav-list>.active>a>[class^="icon-"],.nav-list>.active>a>[class*=" icon-"],.navbar-inverse .nav>.active>a>[class^="icon-"],.navbar-inverse .nav>.active>a>[class*=" icon-"],.dropdown-menu>li>a:hover>[class^="icon-"],.dropdown-menu>li>a:hover>[class*=" icon-"],.dropdown-menu>.active>a>[class^="icon-"],.dropdown-menu>.active>a>[class*=" icon-"],.dropdown-submenu:hover>a>[class^="icon-"],.dropdown-submenu:hover>a>[class*=" icon-"]{background-image:url("../images/glyphicons-halflings-white.png");}
-.icon-glass{background-position:0 0;}
-.icon-music{background-position:-24px 0;}
-.icon-search{background-position:-48px 0;}
-.icon-envelope{background-position:-72px 0;}
-.icon-heart{background-position:-96px 0;}
-.icon-star{background-position:-120px 0;}
-.icon-star-empty{background-position:-144px 0;}
-.icon-user{background-position:-168px 0;}
-.icon-film{background-position:-192px 0;}
-.icon-th-large{background-position:-216px 0;}
-.icon-th{background-position:-240px 0;}
-.icon-th-list{background-position:-264px 0;}
-.icon-ok{background-position:-288px 0;}
-.icon-remove{background-position:-312px 0;}
-.icon-zoom-in{background-position:-336px 0;}
-.icon-zoom-out{background-position:-360px 0;}
-.icon-off{background-position:-384px 0;}
-.icon-signal{background-position:-408px 0;}
-.icon-cog{background-position:-432px 0;}
-.icon-trash{background-position:-456px 0;}
-.icon-home{background-position:0 -24px;}
-.icon-file{background-position:-24px -24px;}
-.icon-time{background-position:-48px -24px;}
-.icon-road{background-position:-72px -24px;}
-.icon-download-alt{background-position:-96px -24px;}
-.icon-download{background-position:-120px -24px;}
-.icon-upload{background-position:-144px -24px;}
-.icon-inbox{background-position:-168px -24px;}
-.icon-play-circle{background-position:-192px -24px;}
-.icon-repeat{background-position:-216px -24px;}
-.icon-refresh{background-position:-240px -24px;}
-.icon-list-alt{background-position:-264px -24px;}
-.icon-lock{background-position:-287px -24px;}
-.icon-flag{background-position:-312px -24px;}
-.icon-headphones{background-position:-336px -24px;}
-.icon-volume-off{background-position:-360px -24px;}
-.icon-volume-down{background-position:-384px -24px;}
-.icon-volume-up{background-position:-408px -24px;}
-.icon-qrcode{background-position:-432px -24px;}
-.icon-barcode{background-position:-456px -24px;}
-.icon-tag{background-position:0 -48px;}
-.icon-tags{background-position:-25px -48px;}
-.icon-book{background-position:-48px -48px;}
-.icon-bookmark{background-position:-72px -48px;}
-.icon-print{background-position:-96px -48px;}
-.icon-camera{background-position:-120px -48px;}
-.icon-font{background-position:-144px -48px;}
-.icon-bold{background-position:-167px -48px;}
-.icon-italic{background-position:-192px -48px;}
-.icon-text-height{background-position:-216px -48px;}
-.icon-text-width{background-position:-240px -48px;}
-.icon-align-left{background-position:-264px -48px;}
-.icon-align-center{background-position:-288px -48px;}
-.icon-align-right{background-position:-312px -48px;}
-.icon-align-justify{background-position:-336px -48px;}
-.icon-list{background-position:-360px -48px;}
-.icon-indent-left{background-position:-384px -48px;}
-.icon-indent-right{background-position:-408px -48px;}
-.icon-facetime-video{background-position:-432px -48px;}
-.icon-picture{background-position:-456px -48px;}
-.icon-pencil{background-position:0 -72px;}
-.icon-map-marker{background-position:-24px -72px;}
-.icon-adjust{background-position:-48px -72px;}
-.icon-tint{background-position:-72px -72px;}
-.icon-edit{background-position:-96px -72px;}
-.icon-share{background-position:-120px -72px;}
-.icon-check{background-position:-144px -72px;}
-.icon-move{background-position:-168px -72px;}
-.icon-step-backward{background-position:-192px -72px;}
-.icon-fast-backward{background-position:-216px -72px;}
-.icon-backward{background-position:-240px -72px;}
-.icon-play{background-position:-264px -72px;}
-.icon-pause{background-position:-288px -72px;}
-.icon-stop{background-position:-312px -72px;}
-.icon-forward{background-position:-336px -72px;}
-.icon-fast-forward{background-position:-360px -72px;}
-.icon-step-forward{background-position:-384px -72px;}
-.icon-eject{background-position:-408px -72px;}
-.icon-chevron-left{background-position:-432px -72px;}
-.icon-chevron-right{background-position:-456px -72px;}
-.icon-plus-sign{background-position:0 -96px;}
-.icon-minus-sign{background-position:-24px -96px;}
-.icon-remove-sign{background-position:-48px -96px;}
-.icon-ok-sign{background-position:-72px -96px;}
-.icon-question-sign{background-position:-96px -96px;}
-.icon-info-sign{background-position:-120px -96px;}
-.icon-screenshot{background-position:-144px -96px;}
-.icon-remove-circle{background-position:-168px -96px;}
-.icon-ok-circle{background-position:-192px -96px;}
-.icon-ban-circle{background-position:-216px -96px;}
-.icon-arrow-left{background-position:-240px -96px;}
-.icon-arrow-right{background-position:-264px -96px;}
-.icon-arrow-up{background-position:-289px -96px;}
-.icon-arrow-down{background-position:-312px -96px;}
-.icon-share-alt{background-position:-336px -96px;}
-.icon-resize-full{background-position:-360px -96px;}
-.icon-resize-small{background-position:-384px -96px;}
-.icon-plus{background-position:-408px -96px;}
-.icon-minus{background-position:-433px -96px;}
-.icon-asterisk{background-position:-456px -96px;}
-.icon-exclamation-sign{background-position:0 -120px;}
-.icon-gift{background-position:-24px -120px;}
-.icon-leaf{background-position:-48px -120px;}
-.icon-fire{background-position:-72px -120px;}
-.icon-eye-open{background-position:-96px -120px;}
-.icon-eye-close{background-position:-120px -120px;}
-.icon-warning-sign{background-position:-144px -120px;}
-.icon-plane{background-position:-168px -120px;}
-.icon-calendar{background-position:-192px -120px;}
-.icon-random{background-position:-216px -120px;width:16px;}
-.icon-comment{background-position:-240px -120px;}
-.icon-magnet{background-position:-264px -120px;}
-.icon-chevron-up{background-position:-288px -120px;}
-.icon-chevron-down{background-position:-313px -119px;}
-.icon-retweet{background-position:-336px -120px;}
-.icon-shopping-cart{background-position:-360px -120px;}
-.icon-folder-close{background-position:-384px -120px;}
-.icon-folder-open{background-position:-408px -120px;width:16px;}
-.icon-resize-vertical{background-position:-432px -119px;}
-.icon-resize-horizontal{background-position:-456px -118px;}
-.icon-hdd{background-position:0 -144px;}
-.icon-bullhorn{background-position:-24px -144px;}
-.icon-bell{background-position:-48px -144px;}
-.icon-certificate{background-position:-72px -144px;}
-.icon-thumbs-up{background-position:-96px -144px;}
-.icon-thumbs-down{background-position:-120px -144px;}
-.icon-hand-right{background-position:-144px -144px;}
-.icon-hand-left{background-position:-168px -144px;}
-.icon-hand-up{background-position:-192px -144px;}
-.icon-hand-down{background-position:-216px -144px;}
-.icon-circle-arrow-right{background-position:-240px -144px;}
-.icon-circle-arrow-left{background-position:-264px -144px;}
-.icon-circle-arrow-up{background-position:-288px -144px;}
-.icon-circle-arrow-down{background-position:-312px -144px;}
-.icon-globe{background-position:-336px -144px;}
-.icon-wrench{background-position:-360px -144px;}
-.icon-tasks{background-position:-384px -144px;}
-.icon-filter{background-position:-408px -144px;}
-.icon-briefcase{background-position:-432px -144px;}
-.icon-fullscreen{background-position:-456px -144px;}
-.dropup,.dropdown{position:relative;}
-.dropdown-toggle{*margin-bottom:-3px;}
-.dropdown-toggle:active,.open .dropdown-toggle{outline:0;}
-.caret{display:inline-block;width:0;height:0;vertical-align:top;border-top:4px solid #000000;border-right:4px solid transparent;border-left:4px solid transparent;content:"";}
-.dropdown .caret{margin-top:8px;margin-left:2px;}
-.dropdown-menu{position:absolute;top:100%;left:0;z-index:1000;display:none;float:left;min-width:160px;padding:5px 0;margin:2px 0 0;list-style:none;background-color:#ffffff;border:1px solid #ccc;border:1px solid rgba(0, 0, 0, 0.2);*border-right-width:2px;*border-bottom-width:2px;-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px;-webkit-box-shadow:0 5px 10px rgba(0, 0, 0, 0.2);-moz-box-shadow:0 5px 10px rgba(0, 0, 0, 0.2);box-shadow:0 5px 10px rgba(0, 0, 0, 0.2);-webkit-background-clip:padding-box;-moz-background-clip:padding;background-clip:padding-box;}.dropdown-menu.pull-right{right:0;left:auto;}
-.dropdown-menu .divider{*width:100%;height:1px;margin:9px 1px;*margin:-5px 0 5px;overflow:hidden;background-color:#e5e5e5;border-bottom:1px solid #ffffff;}
-.dropdown-menu li>a{display:block;padding:3px 20px;clear:both;font-weight:normal;line-height:20px;color:#333333;white-space:nowrap;}
-.dropdown-menu li>a:hover,.dropdown-menu li>a:focus,.dropdown-submenu:hover>a{text-decoration:none;color:#ffffff;background-color:#27a0e5;background-image:-moz-linear-gradient(top, #2fa4e7, #1a99e2);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#2fa4e7), to(#1a99e2));background-image:-webkit-linear-gradient(top, #2fa4e7, #1a99e2);background-image:-o-linear-gradient(top, #2fa4e7, #1a99e2);background-image:linear-gradient(to bottom, #2fa4e7, #1a99e2);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff2fa4e7', endColorstr='#ff1a99e2', GradientType=0);}
-.dropdown-menu .active>a,.dropdown-menu .active>a:hover{color:#ffffff;text-decoration:none;outline:0;background-color:#27a0e5;background-image:-moz-linear-gradient(top, #2fa4e7, #1a99e2);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#2fa4e7), to(#1a99e2));background-image:-webkit-linear-gradient(top, #2fa4e7, #1a99e2);background-image:-o-linear-gradient(top, #2fa4e7, #1a99e2);background-image:linear-gradient(to bottom, #2fa4e7, #1a99e2);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff2fa4e7', endColorstr='#ff1a99e2', GradientType=0);}
-.dropdown-menu .disabled>a,.dropdown-menu .disabled>a:hover{color:#999999;}
-.dropdown-menu .disabled>a:hover{text-decoration:none;background-color:transparent;background-image:none;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);cursor:default;}
-.open{*z-index:1000;}.open >.dropdown-menu{display:block;}
-.pull-right>.dropdown-menu{right:0;left:auto;}
-.dropup .caret,.navbar-fixed-bottom .dropdown .caret{border-top:0;border-bottom:4px solid #000000;content:"";}
-.dropup .dropdown-menu,.navbar-fixed-bottom .dropdown .dropdown-menu{top:auto;bottom:100%;margin-bottom:1px;}
-.dropdown-submenu{position:relative;}
-.dropdown-submenu>.dropdown-menu{top:0;left:100%;margin-top:-6px;margin-left:-1px;-webkit-border-radius:0 6px 6px 6px;-moz-border-radius:0 6px 6px 6px;border-radius:0 6px 6px 6px;}
-.dropdown-submenu:hover>.dropdown-menu{display:block;}
-.dropup .dropdown-submenu>.dropdown-menu{top:auto;bottom:0;margin-top:0;margin-bottom:-2px;-webkit-border-radius:5px 5px 5px 0;-moz-border-radius:5px 5px 5px 0;border-radius:5px 5px 5px 0;}
-.dropdown-submenu>a:after{display:block;content:" ";float:right;width:0;height:0;border-color:transparent;border-style:solid;border-width:5px 0 5px 5px;border-left-color:#cccccc;margin-top:5px;margin-right:-10px;}
-.dropdown-submenu:hover>a:after{border-left-color:#ffffff;}
-.dropdown-submenu.pull-left{float:none;}.dropdown-submenu.pull-left>.dropdown-menu{left:-100%;margin-left:10px;-webkit-border-radius:6px 0 6px 6px;-moz-border-radius:6px 0 6px 6px;border-radius:6px 0 6px 6px;}
-.dropdown .dropdown-menu .nav-header{padding-left:20px;padding-right:20px;}
-.typeahead{z-index:1051;margin-top:2px;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;}
-.well{min-height:20px;padding:19px;margin-bottom:20px;background-color:#f5f5f5;border:1px solid #e3e3e3;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;-webkit-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.05);-moz-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.05);box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.05);}.well blockquote{border-color:#ddd;border-color:rgba(0, 0, 0, 0.15);}
-.well-large{padding:24px;-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px;}
-.well-small{padding:9px;-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px;}
-.fade{opacity:0;-webkit-transition:opacity 0.15s linear;-moz-transition:opacity 0.15s linear;-o-transition:opacity 0.15s linear;transition:opacity 0.15s linear;}.fade.in{opacity:1;}
-.collapse{position:relative;height:0;overflow:hidden;-webkit-transition:height 0.35s ease;-moz-transition:height 0.35s ease;-o-transition:height 0.35s ease;transition:height 0.35s ease;}.collapse.in{height:auto;}
-.close{float:right;font-size:20px;font-weight:bold;line-height:20px;color:#000000;text-shadow:0 1px 0 #ffffff;opacity:0.2;filter:alpha(opacity=20);}.close:hover{color:#000000;text-decoration:none;cursor:pointer;opacity:0.4;filter:alpha(opacity=40);}
-button.close{padding:0;cursor:pointer;background:transparent;border:0;-webkit-appearance:none;}
-.btn{display:inline-block;*display:inline;*zoom:1;padding:4px 12px;margin-bottom:0;font-size:14px;line-height:20px;text-align:center;vertical-align:middle;cursor:pointer;color:#333333;text-shadow:0 1px 1px rgba(255, 255, 255, 0.75);background-color:#f5f5f5;background-image:-moz-linear-gradient(top, #ffffff, #e6e6e6);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#ffffff), to(#e6e6e6));background-image:-webkit-linear-gradient(top, #ffffff, #e6e6e6);background-image:-o-linear-gradient(top, #ffffff, #e6e6e6);background-image:linear-gradient(to bottom, #ffffff, #e6e6e6);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff', endColorstr='#ffe6e6e6', GradientType=0);border-color:#e6e6e6 #e6e6e6 #bfbfbf;border-color:rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);*background-color:#e6e6e6;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);border:1px solid #cccccc;*border:0;border-bottom-color:#b
 3b3b3;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;*margin-left:.3em;-webkit-box-shadow:inset 0 1px 0 rgba(255,255,255,.2), 0 1px 2px rgba(0,0,0,.05);-moz-box-shadow:inset 0 1px 0 rgba(255,255,255,.2), 0 1px 2px rgba(0,0,0,.05);box-shadow:inset 0 1px 0 rgba(255,255,255,.2), 0 1px 2px rgba(0,0,0,.05);}.btn:hover,.btn:active,.btn.active,.btn.disabled,.btn[disabled]{color:#333333;background-color:#e6e6e6;*background-color:#d9d9d9;}
-.btn:active,.btn.active{background-color:#cccccc \9;}
-.btn:first-child{*margin-left:0;}
-.btn:hover{color:#333333;text-decoration:none;background-position:0 -15px;-webkit-transition:background-position 0.1s linear;-moz-transition:background-position 0.1s linear;-o-transition:background-position 0.1s linear;transition:background-position 0.1s linear;}
-.btn:focus{outline:thin dotted #333;outline:5px auto -webkit-focus-ring-color;outline-offset:-2px;}
-.btn.active,.btn:active{background-image:none;outline:0;-webkit-box-shadow:inset 0 2px 4px rgba(0,0,0,.15), 0 1px 2px rgba(0,0,0,.05);-moz-box-shadow:inset 0 2px 4px rgba(0,0,0,.15), 0 1px 2px rgba(0,0,0,.05);box-shadow:inset 0 2px 4px rgba(0,0,0,.15), 0 1px 2px rgba(0,0,0,.05);}
-.btn.disabled,.btn[disabled]{cursor:default;background-image:none;opacity:0.65;filter:alpha(opacity=65);-webkit-box-shadow:none;-moz-box-shadow:none;box-shadow:none;}
-.btn-large{padding:11px 19px;font-size:17.5px;-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px;}
-.btn-large [class^="icon-"],.btn-large [class*=" icon-"]{margin-top:4px;}
-.btn-small{padding:2px 10px;font-size:11.9px;-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px;}
-.btn-small [class^="icon-"],.btn-small [class*=" icon-"]{margin-top:0;}
-.btn-mini [class^="icon-"],.btn-mini [class*=" icon-"]{margin-top:-1px;}
-.btn-mini{padding:0px 6px;font-size:10.5px;-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px;}
-.btn-block{display:block;width:100%;padding-left:0;padding-right:0;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;}
-.btn-block+.btn-block{margin-top:5px;}
-input[type="submit"].btn-block,input[type="reset"].btn-block,input[type="button"].btn-block{width:100%;}
-.btn-primary.active,.btn-warning.active,.btn-danger.active,.btn-success.active,.btn-info.active,.btn-inverse.active{color:rgba(255, 255, 255, 0.75);}
-.btn{border-color:#c5c5c5;border-color:rgba(0, 0, 0, 0.15) rgba(0, 0, 0, 0.15) rgba(0, 0, 0, 0.25);}
-.btn-primary{color:#ffffff;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);background-color:#2f92e7;background-image:-moz-linear-gradient(top, #2fa4e7, #2f76e7);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#2fa4e7), to(#2f76e7));background-image:-webkit-linear-gradient(top, #2fa4e7, #2f76e7);background-image:-o-linear-gradient(top, #2fa4e7, #2f76e7);background-image:linear-gradient(to bottom, #2fa4e7, #2f76e7);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff2fa4e7', endColorstr='#ff2f76e7', GradientType=0);border-color:#2f76e7 #2f76e7 #1553b5;border-color:rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);*background-color:#2f76e7;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);}.btn-primary:hover,.btn-primary:active,.btn-primary.active,.btn-primary.disabled,.btn-primary[disabled]{color:#ffffff;background-color:#2f76e7;*background-color:#1a67e2;}
-.btn-primary:active,.btn-primary.active{background-color:#175dcc \9;}
-.btn-warning{color:#ffffff;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);background-color:#dd5600;background-image:-moz-linear-gradient(top, #dd5600, #dd5600);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#dd5600), to(#dd5600));background-image:-webkit-linear-gradient(top, #dd5600, #dd5600);background-image:-o-linear-gradient(top, #dd5600, #dd5600);background-image:linear-gradient(to bottom, #dd5600, #dd5600);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffdd5600', endColorstr='#ffdd5600', GradientType=0);border-color:#dd5600 #dd5600 #913800;border-color:rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);*background-color:#dd5600;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);}.btn-warning:hover,.btn-warning:active,.btn-warning.active,.btn-warning.disabled,.btn-warning[disabled]{color:#ffffff;background-color:#dd5600;*background-color:#c44c00;}
-.btn-warning:active,.btn-warning.active{background-color:#aa4200 \9;}
-.btn-danger{color:#ffffff;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);background-color:#c32627;background-image:-moz-linear-gradient(top, #c71c22, #bd362f);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#c71c22), to(#bd362f));background-image:-webkit-linear-gradient(top, #c71c22, #bd362f);background-image:-o-linear-gradient(top, #c71c22, #bd362f);background-image:linear-gradient(to bottom, #c71c22, #bd362f);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffc71c22', endColorstr='#ffbd362f', GradientType=0);border-color:#bd362f #bd362f #802420;border-color:rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);*background-color:#bd362f;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);}.btn-danger:hover,.btn-danger:active,.btn-danger.active,.btn-danger.disabled,.btn-danger[disabled]{color:#ffffff;background-color:#bd362f;*background-color:#a9302a;}
-.btn-danger:active,.btn-danger.active{background-color:#942a25 \9;}
-.btn-success{color:#ffffff;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);background-color:#65a643;background-image:-moz-linear-gradient(top, #73a839, #51a351);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#73a839), to(#51a351));background-image:-webkit-linear-gradient(top, #73a839, #51a351);background-image:-o-linear-gradient(top, #73a839, #51a351);background-image:linear-gradient(to bottom, #73a839, #51a351);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff73a839', endColorstr='#ff51a351', GradientType=0);border-color:#51a351 #51a351 #387038;border-color:rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);*background-color:#51a351;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);}.btn-success:hover,.btn-success:active,.btn-success.active,.btn-success.disabled,.btn-success[disabled]{color:#ffffff;background-color:#51a351;*background-color:#499249;}
-.btn-success:active,.btn-success.active{background-color:#408140 \9;}
-.btn-info{color:#ffffff;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);background-color:#6d76b3;background-image:-moz-linear-gradient(top, #9760b3, #2f96b4);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#9760b3), to(#2f96b4));background-image:-webkit-linear-gradient(top, #9760b3, #2f96b4);background-image:-o-linear-gradient(top, #9760b3, #2f96b4);background-image:linear-gradient(to bottom, #9760b3, #2f96b4);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff9760b3', endColorstr='#ff2f96b4', GradientType=0);border-color:#2f96b4 #2f96b4 #1f6377;border-color:rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);*background-color:#2f96b4;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);}.btn-info:hover,.btn-info:active,.btn-info.active,.btn-info.disabled,.btn-info[disabled]{color:#ffffff;background-color:#2f96b4;*background-color:#2a85a0;}
-.btn-info:active,.btn-info.active{background-color:#24748c \9;}
-.btn-inverse{color:#ffffff;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);background-color:#0f3253;background-image:-moz-linear-gradient(top, #033c73, #222222);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#033c73), to(#222222));background-image:-webkit-linear-gradient(top, #033c73, #222222);background-image:-o-linear-gradient(top, #033c73, #222222);background-image:linear-gradient(to bottom, #033c73, #222222);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff033c73', endColorstr='#ff222222', GradientType=0);border-color:#222222 #222222 #000000;border-color:rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);*background-color:#222222;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);}.btn-inverse:hover,.btn-inverse:active,.btn-inverse.active,.btn-inverse.disabled,.btn-inverse[disabled]{color:#ffffff;background-color:#222222;*background-color:#151515;}
-.btn-inverse:active,.btn-inverse.active{background-color:#080808 \9;}
-button.btn,input[type="submit"].btn{*padding-top:3px;*padding-bottom:3px;}button.btn::-moz-focus-inner,input[type="submit"].btn::-moz-focus-inner{padding:0;border:0;}
-button.btn.btn-large,input[type="submit"].btn.btn-large{*padding-top:7px;*padding-bottom:7px;}
-button.btn.btn-small,input[type="submit"].btn.btn-small{*padding-top:3px;*padding-bottom:3px;}
-button.btn.btn-mini,input[type="submit"].btn.btn-mini{*padding-top:1px;*padding-bottom:1px;}
-.btn-link,.btn-link:active,.btn-link[disabled]{background-color:transparent;background-image:none;-webkit-box-shadow:none;-moz-box-shadow:none;box-shadow:none;}
-.btn-link{border-color:transparent;cursor:pointer;color:#2fa4e7;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0;}
-.btn-link:hover{color:#157ab5;text-decoration:underline;background-color:transparent;}
-.btn-link[disabled]:hover{color:#333333;text-decoration:none;}
-.btn-group{position:relative;display:inline-block;*display:inline;*zoom:1;font-size:0;vertical-align:middle;white-space:nowrap;*margin-left:.3em;}.btn-group:first-child{*margin-left:0;}
-.btn-group+.btn-group{margin-left:5px;}
-.btn-toolbar{font-size:0;margin-top:10px;margin-bottom:10px;}.btn-toolbar>.btn+.btn,.btn-toolbar>.btn-group+.btn,.btn-toolbar>.btn+.btn-group{margin-left:5px;}
-.btn-group>.btn{position:relative;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0;}
-.btn-group>.btn+.btn{margin-left:-1px;}
-.btn-group>.btn,.btn-group>.dropdown-menu,.btn-group>.popover{font-size:14px;}
-.btn-group>.btn-mini{font-size:10.5px;}
-.btn-group>.btn-small{font-size:11.9px;}
-.btn-group>.btn-large{font-size:17.5px;}
-.btn-group>.btn:first-child{margin-left:0;-webkit-border-top-left-radius:4px;-moz-border-radius-topleft:4px;border-top-left-radius:4px;-webkit-border-bottom-left-radius:4px;-moz-border-radius-bottomleft:4px;border-bottom-left-radius:4px;}
-.btn-group>.btn:last-child,.btn-group>.dropdown-toggle{-webkit-border-top-right-radius:4px;-moz-border-radius-topright:4px;border-top-right-radius:4px;-webkit-border-bottom-right-radius:4px;-moz-border-radius-bottomright:4px;border-bottom-right-radius:4px;}
-.btn-group>.btn.large:first-child{margin-left:0;-webkit-border-top-left-radius:6px;-moz-border-radius-topleft:6px;border-top-left-radius:6px;-webkit-border-bottom-left-radius:6px;-moz-border-radius-bottomleft:6px;border-bottom-left-radius:6px;}
-.btn-group>.btn.large:last-child,.btn-group>.large.dropdown-toggle{-webkit-border-top-right-radius:6px;-moz-border-radius-topright:6px;border-top-right-radius:6px;-webkit-border-bottom-right-radius:6px;-moz-border-radius-bottomright:6px;border-bottom-right-radius:6px;}
-.btn-group>.btn:hover,.btn-group>.btn:focus,.btn-group>.btn:active,.btn-group>.btn.active{z-index:2;}
-.btn-group .dropdown-toggle:active,.btn-group.open .dropdown-toggle{outline:0;}
-.btn-group>.btn+.dropdown-toggle{padding-left:8px;padding-right:8px;-webkit-box-shadow:inset 1px 0 0 rgba(255,255,255,.125), inset 0 1px 0 rgba(255,255,255,.2), 0 1px 2px rgba(0,0,0,.05);-moz-box-shadow:inset 1px 0 0 rgba(255,255,255,.125), inset 0 1px 0 rgba(255,255,255,.2), 0 1px 2px rgba(0,0,0,.05);box-shadow:inset 1px 0 0 rgba(255,255,255,.125), inset 0 1px 0 rgba(255,255,255,.2), 0 1px 2px rgba(0,0,0,.05);*padding-top:5px;*padding-bottom:5px;}
-.btn-group>.btn-mini+.dropdown-toggle{padding-left:5px;padding-right:5px;*padding-top:2px;*padding-bottom:2px;}
-.btn-group>.btn-small+.dropdown-toggle{*padding-top:5px;*padding-bottom:4px;}
-.btn-group>.btn-large+.dropdown-toggle{padding-left:12px;padding-right:12px;*padding-top:7px;*padding-bottom:7px;}
-.btn-group.open .dropdown-toggle{background-image:none;-webkit-box-shadow:inset 0 2px 4px rgba(0,0,0,.15), 0 1px 2px rgba(0,0,0,.05);-moz-box-shadow:inset 0 2px 4px rgba(0,0,0,.15), 0 1px 2px rgba(0,0,0,.05);box-shadow:inset 0 2px 4px rgba(0,0,0,.15), 0 1px 2px rgba(0,0,0,.05);}
-.btn-group.open .btn.dropdown-toggle{background-color:#e6e6e6;}
-.btn-group.open .btn-primary.dropdown-toggle{background-color:#2f76e7;}
-.btn-group.open .btn-warning.dropdown-toggle{background-color:#dd5600;}
-.btn-group.open .btn-danger.dropdown-toggle{background-color:#bd362f;}
-.btn-group.open .btn-success.dropdown-toggle{background-color:#51a351;}
-.btn-group.open .btn-info.dropdown-toggle{background-color:#2f96b4;}
-.btn-group.open .btn-inverse.dropdown-toggle{background-color:#222222;}
-.btn .caret{margin-top:8px;margin-left:0;}
-.btn-mini .caret,.btn-small .caret,.btn-large .caret{margin-top:6px;}
-.btn-large .caret{border-left-width:5px;border-right-width:5px;border-top-width:5px;}
-.dropup .btn-large .caret{border-bottom-width:5px;}
-.btn-primary .caret,.btn-warning .caret,.btn-danger .caret,.btn-info .caret,.btn-success .caret,.btn-inverse .caret{border-top-color:#ffffff;border-bottom-color:#ffffff;}
-.btn-group-vertical{display:inline-block;*display:inline;*zoom:1;}
-.btn-group-vertical>.btn{display:block;float:none;max-width:100%;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0;}
-.btn-group-vertical>.btn+.btn{margin-left:0;margin-top:-1px;}
-.btn-group-vertical>.btn:first-child{-webkit-border-radius:4px 4px 0 0;-moz-border-radius:4px 4px 0 0;border-radius:4px 4px 0 0;}
-.btn-group-vertical>.btn:last-child{-webkit-border-radius:0 0 4px 4px;-moz-border-radius:0 0 4px 4px;border-radius:0 0 4px 4px;}
-.btn-group-vertical>.btn-large:first-child{-webkit-border-radius:6px 6px 0 0;-moz-border-radius:6px 6px 0 0;border-radius:6px 6px 0 0;}
-.btn-group-vertical>.btn-large:last-child{-webkit-border-radius:0 0 6px 6px;-moz-border-radius:0 0 6px 6px;border-radius:0 0 6px 6px;}
-.alert{padding:8px 35px 8px 14px;margin-bottom:20px;text-shadow:0 1px 0 rgba(255, 255, 255, 0.5);background-color:#f1ceab;border:1px solid #efb99e;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;}
-.alert,.alert h4{color:#dd5600;}
-.alert h4{margin:0;}
-.alert .close{position:relative;top:-2px;right:-21px;line-height:20px;}
-.alert-success{background-color:#d5ecbf;border-color:#d2e6ab;color:#669533;}
-.alert-success h4{color:#669533;}
-.alert-danger,.alert-error{background-color:#f2bdb1;border-color:#f0a5a4;color:#bd4247;}
-.alert-danger h4,.alert-error h4{color:#bd4247;}
-.alert-info{background-color:#a7dff1;border-color:#88e4ec;color:#817b58;}
-.alert-info h4{color:#817b58;}
-.alert-block{padding-top:14px;padding-bottom:14px;}
-.alert-block>p,.alert-block>ul{margin-bottom:0;}
-.alert-block p+p{margin-top:5px;}
-.nav{margin-left:0;margin-bottom:20px;list-style:none;}
-.nav>li>a{display:block;}
-.nav>li>a:hover{text-decoration:none;background-color:#f5f5f5;}
-.nav>li>a>img{max-width:none;}
-.nav>.pull-right{float:right;}
-.nav-header{display:block;padding:3px 15px;font-size:11px;font-weight:bold;line-height:20px;color:#999999;text-shadow:0 1px 0 rgba(255, 255, 255, 0.5);text-transform:uppercase;}
-.nav li+.nav-header{margin-top:9px;}
-.nav-list{padding-left:15px;padding-right:15px;margin-bottom:0;}
-.nav-list>li>a,.nav-list .nav-header{margin-left:-15px;margin-right:-15px;text-shadow:0 1px 0 rgba(255, 255, 255, 0.5);}
-.nav-list>li>a{padding:3px 15px;}
-.nav-list>.active>a,.nav-list>.active>a:hover{color:#ffffff;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.2);background-color:#2fa4e7;}
-.nav-list [class^="icon-"],.nav-list [class*=" icon-"]{margin-right:2px;}
-.nav-list .divider{*width:100%;height:1px;margin:9px 1px;*margin:-5px 0 5px;overflow:hidden;background-color:#e5e5e5;border-bottom:1px solid #ffffff;}
-.nav-tabs,.nav-pills{*zoom:1;}.nav-tabs:before,.nav-pills:before,.nav-tabs:after,.nav-pills:after{display:table;content:"";line-height:0;}
-.nav-tabs:after,.nav-pills:after{clear:both;}
-.nav-tabs>li,.nav-pills>li{float:left;}
-.nav-tabs>li>a,.nav-pills>li>a{padding-right:12px;padding-left:12px;margin-right:2px;line-height:14px;}
-.nav-tabs{border-bottom:1px solid #ddd;}
-.nav-tabs>li{margin-bottom:-1px;}
-.nav-tabs>li>a{padding-top:8px;padding-bottom:8px;line-height:20px;border:1px solid transparent;-webkit-border-radius:4px 4px 0 0;-moz-border-radius:4px 4px 0 0;border-radius:4px 4px 0 0;}.nav-tabs>li>a:hover{border-color:#f5f5f5 #f5f5f5 #dddddd;}
-.nav-tabs>.active>a,.nav-tabs>.active>a:hover{color:#555555;background-color:#ffffff;border:1px solid #ddd;border-bottom-color:transparent;cursor:default;}
-.nav-pills>li>a{padding-top:8px;padding-bottom:8px;margin-top:2px;margin-bottom:2px;-webkit-border-radius:5px;-moz-border-radius:5px;border-radius:5px;}
-.nav-pills>.active>a,.nav-pills>.active>a:hover{color:#ffffff;background-color:#2fa4e7;}
-.nav-stacked>li{float:none;}
-.nav-stacked>li>a{margin-right:0;}
-.nav-tabs.nav-stacked{border-bottom:0;}
-.nav-tabs.nav-stacked>li>a{border:1px solid #ddd;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0;}
-.nav-tabs.nav-stacked>li:first-child>a{-webkit-border-top-right-radius:4px;-moz-border-radius-topright:4px;border-top-right-radius:4px;-webkit-border-top-left-radius:4px;-moz-border-radius-topleft:4px;border-top-left-radius:4px;}
-.nav-tabs.nav-stacked>li:last-child>a{-webkit-border-bottom-right-radius:4px;-moz-border-radius-bottomright:4px;border-bottom-right-radius:4px;-webkit-border-bottom-left-radius:4px;-moz-border-radius-bottomleft:4px;border-bottom-left-radius:4px;}
-.nav-tabs.nav-stacked>li>a:hover{border-color:#ddd;z-index:2;}
-.nav-pills.nav-stacked>li>a{margin-bottom:3px;}
-.nav-pills.nav-stacked>li:last-child>a{margin-bottom:1px;}
-.nav-tabs .dropdown-menu{-webkit-border-radius:0 0 6px 6px;-moz-border-radius:0 0 6px 6px;border-radius:0 0 6px 6px;}
-.nav-pills .dropdown-menu{-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px;}
-.nav .dropdown-toggle .caret{border-top-color:#2fa4e7;border-bottom-color:#2fa4e7;margin-top:6px;}
-.nav .dropdown-toggle:hover .caret{border-top-color:#157ab5;border-bottom-color:#157ab5;}
-.nav-tabs .dropdown-toggle .caret{margin-top:8px;}
-.nav .active .dropdown-toggle .caret{border-top-color:#fff;border-bottom-color:#fff;}
-.nav-tabs .active .dropdown-toggle .caret{border-top-color:#555555;border-bottom-color:#555555;}
-.nav>.dropdown.active>a:hover{cursor:pointer;}
-.nav-tabs .open .dropdown-toggle,.nav-pills .open .dropdown-toggle,.nav>li.dropdown.open.active>a:hover{color:#ffffff;background-color:#999999;border-color:#999999;}
-.nav li.dropdown.open .caret,.nav li.dropdown.open.active .caret,.nav li.dropdown.open a:hover .caret{border-top-color:#ffffff;border-bottom-color:#ffffff;opacity:1;filter:alpha(opacity=100);}
-.tabs-stacked .open>a:hover{border-color:#999999;}
-.tabbable{*zoom:1;}.tabbable:before,.tabbable:after{display:table;content:"";line-height:0;}
-.tabbable:after{clear:both;}
-.tab-content{overflow:auto;}
-.tabs-below>.nav-tabs,.tabs-right>.nav-tabs,.tabs-left>.nav-tabs{border-bottom:0;}
-.tab-content>.tab-pane,.pill-content>.pill-pane{display:none;}
-.tab-content>.active,.pill-content>.active{display:block;}
-.tabs-below>.nav-tabs{border-top:1px solid #ddd;}
-.tabs-below>.nav-tabs>li{margin-top:-1px;margin-bottom:0;}
-.tabs-below>.nav-tabs>li>a{-webkit-border-radius:0 0 4px 4px;-moz-border-radius:0 0 4px 4px;border-radius:0 0 4px 4px;}.tabs-below>.nav-tabs>li>a:hover{border-bottom-color:transparent;border-top-color:#ddd;}
-.tabs-below>.nav-tabs>.active>a,.tabs-below>.nav-tabs>.active>a:hover{border-color:transparent #ddd #ddd #ddd;}
-.tabs-left>.nav-tabs>li,.tabs-right>.nav-tabs>li{float:none;}
-.tabs-left>.nav-tabs>li>a,.tabs-right>.nav-tabs>li>a{min-width:74px;margin-right:0;margin-bottom:3px;}
-.tabs-left>.nav-tabs{float:left;margin-right:19px;border-right:1px solid #ddd;}
-.tabs-left>.nav-tabs>li>a{margin-right:-1px;-webkit-border-radius:4px 0 0 4px;-moz-border-radius:4px 0 0 4px;border-radius:4px 0 0 4px;}
-.tabs-left>.nav-tabs>li>a:hover{border-color:#f5f5f5 #dddddd #f5f5f5 #f5f5f5;}
-.tabs-left>.nav-tabs .active>a,.tabs-left>.nav-tabs .active>a:hover{border-color:#ddd transparent #ddd #ddd;*border-right-color:#ffffff;}
-.tabs-right>.nav-tabs{float:right;margin-left:19px;border-left:1px solid #ddd;}
-.tabs-right>.nav-tabs>li>a{margin-left:-1px;-webkit-border-radius:0 4px 4px 0;-moz-border-radius:0 4px 4px 0;border-radius:0 4px 4px 0;}
-.tabs-right>.nav-tabs>li>a:hover{border-color:#f5f5f5 #f5f5f5 #f5f5f5 #dddddd;}
-.tabs-right>.nav-tabs .active>a,.tabs-right>.nav-tabs .active>a:hover{border-color:#ddd #ddd #ddd transparent;*border-left-color:#ffffff;}
-.nav>.disabled>a{color:#999999;}
-.nav>.disabled>a:hover{text-decoration:none;background-color:transparent;cursor:default;}
-.navbar{overflow:visible;margin-bottom:20px;*position:relative;*z-index:2;}
-.navbar-inner{min-height:50px;padding-left:20px;padding-right:20px;background-color:#45aeea;background-image:-moz-linear-gradient(top, #54b4eb, #2fa4e7);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#54b4eb), to(#2fa4e7));background-image:-webkit-linear-gradient(top, #54b4eb, #2fa4e7);background-image:-o-linear-gradient(top, #54b4eb, #2fa4e7);background-image:linear-gradient(to bottom, #54b4eb, #2fa4e7);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff54b4eb', endColorstr='#ff2fa4e7', GradientType=0);border:1px solid #1990d5;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;-webkit-box-shadow:0 1px 4px rgba(0, 0, 0, 0.065);-moz-box-shadow:0 1px 4px rgba(0, 0, 0, 0.065);box-shadow:0 1px 4px rgba(0, 0, 0, 0.065);*zoom:1;}.navbar-inner:before,.navbar-inner:after{display:table;content:"";line-height:0;}
-.navbar-inner:after{clear:both;}
-.navbar .container{width:auto;}
-.nav-collapse.collapse{height:auto;overflow:visible;}
-.navbar .brand{float:left;display:block;padding:15px 20px 15px;margin-left:-20px;font-size:20px;font-weight:200;color:#ffffff;text-shadow:0 1px 0 #54b4eb;}.navbar .brand:hover{text-decoration:none;}
-.navbar-text{margin-bottom:0;line-height:50px;color:#f5f5f5;}
-.navbar-link{color:#ffffff;}.navbar-link:hover{color:#ffffff;}
-.navbar .divider-vertical{height:50px;margin:0 9px;border-left:1px solid #2fa4e7;border-right:1px solid #54b4eb;}
-.navbar .btn,.navbar .btn-group{margin-top:10px;}
-.navbar .btn-group .btn,.navbar .input-prepend .btn,.navbar .input-append .btn{margin-top:0;}
-.navbar-form{margin-bottom:0;*zoom:1;}.navbar-form:before,.navbar-form:after{display:table;content:"";line-height:0;}
-.navbar-form:after{clear:both;}
-.navbar-form input,.navbar-form select,.navbar-form .radio,.navbar-form .checkbox{margin-top:10px;}
-.navbar-form input,.navbar-form select,.navbar-form .btn{display:inline-block;margin-bottom:0;}
-.navbar-form input[type="image"],.navbar-form input[type="checkbox"],.navbar-form input[type="radio"]{margin-top:3px;}
-.navbar-form .input-append,.navbar-form .input-prepend{margin-top:5px;white-space:nowrap;}.navbar-form .input-append input,.navbar-form .input-prepend input{margin-top:0;}
-.navbar-search{position:relative;float:left;margin-top:10px;margin-bottom:0;}.navbar-search .search-query{margin-bottom:0;padding:4px 14px;font-family:"Helvetica Neue",Helvetica,Arial,sans-serif;font-size:13px;font-weight:normal;line-height:1;-webkit-border-radius:15px;-moz-border-radius:15px;border-radius:15px;}
-.navbar-static-top{position:static;margin-bottom:0;}.navbar-static-top .navbar-inner{-webkit-border-radius:0;-moz-border-radius:0;border-radius:0;}
-.navbar-fixed-top,.navbar-fixed-bottom{position:fixed;right:0;left:0;z-index:1030;margin-bottom:0;}
-.navbar-fixed-top .navbar-inner,.navbar-static-top .navbar-inner{border-width:0 0 1px;}
-.navbar-fixed-bottom .navbar-inner{border-width:1px 0 0;}
-.navbar-fixed-top .navbar-inner,.navbar-fixed-bottom .navbar-inner{padding-left:0;padding-right:0;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0;}
-.navbar-static-top .container,.navbar-fixed-top .container,.navbar-fixed-bottom .container{width:940px;}
-.navbar-fixed-top{top:0;}
-.navbar-fixed-top .navbar-inner,.navbar-static-top .navbar-inner{-webkit-box-shadow:0 1px 10px rgba(0,0,0,.1);-moz-box-shadow:0 1px 10px rgba(0,0,0,.1);box-shadow:0 1px 10px rgba(0,0,0,.1);}
-.navbar-fixed-bottom{bottom:0;}.navbar-fixed-bottom .navbar-inner{-webkit-box-shadow:0 -1px 10px rgba(0,0,0,.1);-moz-box-shadow:0 -1px 10px rgba(0,0,0,.1);box-shadow:0 -1px 10px rgba(0,0,0,.1);}
-.navbar .nav{position:relative;left:0;display:block;float:left;margin:0 10px 0 0;}
-.navbar .nav.pull-right{float:right;margin-right:0;}
-.navbar .nav>li{float:left;}
-.navbar .nav>li>a{float:none;padding:15px 15px 15px;color:#ffffff;text-decoration:none;text-shadow:0 1px 0 #54b4eb;}
-.navbar .nav .dropdown-toggle .caret{margin-top:8px;}
-.navbar .nav>li>a:focus,.navbar .nav>li>a:hover{background-color:#1684c2;color:#ffffff;text-decoration:none;}
-.navbar .nav>.active>a,.navbar .nav>.active>a:hover,.navbar .nav>.active>a:focus{color:#ffffff;text-decoration:none;background-color:#1684c2;-webkit-box-shadow:inset 0 3px 8px rgba(0, 0, 0, 0.125);-moz-box-shadow:inset 0 3px 8px rgba(0, 0, 0, 0.125);box-shadow:inset 0 3px 8px rgba(0, 0, 0, 0.125);}
-.navbar .btn-navbar{display:none;float:right;padding:7px 10px;margin-left:5px;margin-right:5px;color:#ffffff;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);background-color:#2fa3e6;background-image:-moz-linear-gradient(top, #3daae9, #1a99e2);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#3daae9), to(#1a99e2));background-image:-webkit-linear-gradient(top, #3daae9, #1a99e2);background-image:-o-linear-gradient(top, #3daae9, #1a99e2);background-image:linear-gradient(to bottom, #3daae9, #1a99e2);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff3daae9', endColorstr='#ff1a99e2', GradientType=0);border-color:#1a99e2 #1a99e2 #126b9e;border-color:rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);*background-color:#1a99e2;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);-webkit-box-shadow:inset 0 1px 0 rgba(255,255,255,.1), 0 1px 0 rgba(255,255,255,.075);-moz-box-shadow:inset 0 1px 0 rgba(255,255,255,.1), 0
  1px 0 rgba(255,255,255,.075);box-shadow:inset 0 1px 0 rgba(255,255,255,.1), 0 1px 0 rgba(255,255,255,.075);}.navbar .btn-navbar:hover,.navbar .btn-navbar:active,.navbar .btn-navbar.active,.navbar .btn-navbar.disabled,.navbar .btn-navbar[disabled]{color:#ffffff;background-color:#1a99e2;*background-color:#178acc;}
-.navbar .btn-navbar:active,.navbar .btn-navbar.active{background-color:#157ab5 \9;}
-.navbar .btn-navbar .icon-bar{display:block;width:18px;height:2px;background-color:#f5f5f5;-webkit-border-radius:1px;-moz-border-radius:1px;border-radius:1px;-webkit-box-shadow:0 1px 0 rgba(0, 0, 0, 0.25);-moz-box-shadow:0 1px 0 rgba(0, 0, 0, 0.25);box-shadow:0 1px 0 rgba(0, 0, 0, 0.25);}
-.btn-navbar .icon-bar+.icon-bar{margin-top:3px;}
-.navbar .nav>li>.dropdown-menu:before{content:'';display:inline-block;border-left:7px solid transparent;border-right:7px solid transparent;border-bottom:7px solid #ccc;border-bottom-color:rgba(0, 0, 0, 0.2);position:absolute;top:-7px;left:9px;}
-.navbar .nav>li>.dropdown-menu:after{content:'';display:inline-block;border-left:6px solid transparent;border-right:6px solid transparent;border-bottom:6px solid #ffffff;position:absolute;top:-6px;left:10px;}
-.navbar-fixed-bottom .nav>li>.dropdown-menu:before{border-top:7px solid #ccc;border-top-color:rgba(0, 0, 0, 0.2);border-bottom:0;bottom:-7px;top:auto;}
-.navbar-fixed-bottom .nav>li>.dropdown-menu:after{border-top:6px solid #ffffff;border-bottom:0;bottom:-6px;top:auto;}
-.navbar .nav li.dropdown>a:hover .caret{border-top-color:#ffffff;border-bottom-color:#ffffff;}
-.navbar .nav li.dropdown.open>.dropdown-toggle,.navbar .nav li.dropdown.active>.dropdown-toggle,.navbar .nav li.dropdown.open.active>.dropdown-toggle{background-color:#1684c2;color:#ffffff;}
-.navbar .nav li.dropdown>.dropdown-toggle .caret{border-top-color:#ffffff;border-bottom-color:#ffffff;}
-.navbar .nav li.dropdown.open>.dropdown-toggle .caret,.navbar .nav li.dropdown.active>.dropdown-toggle .caret,.navbar .nav li.dropdown.open.active>.dropdown-toggle .caret{border-top-color:#ffffff;border-bottom-color:#ffffff;}
-.navbar .pull-right>li>.dropdown-menu,.navbar .nav>li>.dropdown-menu.pull-right{left:auto;right:0;}.navbar .pull-right>li>.dropdown-menu:before,.navbar .nav>li>.dropdown-menu.pull-right:before{left:auto;right:12px;}
-.navbar .pull-right>li>.dropdown-menu:after,.navbar .nav>li>.dropdown-menu.pull-right:after{left:auto;right:13px;}
-.navbar .pull-right>li>.dropdown-menu .dropdown-menu,.navbar .nav>li>.dropdown-menu.pull-right .dropdown-menu{left:auto;right:100%;margin-left:0;margin-right:-1px;-webkit-border-radius:6px 0 6px 6px;-moz-border-radius:6px 0 6px 6px;border-radius:6px 0 6px 6px;}
-.navbar-inverse .navbar-inner{background-color:#034482;background-image:-moz-linear-gradient(top, #04498c, #033c73);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#04498c), to(#033c73));background-image:-webkit-linear-gradient(top, #04498c, #033c73);background-image:-o-linear-gradient(top, #04498c, #033c73);background-image:linear-gradient(to bottom, #04498c, #033c73);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff04498c', endColorstr='#ff033c73', GradientType=0);border-color:#033464;}
-.navbar-inverse .brand,.navbar-inverse .nav>li>a{color:#ffffff;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);}.navbar-inverse .brand:hover,.navbar-inverse .nav>li>a:hover{color:#ffffff;}
-.navbar-inverse .brand{color:#ffffff;}
-.navbar-inverse .navbar-text{color:#ffffff;}
-.navbar-inverse .nav>li>a:focus,.navbar-inverse .nav>li>a:hover{background-color:#022c55;color:#ffffff;}
-.navbar-inverse .nav .active>a,.navbar-inverse .nav .active>a:hover,.navbar-inverse .nav .active>a:focus{color:#ffffff;background-color:#022c55;}
-.navbar-inverse .navbar-link{color:#ffffff;}.navbar-inverse .navbar-link:hover{color:#ffffff;}
-.navbar-inverse .divider-vertical{border-left-color:#033c73;border-right-color:#04498c;}
-.navbar-inverse .nav li.dropdown.open>.dropdown-toggle,.navbar-inverse .nav li.dropdown.active>.dropdown-toggle,.navbar-inverse .nav li.dropdown.open.active>.dropdown-toggle{background-color:#022c55;color:#ffffff;}
-.navbar-inverse .nav li.dropdown>a:hover .caret{border-top-color:#ffffff;border-bottom-color:#ffffff;}
-.navbar-inverse .nav li.dropdown>.dropdown-toggle .caret{border-top-color:#ffffff;border-bottom-color:#ffffff;}
-.navbar-inverse .nav li.dropdown.open>.dropdown-toggle .caret,.navbar-inverse .nav li.dropdown.active>.dropdown-toggle .caret,.navbar-inverse .nav li.dropdown.open.active>.dropdown-toggle .caret{border-top-color:#ffffff;border-bottom-color:#ffffff;}
-.navbar-inverse .navbar-search .search-query{color:#ffffff;background-color:#ffffff;border-color:#033c73;-webkit-box-shadow:inset 0 1px 2px rgba(0,0,0,.1), 0 1px 0 rgba(255,255,255,.15);-moz-box-shadow:inset 0 1px 2px rgba(0,0,0,.1), 0 1px 0 rgba(255,255,255,.15);box-shadow:inset 0 1px 2px rgba(0,0,0,.1), 0 1px 0 rgba(255,255,255,.15);-webkit-transition:none;-moz-transition:none;-o-transition:none;transition:none;}.navbar-inverse .navbar-search .search-query:-moz-placeholder{color:#999999;}
-.navbar-inverse .navbar-search .search-query:-ms-input-placeholder{color:#999999;}
-.navbar-inverse .navbar-search .search-query::-webkit-input-placeholder{color:#999999;}
-.navbar-inverse .navbar-search .search-query:focus,.navbar-inverse .navbar-search .search-query.focused{padding:5px 15px;color:#333333;text-shadow:0 1px 0 #ffffff;background-color:#ffffff;border:0;-webkit-box-shadow:0 0 3px rgba(0, 0, 0, 0.15);-moz-box-shadow:0 0 3px rgba(0, 0, 0, 0.15);box-shadow:0 0 3px rgba(0, 0, 0, 0.15);outline:0;}
-.navbar-inverse .btn-navbar{color:#ffffff;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);background-color:#033769;background-image:-moz-linear-gradient(top, #033c73, #022f5a);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#033c73), to(#022f5a));background-image:-webkit-linear-gradient(top, #033c73, #022f5a);background-image:-o-linear-gradient(top, #033c73, #022f5a);background-image:linear-gradient(to bottom, #033c73, #022f5a);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff033c73', endColorstr='#ff022f5a', GradientType=0);border-color:#022f5a #022f5a #000810;border-color:rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);*background-color:#022f5a;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);}.navbar-inverse .btn-navbar:hover,.navbar-inverse .btn-navbar:active,.navbar-inverse .btn-navbar.active,.navbar-inverse .btn-navbar.disabled,.navbar-inverse .btn-navbar[disabled]{color:#ffffff;background-c
 olor:#022f5a;*background-color:#022241;}
-.navbar-inverse .btn-navbar:active,.navbar-inverse .btn-navbar.active{background-color:#011528 \9;}
-.breadcrumb{padding:8px 15px;margin:0 0 20px;list-style:none;background-color:#f5f5f5;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;}.breadcrumb>li{display:inline-block;*display:inline;*zoom:1;text-shadow:0 1px 0 #ffffff;}.breadcrumb>li>.divider{padding:0 5px;color:#ccc;}
-.breadcrumb>.active{color:#999999;}
-.pagination{margin:20px 0;}
-.pagination ul{display:inline-block;*display:inline;*zoom:1;margin-left:0;margin-bottom:0;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;-webkit-box-shadow:0 1px 2px rgba(0, 0, 0, 0.05);-moz-box-shadow:0 1px 2px rgba(0, 0, 0, 0.05);box-shadow:0 1px 2px rgba(0, 0, 0, 0.05);}
-.pagination ul>li{display:inline;}
-.pagination ul>li>a,.pagination ul>li>span{float:left;padding:4px 12px;line-height:20px;text-decoration:none;background-color:#ffffff;border:1px solid #dddddd;border-left-width:0;}
-.pagination ul>li>a:hover,.pagination ul>.active>a,.pagination ul>.active>span{background-color:#f5f5f5;}
-.pagination ul>.active>a,.pagination ul>.active>span{color:#999999;cursor:default;}
-.pagination ul>.disabled>span,.pagination ul>.disabled>a,.pagination ul>.disabled>a:hover{color:#999999;background-color:transparent;cursor:default;}
-.pagination ul>li:first-child>a,.pagination ul>li:first-child>span{border-left-width:1px;-webkit-border-top-left-radius:4px;-moz-border-radius-topleft:4px;border-top-left-radius:4px;-webkit-border-bottom-left-radius:4px;-moz-border-radius-bottomleft:4px;border-bottom-left-radius:4px;}
-.pagination ul>li:last-child>a,.pagination ul>li:last-child>span{-webkit-border-top-right-radius:4px;-moz-border-radius-topright:4px;border-top-right-radius:4px;-webkit-border-bottom-right-radius:4px;-moz-border-radius-bottomright:4px;border-bottom-right-radius:4px;}
-.pagination-centered{text-align:center;}
-.pagination-right{text-align:right;}
-.pagination-large ul>li>a,.pagination-large ul>li>span{padding:11px 19px;font-size:17.5px;}
-.pagination-large ul>li:first-child>a,.pagination-large ul>li:first-child>span{-webkit-border-top-left-radius:6px;-moz-border-radius-topleft:6px;border-top-left-radius:6px;-webkit-border-bottom-left-radius:6px;-moz-border-radius-bottomleft:6px;border-bottom-left-radius:6px;}
-.pagination-large ul>li:last-child>a,.pagination-large ul>li:last-child>span{-webkit-border-top-right-radius:6px;-moz-border-radius-topright:6px;border-top-right-radius:6px;-webkit-border-bottom-right-radius:6px;-moz-border-radius-bottomright:6px;border-bottom-right-radius:6px;}
-.pagination-mini ul>li:first-child>a,.pagination-small ul>li:first-child>a,.pagination-mini ul>li:first-child>span,.pagination-small ul>li:first-child>span{-webkit-border-top-left-radius:3px;-moz-border-radius-topleft:3px;border-top-left-radius:3px;-webkit-border-bottom-left-radius:3px;-moz-border-radius-bottomleft:3px;border-bottom-left-radius:3px;}
-.pagination-mini ul>li:last-child>a,.pagination-small ul>li:last-child>a,.pagination-mini ul>li:last-child>span,.pagination-small ul>li:last-child>span{-webkit-border-top-right-radius:3px;-moz-border-radius-topright:3px;border-top-right-radius:3px;-webkit-border-bottom-right-radius:3px;-moz-border-radius-bottomright:3px;border-bottom-right-radius:3px;}
-.pagination-small ul>li>a,.pagination-small ul>li>span{padding:2px 10px;font-size:11.9px;}
-.pagination-mini ul>li>a,.pagination-mini ul>li>span{padding:0px 6px;font-size:10.5px;}
-.pager{margin:20px 0;list-style:none;text-align:center;*zoom:1;}.pager:before,.pager:after{display:table;content:"";line-height:0;}
-.pager:after{clear:both;}
-.pager li{display:inline;}
-.pager li>a,.pager li>span{display:inline-block;padding:5px 14px;background-color:#fff;border:1px solid #ddd;-webkit-border-radius:15px;-moz-border-radius:15px;border-radius:15px;}
-.pager li>a:hover{text-decoration:none;background-color:#f5f5f5;}
-.pager .next>a,.pager .next>span{float:right;}
-.pager .previous>a,.pager .previous>span{float:left;}
-.pager .disabled>a,.pager .disabled>a:hover,.pager .disabled>span{color:#999999;background-color:#fff;cursor:default;}
-.modal-backdrop{position:fixed;top:0;right:0;bottom:0;left:0;z-index:1040;background-color:#000000;}.modal-backdrop.fade{opacity:0;}
-.modal-backdrop,.modal-backdrop.fade.in{opacity:0.8;filter:alpha(opacity=80);}
-.modal{position:fixed;top:10%;left:50%;z-index:1050;width:560px;margin-left:-280px;background-color:#ffffff;border:1px solid #999;border:1px solid rgba(0, 0, 0, 0.3);*border:1px solid #999;-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px;-webkit-box-shadow:0 3px 7px rgba(0, 0, 0, 0.3);-moz-box-shadow:0 3px 7px rgba(0, 0, 0, 0.3);box-shadow:0 3px 7px rgba(0, 0, 0, 0.3);-webkit-background-clip:padding-box;-moz-background-clip:padding-box;background-clip:padding-box;outline:none;}.modal.fade{-webkit-transition:opacity .3s linear, top .3s ease-out;-moz-transition:opacity .3s linear, top .3s ease-out;-o-transition:opacity .3s linear, top .3s ease-out;transition:opacity .3s linear, top .3s ease-out;top:-25%;}
-.modal.fade.in{top:10%;}
-.modal-header{padding:9px 15px;border-bottom:1px solid #eee;}.modal-header .close{margin-top:2px;}
-.modal-header h3{margin:0;line-height:30px;}
-.modal-body{position:relative;overflow-y:auto;max-height:400px;padding:15px;}
-.modal-form{margin-bottom:0;}
-.modal-footer{padding:14px 15px 15px;margin-bottom:0;text-align:right;background-color:#f5f5f5;border-top:1px solid #ddd;-webkit-border-radius:0 0 6px 6px;-moz-border-radius:0 0 6px 6px;border-radius:0 0 6px 6px;-webkit-box-shadow:inset 0 1px 0 #ffffff;-moz-box-shadow:inset 0 1px 0 #ffffff;box-shadow:inset 0 1px 0 #ffffff;*zoom:1;}.modal-footer:before,.modal-footer:after{display:table;content:"";line-height:0;}
-.modal-footer:after{clear:both;}
-.modal-footer .btn+.btn{margin-left:5px;margin-bottom:0;}
-.modal-footer .btn-group .btn+.btn{margin-left:-1px;}
-.modal-footer .btn-block+.btn-block{margin-left:0;}
-.tooltip{position:absolute;z-index:1020;display:block;visibility:visible;padding:5px;font-size:11px;opacity:0;filter:alpha(opacity=0);}.tooltip.in{opacity:0.8;filter:alpha(opacity=80);}
-.tooltip.top{margin-top:-3px;}
-.tooltip.right{margin-left:3px;}
-.tooltip.bottom{margin-top:3px;}
-.tooltip.left{margin-left:-3px;}
-.tooltip-inner{max-width:200px;padding:3px 8px;color:#ffffff;text-align:center;text-decoration:none;background-color:#000000;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;}
-.tooltip-arrow{position:absolute;width:0;height:0;border-color:transparent;border-style:solid;}
-.tooltip.top .tooltip-arrow{bottom:0;left:50%;margin-left:-5px;border-width:5px 5px 0;border-top-color:#000000;}
-.tooltip.right .tooltip-arrow{top:50%;left:0;margin-top:-5px;border-width:5px 5px 5px 0;border-right-color:#000000;}
-.tooltip.left .tooltip-arrow{top:50%;right:0;margin-top:-5px;border-width:5px 0 5px 5px;border-left-color:#000000;}
-.tooltip.bottom .tooltip-arrow{top:0;left:50%;margin-left:-5px;border-width:0 5px 5px;border-bottom-color:#000000;}
-.popover{position:absolute;top:0;left:0;z-index:1010;display:none;width:236px;padding:1px;text-align:left;background-color:#ffffff;-webkit-background-clip:padding-box;-moz-background-clip:padding;background-clip:padding-box;border:1px solid #ccc;border:1px solid rgba(0, 0, 0, 0.2);-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px;-webkit-box-shadow:0 5px 10px rgba(0, 0, 0, 0.2);-moz-box-shadow:0 5px 10px rgba(0, 0, 0, 0.2);box-shadow:0 5px 10px rgba(0, 0, 0, 0.2);white-space:normal;}.popover.top{margin-top:-10px;}
-.popover.right{margin-left:10px;}
-.popover.bottom{margin-top:10px;}
-.popover.left{margin-left:-10px;}
-.popover-title{margin:0;padding:8px 14px;font-size:14px;font-weight:normal;line-height:18px;background-color:#f7f7f7;border-bottom:1px solid #ebebeb;-webkit-border-radius:5px 5px 0 0;-moz-border-radius:5px 5px 0 0;border-radius:5px 5px 0 0;}
-.popover-content{padding:9px 14px;}
-.popover .arrow,.popover .arrow:after{position:absolute;display:block;width:0;height:0;border-color:transparent;border-style:solid;}
-.popover .arrow{border-width:11px;}
-.popover .arrow:after{border-width:10px;content:"";}
-.popover.top .arrow{left:50%;margin-left:-11px;border-bottom-width:0;border-top-color:#999;border-top-color:rgba(0, 0, 0, 0.25);bottom:-11px;}.popover.top .arrow:after{bottom:1px;margin-left:-10px;border-bottom-width:0;border-top-color:#ffffff;}
-.popover.right .arrow{top:50%;left:-11px;margin-top:-11px;border-left-width:0;border-right-color:#999;border-right-color:rgba(0, 0, 0, 0.25);}.popover.right .arrow:after{left:1px;bottom:-10px;border-left-width:0;border-right-color:#ffffff;}
-.popover.bottom .arrow{left:50%;margin-left:-11px;border-top-width:0;border-bottom-color:#999;border-bottom-color:rgba(0, 0, 0, 0.25);top:-11px;}.popover.bottom .arrow:after{top:1px;margin-left:-10px;border-top-width:0;border-bottom-color:#ffffff;}
-.popover.left .arrow{top:50%;right:-11px;margin-top:-11px;border-right-width:0;border-left-color:#999;border-left-color:rgba(0, 0, 0, 0.25);}.popover.left .arrow:after{right:1px;border-right-width:0;border-left-color:#ffffff;bottom:-10px;}
-.thumbnails{margin-left:-20px;list-style:none;*zoom:1;}.thumbnails:before,.thumbnails:after{display:table;content:"";line-height:0;}
-.thumbnails:after{clear:both;}
-.row-fluid .thumbnails{margin-left:0;}
-.thumbnails>li{float:left;margin-bottom:20px;margin-left:20px;}
-.thumbnail{display:block;padding:4px;line-height:20px;border:1px solid #ddd;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;-webkit-box-shadow:0 1px 3px rgba(0, 0, 0, 0.055);-moz-box-shadow:0 1px 3px rgba(0, 0, 0, 0.055);box-shadow:0 1px 3px rgba(0, 0, 0, 0.055);-webkit-transition:all 0.2s ease-in-out;-moz-transition:all 0.2s ease-in-out;-o-transition:all 0.2s ease-in-out;transition:all 0.2s ease-in-out;}
-a.thumbnail:hover{border-color:#2fa4e7;-webkit-box-shadow:0 1px 4px rgba(0, 105, 214, 0.25);-moz-box-shadow:0 1px 4px rgba(0, 105, 214, 0.25);box-shadow:0 1px 4px rgba(0, 105, 214, 0.25);}
-.thumbnail>img{display:block;max-width:100%;margin-left:auto;margin-right:auto;}
-.thumbnail .caption{padding:9px;color:#555555;}
-.media,.media-body{overflow:hidden;*overflow:visible;zoom:1;}
-.media,.media .media{margin-top:15px;}
-.media:first-child{margin-top:0;}
-.media-object{display:block;}
-.media-heading{margin:0 0 5px;}
-.media .pull-left{margin-right:10px;}
-.media .pull-right{margin-left:10px;}
-.media-list{margin-left:0;list-style:none;}
-.label,.badge{display:inline-block;padding:2px 4px;font-size:11.844px;font-weight:bold;line-height:14px;color:#ffffff;vertical-align:baseline;white-space:nowrap;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);background-color:#999999;}
-.label{-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px;}
-.badge{padding-left:9px;padding-right:9px;-webkit-border-radius:9px;-moz-border-radius:9px;border-radius:9px;}
-.label:empty,.badge:empty{display:none;}
-a.label:hover,a.badge:hover{color:#ffffff;text-decoration:none;cursor:pointer;}
-.label-important,.badge-important{background-color:#bd4247;}
-.label-important[href],.badge-important[href]{background-color:#983538;}
-.label-warning,.badge-warning{background-color:#dd5600;}
-.label-warning[href],.badge-warning[href]{background-color:#aa4200;}
-.label-success,.badge-success{background-color:#669533;}
-.label-success[href],.badge-success[href]{background-color:#4c6f26;}
-.label-info,.badge-info{background-color:#817b58;}
-.label-info[href],.badge-info[href]{background-color:#625e43;}
-.label-inverse,.badge-inverse{background-color:#333333;}
-.label-inverse[href],.badge-inverse[href]{background-color:#1a1a1a;}
-.btn .label,.btn .badge{position:relative;top:-1px;}
-.btn-mini .label,.btn-mini .badge{top:0;}
- at -webkit-keyframes progress-bar-stripes{from{background-position:40px 0;} to{background-position:0 0;}}@-moz-keyframes progress-bar-stripes{from{background-position:40px 0;} to{background-position:0 0;}}@-ms-keyframes progress-bar-stripes{from{background-position:40px 0;} to{background-position:0 0;}}@-o-keyframes progress-bar-stripes{from{background-position:0 0;} to{background-position:40px 0;}}@keyframes progress-bar-stripes{from{background-position:40px 0;} to{background-position:0 0;}}.progress{overflow:hidden;height:20px;margin-bottom:20px;background-color:#f7f7f7;background-image:-moz-linear-gradient(top, #f5f5f5, #f9f9f9);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#f5f5f5), to(#f9f9f9));background-image:-webkit-linear-gradient(top, #f5f5f5, #f9f9f9);background-image:-o-linear-gradient(top, #f5f5f5, #f9f9f9);background-image:linear-gradient(to bottom, #f5f5f5, #f9f9f9);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startC
 olorstr='#fff5f5f5', endColorstr='#fff9f9f9', GradientType=0);-webkit-box-shadow:inset 0 1px 2px rgba(0, 0, 0, 0.1);-moz-box-shadow:inset 0 1px 2px rgba(0, 0, 0, 0.1);box-shadow:inset 0 1px 2px rgba(0, 0, 0, 0.1);-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;}
-.progress .bar{width:0%;height:100%;color:#ffffff;float:left;font-size:12px;text-align:center;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);background-color:#0e90d2;background-image:-moz-linear-gradient(top, #149bdf, #0480be);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#149bdf), to(#0480be));background-image:-webkit-linear-gradient(top, #149bdf, #0480be);background-image:-o-linear-gradient(top, #149bdf, #0480be);background-image:linear-gradient(to bottom, #149bdf, #0480be);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff149bdf', endColorstr='#ff0480be', GradientType=0);-webkit-box-shadow:inset 0 -1px 0 rgba(0, 0, 0, 0.15);-moz-box-shadow:inset 0 -1px 0 rgba(0, 0, 0, 0.15);box-shadow:inset 0 -1px 0 rgba(0, 0, 0, 0.15);-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;-webkit-transition:width 0.6s ease;-moz-transition:width 0.6s ease;-o-transition:width 0.6s ease;transition:width 0.6s ease;}
-.progress .bar+.bar{-webkit-box-shadow:inset 1px 0 0 rgba(0,0,0,.15), inset 0 -1px 0 rgba(0,0,0,.15);-moz-box-shadow:inset 1px 0 0 rgba(0,0,0,.15), inset 0 -1px 0 rgba(0,0,0,.15);box-shadow:inset 1px 0 0 rgba(0,0,0,.15), inset 0 -1px 0 rgba(0,0,0,.15);}
-.progress-striped .bar{background-color:#149bdf;background-image:-webkit-gradient(linear, 0 100%, 100% 0, color-stop(0.25, rgba(255, 255, 255, 0.15)), color-stop(0.25, transparent), color-stop(0.5, transparent), color-stop(0.5, rgba(255, 255, 255, 0.15)), color-stop(0.75, rgba(255, 255, 255, 0.15)), color-stop(0.75, transparent), to(transparent));background-image:-webkit-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);background-image:-moz-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);background-image:-o-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);background-image:linear-gradient(
 45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);-webkit-background-size:40px 40px;-moz-background-size:40px 40px;-o-background-size:40px 40px;background-size:40px 40px;}
-.progress.active .bar{-webkit-animation:progress-bar-stripes 2s linear infinite;-moz-animation:progress-bar-stripes 2s linear infinite;-ms-animation:progress-bar-stripes 2s linear infinite;-o-animation:progress-bar-stripes 2s linear infinite;animation:progress-bar-stripes 2s linear infinite;}
-.progress-danger .bar,.progress .bar-danger{background-color:#dd514c;background-image:-moz-linear-gradient(top, #ee5f5b, #c43c35);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#ee5f5b), to(#c43c35));background-image:-webkit-linear-gradient(top, #ee5f5b, #c43c35);background-image:-o-linear-gradient(top, #ee5f5b, #c43c35);background-image:linear-gradient(to bottom, #ee5f5b, #c43c35);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffee5f5b', endColorstr='#ffc43c35', GradientType=0);}
-.progress-danger.progress-striped .bar,.progress-striped .bar-danger{background-color:#ee5f5b;background-image:-webkit-gradient(linear, 0 100%, 100% 0, color-stop(0.25, rgba(255, 255, 255, 0.15)), color-stop(0.25, transparent), color-stop(0.5, transparent), color-stop(0.5, rgba(255, 255, 255, 0.15)), color-stop(0.75, rgba(255, 255, 255, 0.15)), color-stop(0.75, transparent), to(transparent));background-image:-webkit-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);background-image:-moz-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);background-image:-o-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, 
 transparent);background-image:linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);}
-.progress-success .bar,.progress .bar-success{background-color:#5eb95e;background-image:-moz-linear-gradient(top, #62c462, #57a957);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#62c462), to(#57a957));background-image:-webkit-linear-gradient(top, #62c462, #57a957);background-image:-o-linear-gradient(top, #62c462, #57a957);background-image:linear-gradient(to bottom, #62c462, #57a957);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff62c462', endColorstr='#ff57a957', GradientType=0);}
-.progress-success.progress-striped .bar,.progress-striped .bar-success{background-color:#62c462;background-image:-webkit-gradient(linear, 0 100%, 100% 0, color-stop(0.25, rgba(255, 255, 255, 0.15)), color-stop(0.25, transparent), color-stop(0.5, transparent), color-stop(0.5, rgba(255, 255, 255, 0.15)), color-stop(0.75, rgba(255, 255, 255, 0.15)), color-stop(0.75, transparent), to(transparent));background-image:-webkit-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);background-image:-moz-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);background-image:-o-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%
 , transparent);background-image:linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);}
-.progress-info .bar,.progress .bar-info{background-color:#4bb1cf;background-image:-moz-linear-gradient(top, #5bc0de, #339bb9);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#5bc0de), to(#339bb9));background-image:-webkit-linear-gradient(top, #5bc0de, #339bb9);background-image:-o-linear-gradient(top, #5bc0de, #339bb9);background-image:linear-gradient(to bottom, #5bc0de, #339bb9);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff5bc0de', endColorstr='#ff339bb9', GradientType=0);}
-.progress-info.progress-striped .bar,.progress-striped .bar-info{background-color:#5bc0de;background-image:-webkit-gradient(linear, 0 100%, 100% 0, color-stop(0.25, rgba(255, 255, 255, 0.15)), color-stop(0.25, transparent), color-stop(0.5, transparent), color-stop(0.5, rgba(255, 255, 255, 0.15)), color-stop(0.75, rgba(255, 255, 255, 0.15)), color-stop(0.75, transparent), to(transparent));background-image:-webkit-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);background-image:-moz-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);background-image:-o-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, tran
 sparent);background-image:linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);}
-.progress-warning .bar,.progress .bar-warning{background-color:#f16e1a;background-image:-moz-linear-gradient(top, #ff7d2b, #dd5600);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#ff7d2b), to(#dd5600));background-image:-webkit-linear-gradient(top, #ff7d2b, #dd5600);background-image:-o-linear-gradient(top, #ff7d2b, #dd5600);background-image:linear-gradient(to bottom, #ff7d2b, #dd5600);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffff7d2b', endColorstr='#ffdd5600', GradientType=0);}
-.progress-warning.progress-striped .bar,.progress-striped .bar-warning{background-color:#ff7d2b;background-image:-webkit-gradient(linear, 0 100%, 100% 0, color-stop(0.25, rgba(255, 255, 255, 0.15)), color-stop(0.25, transparent), color-stop(0.5, transparent), color-stop(0.5, rgba(255, 255, 255, 0.15)), color-stop(0.75, rgba(255, 255, 255, 0.15)), color-stop(0.75, transparent), to(transparent));background-image:-webkit-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);background-image:-moz-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);background-image:-o-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%
 , transparent);background-image:linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);}
-.accordion{margin-bottom:20px;}
-.accordion-group{margin-bottom:2px;border:1px solid #e5e5e5;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;}
-.accordion-heading{border-bottom:0;}
-.accordion-heading .accordion-toggle{display:block;padding:8px 15px;}
-.accordion-toggle{cursor:pointer;}
-.accordion-inner{padding:9px 15px;border-top:1px solid #e5e5e5;}
-.carousel{position:relative;margin-bottom:20px;line-height:1;}
-.carousel-inner{overflow:hidden;width:100%;position:relative;}
-.carousel-inner>.item{display:none;position:relative;-webkit-transition:0.6s ease-in-out left;-moz-transition:0.6s ease-in-out left;-o-transition:0.6s ease-in-out left;transition:0.6s ease-in-out left;}
-.carousel-inner>.item>img{display:block;line-height:1;}
-.carousel-inner>.active,.carousel-inner>.next,.carousel-inner>.prev{display:block;}
-.carousel-inner>.active{left:0;}
-.carousel-inner>.next,.carousel-inner>.prev{position:absolute;top:0;width:100%;}
-.carousel-inner>.next{left:100%;}
-.carousel-inner>.prev{left:-100%;}
-.carousel-inner>.next.left,.carousel-inner>.prev.right{left:0;}
-.carousel-inner>.active.left{left:-100%;}
-.carousel-inner>.active.right{left:100%;}
-.carousel-control{position:absolute;top:40%;left:15px;width:40px;height:40px;margin-top:-20px;font-size:60px;font-weight:100;line-height:30px;color:#ffffff;text-align:center;background:#222222;border:3px solid #ffffff;-webkit-border-radius:23px;-moz-border-radius:23px;border-radius:23px;opacity:0.5;filter:alpha(opacity=50);}.carousel-control.right{left:auto;right:15px;}
-.carousel-control:hover{color:#ffffff;text-decoration:none;opacity:0.9;filter:alpha(opacity=90);}
-.carousel-caption{position:absolute;left:0;right:0;bottom:0;padding:15px;background:#333333;background:rgba(0, 0, 0, 0.75);}
-.carousel-caption h4,.carousel-caption p{color:#ffffff;line-height:20px;}
-.carousel-caption h4{margin:0 0 5px;}
-.carousel-caption p{margin-bottom:0;}
-.hero-unit{padding:30px;margin-bottom:30px;font-size:18px;font-weight:200;line-height:30px;color:inherit;background-color:#f5f5f5;-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px;}.hero-unit h1{margin-bottom:0;font-size:60px;line-height:1;color:inherit;letter-spacing:-1px;}
-.hero-unit li{line-height:30px;}
-.pull-right{float:right;}
-.pull-left{float:left;}
-.hide{display:none;}
-.show{display:block;}
-.invisible{visibility:hidden;}
-.affix{position:fixed;}
-.navbar .brand{padding:14px 20px 16px;font-family:'Telex',sans-serif;text-shadow:1px 1px 0 rgba(0, 0, 0, 0.2);}
-.navbar li{line-height:20px;}
-.navbar .nav>li>a{padding:16px 10px 14px;font-family:'Telex',sans-serif;text-shadow:1px 1px 0 rgba(0, 0, 0, 0.2);}
-.navbar .search-query{border:1px solid #178acc;line-height:normal;}
-.navbar .navbar-text{padding:19px 10px 18px;line-height:13px;color:rgba(0, 0, 0, 0.5);text-shadow:1px 1px 0 rgba(255, 255, 255, 0.3);}
-.navbar-inverse .navbar-search .search-query{color:#555555;}
- at media (max-width:979px){.navbar .nav-collapse .nav li>a{font-family:'Telex',sans-serif;font-weight:normal;color:#ffffff;text-shadow:1px 1px 0 rgba(0, 0, 0, 0.2);}.navbar .nav-collapse .nav li>a:hover{background-color:#2B7CAC;} .navbar .nav-collapse .nav .active>a{-webkit-box-shadow:none;-moz-box-shadow:none;box-shadow:none;background-color:#2B7CAC;} .navbar .nav-collapse .dropdown-menu li>a:hover,.navbar .nav-collapse .dropdown-menu li>a:focus,.navbar .nav-collapse .dropdown-submenu:hover>a{background-image:none;} .navbar .nav-collapse .navbar-form,.navbar .nav-collapse .navbar-search{border:none;} .navbar .nav-collapse .nav-header{color:#2B7CAC;} .navbar-inverse .nav-collapse .nav li>a{color:#ffffff;}.navbar-inverse .nav-collapse .nav li>a:hover{background-color:rgba(0, 0, 0, 0.1);} .navbar-inverse .nav-collapse .nav .active>a,.navbar-inverse .nav-collapse .nav>li>a:hover,.navbar-inverse .nav-collapse .dropdown-menu a:hover{background-color:rgba(0, 0, 0, 0.1) !important;}}
 div.subnav{font-family:'Telex',sans-serif;text-shadow:1px 1px 0 rgba(255, 255, 255, 0.2);}div.subnav-fixed{top:50px;}
-.btn{background-color:#ffffff;background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#ffffff), color-stop(5%, #ffffff), to(#ffffff));background-image:-webkit-linear-gradient(#ffffff, #ffffff 5%, #ffffff);background-image:-moz-linear-gradient(top, #ffffff, #ffffff 5%, #ffffff);background-image:-o-linear-gradient(#ffffff, #ffffff 5%, #ffffff);background-image:linear-gradient(#ffffff, #ffffff 5%, #ffffff);background-repeat:no-repeat;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff', endColorstr='#ffffffff', GradientType=0);-webkit-box-shadow:inset 0 1px 0 rgba(255, 255, 255, 0.2),0 1px 2px rgba(0, 0, 0, 0.05);-moz-box-shadow:inset 0 1px 0 rgba(255, 255, 255, 0.2),0 1px 2px rgba(0, 0, 0, 0.05);box-shadow:inset 0 1px 0 rgba(255, 255, 255, 0.2),0 1px 2px rgba(0, 0, 0, 0.05);}.btn:hover{background-position:0 0;}
-.btn-primary{color:#ffffff;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);background-color:#3daae9;background-image:-moz-linear-gradient(top, #46aeea, #2fa4e7);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#46aeea), to(#2fa4e7));background-image:-webkit-linear-gradient(top, #46aeea, #2fa4e7);background-image:-o-linear-gradient(top, #46aeea, #2fa4e7);background-image:linear-gradient(to bottom, #46aeea, #2fa4e7);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff46aeea', endColorstr='#ff2fa4e7', GradientType=0);border-color:#2fa4e7 #2fa4e7 #157ab5;border-color:rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);*background-color:#2fa4e7;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);}.btn-primary:hover,.btn-primary:active,.btn-primary.active,.btn-primary.disabled,.btn-primary[disabled]{color:#ffffff;background-color:#2fa4e7;*background-color:#1a99e2;}
-.btn-primary:active,.btn-primary.active{background-color:#178acc \9;}
-.btn-info{color:#ffffff;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);background-color:#9e6ab8;background-image:-moz-linear-gradient(top, #a271bb, #9760b3);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#a271bb), to(#9760b3));background-image:-webkit-linear-gradient(top, #a271bb, #9760b3);background-image:-o-linear-gradient(top, #a271bb, #9760b3);background-image:linear-gradient(to bottom, #a271bb, #9760b3);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffa271bb', endColorstr='#ff9760b3', GradientType=0);border-color:#9760b3 #9760b3 #6f4086;border-color:rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);*background-color:#9760b3;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);}.btn-info:hover,.btn-info:active,.btn-info.active,.btn-info.disabled,.btn-info[disabled]{color:#ffffff;background-color:#9760b3;*background-color:#8b51a9;}
-.btn-info:active,.btn-info.active{background-color:#7d4898 \9;}
-.btn-success{color:#ffffff;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);background-color:#7bb33d;background-image:-moz-linear-gradient(top, #80bb3f, #73a839);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#80bb3f), to(#73a839));background-image:-webkit-linear-gradient(top, #80bb3f, #73a839);background-image:-o-linear-gradient(top, #80bb3f, #73a839);background-image:linear-gradient(to bottom, #80bb3f, #73a839);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff80bb3f', endColorstr='#ff73a839', GradientType=0);border-color:#73a839 #73a839 #4c6f26;border-color:rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);*background-color:#73a839;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);}.btn-success:hover,.btn-success:active,.btn-success.active,.btn-success.disabled,.btn-success[disabled]{color:#ffffff;background-color:#73a839;*background-color:#669533;}
-.btn-success:active,.btn-success.active{background-color:#59822c \9;}
-.btn-warning{color:#ffffff;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);background-color:#ec5c00;background-image:-moz-linear-gradient(top, #f76000, #dd5600);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#f76000), to(#dd5600));background-image:-webkit-linear-gradient(top, #f76000, #dd5600);background-image:-o-linear-gradient(top, #f76000, #dd5600);background-image:linear-gradient(to bottom, #f76000, #dd5600);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#fff76000', endColorstr='#ffdd5600', GradientType=0);border-color:#dd5600 #dd5600 #913800;border-color:rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);*background-color:#dd5600;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);}.btn-warning:hover,.btn-warning:active,.btn-warning.active,.btn-warning.disabled,.btn-warning[disabled]{color:#ffffff;background-color:#dd5600;*background-color:#c44c00;}
-.btn-warning:active,.btn-warning.active{background-color:#aa4200 \9;}
-.btn-danger{color:#ffffff;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);background-color:#d41e24;background-image:-moz-linear-gradient(top, #dd1f26, #c71c22);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#dd1f26), to(#c71c22));background-image:-webkit-linear-gradient(top, #dd1f26, #c71c22);background-image:-o-linear-gradient(top, #dd1f26, #c71c22);background-image:linear-gradient(to bottom, #dd1f26, #c71c22);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffdd1f26', endColorstr='#ffc71c22', GradientType=0);border-color:#c71c22 #c71c22 #841317;border-color:rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);*background-color:#c71c22;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);}.btn-danger:hover,.btn-danger:active,.btn-danger.active,.btn-danger.disabled,.btn-danger[disabled]{color:#ffffff;background-color:#c71c22;*background-color:#b1191e;}
-.btn-danger:active,.btn-danger.active{background-color:#9a161a \9;}
-.btn-inverse{color:#ffffff;text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);background-color:#034482;background-image:-moz-linear-gradient(top, #04498c, #033c73);background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#04498c), to(#033c73));background-image:-webkit-linear-gradient(top, #04498c, #033c73);background-image:-o-linear-gradient(top, #04498c, #033c73);background-image:linear-gradient(to bottom, #04498c, #033c73);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff04498c', endColorstr='#ff033c73', GradientType=0);border-color:#033c73 #033c73 #011528;border-color:rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);*background-color:#033c73;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);}.btn-inverse:hover,.btn-inverse:active,.btn-inverse.active,.btn-inverse.disabled,.btn-inverse[disabled]{color:#ffffff;background-color:#033c73;*background-color:#022f5a;}
-.btn-inverse:active,.btn-inverse.active{background-color:#022241 \9;}
-i[class^="icon-"]{opacity:0.8;}
-.pull-right{float:right;}
-.pull-left{float:left;}
-.hide{display:none;}
-.show{display:block;}
-.invisible{visibility:hidden;}
-.affix{position:fixed;}
+html{font-family:sans-serif;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%}
+body{margin:0}
+article,aside,details,figcaption,figure,footer,header,hgroup,main,nav,section,summary{display:block}
+audio,canvas,progress,video{display:inline-block;vertical-align:baseline}
+audio:not([controls]){display:none;height:0}
+[hidden],template{display:none}
+a{background:transparent}
+a:active,a:hover{outline:0}
+abbr[title]{border-bottom:1px dotted}
+b,strong{font-weight:700}
+dfn{font-style:italic}
+h1{font-size:2em;margin:.67em 0}
+mark{background:#ff0;color:#000}
+small{font-size:80%}
+sub,sup{font-size:75%;line-height:0;position:relative;vertical-align:baseline}
+sup{top:-.5em}
+sub{bottom:-.25em}
+img{border:0}
+svg:not(:root){overflow:hidden}
+figure{margin:1em 40px}
+hr{-moz-box-sizing:content-box;box-sizing:content-box;height:0}
+pre{overflow:auto}
+code,kbd,pre,samp{font-family:monospace,monospace;font-size:1em}
+button,input,optgroup,select,textarea{color:inherit;font:inherit;margin:0}
+button{overflow:visible}
+button,select{text-transform:none}
+button,html input[type="button"],input[type="reset"],input[type="submit"]{-webkit-appearance:button;cursor:pointer}
+button[disabled],html input[disabled]{cursor:default}
+button::-moz-focus-inner,input::-moz-focus-inner{border:0;padding:0}
+input{line-height:normal}
+input[type="checkbox"],input[type="radio"]{box-sizing:border-box;padding:0}
+input[type="number"]::-webkit-inner-spin-button,input[type="number"]::-webkit-outer-spin-button{height:auto}
+input[type="search"]{-webkit-appearance:textfield;-moz-box-sizing:content-box;-webkit-box-sizing:content-box;box-sizing:content-box}
+input[type="search"]::-webkit-search-cancel-button,input[type="search"]::-webkit-search-decoration{-webkit-appearance:none}
+fieldset{border:1px solid silver;margin:0 2px;padding:.35em .625em .75em}
+legend{border:0;padding:0}
+textarea{overflow:auto}
+optgroup{font-weight:700}
+table{border-collapse:collapse;border-spacing:0}
+td,th{padding:0}
+ at media print {
+*{text-shadow:none!important;color:#000!important;background:transparent!important;box-shadow:none!important}
+a,a:visited{text-decoration:underline}
+a[href]:after{content:" (" attr(href) ")"}
+abbr[title]:after{content:" (" attr(title) ")"}
+a[href^="javascript:"]:after,a[href^="#"]:after{content:""}
+pre,blockquote{border:1px solid #999;page-break-inside:avoid}
+thead{display:table-header-group}
+tr,img{page-break-inside:avoid}
+img{max-width:100%!important}
+p,h2,h3{orphans:3;widows:3}
+h2,h3{page-break-after:avoid}
+select{background:#fff!important}
+.navbar{display:none}
+.table td,.table th{background-color:#fff!important}
+.btn > .caret,.dropup > .btn > .caret{border-top-color:#000!important}
+.label{border:1px solid #000}
+.table{border-collapse:collapse!important}
+.table-bordered th,.table-bordered td{border:1px solid #ddd!important}
+}
+ at font-face{font-family:'Glyphicons Halflings';src:url(../fonts/glyphicons-halflings-regular.eot);src:url(../fonts/glyphicons-halflings-regular.eot?#iefix) format("embedded-opentype"),url(../fonts/glyphicons-halflings-regular.woff) format("woff"),url(../fonts/glyphicons-halflings-regular.ttf) format("truetype"),url(../fonts/glyphicons-halflings-regular.svg#glyphicons_halflingsregular) format("svg")}
+.glyphicon{position:relative;top:1px;display:inline-block;font-family:'Glyphicons Halflings';font-style:normal;font-weight:400;line-height:1;-webkit-font-smoothing:antialiased;-moz-osx-font-smoothing:grayscale}
+.glyphicon-asterisk:before{content:"\2a"}
+.glyphicon-plus:before{content:"\2b"}
+.glyphicon-euro:before{content:"\20ac"}
+.glyphicon-minus:before{content:"\2212"}
+.glyphicon-cloud:before{content:"\2601"}
+.glyphicon-envelope:before{content:"\2709"}
+.glyphicon-pencil:before{content:"\270f"}
+.glyphicon-glass:before{content:"\e001"}
+.glyphicon-music:before{content:"\e002"}
+.glyphicon-search:before{content:"\e003"}
+.glyphicon-heart:before{content:"\e005"}
+.glyphicon-star:before{content:"\e006"}
+.glyphicon-star-empty:before{content:"\e007"}
+.glyphicon-user:before{content:"\e008"}
+.glyphicon-film:before{content:"\e009"}
+.glyphicon-th-large:before{content:"\e010"}
+.glyphicon-th:before{content:"\e011"}
+.glyphicon-th-list:before{content:"\e012"}
+.glyphicon-ok:before{content:"\e013"}
+.glyphicon-remove:before{content:"\e014"}
+.glyphicon-zoom-in:before{content:"\e015"}
+.glyphicon-zoom-out:before{content:"\e016"}
+.glyphicon-off:before{content:"\e017"}
+.glyphicon-signal:before{content:"\e018"}
+.glyphicon-cog:before{content:"\e019"}
+.glyphicon-trash:before{content:"\e020"}
+.glyphicon-home:before{content:"\e021"}
+.glyphicon-file:before{content:"\e022"}
+.glyphicon-time:before{content:"\e023"}
+.glyphicon-road:before{content:"\e024"}
+.glyphicon-download-alt:before{content:"\e025"}
+.glyphicon-download:before{content:"\e026"}
+.glyphicon-upload:before{content:"\e027"}
+.glyphicon-inbox:before{content:"\e028"}
+.glyphicon-play-circle:before{content:"\e029"}
+.glyphicon-repeat:before{content:"\e030"}
+.glyphicon-refresh:before{content:"\e031"}
+.glyphicon-list-alt:before{content:"\e032"}
+.glyphicon-lock:before{content:"\e033"}
+.glyphicon-flag:before{content:"\e034"}
+.glyphicon-headphones:before{content:"\e035"}
+.glyphicon-volume-off:before{content:"\e036"}
+.glyphicon-volume-down:before{content:"\e037"}
+.glyphicon-volume-up:before{content:"\e038"}
+.glyphicon-qrcode:before{content:"\e039"}
+.glyphicon-barcode:before{content:"\e040"}
+.glyphicon-tag:before{content:"\e041"}
+.glyphicon-tags:before{content:"\e042"}
+.glyphicon-book:before{content:"\e043"}
+.glyphicon-bookmark:before{content:"\e044"}
+.glyphicon-print:before{content:"\e045"}
+.glyphicon-camera:before{content:"\e046"}
+.glyphicon-font:before{content:"\e047"}
+.glyphicon-bold:before{content:"\e048"}
+.glyphicon-italic:before{content:"\e049"}
+.glyphicon-text-height:before{content:"\e050"}
+.glyphicon-text-width:before{content:"\e051"}
+.glyphicon-align-left:before{content:"\e052"}
+.glyphicon-align-center:before{content:"\e053"}
+.glyphicon-align-right:before{content:"\e054"}
+.glyphicon-align-justify:before{content:"\e055"}
+.glyphicon-list:before{content:"\e056"}
+.glyphicon-indent-left:before{content:"\e057"}
+.glyphicon-indent-right:before{content:"\e058"}
+.glyphicon-facetime-video:before{content:"\e059"}
+.glyphicon-picture:before{content:"\e060"}
+.glyphicon-map-marker:before{content:"\e062"}
+.glyphicon-adjust:before{content:"\e063"}
+.glyphicon-tint:before{content:"\e064"}
+.glyphicon-edit:before{content:"\e065"}
+.glyphicon-share:before{content:"\e066"}
+.glyphicon-check:before{content:"\e067"}
+.glyphicon-move:before{content:"\e068"}
+.glyphicon-step-backward:before{content:"\e069"}
+.glyphicon-fast-backward:before{content:"\e070"}
+.glyphicon-backward:before{content:"\e071"}
+.glyphicon-play:before{content:"\e072"}
+.glyphicon-pause:before{content:"\e073"}
+.glyphicon-stop:before{content:"\e074"}
+.glyphicon-forward:before{content:"\e075"}
+.glyphicon-fast-forward:before{content:"\e076"}
+.glyphicon-step-forward:before{content:"\e077"}
+.glyphicon-eject:before{content:"\e078"}
+.glyphicon-chevron-left:before{content:"\e079"}
+.glyphicon-chevron-right:before{content:"\e080"}
+.glyphicon-plus-sign:before{content:"\e081"}
+.glyphicon-minus-sign:before{content:"\e082"}
+.glyphicon-remove-sign:before{content:"\e083"}
+.glyphicon-ok-sign:before{content:"\e084"}
+.glyphicon-question-sign:before{content:"\e085"}
+.glyphicon-info-sign:before{content:"\e086"}
+.glyphicon-screenshot:before{content:"\e087"}
+.glyphicon-remove-circle:before{content:"\e088"}
+.glyphicon-ok-circle:before{content:"\e089"}
+.glyphicon-ban-circle:before{content:"\e090"}
+.glyphicon-arrow-left:before{content:"\e091"}
+.glyphicon-arrow-right:before{content:"\e092"}
+.glyphicon-arrow-up:before{content:"\e093"}
+.glyphicon-arrow-down:before{content:"\e094"}
+.glyphicon-share-alt:before{content:"\e095"}
+.glyphicon-resize-full:before{content:"\e096"}
+.glyphicon-resize-small:before{content:"\e097"}
+.glyphicon-exclamation-sign:before{content:"\e101"}
+.glyphicon-gift:before{content:"\e102"}
+.glyphicon-leaf:before{content:"\e103"}
+.glyphicon-fire:before{content:"\e104"}
+.glyphicon-eye-open:before{content:"\e105"}
+.glyphicon-eye-close:before{content:"\e106"}
+.glyphicon-warning-sign:before{content:"\e107"}
+.glyphicon-plane:before{content:"\e108"}
+.glyphicon-calendar:before{content:"\e109"}
+.glyphicon-random:before{content:"\e110"}
+.glyphicon-comment:before{content:"\e111"}
+.glyphicon-magnet:before{content:"\e112"}
+.glyphicon-chevron-up:before{content:"\e113"}
+.glyphicon-chevron-down:before{content:"\e114"}
+.glyphicon-retweet:before{content:"\e115"}
+.glyphicon-shopping-cart:before{content:"\e116"}
+.glyphicon-folder-close:before{content:"\e117"}
+.glyphicon-folder-open:before{content:"\e118"}
+.glyphicon-resize-vertical:before{content:"\e119"}
+.glyphicon-resize-horizontal:before{content:"\e120"}
+.glyphicon-hdd:before{content:"\e121"}
+.glyphicon-bullhorn:before{content:"\e122"}
+.glyphicon-bell:before{content:"\e123"}
+.glyphicon-certificate:before{content:"\e124"}
+.glyphicon-thumbs-up:before{content:"\e125"}
+.glyphicon-thumbs-down:before{content:"\e126"}
+.glyphicon-hand-right:before{content:"\e127"}
+.glyphicon-hand-left:before{content:"\e128"}
+.glyphicon-hand-up:before{content:"\e129"}
+.glyphicon-hand-down:before{content:"\e130"}
+.glyphicon-circle-arrow-right:before{content:"\e131"}
+.glyphicon-circle-arrow-left:before{content:"\e132"}
+.glyphicon-circle-arrow-up:before{content:"\e133"}
+.glyphicon-circle-arrow-down:before{content:"\e134"}
+.glyphicon-globe:before{content:"\e135"}
+.glyphicon-wrench:before{content:"\e136"}
+.glyphicon-tasks:before{content:"\e137"}
+.glyphicon-filter:before{content:"\e138"}
+.glyphicon-briefcase:before{content:"\e139"}
+.glyphicon-fullscreen:before{content:"\e140"}
+.glyphicon-dashboard:before{content:"\e141"}
+.glyphicon-paperclip:before{content:"\e142"}
+.glyphicon-heart-empty:before{content:"\e143"}
+.glyphicon-link:before{content:"\e144"}
+.glyphicon-phone:before{content:"\e145"}
+.glyphicon-pushpin:before{content:"\e146"}
+.glyphicon-usd:before{content:"\e148"}
+.glyphicon-gbp:before{content:"\e149"}
+.glyphicon-sort:before{content:"\e150"}
+.glyphicon-sort-by-alphabet:before{content:"\e151"}
+.glyphicon-sort-by-alphabet-alt:before{content:"\e152"}
+.glyphicon-sort-by-order:before{content:"\e153"}
+.glyphicon-sort-by-order-alt:before{content:"\e154"}
+.glyphicon-sort-by-attributes:before{content:"\e155"}
+.glyphicon-sort-by-attributes-alt:before{content:"\e156"}
+.glyphicon-unchecked:before{content:"\e157"}
+.glyphicon-expand:before{content:"\e158"}
+.glyphicon-collapse-down:before{content:"\e159"}
+.glyphicon-collapse-up:before{content:"\e160"}
+.glyphicon-log-in:before{content:"\e161"}
+.glyphicon-flash:before{content:"\e162"}
+.glyphicon-log-out:before{content:"\e163"}
+.glyphicon-new-window:before{content:"\e164"}
+.glyphicon-record:before{content:"\e165"}
+.glyphicon-save:before{content:"\e166"}
+.glyphicon-open:before{content:"\e167"}
+.glyphicon-saved:before{content:"\e168"}
+.glyphicon-import:before{content:"\e169"}
+.glyphicon-export:before{content:"\e170"}
+.glyphicon-send:before{content:"\e171"}
+.glyphicon-floppy-disk:before{content:"\e172"}
+.glyphicon-floppy-saved:before{content:"\e173"}
+.glyphicon-floppy-remove:before{content:"\e174"}
+.glyphicon-floppy-save:before{content:"\e175"}
+.glyphicon-floppy-open:before{content:"\e176"}
+.glyphicon-credit-card:before{content:"\e177"}
+.glyphicon-transfer:before{content:"\e178"}
+.glyphicon-cutlery:before{content:"\e179"}
+.glyphicon-header:before{content:"\e180"}
+.glyphicon-compressed:before{content:"\e181"}
+.glyphicon-earphone:before{content:"\e182"}
+.glyphicon-phone-alt:before{content:"\e183"}
+.glyphicon-tower:before{content:"\e184"}
+.glyphicon-stats:before{content:"\e185"}
+.glyphicon-sd-video:before{content:"\e186"}
+.glyphicon-hd-video:before{content:"\e187"}
+.glyphicon-subtitles:before{content:"\e188"}
+.glyphicon-sound-stereo:before{content:"\e189"}
+.glyphicon-sound-dolby:before{content:"\e190"}
+.glyphicon-sound-5-1:before{content:"\e191"}
+.glyphicon-sound-6-1:before{content:"\e192"}
+.glyphicon-sound-7-1:before{content:"\e193"}
+.glyphicon-copyright-mark:before{content:"\e194"}
+.glyphicon-registration-mark:before{content:"\e195"}
+.glyphicon-cloud-download:before{content:"\e197"}
+.glyphicon-cloud-upload:before{content:"\e198"}
+.glyphicon-tree-conifer:before{content:"\e199"}
+.glyphicon-tree-deciduous:before{content:"\e200"}
+*{-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}
+:before,:after{-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}
+html{font-size:10px;-webkit-tap-highlight-color:rgba(0,0,0,0)}
+body{font-family:"Telex",sans-serif;font-size:14px;line-height:1.42857143;color:#555;background-color:#fff}
+input,button,select,textarea{font-family:inherit;font-size:inherit;line-height:inherit}
+a{color:#2fa4e7;text-decoration:none}
+a:hover,a:focus{color:#157ab5;text-decoration:underline}
+a:focus{outline:thin dotted;outline:5px auto -webkit-focus-ring-color;outline-offset:-2px}
+figure{margin:0}
+img{vertical-align:middle}
+.img-responsive,.thumbnail > img,.thumbnail a > img,.carousel-inner > .item > img,.carousel-inner > .item > a > img{display:block;width:100% \9;max-width:100%;height:auto}
+.img-rounded{border-radius:6px}
+.img-thumbnail{padding:4px;line-height:1.42857143;background-color:#fff;border:1px solid #ddd;border-radius:4px;-webkit-transition:all .2s ease-in-out;-o-transition:all .2s ease-in-out;transition:all .2s ease-in-out;display:inline-block;width:100% \9;max-width:100%;height:auto}
+.img-circle{border-radius:50%}
+hr{margin-top:20px;margin-bottom:20px;border:0;border-top:1px solid #eee}
+.sr-only{position:absolute;width:1px;height:1px;margin:-1px;padding:0;overflow:hidden;clip:rect(0,0,0,0);border:0}
+.sr-only-focusable:active,.sr-only-focusable:focus{position:static;width:auto;height:auto;margin:0;overflow:visible;clip:auto}
+h1,h2,h3,h4,h5,h6,.h1,.h2,.h3,.h4,.h5,.h6{font-family:"Telex",sans-serif;font-weight:bold;line-height:1.1;color:#317eac}
+h1 small,h2 small,h3 small,h4 small,h5 small,h6 small,.h1 small,.h2 small,.h3 small,.h4 small,.h5 small,.h6 small,h1 .small,h2 .small,h3 .small,h4 .small,h5 .small,h6 .small,.h1 .small,.h2 .small,.h3 .small,.h4 .small,.h5 .small,.h6 .small{font-weight:400;line-height:1;color:#999}
+h1,.h1,h2,.h2,h3,.h3{margin-top:20px;margin-bottom:10px}
+h1 small,.h1 small,h2 small,.h2 small,h3 small,.h3 small,h1 .small,.h1 .small,h2 .small,.h2 .small,h3 .small,.h3 .small{font-size:65%}
+h4,.h4,h5,.h5,h6,.h6{margin-top:10px;margin-bottom:10px}
+h4 small,.h4 small,h5 small,.h5 small,h6 small,.h6 small,h4 .small,.h4 .small,h5 .small,.h5 .small,h6 .small,.h6 .small{font-size:75%}
+h1,.h1{font-size:36px}
+h2,.h2{font-size:30px}
+h3,.h3{font-size:24px}
+h4,.h4{font-size:18px}
+h5,.h5{font-size:14px}
+h6,.h6{font-size:12px}
+p{margin:0 0 10px}
+.lead{margin-bottom:20px;font-size:16px;font-weight:300;line-height:1.4}
+ at media (min-width: 768px) {
+.lead{font-size:21px}
+}
+small,.small{font-size:85%}
+cite{font-style:normal}
+mark,.mark{background-color:#fcf8e3;padding:.2em}
+.text-left{text-align:left}
+.text-right{text-align:right}
+.text-center{text-align:center}
+.text-justify{text-align:justify}
+.text-nowrap{white-space:nowrap}
+.text-lowercase{text-transform:lowercase}
+.text-uppercase{text-transform:uppercase}
+.text-capitalize{text-transform:capitalize}
+.text-muted{color:#999}
+.text-primary{color:#2fa4e7}
+a.text-primary:hover{color:#178acc}
+.text-success{color:#468847}
+a.text-success:hover{color:#356635}
+.text-info{color:#3a87ad}
+a.text-info:hover{color:#2d6987}
+.text-warning{color:#c09853}
+a.text-warning:hover{color:#a47e3c}
+.text-danger{color:#b94a48}
+a.text-danger:hover{color:#953b39}
+.bg-primary{color:#fff;background-color:#2fa4e7}
+a.bg-primary:hover{background-color:#178acc}
+.bg-success{background-color:#dff0d8}
+a.bg-success:hover{background-color:#c1e2b3}
+.bg-info{background-color:#d9edf7}
+a.bg-info:hover{background-color:#afd9ee}
+.bg-warning{background-color:#fcf8e3}
+a.bg-warning:hover{background-color:#f7ecb5}
+.bg-danger{background-color:#f2dede}
+a.bg-danger:hover{background-color:#e4b9b9}
+.page-header{padding-bottom:9px;margin:40px 0 20px;border-bottom:1px solid #eee}
+ul,ol{margin-top:0;margin-bottom:10px}
+ul ul,ol ul,ul ol,ol ol{margin-bottom:0}
+.list-unstyled{padding-left:0;list-style:none}
+.list-inline{padding-left:0;list-style:none;margin-left:-5px}
+.list-inline > li{display:inline-block;padding-left:5px;padding-right:5px}
+dl{margin-top:0;margin-bottom:20px}
+dt,dd{line-height:1.42857143}
+dt{font-weight:700}
+dd{margin-left:0}
+ at media (min-width: 768px) {
+.dl-horizontal dt{float:left;width:160px;clear:left;text-align:right;overflow:hidden;text-overflow:ellipsis;white-space:nowrap}
+.dl-horizontal dd{margin-left:180px}
+}
+abbr[title],abbr[data-original-title]{cursor:help;border-bottom:1px dotted #999}
+.initialism{font-size:90%;text-transform:uppercase}
+blockquote{padding:10px 20px;margin:0 0 20px;font-size:17.5px;border-left:5px solid #eee}
+blockquote p:last-child,blockquote ul:last-child,blockquote ol:last-child{margin-bottom:0}
+blockquote footer,blockquote small,blockquote .small{display:block;font-size:80%;line-height:1.42857143;color:#999}
+blockquote footer:before,blockquote small:before,blockquote .small:before{content:'\2014 \00A0'}
+.blockquote-reverse,blockquote.pull-right{padding-right:15px;padding-left:0;border-right:5px solid #eee;border-left:0;text-align:right}
+.blockquote-reverse footer:before,blockquote.pull-right footer:before,.blockquote-reverse small:before,blockquote.pull-right small:before,.blockquote-reverse .small:before,blockquote.pull-right .small:before{content:''}
+.blockquote-reverse footer:after,blockquote.pull-right footer:after,.blockquote-reverse small:after,blockquote.pull-right small:after,.blockquote-reverse .small:after,blockquote.pull-right .small:after{content:'\00A0 \2014'}
+blockquote:before,blockquote:after{content:""}
+address{margin-bottom:20px;font-style:normal;line-height:1.42857143}
+code,kbd,pre,samp{font-family:Menlo,Monaco,Consolas,"Courier New",monospace}
+code{padding:2px 4px;font-size:90%;color:#c7254e;background-color:#f9f2f4;border-radius:4px}
+kbd{padding:2px 4px;font-size:90%;color:#fff;background-color:#333;border-radius:3px;box-shadow:inset 0 -1px 0 rgba(0,0,0,0.25)}
+kbd kbd{padding:0;font-size:100%;box-shadow:none}
+pre{display:block;padding:9.5px;margin:0 0 10px;font-size:13px;line-height:1.42857143;word-break:break-all;word-wrap:break-word;color:#333;background-color:#f5f5f5;border:1px solid #ccc;border-radius:4px}
+pre code{padding:0;font-size:inherit;color:inherit;white-space:pre-wrap;background-color:transparent;border-radius:0}
+.pre-scrollable{max-height:340px;overflow-y:scroll}
+.container{margin-right:auto;margin-left:auto;padding-left:15px;padding-right:15px}
+ at media (min-width: 768px) {
+.container{width:750px}
+}
+ at media (min-width: 992px) {
+.container{width:970px}
+}
+ at media (min-width: 1200px) {
+.container{width:1170px}
+}
+.container-fluid{margin-right:auto;margin-left:auto;padding-left:15px;padding-right:15px}
+.row{margin-left:-15px;margin-right:-15px}
+.col-xs-1,.col-sm-1,.col-md-1,.col-lg-1,.col-xs-2,.col-sm-2,.col-md-2,.col-lg-2,.col-xs-3,.col-sm-3,.col-md-3,.col-lg-3,.col-xs-4,.col-sm-4,.col-md-4,.col-lg-4,.col-xs-5,.col-sm-5,.col-md-5,.col-lg-5,.col-xs-6,.col-sm-6,.col-md-6,.col-lg-6,.col-xs-7,.col-sm-7,.col-md-7,.col-lg-7,.col-xs-8,.col-sm-8,.col-md-8,.col-lg-8,.col-xs-9,.col-sm-9,.col-md-9,.col-lg-9,.col-xs-10,.col-sm-10,.col-md-10,.col-lg-10,.col-xs-11,.col-sm-11,.col-md-11,.col-lg-11,.col-xs-12,.col-sm-12,.col-md-12,.col-lg-12{position:relative;min-height:1px;padding-left:15px;padding-right:15px}
+.col-xs-1,.col-xs-2,.col-xs-3,.col-xs-4,.col-xs-5,.col-xs-6,.col-xs-7,.col-xs-8,.col-xs-9,.col-xs-10,.col-xs-11,.col-xs-12{float:left}
+.col-xs-12{width:100%}
+.col-xs-11{width:91.66666667%}
+.col-xs-10{width:83.33333333%}
+.col-xs-9{width:75%}
+.col-xs-8{width:66.66666667%}
+.col-xs-7{width:58.33333333%}
+.col-xs-6{width:50%}
+.col-xs-5{width:41.66666667%}
+.col-xs-4{width:33.33333333%}
+.col-xs-3{width:25%}
+.col-xs-2{width:16.66666667%}
+.col-xs-1{width:8.33333333%}
+.col-xs-pull-12{right:100%}
+.col-xs-pull-11{right:91.66666667%}
+.col-xs-pull-10{right:83.33333333%}
+.col-xs-pull-9{right:75%}
+.col-xs-pull-8{right:66.66666667%}
+.col-xs-pull-7{right:58.33333333%}
+.col-xs-pull-6{right:50%}
+.col-xs-pull-5{right:41.66666667%}
+.col-xs-pull-4{right:33.33333333%}
+.col-xs-pull-3{right:25%}
+.col-xs-pull-2{right:16.66666667%}
+.col-xs-pull-1{right:8.33333333%}
+.col-xs-pull-0{right:auto}
+.col-xs-push-12{left:100%}
+.col-xs-push-11{left:91.66666667%}
+.col-xs-push-10{left:83.33333333%}
+.col-xs-push-9{left:75%}
+.col-xs-push-8{left:66.66666667%}
+.col-xs-push-7{left:58.33333333%}
+.col-xs-push-6{left:50%}
+.col-xs-push-5{left:41.66666667%}
+.col-xs-push-4{left:33.33333333%}
+.col-xs-push-3{left:25%}
+.col-xs-push-2{left:16.66666667%}
+.col-xs-push-1{left:8.33333333%}
+.col-xs-push-0{left:auto}
+.col-xs-offset-12{margin-left:100%}
+.col-xs-offset-11{margin-left:91.66666667%}
+.col-xs-offset-10{margin-left:83.33333333%}
+.col-xs-offset-9{margin-left:75%}
+.col-xs-offset-8{margin-left:66.66666667%}
+.col-xs-offset-7{margin-left:58.33333333%}
+.col-xs-offset-6{margin-left:50%}
+.col-xs-offset-5{margin-left:41.66666667%}
+.col-xs-offset-4{margin-left:33.33333333%}
+.col-xs-offset-3{margin-left:25%}
+.col-xs-offset-2{margin-left:16.66666667%}
+.col-xs-offset-1{margin-left:8.33333333%}
+.col-xs-offset-0{margin-left:0}
+ at media (min-width: 768px) {
+.col-sm-1,.col-sm-2,.col-sm-3,.col-sm-4,.col-sm-5,.col-sm-6,.col-sm-7,.col-sm-8,.col-sm-9,.col-sm-10,.col-sm-11,.col-sm-12{float:left}
+.col-sm-12{width:100%}
+.col-sm-11{width:91.66666667%}
+.col-sm-10{width:83.33333333%}
+.col-sm-9{width:75%}
+.col-sm-8{width:66.66666667%}
+.col-sm-7{width:58.33333333%}
+.col-sm-6{width:50%}
+.col-sm-5{width:41.66666667%}
+.col-sm-4{width:33.33333333%}
+.col-sm-3{width:25%}
+.col-sm-2{width:16.66666667%}
+.col-sm-1{width:8.33333333%}
+.col-sm-pull-12{right:100%}
+.col-sm-pull-11{right:91.66666667%}
+.col-sm-pull-10{right:83.33333333%}
+.col-sm-pull-9{right:75%}
+.col-sm-pull-8{right:66.66666667%}
+.col-sm-pull-7{right:58.33333333%}
+.col-sm-pull-6{right:50%}
+.col-sm-pull-5{right:41.66666667%}
+.col-sm-pull-4{right:33.33333333%}
+.col-sm-pull-3{right:25%}
+.col-sm-pull-2{right:16.66666667%}
+.col-sm-pull-1{right:8.33333333%}
+.col-sm-pull-0{right:auto}
+.col-sm-push-12{left:100%}
+.col-sm-push-11{left:91.66666667%}
+.col-sm-push-10{left:83.33333333%}
+.col-sm-push-9{left:75%}
+.col-sm-push-8{left:66.66666667%}
+.col-sm-push-7{left:58.33333333%}
+.col-sm-push-6{left:50%}
+.col-sm-push-5{left:41.66666667%}
+.col-sm-push-4{left:33.33333333%}
+.col-sm-push-3{left:25%}
+.col-sm-push-2{left:16.66666667%}
+.col-sm-push-1{left:8.33333333%}
+.col-sm-push-0{left:auto}
+.col-sm-offset-12{margin-left:100%}
+.col-sm-offset-11{margin-left:91.66666667%}
+.col-sm-offset-10{margin-left:83.33333333%}
+.col-sm-offset-9{margin-left:75%}
+.col-sm-offset-8{margin-left:66.66666667%}
+.col-sm-offset-7{margin-left:58.33333333%}
+.col-sm-offset-6{margin-left:50%}
+.col-sm-offset-5{margin-left:41.66666667%}
+.col-sm-offset-4{margin-left:33.33333333%}
+.col-sm-offset-3{margin-left:25%}
+.col-sm-offset-2{margin-left:16.66666667%}
+.col-sm-offset-1{margin-left:8.33333333%}
+.col-sm-offset-0{margin-left:0}
+}
+ at media (min-width: 992px) {
+.col-md-1,.col-md-2,.col-md-3,.col-md-4,.col-md-5,.col-md-6,.col-md-7,.col-md-8,.col-md-9,.col-md-10,.col-md-11,.col-md-12{float:left}
+.col-md-12{width:100%}
+.col-md-11{width:91.66666667%}
+.col-md-10{width:83.33333333%}
+.col-md-9{width:75%}
+.col-md-8{width:66.66666667%}
+.col-md-7{width:58.33333333%}
+.col-md-6{width:50%}
+.col-md-5{width:41.66666667%}
+.col-md-4{width:33.33333333%}
+.col-md-3{width:25%}
+.col-md-2{width:16.66666667%}
+.col-md-1{width:8.33333333%}
+.col-md-pull-12{right:100%}
+.col-md-pull-11{right:91.66666667%}
+.col-md-pull-10{right:83.33333333%}
+.col-md-pull-9{right:75%}
+.col-md-pull-8{right:66.66666667%}
+.col-md-pull-7{right:58.33333333%}
+.col-md-pull-6{right:50%}
+.col-md-pull-5{right:41.66666667%}
+.col-md-pull-4{right:33.33333333%}
+.col-md-pull-3{right:25%}
+.col-md-pull-2{right:16.66666667%}
+.col-md-pull-1{right:8.33333333%}
+.col-md-pull-0{right:auto}
+.col-md-push-12{left:100%}
+.col-md-push-11{left:91.66666667%}
+.col-md-push-10{left:83.33333333%}
+.col-md-push-9{left:75%}
+.col-md-push-8{left:66.66666667%}
+.col-md-push-7{left:58.33333333%}
+.col-md-push-6{left:50%}
+.col-md-push-5{left:41.66666667%}
+.col-md-push-4{left:33.33333333%}
+.col-md-push-3{left:25%}
+.col-md-push-2{left:16.66666667%}
+.col-md-push-1{left:8.33333333%}
+.col-md-push-0{left:auto}
+.col-md-offset-12{margin-left:100%}
+.col-md-offset-11{margin-left:91.66666667%}
+.col-md-offset-10{margin-left:83.33333333%}
+.col-md-offset-9{margin-left:75%}
+.col-md-offset-8{margin-left:66.66666667%}
+.col-md-offset-7{margin-left:58.33333333%}
+.col-md-offset-6{margin-left:50%}
+.col-md-offset-5{margin-left:41.66666667%}
+.col-md-offset-4{margin-left:33.33333333%}
+.col-md-offset-3{margin-left:25%}
+.col-md-offset-2{margin-left:16.66666667%}
+.col-md-offset-1{margin-left:8.33333333%}
+.col-md-offset-0{margin-left:0}
+}
+ at media (min-width: 1200px) {
+.col-lg-1,.col-lg-2,.col-lg-3,.col-lg-4,.col-lg-5,.col-lg-6,.col-lg-7,.col-lg-8,.col-lg-9,.col-lg-10,.col-lg-11,.col-lg-12{float:left}
+.col-lg-12{width:100%}
+.col-lg-11{width:91.66666667%}
+.col-lg-10{width:83.33333333%}
+.col-lg-9{width:75%}
+.col-lg-8{width:66.66666667%}
+.col-lg-7{width:58.33333333%}
+.col-lg-6{width:50%}
+.col-lg-5{width:41.66666667%}
+.col-lg-4{width:33.33333333%}
+.col-lg-3{width:25%}
+.col-lg-2{width:16.66666667%}
+.col-lg-1{width:8.33333333%}
+.col-lg-pull-12{right:100%}
+.col-lg-pull-11{right:91.66666667%}
+.col-lg-pull-10{right:83.33333333%}
+.col-lg-pull-9{right:75%}
+.col-lg-pull-8{right:66.66666667%}
+.col-lg-pull-7{right:58.33333333%}
+.col-lg-pull-6{right:50%}
+.col-lg-pull-5{right:41.66666667%}
+.col-lg-pull-4{right:33.33333333%}
+.col-lg-pull-3{right:25%}
+.col-lg-pull-2{right:16.66666667%}
+.col-lg-pull-1{right:8.33333333%}
+.col-lg-pull-0{right:auto}
+.col-lg-push-12{left:100%}
+.col-lg-push-11{left:91.66666667%}
+.col-lg-push-10{left:83.33333333%}
+.col-lg-push-9{left:75%}
+.col-lg-push-8{left:66.66666667%}
+.col-lg-push-7{left:58.33333333%}
+.col-lg-push-6{left:50%}
+.col-lg-push-5{left:41.66666667%}
+.col-lg-push-4{left:33.33333333%}
+.col-lg-push-3{left:25%}
+.col-lg-push-2{left:16.66666667%}
+.col-lg-push-1{left:8.33333333%}
+.col-lg-push-0{left:auto}
+.col-lg-offset-12{margin-left:100%}
+.col-lg-offset-11{margin-left:91.66666667%}
+.col-lg-offset-10{margin-left:83.33333333%}
+.col-lg-offset-9{margin-left:75%}
+.col-lg-offset-8{margin-left:66.66666667%}
+.col-lg-offset-7{margin-left:58.33333333%}
+.col-lg-offset-6{margin-left:50%}
+.col-lg-offset-5{margin-left:41.66666667%}
+.col-lg-offset-4{margin-left:33.33333333%}
+.col-lg-offset-3{margin-left:25%}
+.col-lg-offset-2{margin-left:16.66666667%}
+.col-lg-offset-1{margin-left:8.33333333%}
+.col-lg-offset-0{margin-left:0}
+}
+table{background-color:transparent}
+th{text-align:left}
+.table{width:100%;max-width:100%;margin-bottom:20px}
+.table > thead > tr > th,.table > tbody > tr > th,.table > tfoot > tr > th,.table > thead > tr > td,.table > tbody > tr > td,.table > tfoot > tr > td{padding:8px;line-height:1.42857143;vertical-align:top;border-top:1px solid #ddd}
+.table > thead > tr > th{vertical-align:bottom;border-bottom:2px solid #ddd}
+.table > caption + thead > tr:first-child > th,.table > colgroup + thead > tr:first-child > th,.table > thead:first-child > tr:first-child > th,.table > caption + thead > tr:first-child > td,.table > colgroup + thead > tr:first-child > td,.table > thead:first-child > tr:first-child > td{border-top:0}
+.table > tbody + tbody{border-top:2px solid #ddd}
+.table .table{background-color:#fff}
+.table-condensed > thead > tr > th,.table-condensed > tbody > tr > th,.table-condensed > tfoot > tr > th,.table-condensed > thead > tr > td,.table-condensed > tbody > tr > td,.table-condensed > tfoot > tr > td{padding:5px}
+.table-bordered{border:1px solid #ddd}
+.table-bordered > thead > tr > th,.table-bordered > tbody > tr > th,.table-bordered > tfoot > tr > th,.table-bordered > thead > tr > td,.table-bordered > tbody > tr > td,.table-bordered > tfoot > tr > td{border:1px solid #ddd}
+.table-bordered > thead > tr > th,.table-bordered > thead > tr > td{border-bottom-width:2px}
+.table-striped > tbody > tr:nth-child(odd) > td,.table-striped > tbody > tr:nth-child(odd) > th{background-color:#f9f9f9}
+.table-hover > tbody > tr:hover > td,.table-hover > tbody > tr:hover > th{background-color:#f5f5f5}
+table col[class*="col-"]{position:static;float:none;display:table-column}
+table td[class*="col-"],table th[class*="col-"]{position:static;float:none;display:table-cell}
+.table > thead > tr > td.active,.table > tbody > tr > td.active,.table > tfoot > tr > td.active,.table > thead > tr > th.active,.table > tbody > tr > th.active,.table > tfoot > tr > th.active,.table > thead > tr.active > td,.table > tbody > tr.active > td,.table > tfoot > tr.active > td,.table > thead > tr.active > th,.table > tbody > tr.active > th,.table > tfoot > tr.active > th{background-color:#f5f5f5}
+.table-hover > tbody > tr > td.active:hover,.table-hover > tbody > tr > th.active:hover,.table-hover > tbody > tr.active:hover > td,.table-hover > tbody > tr:hover > .active,.table-hover > tbody > tr.active:hover > th{background-color:#e8e8e8}
+.table > thead > tr > td.success,.table > tbody > tr > td.success,.table > tfoot > tr > td.success,.table > thead > tr > th.success,.table > tbody > tr > th.success,.table > tfoot > tr > th.success,.table > thead > tr.success > td,.table > tbody > tr.success > td,.table > tfoot > tr.success > td,.table > thead > tr.success > th,.table > tbody > tr.success > th,.table > tfoot > tr.success > th{background-color:#dff0d8}
+.table-hover > tbody > tr > td.success:hover,.table-hover > tbody > tr > th.success:hover,.table-hover > tbody > tr.success:hover > td,.table-hover > tbody > tr:hover > .success,.table-hover > tbody > tr.success:hover > th{background-color:#d0e9c6}
+.table > thead > tr > td.info,.table > tbody > tr > td.info,.table > tfoot > tr > td.info,.table > thead > tr > th.info,.table > tbody > tr > th.info,.table > tfoot > tr > th.info,.table > thead > tr.info > td,.table > tbody > tr.info > td,.table > tfoot > tr.info > td,.table > thead > tr.info > th,.table > tbody > tr.info > th,.table > tfoot > tr.info > th{background-color:#d9edf7}
+.table-hover > tbody > tr > td.info:hover,.table-hover > tbody > tr > th.info:hover,.table-hover > tbody > tr.info:hover > td,.table-hover > tbody > tr:hover > .info,.table-hover > tbody > tr.info:hover > th{background-color:#c4e3f3}
+.table > thead > tr > td.warning,.table > tbody > tr > td.warning,.table > tfoot > tr > td.warning,.table > thead > tr > th.warning,.table > tbody > tr > th.warning,.table > tfoot > tr > th.warning,.table > thead > tr.warning > td,.table > tbody > tr.warning > td,.table > tfoot > tr.warning > td,.table > thead > tr.warning > th,.table > tbody > tr.warning > th,.table > tfoot > tr.warning > th{background-color:#fcf8e3}
+.table-hover > tbody > tr > td.warning:hover,.table-hover > tbody > tr > th.warning:hover,.table-hover > tbody > tr.warning:hover > td,.table-hover > tbody > tr:hover > .warning,.table-hover > tbody > tr.warning:hover > th{background-color:#faf2cc}
+.table > thead > tr > td.danger,.table > tbody > tr > td.danger,.table > tfoot > tr > td.danger,.table > thead > tr > th.danger,.table > tbody > tr > th.danger,.table > tfoot > tr > th.danger,.table > thead > tr.danger > td,.table > tbody > tr.danger > td,.table > tfoot > tr.danger > td,.table > thead > tr.danger > th,.table > tbody > tr.danger > th,.table > tfoot > tr.danger > th{background-color:#f2dede}
+.table-hover > tbody > tr > td.danger:hover,.table-hover > tbody > tr > th.danger:hover,.table-hover > tbody > tr.danger:hover > td,.table-hover > tbody > tr:hover > .danger,.table-hover > tbody > tr.danger:hover > th{background-color:#ebcccc}
+ at media screen and (max-width: 767px) {
+.table-responsive{width:100%;margin-bottom:15px;overflow-y:hidden;overflow-x:auto;-ms-overflow-style:-ms-autohiding-scrollbar;border:1px solid #ddd;-webkit-overflow-scrolling:touch}
+.table-responsive > .table{margin-bottom:0}
+.table-responsive > .table > thead > tr > th,.table-responsive > .table > tbody > tr > th,.table-responsive > .table > tfoot > tr > th,.table-responsive > .table > thead > tr > td,.table-responsive > .table > tbody > tr > td,.table-responsive > .table > tfoot > tr > td{white-space:nowrap}
+.table-responsive > .table-bordered{border:0}
+.table-responsive > .table-bordered > thead > tr > th:first-child,.table-responsive > .table-bordered > tbody > tr > th:first-child,.table-responsive > .table-bordered > tfoot > tr > th:first-child,.table-responsive > .table-bordered > thead > tr > td:first-child,.table-responsive > .table-bordered > tbody > tr > td:first-child,.table-responsive > .table-bordered > tfoot > tr > td:first-child{border-left:0}
+.table-responsive > .table-bordered > thead > tr > th:last-child,.table-responsive > .table-bordered > tbody > tr > th:last-child,.table-responsive > .table-bordered > tfoot > tr > th:last-child,.table-responsive > .table-bordered > thead > tr > td:last-child,.table-responsive > .table-bordered > tbody > tr > td:last-child,.table-responsive > .table-bordered > tfoot > tr > td:last-child{border-right:0}
+.table-responsive > .table-bordered > tbody > tr:last-child > th,.table-responsive > .table-bordered > tfoot > tr:last-child > th,.table-responsive > .table-bordered > tbody > tr:last-child > td,.table-responsive > .table-bordered > tfoot > tr:last-child > td{border-bottom:0}
+}
+fieldset{padding:0;margin:0;border:0;min-width:0}
+legend{display:block;width:100%;padding:0;margin-bottom:20px;font-size:21px;line-height:inherit;color:#555;border:0;border-bottom:1px solid #e5e5e5}
+label{display:inline-block;max-width:100%;margin-bottom:5px;font-weight:700}
+input[type="search"]{-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}
+input[type="radio"],input[type="checkbox"]{margin:4px 0 0;margin-top:1px \9;line-height:normal}
+input[type="file"]{display:block}
+input[type="range"]{display:block;width:100%}
+select[multiple],select[size]{height:auto}
+input[type="file"]:focus,input[type="radio"]:focus,input[type="checkbox"]:focus{outline:thin dotted;outline:5px auto -webkit-focus-ring-color;outline-offset:-2px}
+output{display:block;padding-top:9px;font-size:14px;line-height:1.42857143;color:#555}
+.form-control{display:block;width:100%;height:38px;padding:8px 12px;font-size:14px;line-height:1.42857143;color:#555;background-color:#fff;background-image:none;border:1px solid #ccc;border-radius:4px;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075);box-shadow:inset 0 1px 1px rgba(0,0,0,0.075);-webkit-transition:border-color ease-in-out .15s,box-shadow ease-in-out .15s;-o-transition:border-color ease-in-out .15s,box-shadow ease-in-out .15s;transition:border-color ease-in-out .15s,box-shadow ease-in-out .15s}
+.form-control:focus{border-color:#66afe9;outline:0;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,0.6);box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,0.6)}
+.form-control::-moz-placeholder{color:#999;opacity:1}
+.form-control:-ms-input-placeholder{color:#999}
+.form-control::-webkit-input-placeholder{color:#999}
+.form-control[disabled],.form-control[readonly],fieldset[disabled] .form-control{cursor:not-allowed;background-color:#eee;opacity:1}
+textarea.form-control{height:auto}
+input[type="search"]{-webkit-appearance:none}
+input[type="date"],input[type="time"],input[type="datetime-local"],input[type="month"]{line-height:38px;line-height:1.42857143 \0}
+input[type="date"].input-sm,input[type="time"].input-sm,input[type="datetime-local"].input-sm,input[type="month"].input-sm{line-height:30px}
+input[type="date"].input-lg,input[type="time"].input-lg,input[type="datetime-local"].input-lg,input[type="month"].input-lg{line-height:54px}
+.form-group{margin-bottom:15px}
+.radio,.checkbox{position:relative;display:block;min-height:20px;margin-top:10px;margin-bottom:10px}
+.radio label,.checkbox label{padding-left:20px;margin-bottom:0;font-weight:400;cursor:pointer}
+.radio input[type="radio"],.radio-inline input[type="radio"],.checkbox input[type="checkbox"],.checkbox-inline input[type="checkbox"]{position:absolute;margin-left:-20px;margin-top:4px \9}
+.radio + .radio,.checkbox + .checkbox{margin-top:-5px}
+.radio-inline,.checkbox-inline{display:inline-block;padding-left:20px;margin-bottom:0;vertical-align:middle;font-weight:400;cursor:pointer}
+.radio-inline + .radio-inline,.checkbox-inline + .checkbox-inline{margin-top:0;margin-left:10px}
+input[type="radio"][disabled],input[type="checkbox"][disabled],input[type="radio"].disabled,input[type="checkbox"].disabled,fieldset[disabled] input[type="radio"],fieldset[disabled] input[type="checkbox"]{cursor:not-allowed}
+.radio-inline.disabled,.checkbox-inline.disabled,fieldset[disabled] .radio-inline,fieldset[disabled] .checkbox-inline{cursor:not-allowed}
+.radio.disabled label,.checkbox.disabled label,fieldset[disabled] .radio label,fieldset[disabled] .checkbox label{cursor:not-allowed}
+.form-control-static{padding-top:9px;padding-bottom:9px;margin-bottom:0}
+.form-control-static.input-lg,.form-control-static.input-sm{padding-left:0;padding-right:0}
+.input-sm,.form-horizontal .form-group-sm .form-control{height:30px;padding:5px 10px;font-size:12px;line-height:1.5;border-radius:3px}
+select.input-sm{height:30px;line-height:30px}
+textarea.input-sm,select[multiple].input-sm{height:auto}
+.input-lg,.form-horizontal .form-group-lg .form-control{height:54px;padding:14px 16px;font-size:18px;line-height:1.33;border-radius:6px}
+select.input-lg{height:54px;line-height:54px}
+textarea.input-lg,select[multiple].input-lg{height:auto}
+.has-feedback{position:relative}
+.has-feedback .form-control{padding-right:47.5px}
+.form-control-feedback{position:absolute;top:25px;right:0;z-index:2;display:block;width:38px;height:38px;line-height:38px;text-align:center}
+.input-lg + .form-control-feedback{width:54px;height:54px;line-height:54px}
+.input-sm + .form-control-feedback{width:30px;height:30px;line-height:30px}
+.has-success .help-block,.has-success .control-label,.has-success .radio,.has-success .checkbox,.has-success .radio-inline,.has-success .checkbox-inline{color:#468847}
+.has-success .form-control{border-color:#468847;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075);box-shadow:inset 0 1px 1px rgba(0,0,0,0.075)}
+.has-success .form-control:focus{border-color:#356635;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075),0 0 6px #7aba7b;box-shadow:inset 0 1px 1px rgba(0,0,0,0.075),0 0 6px #7aba7b}
+.has-success .input-group-addon{color:#468847;border-color:#468847;background-color:#dff0d8}
+.has-success .form-control-feedback{color:#468847}
+.has-warning .help-block,.has-warning .control-label,.has-warning .radio,.has-warning .checkbox,.has-warning .radio-inline,.has-warning .checkbox-inline{color:#c09853}
+.has-warning .form-control{border-color:#c09853;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075);box-shadow:inset 0 1px 1px rgba(0,0,0,0.075)}
+.has-warning .form-control:focus{border-color:#a47e3c;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075),0 0 6px #dbc59e;box-shadow:inset 0 1px 1px rgba(0,0,0,0.075),0 0 6px #dbc59e}
+.has-warning .input-group-addon{color:#c09853;border-color:#c09853;background-color:#fcf8e3}
+.has-warning .form-control-feedback{color:#c09853}
+.has-error .help-block,.has-error .control-label,.has-error .radio,.has-error .checkbox,.has-error .radio-inline,.has-error .checkbox-inline{color:#b94a48}
+.has-error .form-control{border-color:#b94a48;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075);box-shadow:inset 0 1px 1px rgba(0,0,0,0.075)}
+.has-error .form-control:focus{border-color:#953b39;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,0.075),0 0 6px #d59392;box-shadow:inset 0 1px 1px rgba(0,0,0,0.075),0 0 6px #d59392}
+.has-error .input-group-addon{color:#b94a48;border-color:#b94a48;background-color:#f2dede}
+.has-error .form-control-feedback{color:#b94a48}
+.has-feedback label.sr-only ~ .form-control-feedback{top:0}
+.help-block{display:block;margin-top:5px;margin-bottom:10px;color:#959595}
+ at media (min-width: 768px) {
+.form-inline .form-group{display:inline-block;margin-bottom:0;vertical-align:middle}
+.form-inline .form-control{display:inline-block;width:auto;vertical-align:middle}
+.form-inline .input-group{display:inline-table;vertical-align:middle}
+.form-inline .input-group .input-group-addon,.form-inline .input-group .input-group-btn,.form-inline .input-group .form-control{width:auto}
+.form-inline .input-group > .form-control{width:100%}
+.form-inline .control-label{margin-bottom:0;vertical-align:middle}
+.form-inline .radio,.form-inline .checkbox{display:inline-block;margin-top:0;margin-bottom:0;vertical-align:middle}
+.form-inline .radio label,.form-inline .checkbox label{padding-left:0}
+.form-inline .radio input[type="radio"],.form-inline .checkbox input[type="checkbox"]{position:relative;margin-left:0}
+.form-inline .has-feedback .form-control-feedback{top:0}
+}
+.form-horizontal .radio,.form-horizontal .checkbox,.form-horizontal .radio-inline,.form-horizontal .checkbox-inline{margin-top:0;margin-bottom:0;padding-top:9px}
+.form-horizontal .radio,.form-horizontal .checkbox{min-height:29px}
+.form-horizontal .form-group{margin-left:-15px;margin-right:-15px}
+ at media (min-width: 768px) {
+.form-horizontal .control-label{text-align:right;margin-bottom:0;padding-top:9px}
+}
+.form-horizontal .has-feedback .form-control-feedback{top:0;right:15px}
+ at media (min-width: 768px) {
+.form-horizontal .form-group-lg .control-label{padding-top:19.62px}
+}
+ at media (min-width: 768px) {
+.form-horizontal .form-group-sm .control-label{padding-top:6px}
+}
+.btn{display:inline-block;margin-bottom:0;font-weight:400;text-align:center;vertical-align:middle;cursor:pointer;background-image:none;border:1px solid transparent;white-space:nowrap;padding:8px 12px;font-size:14px;line-height:1.42857143;border-radius:4px;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none}
+.btn:focus,.btn:active:focus,.btn.active:focus{outline:thin dotted;outline:5px auto -webkit-focus-ring-color;outline-offset:-2px}
+.btn:hover,.btn:focus{color:#555;text-decoration:none}
+.btn:active,.btn.active{outline:0;background-image:none;-webkit-box-shadow:inset 0 3px 5px rgba(0,0,0,0.125);box-shadow:inset 0 3px 5px rgba(0,0,0,0.125)}
+.btn.disabled,.btn[disabled],fieldset[disabled] .btn{cursor:not-allowed;pointer-events:none;opacity:.65;filter:alpha(opacity=65);-webkit-box-shadow:none;box-shadow:none}
+.btn-default{color:#555;background-color:#fff;border-color:rgba(0,0,0,0.1)}
+.btn-default:hover,.btn-default:focus,.btn-default:active,.btn-default.active,.open > .dropdown-toggle.btn-default{color:#555;background-color:#e6e6e6;border-color:rgba(0,0,0,0.1)}
+.btn-default:active,.btn-default.active,.open > .dropdown-toggle.btn-default{background-image:none}
+.btn-default.disabled,.btn-default[disabled],fieldset[disabled] .btn-default,.btn-default.disabled:hover,.btn-default[disabled]:hover,fieldset[disabled] .btn-default:hover,.btn-default.disabled:focus,.btn-default[disabled]:focus,fieldset[disabled] .btn-default:focus,.btn-default.disabled:active,.btn-default[disabled]:active,fieldset[disabled] .btn-default:active,.btn-default.disabled.active,.btn-default[disabled].active,fieldset[disabled] .btn-default.active{background-color:#fff;border-color:rgba(0,0,0,0.1)}
+.btn-default .badge{color:#fff;background-color:#555}
+.btn-primary{color:#fff;background-color:#2fa4e7;border-color:#2fa4e7}
+.btn-primary:hover,.btn-primary:focus,.btn-primary:active,.btn-primary.active,.open > .dropdown-toggle.btn-primary{color:#fff;background-color:#178acc;border-color:#1684c2}
+.btn-primary:active,.btn-primary.active,.open > .dropdown-toggle.btn-primary{background-image:none}
+.btn-primary.disabled,.btn-primary[disabled],fieldset[disabled] .btn-primary,.btn-primary.disabled:hover,.btn-primary[disabled]:hover,fieldset[disabled] .btn-primary:hover,.btn-primary.disabled:focus,.btn-primary[disabled]:focus,fieldset[disabled] .btn-primary:focus,.btn-primary.disabled:active,.btn-primary[disabled]:active,fieldset[disabled] .btn-primary:active,.btn-primary.disabled.active,.btn-primary[disabled].active,fieldset[disabled] .btn-primary.active{background-color:#2fa4e7;border-color:#2fa4e7}
+.btn-primary .badge{color:#2fa4e7;background-color:#fff}
+.btn-success{color:#fff;background-color:#73a839;border-color:#73a839}
+.btn-success:hover,.btn-success:focus,.btn-success:active,.btn-success.active,.open > .dropdown-toggle.btn-success{color:#fff;background-color:#59822c;border-color:#547a29}
+.btn-success:active,.btn-success.active,.open > .dropdown-toggle.btn-success{background-image:none}
+.btn-success.disabled,.btn-success[disabled],fieldset[disabled] .btn-success,.btn-success.disabled:hover,.btn-success[disabled]:hover,fieldset[disabled] .btn-success:hover,.btn-success.disabled:focus,.btn-success[disabled]:focus,fieldset[disabled] .btn-success:focus,.btn-success.disabled:active,.btn-success[disabled]:active,fieldset[disabled] .btn-success:active,.btn-success.disabled.active,.btn-success[disabled].active,fieldset[disabled] .btn-success.active{background-color:#73a839;border-color:#73a839}
+.btn-success .badge{color:#73a839;background-color:#fff}
+.btn-info{color:#fff;background-color:#033c73;border-color:#033c73}
+.btn-info:hover,.btn-info:focus,.btn-info:active,.btn-info.active,.open > .dropdown-toggle.btn-info{color:#fff;background-color:#022241;border-color:#011d37}
+.btn-info:active,.btn-info.active,.open > .dropdown-toggle.btn-info{background-image:none}
+.btn-info.disabled,.btn-info[disabled],fieldset[disabled] .btn-info,.btn-info.disabled:hover,.btn-info[disabled]:hover,fieldset[disabled] .btn-info:hover,.btn-info.disabled:focus,.btn-info[disabled]:focus,fieldset[disabled] .btn-info:focus,.btn-info.disabled:active,.btn-info[disabled]:active,fieldset[disabled] .btn-info:active,.btn-info.disabled.active,.btn-info[disabled].active,fieldset[disabled] .btn-info.active{background-color:#033c73;border-color:#033c73}
+.btn-info .badge{color:#033c73;background-color:#fff}
+.btn-warning{color:#fff;background-color:#dd5600;border-color:#dd5600}
+.btn-warning:hover,.btn-warning:focus,.btn-warning:active,.btn-warning.active,.open > .dropdown-toggle.btn-warning{color:#fff;background-color:#aa4200;border-color:#a03e00}
+.btn-warning:active,.btn-warning.active,.open > .dropdown-toggle.btn-warning{background-image:none}
+.btn-warning.disabled,.btn-warning[disabled],fieldset[disabled] .btn-warning,.btn-warning.disabled:hover,.btn-warning[disabled]:hover,fieldset[disabled] .btn-warning:hover,.btn-warning.disabled:focus,.btn-warning[disabled]:focus,fieldset[disabled] .btn-warning:focus,.btn-warning.disabled:active,.btn-warning[disabled]:active,fieldset[disabled] .btn-warning:active,.btn-warning.disabled.active,.btn-warning[disabled].active,fieldset[disabled] .btn-warning.active{background-color:#dd5600;border-color:#dd5600}
+.btn-warning .badge{color:#dd5600;background-color:#fff}
+.btn-danger{color:#fff;background-color:#c71c22;border-color:#c71c22}
+.btn-danger:hover,.btn-danger:focus,.btn-danger:active,.btn-danger.active,.open > .dropdown-toggle.btn-danger{color:#fff;background-color:#9a161a;border-color:#911419}
+.btn-danger:active,.btn-danger.active,.open > .dropdown-toggle.btn-danger{background-image:none}
+.btn-danger.disabled,.btn-danger[disabled],fieldset[disabled] .btn-danger,.btn-danger.disabled:hover,.btn-danger[disabled]:hover,fieldset[disabled] .btn-danger:hover,.btn-danger.disabled:focus,.btn-danger[disabled]:focus,fieldset[disabled] .btn-danger:focus,.btn-danger.disabled:active,.btn-danger[disabled]:active,fieldset[disabled] .btn-danger:active,.btn-danger.disabled.active,.btn-danger[disabled].active,fieldset[disabled] .btn-danger.active{background-color:#c71c22;border-color:#c71c22}
+.btn-danger .badge{color:#c71c22;background-color:#fff}
+.btn-link{color:#2fa4e7;font-weight:400;cursor:pointer;border-radius:0}
+.btn-link,.btn-link:active,.btn-link[disabled],fieldset[disabled] .btn-link{background-color:transparent;-webkit-box-shadow:none;box-shadow:none}
+.btn-link,.btn-link:hover,.btn-link:focus,.btn-link:active{border-color:transparent}
+.btn-link:hover,.btn-link:focus{color:#157ab5;text-decoration:underline;background-color:transparent}
+.btn-link[disabled]:hover,fieldset[disabled] .btn-link:hover,.btn-link[disabled]:focus,fieldset[disabled] .btn-link:focus{color:#999;text-decoration:none}
+.btn-lg,.btn-group-lg > .btn{padding:14px 16px;font-size:18px;line-height:1.33;border-radius:6px}
+.btn-sm,.btn-group-sm > .btn{padding:5px 10px;font-size:12px;line-height:1.5;border-radius:3px}
+.btn-xs,.btn-group-xs > .btn{padding:1px 5px;font-size:12px;line-height:1.5;border-radius:3px}
+.btn-block{display:block;width:100%}
+.btn-block + .btn-block{margin-top:5px}
+input[type="submit"].btn-block,input[type="reset"].btn-block,input[type="button"].btn-block{width:100%}
+.fade{opacity:0;-webkit-transition:opacity .15s linear;-o-transition:opacity .15s linear;transition:opacity .15s linear}
+.fade.in{opacity:1}
+.collapse{display:none}
+.collapse.in{display:block}
+tr.collapse.in{display:table-row}
+tbody.collapse.in{display:table-row-group}
+.collapsing{position:relative;height:0;overflow:hidden;-webkit-transition:height .35s ease;-o-transition:height .35s ease;transition:height .35s ease}
+.caret{display:inline-block;width:0;height:0;margin-left:2px;vertical-align:middle;border-top:4px solid;border-right:4px solid transparent;border-left:4px solid transparent}
+.dropdown{position:relative}
+.dropdown-toggle:focus{outline:0}
+.dropdown-menu{position:absolute;top:100%;left:0;z-index:1000;display:none;float:left;min-width:160px;padding:5px 0;margin:2px 0 0;list-style:none;font-size:14px;text-align:left;background-color:#fff;border:1px solid #ccc;border:1px solid rgba(0,0,0,0.15);border-radius:4px;-webkit-box-shadow:0 6px 12px rgba(0,0,0,0.175);box-shadow:0 6px 12px rgba(0,0,0,0.175);background-clip:padding-box}
+.dropdown-menu.pull-right{right:0;left:auto}
+.dropdown-menu .divider{height:1px;margin:9px 0;overflow:hidden;background-color:#e5e5e5}
+.dropdown-menu > li > a{display:block;padding:3px 20px;clear:both;font-weight:400;line-height:1.42857143;color:#333;white-space:nowrap}
+.dropdown-menu > li > a:hover,.dropdown-menu > li > a:focus{text-decoration:none;color:#fff;background-color:#2fa4e7}
+.dropdown-menu > .active > a,.dropdown-menu > .active > a:hover,.dropdown-menu > .active > a:focus{color:#fff;text-decoration:none;outline:0;background-color:#2fa4e7}
+.dropdown-menu > .disabled > a,.dropdown-menu > .disabled > a:hover,.dropdown-menu > .disabled > a:focus{color:#999}
+.dropdown-menu > .disabled > a:hover,.dropdown-menu > .disabled > a:focus{text-decoration:none;background-color:transparent;background-image:none;filter:progid:DXImageTransform.Microsoft.gradient(enabled = false);cursor:not-allowed}
+.open > .dropdown-menu{display:block}
+.open > a{outline:0}
+.dropdown-menu-right{left:auto;right:0}
+.dropdown-menu-left{left:0;right:auto}
+.dropdown-header{display:block;padding:3px 20px;font-size:12px;line-height:1.42857143;color:#999;white-space:nowrap}
+.dropdown-backdrop{position:fixed;left:0;right:0;bottom:0;top:0;z-index:990}
+.pull-right > .dropdown-menu{right:0;left:auto}
+.dropup .caret,.navbar-fixed-bottom .dropdown .caret{border-top:0;border-bottom:4px solid;content:""}
+.dropup .dropdown-menu,.navbar-fixed-bottom .dropdown .dropdown-menu{top:auto;bottom:100%;margin-bottom:1px}
+ at media (min-width: 768px) {
+.navbar-right .dropdown-menu{left:auto;right:0}
+.navbar-right .dropdown-menu-left{left:0;right:auto}
+}
+.btn-group,.btn-group-vertical{position:relative;display:inline-block;vertical-align:middle}
+.btn-group > .btn,.btn-group-vertical > .btn{position:relative;float:left}
+.btn-group > .btn:hover,.btn-group-vertical > .btn:hover,.btn-group > .btn:focus,.btn-group-vertical > .btn:focus,.btn-group > .btn:active,.btn-group-vertical > .btn:active,.btn-group > .btn.active,.btn-group-vertical > .btn.active{z-index:2}
+.btn-group > .btn:focus,.btn-group-vertical > .btn:focus{outline:0}
+.btn-group .btn + .btn,.btn-group .btn + .btn-group,.btn-group .btn-group + .btn,.btn-group .btn-group + .btn-group{margin-left:-1px}
+.btn-toolbar{margin-left:-5px}
+.btn-toolbar .btn-group,.btn-toolbar .input-group{float:left}
+.btn-toolbar > .btn,.btn-toolbar > .btn-group,.btn-toolbar > .input-group{margin-left:5px}
+.btn-group > .btn:not(:first-child):not(:last-child):not(.dropdown-toggle){border-radius:0}
+.btn-group > .btn:first-child{margin-left:0}
+.btn-group > .btn:first-child:not(:last-child):not(.dropdown-toggle){border-bottom-right-radius:0;border-top-right-radius:0}
+.btn-group > .btn:last-child:not(:first-child),.btn-group > .dropdown-toggle:not(:first-child){border-bottom-left-radius:0;border-top-left-radius:0}
+.btn-group > .btn-group{float:left}
+.btn-group > .btn-group:not(:first-child):not(:last-child) > .btn{border-radius:0}
+.btn-group > .btn-group:first-child > .btn:last-child,.btn-group > .btn-group:first-child > .dropdown-toggle{border-bottom-right-radius:0;border-top-right-radius:0}
+.btn-group > .btn-group:last-child > .btn:first-child{border-bottom-left-radius:0;border-top-left-radius:0}
+.btn-group .dropdown-toggle:active,.btn-group.open .dropdown-toggle{outline:0}
+.btn-group > .btn + .dropdown-toggle{padding-left:8px;padding-right:8px}
+.btn-group > .btn-lg + .dropdown-toggle{padding-left:12px;padding-right:12px}
+.btn-group.open .dropdown-toggle{-webkit-box-shadow:inset 0 3px 5px rgba(0,0,0,0.125);box-shadow:inset 0 3px 5px rgba(0,0,0,0.125)}
+.btn-group.open .dropdown-toggle.btn-link{-webkit-box-shadow:none;box-shadow:none}
+.btn .caret{margin-left:0}
+.btn-lg .caret{border-width:5px 5px 0;border-bottom-width:0}
+.dropup .btn-lg .caret{border-width:0 5px 5px}
+.btn-group-vertical > .btn,.btn-group-vertical > .btn-group,.btn-group-vertical > .btn-group > .btn{display:block;float:none;width:100%;max-width:100%}
+.btn-group-vertical > .btn-group > .btn{float:none}
+.btn-group-vertical > .btn + .btn,.btn-group-vertical > .btn + .btn-group,.btn-group-vertical > .btn-group + .btn,.btn-group-vertical > .btn-group + .btn-group{margin-top:-1px;margin-left:0}
+.btn-group-vertical > .btn:not(:first-child):not(:last-child){border-radius:0}
+.btn-group-vertical > .btn:first-child:not(:last-child){border-top-right-radius:4px;border-bottom-right-radius:0;border-bottom-left-radius:0}
+.btn-group-vertical > .btn:last-child:not(:first-child){border-bottom-left-radius:4px;border-top-right-radius:0;border-top-left-radius:0}
+.btn-group-vertical > .btn-group:not(:first-child):not(:last-child) > .btn{border-radius:0}
+.btn-group-vertical > .btn-group:first-child:not(:last-child) > .btn:last-child,.btn-group-vertical > .btn-group:first-child:not(:last-child) > .dropdown-toggle{border-bottom-right-radius:0;border-bottom-left-radius:0}
+.btn-group-vertical > .btn-group:last-child:not(:first-child) > .btn:first-child{border-top-right-radius:0;border-top-left-radius:0}
+.btn-group-justified{display:table;width:100%;table-layout:fixed;border-collapse:separate}
+.btn-group-justified > .btn,.btn-group-justified > .btn-group{float:none;display:table-cell;width:1%}
+.btn-group-justified > .btn-group .btn{width:100%}
+.btn-group-justified > .btn-group .dropdown-menu{left:auto}
+[data-toggle="buttons"] > .btn > input[type="radio"],[data-toggle="buttons"] > .btn > input[type="checkbox"]{position:absolute;z-index:-1;opacity:0;filter:alpha(opacity=0)}
+.input-group{position:relative;display:table;border-collapse:separate}
+.input-group[class*="col-"]{float:none;padding-left:0;padding-right:0}
+.input-group .form-control{position:relative;z-index:2;float:left;width:100%;margin-bottom:0}
+.input-group-lg > .form-control,.input-group-lg > .input-group-addon,.input-group-lg > .input-group-btn > .btn{height:54px;padding:14px 16px;font-size:18px;line-height:1.33;border-radius:6px}
+select.input-group-lg > .form-control,select.input-group-lg > .input-group-addon,select.input-group-lg > .input-group-btn > .btn{height:54px;line-height:54px}
+textarea.input-group-lg > .form-control,textarea.input-group-lg > .input-group-addon,textarea.input-group-lg > .input-group-btn > .btn,select[multiple].input-group-lg > .form-control,select[multiple].input-group-lg > .input-group-addon,select[multiple].input-group-lg > .input-group-btn > .btn{height:auto}
+.input-group-sm > .form-control,.input-group-sm > .input-group-addon,.input-group-sm > .input-group-btn > .btn{height:30px;padding:5px 10px;font-size:12px;line-height:1.5;border-radius:3px}
+select.input-group-sm > .form-control,select.input-group-sm > .input-group-addon,select.input-group-sm > .input-group-btn > .btn{height:30px;line-height:30px}
+textarea.input-group-sm > .form-control,textarea.input-group-sm > .input-group-addon,textarea.input-group-sm > .input-group-btn > .btn,select[multiple].input-group-sm > .form-control,select[multiple].input-group-sm > .input-group-addon,select[multiple].input-group-sm > .input-group-btn > .btn{height:auto}
+.input-group-addon,.input-group-btn,.input-group .form-control{display:table-cell}
+.input-group-addon:not(:first-child):not(:last-child),.input-group-btn:not(:first-child):not(:last-child),.input-group .form-control:not(:first-child):not(:last-child){border-radius:0}
+.input-group-addon,.input-group-btn{width:1%;white-space:nowrap;vertical-align:middle}
+.input-group-addon{padding:8px 12px;font-size:14px;font-weight:400;line-height:1;color:#555;text-align:center;background-color:#eee;border:1px solid #ccc;border-radius:4px}
+.input-group-addon.input-sm{padding:5px 10px;font-size:12px;border-radius:3px}
+.input-group-addon.input-lg{padding:14px 16px;font-size:18px;border-radius:6px}
+.input-group-addon input[type="radio"],.input-group-addon input[type="checkbox"]{margin-top:0}
+.input-group .form-control:first-child,.input-group-addon:first-child,.input-group-btn:first-child > .btn,.input-group-btn:first-child > .btn-group > .btn,.input-group-btn:first-child > .dropdown-toggle,.input-group-btn:last-child > .btn:not(:last-child):not(.dropdown-toggle),.input-group-btn:last-child > .btn-group:not(:last-child) > .btn{border-bottom-right-radius:0;border-top-right-radius:0}
+.input-group-addon:first-child{border-right:0}
+.input-group .form-control:last-child,.input-group-addon:last-child,.input-group-btn:last-child > .btn,.input-group-btn:last-child > .btn-group > .btn,.input-group-btn:last-child > .dropdown-toggle,.input-group-btn:first-child > .btn:not(:first-child),.input-group-btn:first-child > .btn-group:not(:first-child) > .btn{border-bottom-left-radius:0;border-top-left-radius:0}
+.input-group-addon:last-child{border-left:0}
+.input-group-btn{position:relative;font-size:0;white-space:nowrap}
+.input-group-btn > .btn{position:relative}
+.input-group-btn > .btn + .btn{margin-left:-1px}
+.input-group-btn > .btn:hover,.input-group-btn > .btn:focus,.input-group-btn > .btn:active{z-index:2}
+.input-group-btn:first-child > .btn,.input-group-btn:first-child > .btn-group{margin-right:-1px}
+.input-group-btn:last-child > .btn,.input-group-btn:last-child > .btn-group{margin-left:-1px}
+.nav{margin-bottom:0;padding-left:0;list-style:none}
+.nav > li{position:relative;display:block}
+.nav > li > a{position:relative;display:block;padding:10px 15px}
+.nav > li > a:hover,.nav > li > a:focus{text-decoration:none;background-color:#eee}
+.nav > li.disabled > a{color:#999}
+.nav > li.disabled > a:hover,.nav > li.disabled > a:focus{color:#999;text-decoration:none;background-color:transparent;cursor:not-allowed}
+.nav .open > a,.nav .open > a:hover,.nav .open > a:focus{background-color:#eee;border-color:#2fa4e7}
+.nav .nav-divider{height:1px;margin:9px 0;overflow:hidden;background-color:#e5e5e5}
+.nav > li > a > img{max-width:none}
+.nav-tabs{border-bottom:1px solid #ddd}
+.nav-tabs > li{float:left;margin-bottom:-1px}
+.nav-tabs > li > a{margin-right:2px;line-height:1.42857143;border:1px solid transparent;border-radius:4px 4px 0 0}
+.nav-tabs > li > a:hover{border-color:#eee #eee #ddd}
+.nav-tabs > li.active > a,.nav-tabs > li.active > a:hover,.nav-tabs > li.active > a:focus{color:#555;background-color:#fff;border:1px solid #ddd;border-bottom-color:transparent;cursor:default}
+.nav-tabs.nav-justified{width:100%;border-bottom:0}
+.nav-tabs.nav-justified > li{float:none}
+.nav-tabs.nav-justified > li > a{text-align:center;margin-bottom:5px}
+.nav-tabs.nav-justified > .dropdown .dropdown-menu{top:auto;left:auto}
+ at media (min-width: 768px) {
+.nav-tabs.nav-justified > li{display:table-cell;width:1%}
+.nav-tabs.nav-justified > li > a{margin-bottom:0}
+}
+.nav-tabs.nav-justified > li > a{margin-right:0;border-radius:4px}
+.nav-tabs.nav-justified > .active > a,.nav-tabs.nav-justified > .active > a:hover,.nav-tabs.nav-justified > .active > a:focus{border:1px solid #ddd}
+ at media (min-width: 768px) {
+.nav-tabs.nav-justified > li > a{border-bottom:1px solid #ddd;border-radius:4px 4px 0 0}
+.nav-tabs.nav-justified > .active > a,.nav-tabs.nav-justified > .active > a:hover,.nav-tabs.nav-justified > .active > a:focus{border-bottom-color:#fff}
+}
+.nav-pills > li{float:left}
+.nav-pills > li > a{border-radius:4px}
+.nav-pills > li + li{margin-left:2px}
+.nav-pills > li.active > a,.nav-pills > li.active > a:hover,.nav-pills > li.active > a:focus{color:#fff;background-color:#2fa4e7}
+.nav-stacked > li{float:none}
+.nav-stacked > li + li{margin-top:2px;margin-left:0}
+.nav-justified{width:100%}
+.nav-justified > li{float:none}
+.nav-justified > li > a{text-align:center;margin-bottom:5px}
+.nav-justified > .dropdown .dropdown-menu{top:auto;left:auto}
+ at media (min-width: 768px) {
+.nav-justified > li{display:table-cell;width:1%}
+.nav-justified > li > a{margin-bottom:0}
+}
+.nav-tabs-justified{border-bottom:0}
+.nav-tabs-justified > li > a{margin-right:0;border-radius:4px}
+.nav-tabs-justified > .active > a,.nav-tabs-justified > .active > a:hover,.nav-tabs-justified > .active > a:focus{border:1px solid #ddd}
+ at media (min-width: 768px) {
+.nav-tabs-justified > li > a{border-bottom:1px solid #ddd;border-radius:4px 4px 0 0}
+.nav-tabs-justified > .active > a,.nav-tabs-justified > .active > a:hover,.nav-tabs-justified > .active > a:focus{border-bottom-color:#fff}
+}
+.tab-content > .tab-pane{display:none}
+.tab-content > .active{display:block}
+.nav-tabs .dropdown-menu{margin-top:-1px;border-top-right-radius:0;border-top-left-radius:0}
+.navbar{position:relative;min-height:50px;margin-bottom:20px;border:1px solid transparent}
+ at media (min-width: 768px) {
+.navbar{border-radius:4px}
+}
+ at media (min-width: 768px) {
+.navbar-header{float:left}
+}
+.navbar-collapse{overflow-x:visible;padding-right:15px;padding-left:15px;border-top:1px solid transparent;box-shadow:inset 0 1px 0 rgba(255,255,255,0.1);-webkit-overflow-scrolling:touch}
+.navbar-collapse.in{overflow-y:auto}
+ at media (min-width: 768px) {
+.navbar-collapse{width:auto;border-top:0;box-shadow:none}
+.navbar-collapse.collapse{display:block!important;height:auto!important;padding-bottom:0;overflow:visible!important}
+.navbar-collapse.in{overflow-y:visible}
+.navbar-fixed-top .navbar-collapse,.navbar-static-top .navbar-collapse,.navbar-fixed-bottom .navbar-collapse{padding-left:0;padding-right:0}
+}
+.navbar-fixed-top .navbar-collapse,.navbar-fixed-bottom .navbar-collapse{max-height:340px}
+ at media (max-width: 480px) and (orientation: landscape) {
+.navbar-fixed-top .navbar-collapse,.navbar-fixed-bottom .navbar-collapse{max-height:200px}
+}
+.container > .navbar-header,.container-fluid > .navbar-header,.container > .navbar-collapse,.container-fluid > .navbar-collapse{margin-right:-15px;margin-left:-15px}
+ at media (min-width: 768px) {
+.container > .navbar-header,.container-fluid > .navbar-header,.container > .navbar-collapse,.container-fluid > .navbar-collapse{margin-right:0;margin-left:0}
+}
+.navbar-static-top{z-index:1000;border-width:0 0 1px}
+ at media (min-width: 768px) {
+.navbar-static-top{border-radius:0}
+}
+.navbar-fixed-top,.navbar-fixed-bottom{position:fixed;right:0;left:0;z-index:1030;-webkit-transform:translate3d(0,0,0);transform:translate3d(0,0,0)}
+ at media (min-width: 768px) {
+.navbar-fixed-top,.navbar-fixed-bottom{border-radius:0}
+}
+.navbar-fixed-top{top:0;border-width:0 0 1px}
+.navbar-fixed-bottom{bottom:0;margin-bottom:0;border-width:1px 0 0}
+.navbar-brand{float:left;padding:15px;font-size:18px;line-height:20px;height:50px}
+.navbar-brand:hover,.navbar-brand:focus{text-decoration:none}
+ at media (min-width: 768px) {
+.navbar > .container .navbar-brand,.navbar > .container-fluid .navbar-brand{margin-left:-15px}
+}
+.navbar-toggle{position:relative;float:right;margin-right:15px;padding:9px 10px;margin-top:8px;margin-bottom:8px;background-color:transparent;background-image:none;border:1px solid transparent;border-radius:4px}
+.navbar-toggle:focus{outline:0}
+.navbar-toggle .icon-bar{display:block;width:22px;height:2px;border-radius:1px}
+.navbar-toggle .icon-bar + .icon-bar{margin-top:4px}
+ at media (min-width: 768px) {
+.navbar-toggle{display:none}
+}
+.navbar-nav{margin:7.5px -15px}
+.navbar-nav > li > a{padding-top:10px;padding-bottom:10px;line-height:20px}
+ at media (max-width: 767px) {
+.navbar-nav .open .dropdown-menu{position:static;float:none;width:auto;margin-top:0;background-color:transparent;border:0;box-shadow:none}
+.navbar-nav .open .dropdown-menu > li > a,.navbar-nav .open .dropdown-menu .dropdown-header{padding:5px 15px 5px 25px}
+.navbar-nav .open .dropdown-menu > li > a{line-height:20px}
+.navbar-nav .open .dropdown-menu > li > a:hover,.navbar-nav .open .dropdown-menu > li > a:focus{background-image:none}
+}
+ at media (min-width: 768px) {
+.navbar-nav{float:left;margin:0}
+.navbar-nav > li{float:left}
+.navbar-nav > li > a{padding-top:15px;padding-bottom:15px}
+.navbar-nav.navbar-right:last-child{margin-right:-15px}
+}
+ at media (min-width: 768px) {
+.navbar-left{float:left!important}
+.navbar-right{float:right!important}
+}
+.navbar-form{padding:10px 15px;border-top:1px solid transparent;border-bottom:1px solid transparent;-webkit-box-shadow:inset 0 1px 0 rgba(255,255,255,0.1),0 1px 0 rgba(255,255,255,0.1);box-shadow:inset 0 1px 0 rgba(255,255,255,0.1),0 1px 0 rgba(255,255,255,0.1);margin:6px -15px}
+ at media (min-width: 768px) {
+.navbar-form .form-group{display:inline-block;margin-bottom:0;vertical-align:middle}
+.navbar-form .form-control{display:inline-block;width:auto;vertical-align:middle}
+.navbar-form .input-group{display:inline-table;vertical-align:middle}
+.navbar-form .input-group .input-group-addon,.navbar-form .input-group .input-group-btn,.navbar-form .input-group .form-control{width:auto}
+.navbar-form .input-group > .form-control{width:100%}
+.navbar-form .control-label{margin-bottom:0;vertical-align:middle}
+.navbar-form .radio,.navbar-form .checkbox{display:inline-block;margin-top:0;margin-bottom:0;vertical-align:middle}
+.navbar-form .radio label,.navbar-form .checkbox label{padding-left:0}
+.navbar-form .radio input[type="radio"],.navbar-form .checkbox input[type="checkbox"]{position:relative;margin-left:0}
+.navbar-form .has-feedback .form-control-feedback{top:0}
+}
+ at media (max-width: 767px) {
+.navbar-form .form-group{margin-bottom:5px}
+}
+ at media (min-width: 768px) {
+.navbar-form{width:auto;border:0;margin-left:0;margin-right:0;padding-top:0;padding-bottom:0;-webkit-box-shadow:none;box-shadow:none}
+.navbar-form.navbar-right:last-child{margin-right:-15px}
+}
+.navbar-nav > li > .dropdown-menu{margin-top:0;border-top-right-radius:0;border-top-left-radius:0}
+.navbar-fixed-bottom .navbar-nav > li > .dropdown-menu{border-bottom-right-radius:0;border-bottom-left-radius:0}
+.navbar-btn{margin-top:6px;margin-bottom:6px}
+.navbar-btn.btn-sm{margin-top:10px;margin-bottom:10px}
+.navbar-btn.btn-xs{margin-top:14px;margin-bottom:14px}
+.navbar-text{margin-top:15px;margin-bottom:15px}
+ at media (min-width: 768px) {
+.navbar-text{float:left;margin-left:15px;margin-right:15px}
+.navbar-text.navbar-right:last-child{margin-right:0}
+}
+.navbar-default{background-color:#2fa4e7;border-color:#1995dc}
+.navbar-default .navbar-brand{color:#fff}
+.navbar-default .navbar-brand:hover,.navbar-default .navbar-brand:focus{color:#fff;background-color:none}
+.navbar-default .navbar-text{color:#ddd}
+.navbar-default .navbar-nav > li > a{color:#fff}
+.navbar-default .navbar-nav > li > a:hover,.navbar-default .navbar-nav > li > a:focus{color:#fff;background-color:#178acc}
+.navbar-default .navbar-nav > .active > a,.navbar-default .navbar-nav > .active > a:hover,.navbar-default .navbar-nav > .active > a:focus{color:#fff;background-color:#178acc}
+.navbar-default .navbar-nav > .disabled > a,.navbar-default .navbar-nav > .disabled > a:hover,.navbar-default .navbar-nav > .disabled > a:focus{color:#ddd;background-color:transparent}
+.navbar-default .navbar-toggle{border-color:#178acc}
+.navbar-default .navbar-toggle:hover,.navbar-default .navbar-toggle:focus{background-color:#178acc}
+.navbar-default .navbar-toggle .icon-bar{background-color:#fff}
+.navbar-default .navbar-collapse,.navbar-default .navbar-form{border-color:#1995dc}
+.navbar-default .navbar-nav > .open > a,.navbar-default .navbar-nav > .open > a:hover,.navbar-default .navbar-nav > .open > a:focus{background-color:#178acc;color:#fff}
+ at media (max-width: 767px) {
+.navbar-default .navbar-nav .open .dropdown-menu > li > a{color:#fff}
+.navbar-default .navbar-nav .open .dropdown-menu > li > a:hover,.navbar-default .navbar-nav .open .dropdown-menu > li > a:focus{color:#fff;background-color:#178acc}
+.navbar-default .navbar-nav .open .dropdown-menu > .active > a,.navbar-default .navbar-nav .open .dropdown-menu > .active > a:hover,.navbar-default .navbar-nav .open .dropdown-menu > .active > a:focus{color:#fff;background-color:#178acc}
+.navbar-default .navbar-nav .open .dropdown-menu > .disabled > a,.navbar-default .navbar-nav .open .dropdown-menu > .disabled > a:hover,.navbar-default .navbar-nav .open .dropdown-menu > .disabled > a:focus{color:#ddd;background-color:transparent}
+}
+.navbar-default .navbar-link{color:#fff}
+.navbar-default .navbar-link:hover{color:#fff}
+.navbar-default .btn-link{color:#fff}
+.navbar-default .btn-link:hover,.navbar-default .btn-link:focus{color:#fff}
+.navbar-default .btn-link[disabled]:hover,fieldset[disabled] .navbar-default .btn-link:hover,.navbar-default .btn-link[disabled]:focus,fieldset[disabled] .navbar-default .btn-link:focus{color:#ddd}
+.navbar-inverse{background-color:#033c73;border-color:#022f5a}
+.navbar-inverse .navbar-brand{color:#fff}
+.navbar-inverse .navbar-brand:hover,.navbar-inverse .navbar-brand:focus{color:#fff;background-color:none}
+.navbar-inverse .navbar-text{color:#fff}
+.navbar-inverse .navbar-nav > li > a{color:#fff}
+.navbar-inverse .navbar-nav > li > a:hover,.navbar-inverse .navbar-nav > li > a:focus{color:#fff;background-color:#022f5a}
+.navbar-inverse .navbar-nav > .active > a,.navbar-inverse .navbar-nav > .active > a:hover,.navbar-inverse .navbar-nav > .active > a:focus{color:#fff;background-color:#022f5a}
+.navbar-inverse .navbar-nav > .disabled > a,.navbar-inverse .navbar-nav > .disabled > a:hover,.navbar-inverse .navbar-nav > .disabled > a:focus{color:#ccc;background-color:transparent}
+.navbar-inverse .navbar-toggle{border-color:#022f5a}
+.navbar-inverse .navbar-toggle:hover,.navbar-inverse .navbar-toggle:focus{background-color:#022f5a}
+.navbar-inverse .navbar-toggle .icon-bar{background-color:#fff}
+.navbar-inverse .navbar-collapse,.navbar-inverse .navbar-form{border-color:#022a50}
+.navbar-inverse .navbar-nav > .open > a,.navbar-inverse .navbar-nav > .open > a:hover,.navbar-inverse .navbar-nav > .open > a:focus{background-color:#022f5a;color:#fff}
+ at media (max-width: 767px) {
+.navbar-inverse .navbar-nav .open .dropdown-menu > .dropdown-header{border-color:#022f5a}
+.navbar-inverse .navbar-nav .open .dropdown-menu .divider{background-color:#022f5a}
+.navbar-inverse .navbar-nav .open .dropdown-menu > li > a{color:#fff}
+.navbar-inverse .navbar-nav .open .dropdown-menu > li > a:hover,.navbar-inverse .navbar-nav .open .dropdown-menu > li > a:focus{color:#fff;background-color:#022f5a}
+.navbar-inverse .navbar-nav .open .dropdown-menu > .active > a,.navbar-inverse .navbar-nav .open .dropdown-menu > .active > a:hover,.navbar-inverse .navbar-nav .open .dropdown-menu > .active > a:focus{color:#fff;background-color:#022f5a}
+.navbar-inverse .navbar-nav .open .dropdown-menu > .disabled > a,.navbar-inverse .navbar-nav .open .dropdown-menu > .disabled > a:hover,.navbar-inverse .navbar-nav .open .dropdown-menu > .disabled > a:focus{color:#ccc;background-color:transparent}
+}
+.navbar-inverse .navbar-link{color:#fff}
+.navbar-inverse .navbar-link:hover{color:#fff}
+.navbar-inverse .btn-link{color:#fff}
+.navbar-inverse .btn-link:hover,.navbar-inverse .btn-link:focus{color:#fff}
+.navbar-inverse .btn-link[disabled]:hover,fieldset[disabled] .navbar-inverse .btn-link:hover,.navbar-inverse .btn-link[disabled]:focus,fieldset[disabled] .navbar-inverse .btn-link:focus{color:#ccc}
+.breadcrumb{padding:8px 15px;margin-bottom:20px;list-style:none;background-color:#f5f5f5;border-radius:4px}
+.breadcrumb > li{display:inline-block}
+.breadcrumb > li + li:before{content:"/\00a0";padding:0 5px;color:#ccc}
+.breadcrumb > .active{color:#999}
+.pagination{display:inline-block;padding-left:0;margin:20px 0;border-radius:4px}
+.pagination > li{display:inline}
+.pagination > li > a,.pagination > li > span{position:relative;float:left;padding:8px 12px;line-height:1.42857143;text-decoration:none;color:#2fa4e7;background-color:#fff;border:1px solid #ddd;margin-left:-1px}
+.pagination > li:first-child > a,.pagination > li:first-child > span{margin-left:0;border-bottom-left-radius:4px;border-top-left-radius:4px}
+.pagination > li:last-child > a,.pagination > li:last-child > span{border-bottom-right-radius:4px;border-top-right-radius:4px}
+.pagination > li > a:hover,.pagination > li > span:hover,.pagination > li > a:focus,.pagination > li > span:focus{color:#157ab5;background-color:#eee;border-color:#ddd}
+.pagination > .active > a,.pagination > .active > span,.pagination > .active > a:hover,.pagination > .active > span:hover,.pagination > .active > a:focus,.pagination > .active > span:focus{z-index:2;color:#999;background-color:#f5f5f5;border-color:#ddd;cursor:default}
+.pagination > .disabled > span,.pagination > .disabled > span:hover,.pagination > .disabled > span:focus,.pagination > .disabled > a,.pagination > .disabled > a:hover,.pagination > .disabled > a:focus{color:#999;background-color:#fff;border-color:#ddd;cursor:not-allowed}
+.pagination-lg > li > a,.pagination-lg > li > span{padding:14px 16px;font-size:18px}
+.pagination-lg > li:first-child > a,.pagination-lg > li:first-child > span{border-bottom-left-radius:6px;border-top-left-radius:6px}
+.pagination-lg > li:last-child > a,.pagination-lg > li:last-child > span{border-bottom-right-radius:6px;border-top-right-radius:6px}
+.pagination-sm > li > a,.pagination-sm > li > span{padding:5px 10px;font-size:12px}
+.pagination-sm > li:first-child > a,.pagination-sm > li:first-child > span{border-bottom-left-radius:3px;border-top-left-radius:3px}
+.pagination-sm > li:last-child > a,.pagination-sm > li:last-child > span{border-bottom-right-radius:3px;border-top-right-radius:3px}
+.pager{padding-left:0;margin:20px 0;list-style:none;text-align:center}
+.pager li{display:inline}
+.pager li > a,.pager li > span{display:inline-block;padding:5px 14px;background-color:#fff;border:1px solid #ddd;border-radius:15px}
+.pager li > a:hover,.pager li > a:focus{text-decoration:none;background-color:#eee}
+.pager .next > a,.pager .next > span{float:right}
+.pager .previous > a,.pager .previous > span{float:left}
+.pager .disabled > a,.pager .disabled > a:hover,.pager .disabled > a:focus,.pager .disabled > span{color:#999;background-color:#fff;cursor:not-allowed}
+.label{display:inline;padding:.2em .6em .3em;font-size:75%;font-weight:700;line-height:1;color:#fff;text-align:center;white-space:nowrap;vertical-align:baseline;border-radius:.25em}
+a.label:hover,a.label:focus{color:#fff;text-decoration:none;cursor:pointer}
+.label:empty{display:none}
+.btn .label{position:relative;top:-1px}
+.label-default{background-color:#999}
+.label-default[href]:hover,.label-default[href]:focus{background-color:gray}
+.label-primary{background-color:#2fa4e7}
+.label-primary[href]:hover,.label-primary[href]:focus{background-color:#178acc}
+.label-success{background-color:#73a839}
+.label-success[href]:hover,.label-success[href]:focus{background-color:#59822c}
+.label-info{background-color:#033c73}
+.label-info[href]:hover,.label-info[href]:focus{background-color:#022241}
+.label-warning{background-color:#dd5600}
+.label-warning[href]:hover,.label-warning[href]:focus{background-color:#aa4200}
+.label-danger{background-color:#c71c22}
+.label-danger[href]:hover,.label-danger[href]:focus{background-color:#9a161a}
+.badge{display:inline-block;min-width:10px;padding:3px 7px;font-size:12px;font-weight:700;color:#fff;line-height:1;vertical-align:baseline;white-space:nowrap;text-align:center;background-color:#2fa4e7;border-radius:10px}
+.badge:empty{display:none}
+.btn .badge{position:relative;top:-1px}
+.btn-xs .badge{top:0;padding:1px 5px}
+a.badge:hover,a.badge:focus{color:#fff;text-decoration:none;cursor:pointer}
+a.list-group-item.active > .badge,.nav-pills > .active > a > .badge{color:#2fa4e7;background-color:#fff}
+.nav-pills > li > a > .badge{margin-left:3px}
+.jumbotron{padding:30px;margin-bottom:30px;color:inherit;background-color:#eee}
+.jumbotron h1,.jumbotron .h1{color:inherit}
+.jumbotron p{margin-bottom:15px;font-size:21px;font-weight:200}
+.jumbotron > hr{border-top-color:#d5d5d5}
+.container .jumbotron{border-radius:6px}
+.jumbotron .container{max-width:100%}
+ at media screen and (min-width: 768px) {
+.jumbotron{padding-top:48px;padding-bottom:48px}
+.container .jumbotron{padding-left:60px;padding-right:60px}
+.jumbotron h1,.jumbotron .h1{font-size:63px}
+}
+.thumbnail{display:block;padding:4px;margin-bottom:20px;line-height:1.42857143;background-color:#fff;border:1px solid #ddd;border-radius:4px;-webkit-transition:all .2s ease-in-out;-o-transition:all .2s ease-in-out;transition:all .2s ease-in-out}
+.thumbnail > img,.thumbnail a > img{margin-left:auto;margin-right:auto}
+a.thumbnail:hover,a.thumbnail:focus,a.thumbnail.active{border-color:#2fa4e7}
+.thumbnail .caption{padding:9px;color:#555}
+.alert{padding:15px;margin-bottom:20px;border:1px solid transparent;border-radius:4px}
+.alert h4{margin-top:0;color:inherit}
+.alert .alert-link{font-weight:700}
+.alert > p,.alert > ul{margin-bottom:0}
+.alert > p + p{margin-top:5px}
+.alert-dismissable,.alert-dismissible{padding-right:35px}
+.alert-dismissable .close,.alert-dismissible .close{position:relative;top:-2px;right:-21px;color:inherit}
+.alert-success{background-color:#dff0d8;border-color:#d6e9c6;color:#468847}
+.alert-success hr{border-top-color:#c9e2b3}
+.alert-success .alert-link{color:#356635}
+.alert-info{background-color:#d9edf7;border-color:#bce8f1;color:#3a87ad}
+.alert-info hr{border-top-color:#a6e1ec}
+.alert-info .alert-link{color:#2d6987}
+.alert-warning{background-color:#fcf8e3;border-color:#fbeed5;color:#c09853}
+.alert-warning hr{border-top-color:#f8e5be}
+.alert-warning .alert-link{color:#a47e3c}
+.alert-danger{background-color:#f2dede;border-color:#eed3d7;color:#b94a48}
+.alert-danger hr{border-top-color:#e6c1c7}
+.alert-danger .alert-link{color:#953b39}
+ at -webkit-keyframes progress-bar-stripes {
+from{background-position:40px 0}
+to{background-position:0 0}
+}
+ at keyframes progress-bar-stripes {
+from{background-position:40px 0}
+to{background-position:0 0}
+}
+.progress{overflow:hidden;height:20px;margin-bottom:20px;background-color:#f5f5f5;border-radius:4px;-webkit-box-shadow:inset 0 1px 2px rgba(0,0,0,0.1);box-shadow:inset 0 1px 2px rgba(0,0,0,0.1)}
+.progress-bar{float:left;width:0;height:100%;font-size:12px;line-height:20px;color:#fff;text-align:center;background-color:#2fa4e7;-webkit-box-shadow:inset 0 -1px 0 rgba(0,0,0,0.15);box-shadow:inset 0 -1px 0 rgba(0,0,0,0.15);-webkit-transition:width .6s ease;-o-transition:width .6s ease;transition:width .6s ease}
+.progress-striped .progress-bar,.progress-bar-striped{background-image:-webkit-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:-o-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-size:40px 40px}
+.progress.active .progress-bar,.progress-bar.active{-webkit-animation:progress-bar-stripes 2s linear infinite;-o-animation:progress-bar-stripes 2s linear infinite;animation:progress-bar-stripes 2s linear infinite}
+.progress-bar[aria-valuenow="1"],.progress-bar[aria-valuenow="2"]{min-width:30px}
+.progress-bar[aria-valuenow="0"]{color:#999;min-width:30px;background-color:transparent;background-image:none;box-shadow:none}
+.progress-bar-success{background-color:#73a839}
+.progress-striped .progress-bar-success{background-image:-webkit-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:-o-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent)}
+.progress-bar-info{background-color:#033c73}
+.progress-striped .progress-bar-info{background-image:-webkit-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:-o-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent)}
+.progress-bar-warning{background-color:#dd5600}
+.progress-striped .progress-bar-warning{background-image:-webkit-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:-o-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent)}
+.progress-bar-danger{background-color:#c71c22}
+.progress-striped .progress-bar-danger{background-image:-webkit-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:-o-linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-image:linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent)}
+.media,.media-body{overflow:hidden;zoom:1}
+.media,.media .media{margin-top:15px}
+.media:first-child{margin-top:0}
+.media-object{display:block}
+.media-heading{margin:0 0 5px}
+.media > .pull-left{margin-right:10px}
+.media > .pull-right{margin-left:10px}
+.media-list{padding-left:0;list-style:none}
+.list-group{margin-bottom:20px;padding-left:0}
+.list-group-item{position:relative;display:block;padding:10px 15px;margin-bottom:-1px;background-color:#fff;border:1px solid #ddd}
+.list-group-item:first-child{border-top-right-radius:4px;border-top-left-radius:4px}
+.list-group-item:last-child{margin-bottom:0;border-bottom-right-radius:4px;border-bottom-left-radius:4px}
+.list-group-item > .badge{float:right}
+.list-group-item > .badge + .badge{margin-right:5px}
+a.list-group-item{color:#555}
+a.list-group-item .list-group-item-heading{color:#333}
+a.list-group-item:hover,a.list-group-item:focus{text-decoration:none;color:#555;background-color:#f5f5f5}
+.list-group-item.disabled,.list-group-item.disabled:hover,.list-group-item.disabled:focus{background-color:#eee;color:#999}
+.list-group-item.disabled .list-group-item-heading,.list-group-item.disabled:hover .list-group-item-heading,.list-group-item.disabled:focus .list-group-item-heading{color:inherit}
+.list-group-item.disabled .list-group-item-text,.list-group-item.disabled:hover .list-group-item-text,.list-group-item.disabled:focus .list-group-item-text{color:#999}
+.list-group-item.active,.list-group-item.active:hover,.list-group-item.active:focus{z-index:2;color:#fff;background-color:#2fa4e7;border-color:#2fa4e7}
+.list-group-item.active .list-group-item-heading,.list-group-item.active:hover .list-group-item-heading,.list-group-item.active:focus .list-group-item-heading,.list-group-item.active .list-group-item-heading > small,.list-group-item.active:hover .list-group-item-heading > small,.list-group-item.active:focus .list-group-item-heading > small,.list-group-item.active .list-group-item-heading > .small,.list-group-item.active:hover .list-group-item-heading > .small,.list-group-item.active:focus .list-group-item-heading > .small{color:inherit}
+.list-group-item.active .list-group-item-text,.list-group-item.active:hover .list-group-item-text,.list-group-item.active:focus .list-group-item-text{color:#e6f4fc}
+.list-group-item-success{color:#468847;background-color:#dff0d8}
+a.list-group-item-success{color:#468847}
+a.list-group-item-success .list-group-item-heading{color:inherit}
+a.list-group-item-success:hover,a.list-group-item-success:focus{color:#468847;background-color:#d0e9c6}
+a.list-group-item-success.active,a.list-group-item-success.active:hover,a.list-group-item-success.active:focus{color:#fff;background-color:#468847;border-color:#468847}
+.list-group-item-info{color:#3a87ad;background-color:#d9edf7}
+a.list-group-item-info{color:#3a87ad}
+a.list-group-item-info .list-group-item-heading{color:inherit}
+a.list-group-item-info:hover,a.list-group-item-info:focus{color:#3a87ad;background-color:#c4e3f3}
+a.list-group-item-info.active,a.list-group-item-info.active:hover,a.list-group-item-info.active:focus{color:#fff;background-color:#3a87ad;border-color:#3a87ad}
+.list-group-item-warning{color:#c09853;background-color:#fcf8e3}
+a.list-group-item-warning{color:#c09853}
+a.list-group-item-warning .list-group-item-heading{color:inherit}
+a.list-group-item-warning:hover,a.list-group-item-warning:focus{color:#c09853;background-color:#faf2cc}
+a.list-group-item-warning.active,a.list-group-item-warning.active:hover,a.list-group-item-warning.active:focus{color:#fff;background-color:#c09853;border-color:#c09853}
+.list-group-item-danger{color:#b94a48;background-color:#f2dede}
+a.list-group-item-danger{color:#b94a48}
+a.list-group-item-danger .list-group-item-heading{color:inherit}
+a.list-group-item-danger:hover,a.list-group-item-danger:focus{color:#b94a48;background-color:#ebcccc}
+a.list-group-item-danger.active,a.list-group-item-danger.active:hover,a.list-group-item-danger.active:focus{color:#fff;background-color:#b94a48;border-color:#b94a48}
+.list-group-item-heading{margin-top:0;margin-bottom:5px}
+.list-group-item-text{margin-bottom:0;line-height:1.3}
+.panel{margin-bottom:20px;background-color:#fff;border:1px solid transparent;border-radius:4px;-webkit-box-shadow:0 1px 1px rgba(0,0,0,0.05);box-shadow:0 1px 1px rgba(0,0,0,0.05)}
+.panel-body{padding:15px}
+.panel-heading{padding:10px 15px;border-bottom:1px solid transparent;border-top-right-radius:3px;border-top-left-radius:3px}
+.panel-heading > .dropdown .dropdown-toggle{color:inherit}
+.panel-title{margin-top:0;margin-bottom:0;font-size:16px;color:inherit}
+.panel-title > a{color:inherit}
+.panel-footer{padding:10px 15px;background-color:#f5f5f5;border-top:1px solid #ddd;border-bottom-right-radius:3px;border-bottom-left-radius:3px}
+.panel > .list-group{margin-bottom:0}
+.panel > .list-group .list-group-item{border-width:1px 0;border-radius:0}
+.panel > .list-group:first-child .list-group-item:first-child{border-top:0;border-top-right-radius:3px;border-top-left-radius:3px}
+.panel > .list-group:last-child .list-group-item:last-child{border-bottom:0;border-bottom-right-radius:3px;border-bottom-left-radius:3px}
+.panel-heading + .list-group .list-group-item:first-child{border-top-width:0}
+.list-group + .panel-footer{border-top-width:0}
+.panel > .table,.panel > .table-responsive > .table,.panel > .panel-collapse > .table{margin-bottom:0}
+.panel > .table:first-child,.panel > .table-responsive:first-child > .table:first-child{border-top-right-radius:3px;border-top-left-radius:3px}
+.panel > .table:first-child > thead:first-child > tr:first-child td:first-child,.panel > .table-responsive:first-child > .table:first-child > thead:first-child > tr:first-child td:first-child,.panel > .table:first-child > tbody:first-child > tr:first-child td:first-child,.panel > .table-responsive:first-child > .table:first-child > tbody:first-child > tr:first-child td:first-child,.panel > .table:first-child > thead:first-child > tr:first-child th:first-child,.panel > .table-responsive:first-child > .table:first-child > thead:first-child > tr:first-child th:first-child,.panel > .table:first-child > tbody:first-child > tr:first-child th:first-child,.panel > .table-responsive:first-child > .table:first-child > tbody:first-child > tr:first-child th:first-child{border-top-left-radius:3px}
+.panel > .table:first-child > thead:first-child > tr:first-child td:last-child,.panel > .table-responsive:first-child > .table:first-child > thead:first-child > tr:first-child td:last-child,.panel > .table:first-child > tbody:first-child > tr:first-child td:last-child,.panel > .table-responsive:first-child > .table:first-child > tbody:first-child > tr:first-child td:last-child,.panel > .table:first-child > thead:first-child > tr:first-child th:last-child,.panel > .table-responsive:first-child > .table:first-child > thead:first-child > tr:first-child th:last-child,.panel > .table:first-child > tbody:first-child > tr:first-child th:last-child,.panel > .table-responsive:first-child > .table:first-child > tbody:first-child > tr:first-child th:last-child{border-top-right-radius:3px}
+.panel > .table:last-child,.panel > .table-responsive:last-child > .table:last-child{border-bottom-right-radius:3px;border-bottom-left-radius:3px}
+.panel > .table:last-child > tbody:last-child > tr:last-child td:first-child,.panel > .table-responsive:last-child > .table:last-child > tbody:last-child > tr:last-child td:first-child,.panel > .table:last-child > tfoot:last-child > tr:last-child td:first-child,.panel > .table-responsive:last-child > .table:last-child > tfoot:last-child > tr:last-child td:first-child,.panel > .table:last-child > tbody:last-child > tr:last-child th:first-child,.panel > .table-responsive:last-child > .table:last-child > tbody:last-child > tr:last-child th:first-child,.panel > .table:last-child > tfoot:last-child > tr:last-child th:first-child,.panel > .table-responsive:last-child > .table:last-child > tfoot:last-child > tr:last-child th:first-child{border-bottom-left-radius:3px}
+.panel > .table:last-child > tbody:last-child > tr:last-child td:last-child,.panel > .table-responsive:last-child > .table:last-child > tbody:last-child > tr:last-child td:last-child,.panel > .table:last-child > tfoot:last-child > tr:last-child td:last-child,.panel > .table-responsive:last-child > .table:last-child > tfoot:last-child > tr:last-child td:last-child,.panel > .table:last-child > tbody:last-child > tr:last-child th:last-child,.panel > .table-responsive:last-child > .table:last-child > tbody:last-child > tr:last-child th:last-child,.panel > .table:last-child > tfoot:last-child > tr:last-child th:last-child,.panel > .table-responsive:last-child > .table:last-child > tfoot:last-child > tr:last-child th:last-child{border-bottom-right-radius:3px}
+.panel > .panel-body + .table,.panel > .panel-body + .table-responsive{border-top:1px solid #ddd}
+.panel > .table > tbody:first-child > tr:first-child th,.panel > .table > tbody:first-child > tr:first-child td{border-top:0}
+.panel > .table-bordered,.panel > .table-responsive > .table-bordered{border:0}
+.panel > .table-bordered > thead > tr > th:first-child,.panel > .table-responsive > .table-bordered > thead > tr > th:first-child,.panel > .table-bordered > tbody > tr > th:first-child,.panel > .table-responsive > .table-bordered > tbody > tr > th:first-child,.panel > .table-bordered > tfoot > tr > th:first-child,.panel > .table-responsive > .table-bordered > tfoot > tr > th:first-child,.panel > .table-bordered > thead > tr > td:first-child,.panel > .table-responsive > .table-bordered > thead > tr > td:first-child,.panel > .table-bordered > tbody > tr > td:first-child,.panel > .table-responsive > .table-bordered > tbody > tr > td:first-child,.panel > .table-bordered > tfoot > tr > td:first-child,.panel > .table-responsive > .table-bordered > tfoot > tr > td:first-child{border-left:0}
+.panel > .table-bordered > thead > tr > th:last-child,.panel > .table-responsive > .table-bordered > thead > tr > th:last-child,.panel > .table-bordered > tbody > tr > th:last-child,.panel > .table-responsive > .table-bordered > tbody > tr > th:last-child,.panel > .table-bordered > tfoot > tr > th:last-child,.panel > .table-responsive > .table-bordered > tfoot > tr > th:last-child,.panel > .table-bordered > thead > tr > td:last-child,.panel > .table-responsive > .table-bordered > thead > tr > td:last-child,.panel > .table-bordered > tbody > tr > td:last-child,.panel > .table-responsive > .table-bordered > tbody > tr > td:last-child,.panel > .table-bordered > tfoot > tr > td:last-child,.panel > .table-responsive > .table-bordered > tfoot > tr > td:last-child{border-right:0}
+.panel > .table-bordered > thead > tr:first-child > td,.panel > .table-responsive > .table-bordered > thead > tr:first-child > td,.panel > .table-bordered > tbody > tr:first-child > td,.panel > .table-responsive > .table-bordered > tbody > tr:first-child > td,.panel > .table-bordered > thead > tr:first-child > th,.panel > .table-responsive > .table-bordered > thead > tr:first-child > th,.panel > .table-bordered > tbody > tr:first-child > th,.panel > .table-responsive > .table-bordered > tbody > tr:first-child > th{border-bottom:0}
+.panel > .table-bordered > tbody > tr:last-child > td,.panel > .table-responsive > .table-bordered > tbody > tr:last-child > td,.panel > .table-bordered > tfoot > tr:last-child > td,.panel > .table-responsive > .table-bordered > tfoot > tr:last-child > td,.panel > .table-bordered > tbody > tr:last-child > th,.panel > .table-responsive > .table-bordered > tbody > tr:last-child > th,.panel > .table-bordered > tfoot > tr:last-child > th,.panel > .table-responsive > .table-bordered > tfoot > tr:last-child > th{border-bottom:0}
+.panel > .table-responsive{border:0;margin-bottom:0}
+.panel-group{margin-bottom:20px}
+.panel-group .panel{margin-bottom:0;border-radius:4px}
+.panel-group .panel + .panel{margin-top:5px}
+.panel-group .panel-heading{border-bottom:0}
+.panel-group .panel-heading + .panel-collapse > .panel-body{border-top:1px solid #ddd}
+.panel-group .panel-footer{border-top:0}
+.panel-group .panel-footer + .panel-collapse .panel-body{border-bottom:1px solid #ddd}
+.panel-default{border-color:#ddd}
+.panel-default > .panel-heading{color:#555;background-color:#f5f5f5;border-color:#ddd}
+.panel-default > .panel-heading + .panel-collapse > .panel-body{border-top-color:#ddd}
+.panel-default > .panel-heading .badge{color:#f5f5f5;background-color:#555}
+.panel-default > .panel-footer + .panel-collapse > .panel-body{border-bottom-color:#ddd}
+.panel-primary{border-color:#ddd}
+.panel-primary > .panel-heading{color:#fff;background-color:#2fa4e7;border-color:#ddd}
+.panel-primary > .panel-heading + .panel-collapse > .panel-body{border-top-color:#ddd}
+.panel-primary > .panel-heading .badge{color:#2fa4e7;background-color:#fff}
+.panel-primary > .panel-footer + .panel-collapse > .panel-body{border-bottom-color:#ddd}
+.panel-success{border-color:#ddd}
+.panel-success > .panel-heading{color:#468847;background-color:#73a839;border-color:#ddd}
+.panel-success > .panel-heading + .panel-collapse > .panel-body{border-top-color:#ddd}
+.panel-success > .panel-heading .badge{color:#73a839;background-color:#468847}
+.panel-success > .panel-footer + .panel-collapse > .panel-body{border-bottom-color:#ddd}
+.panel-info{border-color:#ddd}
+.panel-info > .panel-heading{color:#3a87ad;background-color:#033c73;border-color:#ddd}
+.panel-info > .panel-heading + .panel-collapse > .panel-body{border-top-color:#ddd}
+.panel-info > .panel-heading .badge{color:#033c73;background-color:#3a87ad}
+.panel-info > .panel-footer + .panel-collapse > .panel-body{border-bottom-color:#ddd}
+.panel-warning{border-color:#ddd}
+.panel-warning > .panel-heading{color:#c09853;background-color:#dd5600;border-color:#ddd}
+.panel-warning > .panel-heading + .panel-collapse > .panel-body{border-top-color:#ddd}
+.panel-warning > .panel-heading .badge{color:#dd5600;background-color:#c09853}
+.panel-warning > .panel-footer + .panel-collapse > .panel-body{border-bottom-color:#ddd}
+.panel-danger{border-color:#ddd}
+.panel-danger > .panel-heading{color:#b94a48;background-color:#c71c22;border-color:#ddd}
+.panel-danger > .panel-heading + .panel-collapse > .panel-body{border-top-color:#ddd}
+.panel-danger > .panel-heading .badge{color:#c71c22;background-color:#b94a48}
+.panel-danger > .panel-footer + .panel-collapse > .panel-body{border-bottom-color:#ddd}
+.embed-responsive{position:relative;display:block;height:0;padding:0;overflow:hidden}
+.embed-responsive .embed-responsive-item,.embed-responsive iframe,.embed-responsive embed,.embed-responsive object{position:absolute;top:0;left:0;bottom:0;height:100%;width:100%;border:0}
+.embed-responsive.embed-responsive-16by9{padding-bottom:56.25%}
+.embed-responsive.embed-responsive-4by3{padding-bottom:75%}
+.well{min-height:20px;padding:19px;margin-bottom:20px;background-color:#f5f5f5;border:1px solid #e3e3e3;border-radius:4px;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,0.05);box-shadow:inset 0 1px 1px rgba(0,0,0,0.05)}
+.well blockquote{border-color:#ddd;border-color:rgba(0,0,0,0.15)}
+.well-lg{padding:24px;border-radius:6px}
+.well-sm{padding:9px;border-radius:3px}
+.close{float:right;font-size:21px;font-weight:700;line-height:1;color:#000;text-shadow:0 1px 0 #fff;opacity:.2;filter:alpha(opacity=20)}
+.close:hover,.close:focus{color:#000;text-decoration:none;cursor:pointer;opacity:.5;filter:alpha(opacity=50)}
+button.close{padding:0;cursor:pointer;background:transparent;border:0;-webkit-appearance:none}
+.modal-open{overflow:hidden}
+.modal{display:none;overflow:hidden;position:fixed;top:0;right:0;bottom:0;left:0;z-index:1050;-webkit-overflow-scrolling:touch;outline:0}
+.modal.fade .modal-dialog{-webkit-transform:translate3d(0,-25%,0);transform:translate3d(0,-25%,0);-webkit-transition:-webkit-transform .3s ease-out;-moz-transition:-moz-transform .3s ease-out;-o-transition:-o-transform .3s ease-out;transition:transform .3s ease-out}
+.modal.in .modal-dialog{-webkit-transform:translate3d(0,0,0);transform:translate3d(0,0,0)}
+.modal-open .modal{overflow-x:hidden;overflow-y:auto}
+.modal-dialog{position:relative;width:auto;margin:10px}
+.modal-content{position:relative;background-color:#fff;border:1px solid #999;border:1px solid rgba(0,0,0,0.2);border-radius:6px;-webkit-box-shadow:0 3px 9px rgba(0,0,0,0.5);box-shadow:0 3px 9px rgba(0,0,0,0.5);background-clip:padding-box;outline:0}
+.modal-backdrop{position:fixed;top:0;right:0;bottom:0;left:0;z-index:1040;background-color:#000}
+.modal-backdrop.fade{opacity:0;filter:alpha(opacity=0)}
+.modal-backdrop.in{opacity:.5;filter:alpha(opacity=50)}
+.modal-header{padding:15px;border-bottom:1px solid #e5e5e5;min-height:16.42857143px}
+.modal-header .close{margin-top:-2px}
+.modal-title{margin:0;line-height:1.42857143}
+.modal-body{position:relative;padding:20px}
+.modal-footer{padding:20px;text-align:right;border-top:1px solid #e5e5e5}
+.modal-footer .btn + .btn{margin-left:5px;margin-bottom:0}
+.modal-footer .btn-group .btn + .btn{margin-left:-1px}
+.modal-footer .btn-block + .btn-block{margin-left:0}
+.modal-scrollbar-measure{position:absolute;top:-9999px;width:50px;height:50px;overflow:scroll}
+ at media (min-width: 768px) {
+.modal-dialog{width:600px;margin:30px auto}
+.modal-content{-webkit-box-shadow:0 5px 15px rgba(0,0,0,0.5);box-shadow:0 5px 15px rgba(0,0,0,0.5)}
+.modal-sm{width:300px}
+}
+ at media (min-width: 992px) {
+.modal-lg{width:900px}
+}
+.tooltip{position:absolute;z-index:1070;display:block;visibility:visible;font-size:12px;line-height:1.4;opacity:0;filter:alpha(opacity=0)}
+.tooltip.in{opacity:.9;filter:alpha(opacity=90)}
+.tooltip.top{margin-top:-3px;padding:5px 0}
+.tooltip.right{margin-left:3px;padding:0 5px}
+.tooltip.bottom{margin-top:3px;padding:5px 0}
+.tooltip.left{margin-left:-3px;padding:0 5px}
+.tooltip-inner{max-width:200px;padding:3px 8px;color:#fff;text-align:center;text-decoration:none;background-color:rgba(0,0,0,0.9);border-radius:4px}
+.tooltip-arrow{position:absolute;width:0;height:0;border-color:transparent;border-style:solid}
+.tooltip.top .tooltip-arrow{bottom:0;left:50%;margin-left:-5px;border-width:5px 5px 0;border-top-color:rgba(0,0,0,0.9)}
+.tooltip.top-left .tooltip-arrow{bottom:0;left:5px;border-width:5px 5px 0;border-top-color:rgba(0,0,0,0.9)}
+.tooltip.top-right .tooltip-arrow{bottom:0;right:5px;border-width:5px 5px 0;border-top-color:rgba(0,0,0,0.9)}
+.tooltip.right .tooltip-arrow{top:50%;left:0;margin-top:-5px;border-width:5px 5px 5px 0;border-right-color:rgba(0,0,0,0.9)}
+.tooltip.left .tooltip-arrow{top:50%;right:0;margin-top:-5px;border-width:5px 0 5px 5px;border-left-color:rgba(0,0,0,0.9)}
+.tooltip.bottom .tooltip-arrow{top:0;left:50%;margin-left:-5px;border-width:0 5px 5px;border-bottom-color:rgba(0,0,0,0.9)}
+.tooltip.bottom-left .tooltip-arrow{top:0;left:5px;border-width:0 5px 5px;border-bottom-color:rgba(0,0,0,0.9)}
+.tooltip.bottom-right .tooltip-arrow{top:0;right:5px;border-width:0 5px 5px;border-bottom-color:rgba(0,0,0,0.9)}
+.popover{position:absolute;top:0;left:0;z-index:1060;display:none;max-width:276px;padding:1px;text-align:left;background-color:#fff;background-clip:padding-box;border:1px solid #ccc;border:1px solid rgba(0,0,0,0.2);border-radius:6px;-webkit-box-shadow:0 5px 10px rgba(0,0,0,0.2);box-shadow:0 5px 10px rgba(0,0,0,0.2);white-space:normal}
+.popover.top{margin-top:-10px}
+.popover.right{margin-left:10px}
+.popover.bottom{margin-top:10px}
+.popover.left{margin-left:-10px}
+.popover-title{margin:0;padding:8px 14px;font-size:14px;font-weight:400;line-height:18px;background-color:#f7f7f7;border-bottom:1px solid #ebebeb;border-radius:5px 5px 0 0}
+.popover-content{padding:9px 14px}
+.popover > .arrow,.popover > .arrow:after{position:absolute;display:block;width:0;height:0;border-color:transparent;border-style:solid}
+.popover > .arrow{border-width:11px}
+.popover > .arrow:after{border-width:10px;content:""}
+.popover.top > .arrow{left:50%;margin-left:-11px;border-bottom-width:0;border-top-color:#999;border-top-color:rgba(0,0,0,0.25);bottom:-11px}
+.popover.top > .arrow:after{content:" ";bottom:1px;margin-left:-10px;border-bottom-width:0;border-top-color:#fff}
+.popover.right > .arrow{top:50%;left:-11px;margin-top:-11px;border-left-width:0;border-right-color:#999;border-right-color:rgba(0,0,0,0.25)}
+.popover.right > .arrow:after{content:" ";left:1px;bottom:-10px;border-left-width:0;border-right-color:#fff}
+.popover.bottom > .arrow{left:50%;margin-left:-11px;border-top-width:0;border-bottom-color:#999;border-bottom-color:rgba(0,0,0,0.25);top:-11px}
+.popover.bottom > .arrow:after{content:" ";top:1px;margin-left:-10px;border-top-width:0;border-bottom-color:#fff}
+.popover.left > .arrow{top:50%;right:-11px;margin-top:-11px;border-right-width:0;border-left-color:#999;border-left-color:rgba(0,0,0,0.25)}
+.popover.left > .arrow:after{content:" ";right:1px;border-right-width:0;border-left-color:#fff;bottom:-10px}
+.carousel{position:relative}
+.carousel-inner{position:relative;overflow:hidden;width:100%}
+.carousel-inner > .item{display:none;position:relative;-webkit-transition:.6s ease-in-out left;-o-transition:.6s ease-in-out left;transition:.6s ease-in-out left}
+.carousel-inner > .item > img,.carousel-inner > .item > a > img{line-height:1}
+.carousel-inner > .active,.carousel-inner > .next,.carousel-inner > .prev{display:block}
+.carousel-inner > .active{left:0}
+.carousel-inner > .next,.carousel-inner > .prev{position:absolute;top:0;width:100%}
+.carousel-inner > .next{left:100%}
+.carousel-inner > .prev{left:-100%}
+.carousel-inner > .next.left,.carousel-inner > .prev.right{left:0}
+.carousel-inner > .active.left{left:-100%}
+.carousel-inner > .active.right{left:100%}
+.carousel-control{position:absolute;top:0;left:0;bottom:0;width:15%;opacity:.5;filter:alpha(opacity=50);font-size:20px;color:#fff;text-align:center;text-shadow:0 1px 2px rgba(0,0,0,0.6)}
+.carousel-control.left{background-image:-webkit-linear-gradient(left,rgba(0,0,0,0.5) 0%,rgba(0,0,0,0.0001) 100%);background-image:-o-linear-gradient(left,rgba(0,0,0,0.5) 0%,rgba(0,0,0,0.0001) 100%);background-image:linear-gradient(to right,rgba(0,0,0,0.5) 0%,rgba(0,0,0,0.0001) 100%);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#80000000',endColorstr='#00000000',GradientType=1)}
+.carousel-control.right{left:auto;right:0;background-image:-webkit-linear-gradient(left,rgba(0,0,0,0.0001) 0%,rgba(0,0,0,0.5) 100%);background-image:-o-linear-gradient(left,rgba(0,0,0,0.0001) 0%,rgba(0,0,0,0.5) 100%);background-image:linear-gradient(to right,rgba(0,0,0,0.0001) 0%,rgba(0,0,0,0.5) 100%);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#00000000',endColorstr='#80000000',GradientType=1)}
+.carousel-control:hover,.carousel-control:focus{outline:0;color:#fff;text-decoration:none;opacity:.9;filter:alpha(opacity=90)}
+.carousel-control .icon-prev,.carousel-control .icon-next,.carousel-control .glyphicon-chevron-left,.carousel-control .glyphicon-chevron-right{position:absolute;top:50%;z-index:5;display:inline-block}
+.carousel-control .icon-prev,.carousel-control .glyphicon-chevron-left{left:50%;margin-left:-10px}
+.carousel-control .icon-next,.carousel-control .glyphicon-chevron-right{right:50%;margin-right:-10px}
+.carousel-control .icon-prev,.carousel-control .icon-next{width:20px;height:20px;margin-top:-10px;font-family:serif}
+.carousel-control .icon-prev:before{content:'\2039'}
+.carousel-control .icon-next:before{content:'\203a'}
+.carousel-indicators{position:absolute;bottom:10px;left:50%;z-index:15;width:60%;margin-left:-30%;padding-left:0;list-style:none;text-align:center}
+.carousel-indicators li{display:inline-block;width:10px;height:10px;margin:1px;text-indent:-999px;border:1px solid #fff;border-radius:10px;cursor:pointer;background-color:#000 \9;background-color:rgba(0,0,0,0)}
+.carousel-indicators .active{margin:0;width:12px;height:12px;background-color:#fff}
+.carousel-caption{position:absolute;left:15%;right:15%;bottom:20px;z-index:10;padding-top:20px;padding-bottom:20px;color:#fff;text-align:center;text-shadow:0 1px 2px rgba(0,0,0,0.6)}
+.carousel-caption .btn{text-shadow:none}
+ at media screen and (min-width: 768px) {
+.carousel-control .glyphicon-chevron-left,.carousel-control .glyphicon-chevron-right,.carousel-control .icon-prev,.carousel-control .icon-next{width:30px;height:30px;margin-top:-15px;font-size:30px}
+.carousel-control .glyphicon-chevron-left,.carousel-control .icon-prev{margin-left:-15px}
+.carousel-control .glyphicon-chevron-right,.carousel-control .icon-next{margin-right:-15px}
+.carousel-caption{left:20%;right:20%;padding-bottom:30px}
+.carousel-indicators{bottom:20px}
+}
+.clearfix:before,.clearfix:after,.dl-horizontal dd:before,.dl-horizontal dd:after,.container:before,.container:after,.container-fluid:before,.container-fluid:after,.row:before,.row:after,.form-horizontal .form-group:before,.form-horizontal .form-group:after,.btn-toolbar:before,.btn-toolbar:after,.btn-group-vertical > .btn-group:before,.btn-group-vertical > .btn-group:after,.nav:before,.nav:after,.navbar:before,.navbar:after,.navbar-header:before,.navbar-header:after,.navbar-collapse:before,.navbar-collapse:after,.pager:before,.pager:after,.panel-body:before,.panel-body:after,.modal-footer:before,.modal-footer:after{content:" ";display:table}
+.clearfix:after,.dl-horizontal dd:after,.container:after,.container-fluid:after,.row:after,.form-horizontal .form-group:after,.btn-toolbar:after,.btn-group-vertical > .btn-group:after,.nav:after,.navbar:after,.navbar-header:after,.navbar-collapse:after,.pager:after,.panel-body:after,.modal-footer:after{clear:both}
+.center-block{display:block;margin-left:auto;margin-right:auto}
+.pull-right{float:right!important}
+.pull-left{float:left!important}
+.hide{display:none!important}
+.show{display:block!important}
+.invisible{visibility:hidden}
+.text-hide{font:0/0 a;color:transparent;text-shadow:none;background-color:transparent;border:0}
+.hidden{display:none!important;visibility:hidden!important}
+.affix{position:fixed;-webkit-transform:translate3d(0,0,0);transform:translate3d(0,0,0)}
+.visible-xs,.visible-sm,.visible-md,.visible-lg{display:none!important}
+.visible-xs-block,.visible-xs-inline,.visible-xs-inline-block,.visible-sm-block,.visible-sm-inline,.visible-sm-inline-block,.visible-md-block,.visible-md-inline,.visible-md-inline-block,.visible-lg-block,.visible-lg-inline,.visible-lg-inline-block{display:none!important}
+ at media (max-width: 767px) {
+.visible-xs{display:block!important}
+table.visible-xs{display:table}
+tr.visible-xs{display:table-row!important}
+th.visible-xs,td.visible-xs{display:table-cell!important}
+}
+ at media (max-width: 767px) {
+.visible-xs-block{display:block!important}
+}
+ at media (max-width: 767px) {
+.visible-xs-inline{display:inline!important}
+}
+ at media (max-width: 767px) {
+.visible-xs-inline-block{display:inline-block!important}
+}
+ at media (min-width: 768px) and (max-width: 991px) {
+.visible-sm{display:block!important}
+table.visible-sm{display:table}
+tr.visible-sm{display:table-row!important}
+th.visible-sm,td.visible-sm{display:table-cell!important}
+.visible-sm-block{display:block!important}
+.visible-sm-inline{display:inline!important}
+.visible-sm-inline-block{display:inline-block!important}
+}
+ at media (min-width: 992px) and (max-width: 1199px) {
+.visible-md{display:block!important}
+table.visible-md{display:table}
+tr.visible-md{display:table-row!important}
+th.visible-md,td.visible-md{display:table-cell!important}
+.visible-md-block{display:block!important}
+.visible-md-inline{display:inline!important}
+.visible-md-inline-block{display:inline-block!important}
+}
+ at media (min-width: 1200px) {
+.visible-lg{display:block!important}
+table.visible-lg{display:table}
+tr.visible-lg{display:table-row!important}
+th.visible-lg,td.visible-lg{display:table-cell!important}
+}
+ at media (min-width: 1200px) {
+.visible-lg-block{display:block!important}
+}
+ at media (min-width: 1200px) {
+.visible-lg-inline{display:inline!important}
+}
+ at media (min-width: 1200px) {
+.visible-lg-inline-block{display:inline-block!important}
+}
+ at media (max-width: 767px) {
+.hidden-xs{display:none!important}
+}
+ at media (min-width: 768px) and (max-width: 991px) {
+.hidden-sm{display:none!important}
+}
+ at media (min-width: 992px) and (max-width: 1199px) {
+.hidden-md{display:none!important}
+}
+ at media (min-width: 1200px) {
+.hidden-lg{display:none!important}
+}
+.visible-print{display:none!important}
+ at media print {
+.visible-print{display:block!important}
+table.visible-print{display:table}
+tr.visible-print{display:table-row!important}
+th.visible-print,td.visible-print{display:table-cell!important}
+}
+.visible-print-block{display:none!important}
+ at media print {
+.visible-print-block{display:block!important}
+}
+.visible-print-inline{display:none!important}
+ at media print {
+.visible-print-inline{display:inline!important}
+}
+.visible-print-inline-block{display:none!important}
+ at media print {
+.visible-print-inline-block{display:inline-block!important}
+}
+ at media print {
+.hidden-print{display:none!important}
+}
+.navbar{background-image:-webkit-linear-gradient(#54b4eb,#2fa4e7 60%,#1d9ce5);background-image:-o-linear-gradient(#54b4eb,#2fa4e7 60%,#1d9ce5);background-image:linear-gradient(#54b4eb,#2fa4e7 60%,#1d9ce5);background-repeat:no-repeat;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff54b4eb',endColorstr='#ff1d9ce5',GradientType=0);border-bottom:1px solid #178acc;filter:none;-webkit-box-shadow:0 1px 10px rgba(0,0,0,0.1);box-shadow:0 1px 10px rgba(0,0,0,0.1)}
+.navbar-default .badge{background-color:#fff;color:#2fa4e7}
+.navbar-inverse{background-image:-webkit-linear-gradient(#04519b,#044687 60%,#033769);background-image:-o-linear-gradient(#04519b,#044687 60%,#033769);background-image:linear-gradient(#04519b,#044687 60%,#033769);background-repeat:no-repeat;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff04519b',endColorstr='#ff033769',GradientType=0);filter:none;border-bottom:1px solid #022241}
+.navbar-inverse .badge{background-color:#fff;color:#033c73}
+.navbar .navbar-nav > li > a,.navbar-brand{text-shadow:0 1px 0 rgba(0,0,0,0.1)}
+ at media (max-width: 767px) {
+.navbar .dropdown-header{color:#fff}
+}
+.btn{text-shadow:0 1px 0 rgba(0,0,0,0.1)}
+.btn .caret{border-top-color:#fff}
+.btn-default{background-image:-webkit-linear-gradient(#fff,#fff 60%,#f5f5f5);background-image:-o-linear-gradient(#fff,#fff 60%,#f5f5f5);background-image:linear-gradient(#fff,#fff 60%,#f5f5f5);background-repeat:no-repeat;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff',endColorstr='#fff5f5f5',GradientType=0);filter:none;border-bottom:1px solid #e6e6e6}
+.btn-default:hover{color:#555}
+.btn-default .caret{border-top-color:#555}
+.btn-default{background-image:-webkit-linear-gradient(#fff,#fff 60%,#f5f5f5);background-image:-o-linear-gradient(#fff,#fff 60%,#f5f5f5);background-image:linear-gradient(#fff,#fff 60%,#f5f5f5);background-repeat:no-repeat;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff',endColorstr='#fff5f5f5',GradientType=0);filter:none;border-bottom:1px solid #e6e6e6}
+.btn-primary{background-image:-webkit-linear-gradient(#54b4eb,#2fa4e7 60%,#1d9ce5);background-image:-o-linear-gradient(#54b4eb,#2fa4e7 60%,#1d9ce5);background-image:linear-gradient(#54b4eb,#2fa4e7 60%,#1d9ce5);background-repeat:no-repeat;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff54b4eb',endColorstr='#ff1d9ce5',GradientType=0);filter:none;border-bottom:1px solid #178acc}
+.btn-success{background-image:-webkit-linear-gradient(#88c149,#73a839 60%,#699934);background-image:-o-linear-gradient(#88c149,#73a839 60%,#699934);background-image:linear-gradient(#88c149,#73a839 60%,#699934);background-repeat:no-repeat;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff88c149',endColorstr='#ff699934',GradientType=0);filter:none;border-bottom:1px solid #59822c}
+.btn-info{background-image:-webkit-linear-gradient(#04519b,#033c73 60%,#02325f);background-image:-o-linear-gradient(#04519b,#033c73 60%,#02325f);background-image:linear-gradient(#04519b,#033c73 60%,#02325f);background-repeat:no-repeat;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff04519b',endColorstr='#ff02325f',GradientType=0);filter:none;border-bottom:1px solid #022241}
+.btn-warning{background-image:-webkit-linear-gradient(#ff6707,#dd5600 60%,#c94e00);background-image:-o-linear-gradient(#ff6707,#dd5600 60%,#c94e00);background-image:linear-gradient(#ff6707,#dd5600 60%,#c94e00);background-repeat:no-repeat;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffff6707',endColorstr='#ffc94e00',GradientType=0);filter:none;border-bottom:1px solid #aa4200}
+.btn-danger{background-image:-webkit-linear-gradient(#e12b31,#c71c22 60%,#b5191f);background-image:-o-linear-gradient(#e12b31,#c71c22 60%,#b5191f);background-image:linear-gradient(#e12b31,#c71c22 60%,#b5191f);background-repeat:no-repeat;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffe12b31',endColorstr='#ffb5191f',GradientType=0);filter:none;border-bottom:1px solid #9a161a}
+.panel-primary .panel-heading,.panel-success .panel-heading,.panel-warning .panel-heading,.panel-danger .panel-heading,.panel-info .panel-heading,.panel-primary .panel-title,.panel-success .panel-title,.panel-warning .panel-title,.panel-danger .panel-title,.panel-info .panel-title{color:#fff}
diff --git a/docs/js/bootstrap.js b/docs/js/bootstrap.js
deleted file mode 100644
index 6c15a58..0000000
--- a/docs/js/bootstrap.js
+++ /dev/null
@@ -1,2159 +0,0 @@
-/* ===================================================
- * bootstrap-transition.js v2.2.2
- * http://twitter.github.com/bootstrap/javascript.html#transitions
- * ===================================================
- * Copyright 2012 Twitter, Inc.
- *
- * Licensed under the Apache License, Version 2.0 (the "License");
- * you may not use this file except in compliance with the License.
- * You may obtain a copy of the License at
- *
- * http://www.apache.org/licenses/LICENSE-2.0
- *
- * Unless required by applicable law or agreed to in writing, software
- * distributed under the License is distributed on an "AS IS" BASIS,
- * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
- * See the License for the specific language governing permissions and
- * limitations under the License.
- * ========================================================== */
-
-
-!function ($) {
-
-  "use strict"; // jshint ;_;
-
-
-  /* CSS TRANSITION SUPPORT (http://www.modernizr.com/)
-   * ======================================================= */
-
-  $(function () {
-
-    $.support.transition = (function () {
-
-      var transitionEnd = (function () {
-
-        var el = document.createElement('bootstrap')
-          , transEndEventNames = {
-               'WebkitTransition' : 'webkitTransitionEnd'
-            ,  'MozTransition'    : 'transitionend'
-            ,  'OTransition'      : 'oTransitionEnd otransitionend'
-            ,  'transition'       : 'transitionend'
-            }
-          , name
-
-        for (name in transEndEventNames){
-          if (el.style[name] !== undefined) {
-            return transEndEventNames[name]
-          }
-        }
-
-      }())
-
-      return transitionEnd && {
-        end: transitionEnd
-      }
-
-    })()
-
-  })
-
-}(window.jQuery);/* ==========================================================
- * bootstrap-alert.js v2.2.2
- * http://twitter.github.com/bootstrap/javascript.html#alerts
- * ==========================================================
- * Copyright 2012 Twitter, Inc.
- *
- * Licensed under the Apache License, Version 2.0 (the "License");
- * you may not use this file except in compliance with the License.
- * You may obtain a copy of the License at
- *
- * http://www.apache.org/licenses/LICENSE-2.0
- *
- * Unless required by applicable law or agreed to in writing, software
- * distributed under the License is distributed on an "AS IS" BASIS,
- * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
- * See the License for the specific language governing permissions and
- * limitations under the License.
- * ========================================================== */
-
-
-!function ($) {
-
-  "use strict"; // jshint ;_;
-
-
- /* ALERT CLASS DEFINITION
-  * ====================== */
-
-  var dismiss = '[data-dismiss="alert"]'
-    , Alert = function (el) {
-        $(el).on('click', dismiss, this.close)
-      }
-
-  Alert.prototype.close = function (e) {
-    var $this = $(this)
-      , selector = $this.attr('data-target')
-      , $parent
-
-    if (!selector) {
-      selector = $this.attr('href')
-      selector = selector && selector.replace(/.*(?=#[^\s]*$)/, '') //strip for ie7
-    }
-
-    $parent = $(selector)
-
-    e && e.preventDefault()
-
-    $parent.length || ($parent = $this.hasClass('alert') ? $this : $this.parent())
-
-    $parent.trigger(e = $.Event('close'))
-
-    if (e.isDefaultPrevented()) return
-
-    $parent.removeClass('in')
-
-    function removeElement() {
-      $parent
-        .trigger('closed')
-        .remove()
-    }
-
-    $.support.transition && $parent.hasClass('fade') ?
-      $parent.on($.support.transition.end, removeElement) :
-      removeElement()
-  }
-
-
- /* ALERT PLUGIN DEFINITION
-  * ======================= */
-
-  var old = $.fn.alert
-
-  $.fn.alert = function (option) {
-    return this.each(function () {
-      var $this = $(this)
-        , data = $this.data('alert')
-      if (!data) $this.data('alert', (data = new Alert(this)))
-      if (typeof option == 'string') data[option].call($this)
-    })
-  }
-
-  $.fn.alert.Constructor = Alert
-
-
- /* ALERT NO CONFLICT
-  * ================= */
-
-  $.fn.alert.noConflict = function () {
-    $.fn.alert = old
-    return this
-  }
-
-
- /* ALERT DATA-API
-  * ============== */
-
-  $(document).on('click.alert.data-api', dismiss, Alert.prototype.close)
-
-}(window.jQuery);/* ============================================================
- * bootstrap-button.js v2.2.2
- * http://twitter.github.com/bootstrap/javascript.html#buttons
- * ============================================================
- * Copyright 2012 Twitter, Inc.
- *
- * Licensed under the Apache License, Version 2.0 (the "License");
- * you may not use this file except in compliance with the License.
- * You may obtain a copy of the License at
- *
- * http://www.apache.org/licenses/LICENSE-2.0
- *
- * Unless required by applicable law or agreed to in writing, software
- * distributed under the License is distributed on an "AS IS" BASIS,
- * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
- * See the License for the specific language governing permissions and
- * limitations under the License.
- * ============================================================ */
-
-
-!function ($) {
-
-  "use strict"; // jshint ;_;
-
-
- /* BUTTON PUBLIC CLASS DEFINITION
-  * ============================== */
-
-  var Button = function (element, options) {
-    this.$element = $(element)
-    this.options = $.extend({}, $.fn.button.defaults, options)
-  }
-
-  Button.prototype.setState = function (state) {
-    var d = 'disabled'
-      , $el = this.$element
-      , data = $el.data()
-      , val = $el.is('input') ? 'val' : 'html'
-
-    state = state + 'Text'
-    data.resetText || $el.data('resetText', $el[val]())
-
-    $el[val](data[state] || this.options[state])
-
-    // push to event loop to allow forms to submit
-    setTimeout(function () {
-      state == 'loadingText' ?
-        $el.addClass(d).attr(d, d) :
-        $el.removeClass(d).removeAttr(d)
-    }, 0)
-  }
-
-  Button.prototype.toggle = function () {
-    var $parent = this.$element.closest('[data-toggle="buttons-radio"]')
-
-    $parent && $parent
-      .find('.active')
-      .removeClass('active')
-
-    this.$element.toggleClass('active')
-  }
-
-
- /* BUTTON PLUGIN DEFINITION
-  * ======================== */
-
-  var old = $.fn.button
-
-  $.fn.button = function (option) {
-    return this.each(function () {
-      var $this = $(this)
-        , data = $this.data('button')
-        , options = typeof option == 'object' && option
-      if (!data) $this.data('button', (data = new Button(this, options)))
-      if (option == 'toggle') data.toggle()
-      else if (option) data.setState(option)
-    })
-  }
-
-  $.fn.button.defaults = {
-    loadingText: 'loading...'
-  }
-
-  $.fn.button.Constructor = Button
-
-
- /* BUTTON NO CONFLICT
-  * ================== */
-
-  $.fn.button.noConflict = function () {
-    $.fn.button = old
-    return this
-  }
-
-
- /* BUTTON DATA-API
-  * =============== */
-
-  $(document).on('click.button.data-api', '[data-toggle^=button]', function (e) {
-    var $btn = $(e.target)
-    if (!$btn.hasClass('btn')) $btn = $btn.closest('.btn')
-    $btn.button('toggle')
-  })
-
-}(window.jQuery);/* ==========================================================
- * bootstrap-carousel.js v2.2.2
- * http://twitter.github.com/bootstrap/javascript.html#carousel
- * ==========================================================
- * Copyright 2012 Twitter, Inc.
- *
- * Licensed under the Apache License, Version 2.0 (the "License");
- * you may not use this file except in compliance with the License.
- * You may obtain a copy of the License at
- *
- * http://www.apache.org/licenses/LICENSE-2.0
- *
- * Unless required by applicable law or agreed to in writing, software
- * distributed under the License is distributed on an "AS IS" BASIS,
- * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
- * See the License for the specific language governing permissions and
- * limitations under the License.
- * ========================================================== */
-
-
-!function ($) {
-
-  "use strict"; // jshint ;_;
-
-
- /* CAROUSEL CLASS DEFINITION
-  * ========================= */
-
-  var Carousel = function (element, options) {
-    this.$element = $(element)
-    this.options = options
-    this.options.pause == 'hover' && this.$element
-      .on('mouseenter', $.proxy(this.pause, this))
-      .on('mouseleave', $.proxy(this.cycle, this))
-  }
-
-  Carousel.prototype = {
-
-    cycle: function (e) {
-      if (!e) this.paused = false
-      this.options.interval
-        && !this.paused
-        && (this.interval = setInterval($.proxy(this.next, this), this.options.interval))
-      return this
-    }
-
-  , to: function (pos) {
-      var $active = this.$element.find('.item.active')
-        , children = $active.parent().children()
-        , activePos = children.index($active)
-        , that = this
-
-      if (pos > (children.length - 1) || pos < 0) return
-
-      if (this.sliding) {
-        return this.$element.one('slid', function () {
-          that.to(pos)
-        })
-      }
-
-      if (activePos == pos) {
-        return this.pause().cycle()
-      }
-
-      return this.slide(pos > activePos ? 'next' : 'prev', $(children[pos]))
-    }
-
-  , pause: function (e) {
-      if (!e) this.paused = true
-      if (this.$element.find('.next, .prev').length && $.support.transition.end) {
-        this.$element.trigger($.support.transition.end)
-        this.cycle()
-      }
-      clearInterval(this.interval)
-      this.interval = null
-      return this
-    }
-
-  , next: function () {
-      if (this.sliding) return
-      return this.slide('next')
-    }
-
-  , prev: function () {
-      if (this.sliding) return
-      return this.slide('prev')
-    }
-
-  , slide: function (type, next) {
-      var $active = this.$element.find('.item.active')
-        , $next = next || $active[type]()
-        , isCycling = this.interval
-        , direction = type == 'next' ? 'left' : 'right'
-        , fallback  = type == 'next' ? 'first' : 'last'
-        , that = this
-        , e
-
-      this.sliding = true
-
-      isCycling && this.pause()
-
-      $next = $next.length ? $next : this.$element.find('.item')[fallback]()
-
-      e = $.Event('slide', {
-        relatedTarget: $next[0]
-      })
-
-      if ($next.hasClass('active')) return
-
-      if ($.support.transition && this.$element.hasClass('slide')) {
-        this.$element.trigger(e)
-        if (e.isDefaultPrevented()) return
-        $next.addClass(type)
-        $next[0].offsetWidth // force reflow
-        $active.addClass(direction)
-        $next.addClass(direction)
-        this.$element.one($.support.transition.end, function () {
-          $next.removeClass([type, direction].join(' ')).addClass('active')
-          $active.removeClass(['active', direction].join(' '))
-          that.sliding = false
-          setTimeout(function () { that.$element.trigger('slid') }, 0)
-        })
-      } else {
-        this.$element.trigger(e)
-        if (e.isDefaultPrevented()) return
-        $active.removeClass('active')
-        $next.addClass('active')
-        this.sliding = false
-        this.$element.trigger('slid')
-      }
-
-      isCycling && this.cycle()
-
-      return this
-    }
-
-  }
-
-
- /* CAROUSEL PLUGIN DEFINITION
-  * ========================== */
-
-  var old = $.fn.carousel
-
-  $.fn.carousel = function (option) {
-    return this.each(function () {
-      var $this = $(this)
-        , data = $this.data('carousel')
-        , options = $.extend({}, $.fn.carousel.defaults, typeof option == 'object' && option)
-        , action = typeof option == 'string' ? option : options.slide
-      if (!data) $this.data('carousel', (data = new Carousel(this, options)))
-      if (typeof option == 'number') data.to(option)
-      else if (action) data[action]()
-      else if (options.interval) data.cycle()
-    })
-  }
-
-  $.fn.carousel.defaults = {
-    interval: 5000
-  , pause: 'hover'
-  }
-
-  $.fn.carousel.Constructor = Carousel
-
-
- /* CAROUSEL NO CONFLICT
-  * ==================== */
-
-  $.fn.carousel.noConflict = function () {
-    $.fn.carousel = old
-    return this
-  }
-
- /* CAROUSEL DATA-API
-  * ================= */
-
-  $(document).on('click.carousel.data-api', '[data-slide]', function (e) {
-    var $this = $(this), href
-      , $target = $($this.attr('data-target') || (href = $this.attr('href')) && href.replace(/.*(?=#[^\s]+$)/, '')) //strip for ie7
-      , options = $.extend({}, $target.data(), $this.data())
-    $target.carousel(options)
-    e.preventDefault()
-  })
-
-}(window.jQuery);/* =============================================================
- * bootstrap-collapse.js v2.2.2
- * http://twitter.github.com/bootstrap/javascript.html#collapse
- * =============================================================
- * Copyright 2012 Twitter, Inc.
- *
- * Licensed under the Apache License, Version 2.0 (the "License");
- * you may not use this file except in compliance with the License.
- * You may obtain a copy of the License at
- *
- * http://www.apache.org/licenses/LICENSE-2.0
- *
- * Unless required by applicable law or agreed to in writing, software
- * distributed under the License is distributed on an "AS IS" BASIS,
- * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
- * See the License for the specific language governing permissions and
- * limitations under the License.
- * ============================================================ */
-
-
-!function ($) {
-
-  "use strict"; // jshint ;_;
-
-
- /* COLLAPSE PUBLIC CLASS DEFINITION
-  * ================================ */
-
-  var Collapse = function (element, options) {
-    this.$element = $(element)
-    this.options = $.extend({}, $.fn.collapse.defaults, options)
-
-    if (this.options.parent) {
-      this.$parent = $(this.options.parent)
-    }
-
-    this.options.toggle && this.toggle()
-  }
-
-  Collapse.prototype = {
-
-    constructor: Collapse
-
-  , dimension: function () {
-      var hasWidth = this.$element.hasClass('width')
-      return hasWidth ? 'width' : 'height'
-    }
-
-  , show: function () {
-      var dimension
-        , scroll
-        , actives
-        , hasData
-
-      if (this.transitioning) return
-
-      dimension = this.dimension()
-      scroll = $.camelCase(['scroll', dimension].join('-'))
-      actives = this.$parent && this.$parent.find('> .accordion-group > .in')
-
-      if (actives && actives.length) {
-        hasData = actives.data('collapse')
-        if (hasData && hasData.transitioning) return
-        actives.collapse('hide')
-        hasData || actives.data('collapse', null)
-      }
-
-      this.$element[dimension](0)
-      this.transition('addClass', $.Event('show'), 'shown')
-      $.support.transition && this.$element[dimension](this.$element[0][scroll])
-    }
-
-  , hide: function () {
-      var dimension
-      if (this.transitioning) return
-      dimension = this.dimension()
-      this.reset(this.$element[dimension]())
-      this.transition('removeClass', $.Event('hide'), 'hidden')
-      this.$element[dimension](0)
-    }
-
-  , reset: function (size) {
-      var dimension = this.dimension()
-
-      this.$element
-        .removeClass('collapse')
-        [dimension](size || 'auto')
-        [0].offsetWidth
-
-      this.$element[size !== null ? 'addClass' : 'removeClass']('collapse')
-
-      return this
-    }
-
-  , transition: function (method, startEvent, completeEvent) {
-      var that = this
-        , complete = function () {
-            if (startEvent.type == 'show') that.reset()
-            that.transitioning = 0
-            that.$element.trigger(completeEvent)
-          }
-
-      this.$element.trigger(startEvent)
-
-      if (startEvent.isDefaultPrevented()) return
-
-      this.transitioning = 1
-
-      this.$element[method]('in')
-
-      $.support.transition && this.$element.hasClass('collapse') ?
-        this.$element.one($.support.transition.end, complete) :
-        complete()
-    }
-
-  , toggle: function () {
-      this[this.$element.hasClass('in') ? 'hide' : 'show']()
-    }
-
-  }
-
-
- /* COLLAPSE PLUGIN DEFINITION
-  * ========================== */
-
-  var old = $.fn.collapse
-
-  $.fn.collapse = function (option) {
-    return this.each(function () {
-      var $this = $(this)
-        , data = $this.data('collapse')
-        , options = typeof option == 'object' && option
-      if (!data) $this.data('collapse', (data = new Collapse(this, options)))
-      if (typeof option == 'string') data[option]()
-    })
-  }
-
-  $.fn.collapse.defaults = {
-    toggle: true
-  }
-
-  $.fn.collapse.Constructor = Collapse
-
-
- /* COLLAPSE NO CONFLICT
-  * ==================== */
-
-  $.fn.collapse.noConflict = function () {
-    $.fn.collapse = old
-    return this
-  }
-
-
- /* COLLAPSE DATA-API
-  * ================= */
-
-  $(document).on('click.collapse.data-api', '[data-toggle=collapse]', function (e) {
-    var $this = $(this), href
-      , target = $this.attr('data-target')
-        || e.preventDefault()
-        || (href = $this.attr('href')) && href.replace(/.*(?=#[^\s]+$)/, '') //strip for ie7
-      , option = $(target).data('collapse') ? 'toggle' : $this.data()
-    $this[$(target).hasClass('in') ? 'addClass' : 'removeClass']('collapsed')
-    $(target).collapse(option)
-  })
-
-}(window.jQuery);/* ============================================================
- * bootstrap-dropdown.js v2.2.2
- * http://twitter.github.com/bootstrap/javascript.html#dropdowns
- * ============================================================
- * Copyright 2012 Twitter, Inc.
- *
- * Licensed under the Apache License, Version 2.0 (the "License");
- * you may not use this file except in compliance with the License.
- * You may obtain a copy of the License at
- *
- * http://www.apache.org/licenses/LICENSE-2.0
- *
- * Unless required by applicable law or agreed to in writing, software
- * distributed under the License is distributed on an "AS IS" BASIS,
- * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
- * See the License for the specific language governing permissions and
- * limitations under the License.
- * ============================================================ */
-
-
-!function ($) {
-
-  "use strict"; // jshint ;_;
-
-
- /* DROPDOWN CLASS DEFINITION
-  * ========================= */
-
-  var toggle = '[data-toggle=dropdown]'
-    , Dropdown = function (element) {
-        var $el = $(element).on('click.dropdown.data-api', this.toggle)
-        $('html').on('click.dropdown.data-api', function () {
-          $el.parent().removeClass('open')
-        })
-      }
-
-  Dropdown.prototype = {
-
-    constructor: Dropdown
-
-  , toggle: function (e) {
-      var $this = $(this)
-        , $parent
-        , isActive
-
-      if ($this.is('.disabled, :disabled')) return
-
-      $parent = getParent($this)
-
-      isActive = $parent.hasClass('open')
-
-      clearMenus()
-
-      if (!isActive) {
-        $parent.toggleClass('open')
-      }
-
-      $this.focus()
-
-      return false
-    }
-
-  , keydown: function (e) {
-      var $this
-        , $items
-        , $active
-        , $parent
-        , isActive
-        , index
-
-      if (!/(38|40|27)/.test(e.keyCode)) return
-
-      $this = $(this)
-
-      e.preventDefault()
-      e.stopPropagation()
-
-      if ($this.is('.disabled, :disabled')) return
-
-      $parent = getParent($this)
-
-      isActive = $parent.hasClass('open')
-
-      if (!isActive || (isActive && e.keyCode == 27)) return $this.click()
-
-      $items = $('[role=menu] li:not(.divider):visible a', $parent)
-
-      if (!$items.length) return
-
-      index = $items.index($items.filter(':focus'))
-
-      if (e.keyCode == 38 && index > 0) index--                                        // up
-      if (e.keyCode == 40 && index < $items.length - 1) index++                        // down
-      if (!~index) index = 0
-
-      $items
-        .eq(index)
-        .focus()
-    }
-
-  }
-
-  function clearMenus() {
-    $(toggle).each(function () {
-      getParent($(this)).removeClass('open')
-    })
-  }
-
-  function getParent($this) {
-    var selector = $this.attr('data-target')
-      , $parent
-
-    if (!selector) {
-      selector = $this.attr('href')
-      selector = selector && /#/.test(selector) && selector.replace(/.*(?=#[^\s]*$)/, '') //strip for ie7
-    }
-
-    $parent = $(selector)
-    $parent.length || ($parent = $this.parent())
-
-    return $parent
-  }
-
-
-  /* DROPDOWN PLUGIN DEFINITION
-   * ========================== */
-
-  var old = $.fn.dropdown
-
-  $.fn.dropdown = function (option) {
-    return this.each(function () {
-      var $this = $(this)
-        , data = $this.data('dropdown')
-      if (!data) $this.data('dropdown', (data = new Dropdown(this)))
-      if (typeof option == 'string') data[option].call($this)
-    })
-  }
-
-  $.fn.dropdown.Constructor = Dropdown
-
-
- /* DROPDOWN NO CONFLICT
-  * ==================== */
-
-  $.fn.dropdown.noConflict = function () {
-    $.fn.dropdown = old
-    return this
-  }
-
-
-  /* APPLY TO STANDARD DROPDOWN ELEMENTS
-   * =================================== */
-
-  $(document)
-    .on('click.dropdown.data-api touchstart.dropdown.data-api', clearMenus)
-    .on('click.dropdown touchstart.dropdown.data-api', '.dropdown form', function (e) { e.stopPropagation() })
-    .on('touchstart.dropdown.data-api', '.dropdown-menu', function (e) { e.stopPropagation() })
-    .on('click.dropdown.data-api touchstart.dropdown.data-api'  , toggle, Dropdown.prototype.toggle)
-    .on('keydown.dropdown.data-api touchstart.dropdown.data-api', toggle + ', [role=menu]' , Dropdown.prototype.keydown)
-
-}(window.jQuery);/* =========================================================
- * bootstrap-modal.js v2.2.2
- * http://twitter.github.com/bootstrap/javascript.html#modals
- * =========================================================
- * Copyright 2012 Twitter, Inc.
- *
- * Licensed under the Apache License, Version 2.0 (the "License");
- * you may not use this file except in compliance with the License.
- * You may obtain a copy of the License at
- *
- * http://www.apache.org/licenses/LICENSE-2.0
- *
- * Unless required by applicable law or agreed to in writing, software
- * distributed under the License is distributed on an "AS IS" BASIS,
- * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
- * See the License for the specific language governing permissions and
- * limitations under the License.
- * ========================================================= */
-
-
-!function ($) {
-
-  "use strict"; // jshint ;_;
-
-
- /* MODAL CLASS DEFINITION
-  * ====================== */
-
-  var Modal = function (element, options) {
-    this.options = options
-    this.$element = $(element)
-      .delegate('[data-dismiss="modal"]', 'click.dismiss.modal', $.proxy(this.hide, this))
-    this.options.remote && this.$element.find('.modal-body').load(this.options.remote)
-  }
-
-  Modal.prototype = {
-
-      constructor: Modal
-
-    , toggle: function () {
-        return this[!this.isShown ? 'show' : 'hide']()
-      }
-
-    , show: function () {
-        var that = this
-          , e = $.Event('show')
-
-        this.$element.trigger(e)
-
-        if (this.isShown || e.isDefaultPrevented()) return
-
-        this.isShown = true
-
-        this.escape()
-
-        this.backdrop(function () {
-          var transition = $.support.transition && that.$element.hasClass('fade')
-
-          if (!that.$element.parent().length) {
-            that.$element.appendTo(document.body) //don't move modals dom position
-          }
-
-          that.$element
-            .show()
-
-          if (transition) {
-            that.$element[0].offsetWidth // force reflow
-          }
-
-          that.$element
-            .addClass('in')
-            .attr('aria-hidden', false)
-
-          that.enforceFocus()
-
-          transition ?
-            that.$element.one($.support.transition.end, function () { that.$element.focus().trigger('shown') }) :
-            that.$element.focus().trigger('shown')
-
-        })
-      }
-
-    , hide: function (e) {
-        e && e.preventDefault()
-
-        var that = this
-
-        e = $.Event('hide')
-
-        this.$element.trigger(e)
-
-        if (!this.isShown || e.isDefaultPrevented()) return
-
-        this.isShown = false
-
-        this.escape()
-
-        $(document).off('focusin.modal')
-
-        this.$element
-          .removeClass('in')
-          .attr('aria-hidden', true)
-
-        $.support.transition && this.$element.hasClass('fade') ?
-          this.hideWithTransition() :
-          this.hideModal()
-      }
-
-    , enforceFocus: function () {
-        var that = this
-        $(document).on('focusin.modal', function (e) {
-          if (that.$element[0] !== e.target && !that.$element.has(e.target).length) {
-            that.$element.focus()
-          }
-        })
-      }
-
-    , escape: function () {
-        var that = this
-        if (this.isShown && this.options.keyboard) {
-          this.$element.on('keyup.dismiss.modal', function ( e ) {
-            e.which == 27 && that.hide()
-          })
-        } else if (!this.isShown) {
-          this.$element.off('keyup.dismiss.modal')
-        }
-      }
-
-    , hideWithTransition: function () {
-        var that = this
-          , timeout = setTimeout(function () {
-              that.$element.off($.support.transition.end)
-              that.hideModal()
-            }, 500)
-
-        this.$element.one($.support.transition.end, function () {
-          clearTimeout(timeout)
-          that.hideModal()
-        })
-      }
-
-    , hideModal: function (that) {
-        this.$element
-          .hide()
-          .trigger('hidden')
-
-        this.backdrop()
-      }
-
-    , removeBackdrop: function () {
-        this.$backdrop.remove()
-        this.$backdrop = null
-      }
-
-    , backdrop: function (callback) {
-        var that = this
-          , animate = this.$element.hasClass('fade') ? 'fade' : ''
-
-        if (this.isShown && this.options.backdrop) {
-          var doAnimate = $.support.transition && animate
-
-          this.$backdrop = $('<div class="modal-backdrop ' + animate + '" />')
-            .appendTo(document.body)
-
-          this.$backdrop.click(
-            this.options.backdrop == 'static' ?
-              $.proxy(this.$element[0].focus, this.$element[0])
-            : $.proxy(this.hide, this)
-          )
-
-          if (doAnimate) this.$backdrop[0].offsetWidth // force reflow
-
-          this.$backdrop.addClass('in')
-
-          doAnimate ?
-            this.$backdrop.one($.support.transition.end, callback) :
-            callback()
-
-        } else if (!this.isShown && this.$backdrop) {
-          this.$backdrop.removeClass('in')
-
-          $.support.transition && this.$element.hasClass('fade')?
-            this.$backdrop.one($.support.transition.end, $.proxy(this.removeBackdrop, this)) :
-            this.removeBackdrop()
-
-        } else if (callback) {
-          callback()
-        }
-      }
-  }
-
-
- /* MODAL PLUGIN DEFINITION
-  * ======================= */
-
-  var old = $.fn.modal
-
-  $.fn.modal = function (option) {
-    return this.each(function () {
-      var $this = $(this)
-        , data = $this.data('modal')
-        , options = $.extend({}, $.fn.modal.defaults, $this.data(), typeof option == 'object' && option)
-      if (!data) $this.data('modal', (data = new Modal(this, options)))
-      if (typeof option == 'string') data[option]()
-      else if (options.show) data.show()
-    })
-  }
-
-  $.fn.modal.defaults = {
-      backdrop: true
-    , keyboard: true
-    , show: true
-  }
-
-  $.fn.modal.Constructor = Modal
-
-
- /* MODAL NO CONFLICT
-  * ================= */
-
-  $.fn.modal.noConflict = function () {
-    $.fn.modal = old
-    return this
-  }
-
-
- /* MODAL DATA-API
-  * ============== */
-
-  $(document).on('click.modal.data-api', '[data-toggle="modal"]', function (e) {
-    var $this = $(this)
-      , href = $this.attr('href')
-      , $target = $($this.attr('data-target') || (href && href.replace(/.*(?=#[^\s]+$)/, ''))) //strip for ie7
-      , option = $target.data('modal') ? 'toggle' : $.extend({ remote:!/#/.test(href) && href }, $target.data(), $this.data())
-
-    e.preventDefault()
-
-    $target
-      .modal(option)
-      .one('hide', function () {
-        $this.focus()
-      })
-  })
-
-}(window.jQuery);
-/* ===========================================================
- * bootstrap-tooltip.js v2.2.2
- * http://twitter.github.com/bootstrap/javascript.html#tooltips
- * Inspired by the original jQuery.tipsy by Jason Frame
- * ===========================================================
- * Copyright 2012 Twitter, Inc.
- *
- * Licensed under the Apache License, Version 2.0 (the "License");
- * you may not use this file except in compliance with the License.
- * You may obtain a copy of the License at
- *
- * http://www.apache.org/licenses/LICENSE-2.0
- *
- * Unless required by applicable law or agreed to in writing, software
- * distributed under the License is distributed on an "AS IS" BASIS,
- * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
- * See the License for the specific language governing permissions and
- * limitations under the License.
- * ========================================================== */
-
-
-!function ($) {
-
-  "use strict"; // jshint ;_;
-
-
- /* TOOLTIP PUBLIC CLASS DEFINITION
-  * =============================== */
-
-  var Tooltip = function (element, options) {
-    this.init('tooltip', element, options)
-  }
-
-  Tooltip.prototype = {
-
-    constructor: Tooltip
-
-  , init: function (type, element, options) {
-      var eventIn
-        , eventOut
-
-      this.type = type
-      this.$element = $(element)
-      this.options = this.getOptions(options)
-      this.enabled = true
-
-      if (this.options.trigger == 'click') {
-        this.$element.on('click.' + this.type, this.options.selector, $.proxy(this.toggle, this))
-      } else if (this.options.trigger != 'manual') {
-        eventIn = this.options.trigger == 'hover' ? 'mouseenter' : 'focus'
-        eventOut = this.options.trigger == 'hover' ? 'mouseleave' : 'blur'
-        this.$element.on(eventIn + '.' + this.type, this.options.selector, $.proxy(this.enter, this))
-        this.$element.on(eventOut + '.' + this.type, this.options.selector, $.proxy(this.leave, this))
-      }
-
-      this.options.selector ?
-        (this._options = $.extend({}, this.options, { trigger: 'manual', selector: '' })) :
-        this.fixTitle()
-    }
-
-  , getOptions: function (options) {
-      options = $.extend({}, $.fn[this.type].defaults, options, this.$element.data())
-
-      if (options.delay && typeof options.delay == 'number') {
-        options.delay = {
-          show: options.delay
-        , hide: options.delay
-        }
-      }
-
-      return options
-    }
-
-  , enter: function (e) {
-      var self = $(e.currentTarget)[this.type](this._options).data(this.type)
-
-      if (!self.options.delay || !self.options.delay.show) return self.show()
-
-      clearTimeout(this.timeout)
-      self.hoverState = 'in'
-      this.timeout = setTimeout(function() {
-        if (self.hoverState == 'in') self.show()
-      }, self.options.delay.show)
-    }
-
-  , leave: function (e) {
-      var self = $(e.currentTarget)[this.type](this._options).data(this.type)
-
-      if (this.timeout) clearTimeout(this.timeout)
-      if (!self.options.delay || !self.options.delay.hide) return self.hide()
-
-      self.hoverState = 'out'
-      this.timeout = setTimeout(function() {
-        if (self.hoverState == 'out') self.hide()
-      }, self.options.delay.hide)
-    }
-
-  , show: function () {
-      var $tip
-        , inside
-        , pos
-        , actualWidth
-        , actualHeight
-        , placement
-        , tp
-
-      if (this.hasContent() && this.enabled) {
-        $tip = this.tip()
-        this.setContent()
-
-        if (this.options.animation) {
-          $tip.addClass('fade')
-        }
-
-        placement = typeof this.options.placement == 'function' ?
-          this.options.placement.call(this, $tip[0], this.$element[0]) :
-          this.options.placement
-
-        inside = /in/.test(placement)
-
-        $tip
-          .detach()
-          .css({ top: 0, left: 0, display: 'block' })
-          .insertAfter(this.$element)
-
-        pos = this.getPosition(inside)
-
-        actualWidth = $tip[0].offsetWidth
-        actualHeight = $tip[0].offsetHeight
-
-        switch (inside ? placement.split(' ')[1] : placement) {
-          case 'bottom':
-            tp = {top: pos.top + pos.height, left: pos.left + pos.width / 2 - actualWidth / 2}
-            break
-          case 'top':
-            tp = {top: pos.top - actualHeight, left: pos.left + pos.width / 2 - actualWidth / 2}
-            break
-          case 'left':
-            tp = {top: pos.top + pos.height / 2 - actualHeight / 2, left: pos.left - actualWidth}
-            break
-          case 'right':
-            tp = {top: pos.top + pos.height / 2 - actualHeight / 2, left: pos.left + pos.width}
-            break
-        }
-
-        $tip
-          .offset(tp)
-          .addClass(placement)
-          .addClass('in')
-      }
-    }
-
-  , setContent: function () {
-      var $tip = this.tip()
-        , title = this.getTitle()
-
-      $tip.find('.tooltip-inner')[this.options.html ? 'html' : 'text'](title)
-      $tip.removeClass('fade in top bottom left right')
-    }
-
-  , hide: function () {
-      var that = this
-        , $tip = this.tip()
-
-      $tip.removeClass('in')
-
-      function removeWithAnimation() {
-        var timeout = setTimeout(function () {
-          $tip.off($.support.transition.end).detach()
-        }, 500)
-
-        $tip.one($.support.transition.end, function () {
-          clearTimeout(timeout)
-          $tip.detach()
-        })
-      }
-
-      $.support.transition && this.$tip.hasClass('fade') ?
-        removeWithAnimation() :
-        $tip.detach()
-
-      return this
-    }
-
-  , fixTitle: function () {
-      var $e = this.$element
-      if ($e.attr('title') || typeof($e.attr('data-original-title')) != 'string') {
-        $e.attr('data-original-title', $e.attr('title') || '').removeAttr('title')
-      }
-    }
-
-  , hasContent: function () {
-      return this.getTitle()
-    }
-
-  , getPosition: function (inside) {
-      return $.extend({}, (inside ? {top: 0, left: 0} : this.$element.offset()), {
-        width: this.$element[0].offsetWidth
-      , height: this.$element[0].offsetHeight
-      })
-    }
-
-  , getTitle: function () {
-      var title
-        , $e = this.$element
-        , o = this.options
-
-      title = $e.attr('data-original-title')
-        || (typeof o.title == 'function' ? o.title.call($e[0]) :  o.title)
-
-      return title
-    }
-
-  , tip: function () {
-      return this.$tip = this.$tip || $(this.options.template)
-    }
-
-  , validate: function () {
-      if (!this.$element[0].parentNode) {
-        this.hide()
-        this.$element = null
-        this.options = null
-      }
-    }
-
-  , enable: function () {
-      this.enabled = true
-    }
-
-  , disable: function () {
-      this.enabled = false
-    }
-
-  , toggleEnabled: function () {
-      this.enabled = !this.enabled
-    }
-
-  , toggle: function (e) {
-      var self = $(e.currentTarget)[this.type](this._options).data(this.type)
-      self[self.tip().hasClass('in') ? 'hide' : 'show']()
-    }
-
-  , destroy: function () {
-      this.hide().$element.off('.' + this.type).removeData(this.type)
-    }
-
-  }
-
-
- /* TOOLTIP PLUGIN DEFINITION
-  * ========================= */
-
-  var old = $.fn.tooltip
-
-  $.fn.tooltip = function ( option ) {
-    return this.each(function () {
-      var $this = $(this)
-        , data = $this.data('tooltip')
-        , options = typeof option == 'object' && option
-      if (!data) $this.data('tooltip', (data = new Tooltip(this, options)))
-      if (typeof option == 'string') data[option]()
-    })
-  }
-
-  $.fn.tooltip.Constructor = Tooltip
-
-  $.fn.tooltip.defaults = {
-    animation: true
-  , placement: 'top'
-  , selector: false
-  , template: '<div class="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
-  , trigger: 'hover'
-  , title: ''
-  , delay: 0
-  , html: false
-  }
-
-
- /* TOOLTIP NO CONFLICT
-  * =================== */
-
-  $.fn.tooltip.noConflict = function () {
-    $.fn.tooltip = old
-    return this
-  }
-
-}(window.jQuery);/* ===========================================================
- * bootstrap-popover.js v2.2.2
- * http://twitter.github.com/bootstrap/javascript.html#popovers
- * ===========================================================
- * Copyright 2012 Twitter, Inc.
- *
- * Licensed under the Apache License, Version 2.0 (the "License");
- * you may not use this file except in compliance with the License.
- * You may obtain a copy of the License at
- *
- * http://www.apache.org/licenses/LICENSE-2.0
- *
- * Unless required by applicable law or agreed to in writing, software
- * distributed under the License is distributed on an "AS IS" BASIS,
- * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
- * See the License for the specific language governing permissions and
- * limitations under the License.
- * =========================================================== */
-
-
-!function ($) {
-
-  "use strict"; // jshint ;_;
-
-
- /* POPOVER PUBLIC CLASS DEFINITION
-  * =============================== */
-
-  var Popover = function (element, options) {
-    this.init('popover', element, options)
-  }
-
-
-  /* NOTE: POPOVER EXTENDS BOOTSTRAP-TOOLTIP.js
-     ========================================== */
-
-  Popover.prototype = $.extend({}, $.fn.tooltip.Constructor.prototype, {
-
-    constructor: Popover
-
-  , setContent: function () {
-      var $tip = this.tip()
-        , title = this.getTitle()
-        , content = this.getContent()
-
-      $tip.find('.popover-title')[this.options.html ? 'html' : 'text'](title)
-      $tip.find('.popover-content')[this.options.html ? 'html' : 'text'](content)
-
-      $tip.removeClass('fade top bottom left right in')
-    }
-
-  , hasContent: function () {
-      return this.getTitle() || this.getContent()
-    }
-
-  , getContent: function () {
-      var content
-        , $e = this.$element
-        , o = this.options
-
-      content = $e.attr('data-content')
-        || (typeof o.content == 'function' ? o.content.call($e[0]) :  o.content)
-
-      return content
-    }
-
-  , tip: function () {
-      if (!this.$tip) {
-        this.$tip = $(this.options.template)
-      }
-      return this.$tip
-    }
-
-  , destroy: function () {
-      this.hide().$element.off('.' + this.type).removeData(this.type)
-    }
-
-  })
-
-
- /* POPOVER PLUGIN DEFINITION
-  * ======================= */
-
-  var old = $.fn.popover
-
-  $.fn.popover = function (option) {
-    return this.each(function () {
-      var $this = $(this)
-        , data = $this.data('popover')
-        , options = typeof option == 'object' && option
-      if (!data) $this.data('popover', (data = new Popover(this, options)))
-      if (typeof option == 'string') data[option]()
-    })
-  }
-
-  $.fn.popover.Constructor = Popover
-
-  $.fn.popover.defaults = $.extend({} , $.fn.tooltip.defaults, {
-    placement: 'right'
-  , trigger: 'click'
-  , content: ''
-  , template: '<div class="popover"><div class="arrow"></div><div class="popover-inner"><h3 class="popover-title"></h3><div class="popover-content"></div></div></div>'
-  })
-
-
- /* POPOVER NO CONFLICT
-  * =================== */
-
-  $.fn.popover.noConflict = function () {
-    $.fn.popover = old
-    return this
-  }
-
-}(window.jQuery);/* =============================================================
- * bootstrap-scrollspy.js v2.2.2
- * http://twitter.github.com/bootstrap/javascript.html#scrollspy
- * =============================================================
- * Copyright 2012 Twitter, Inc.
- *
- * Licensed under the Apache License, Version 2.0 (the "License");
- * you may not use this file except in compliance with the License.
- * You may obtain a copy of the License at
- *
- * http://www.apache.org/licenses/LICENSE-2.0
- *
- * Unless required by applicable law or agreed to in writing, software
- * distributed under the License is distributed on an "AS IS" BASIS,
- * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
- * See the License for the specific language governing permissions and
- * limitations under the License.
- * ============================================================== */
-
-
-!function ($) {
-
-  "use strict"; // jshint ;_;
-
-
- /* SCROLLSPY CLASS DEFINITION
-  * ========================== */
-
-  function ScrollSpy(element, options) {
-    var process = $.proxy(this.process, this)
-      , $element = $(element).is('body') ? $(window) : $(element)
-      , href
-    this.options = $.extend({}, $.fn.scrollspy.defaults, options)
-    this.$scrollElement = $element.on('scroll.scroll-spy.data-api', process)
-    this.selector = (this.options.target
-      || ((href = $(element).attr('href')) && href.replace(/.*(?=#[^\s]+$)/, '')) //strip for ie7
-      || '') + ' .nav li > a'
-    this.$body = $('body')
-    this.refresh()
-    this.process()
-  }
-
-  ScrollSpy.prototype = {
-
-      constructor: ScrollSpy
-
-    , refresh: function () {
-        var self = this
-          , $targets
-
-        this.offsets = $([])
-        this.targets = $([])
-
-        $targets = this.$body
-          .find(this.selector)
-          .map(function () {
-            var $el = $(this)
-              , href = $el.data('target') || $el.attr('href')
-              , $href = /^#\w/.test(href) && $(href)
-            return ( $href
-              && $href.length
-              && [[ $href.position().top + self.$scrollElement.scrollTop(), href ]] ) || null
-          })
-          .sort(function (a, b) { return a[0] - b[0] })
-          .each(function () {
-            self.offsets.push(this[0])
-            self.targets.push(this[1])
-          })
-      }
-
-    , process: function () {
-        var scrollTop = this.$scrollElement.scrollTop() + this.options.offset
-          , scrollHeight = this.$scrollElement[0].scrollHeight || this.$body[0].scrollHeight
-          , maxScroll = scrollHeight - this.$scrollElement.height()
-          , offsets = this.offsets
-          , targets = this.targets
-          , activeTarget = this.activeTarget
-          , i
-
-        if (scrollTop >= maxScroll) {
-          return activeTarget != (i = targets.last()[0])
-            && this.activate ( i )
-        }
-
-        for (i = offsets.length; i--;) {
-          activeTarget != targets[i]
-            && scrollTop >= offsets[i]
-            && (!offsets[i + 1] || scrollTop <= offsets[i + 1])
-            && this.activate( targets[i] )
-        }
-      }
-
-    , activate: function (target) {
-        var active
-          , selector
-
-        this.activeTarget = target
-
-        $(this.selector)
-          .parent('.active')
-          .removeClass('active')
-
-        selector = this.selector
-          + '[data-target="' + target + '"],'
-          + this.selector + '[href="' + target + '"]'
-
-        active = $(selector)
-          .parent('li')
-          .addClass('active')
-
-        if (active.parent('.dropdown-menu').length)  {
-          active = active.closest('li.dropdown').addClass('active')
-        }
-
-        active.trigger('activate')
-      }
-
-  }
-
-
- /* SCROLLSPY PLUGIN DEFINITION
-  * =========================== */
-
-  var old = $.fn.scrollspy
-
-  $.fn.scrollspy = function (option) {
-    return this.each(function () {
-      var $this = $(this)
-        , data = $this.data('scrollspy')
-        , options = typeof option == 'object' && option
-      if (!data) $this.data('scrollspy', (data = new ScrollSpy(this, options)))
-      if (typeof option == 'string') data[option]()
-    })
-  }
-
-  $.fn.scrollspy.Constructor = ScrollSpy
-
-  $.fn.scrollspy.defaults = {
-    offset: 10
-  }
-
-
- /* SCROLLSPY NO CONFLICT
-  * ===================== */
-
-  $.fn.scrollspy.noConflict = function () {
-    $.fn.scrollspy = old
-    return this
-  }
-
-
- /* SCROLLSPY DATA-API
-  * ================== */
-
-  $(window).on('load', function () {
-    $('[data-spy="scroll"]').each(function () {
-      var $spy = $(this)
-      $spy.scrollspy($spy.data())
-    })
-  })
-
-}(window.jQuery);/* ========================================================
- * bootstrap-tab.js v2.2.2
- * http://twitter.github.com/bootstrap/javascript.html#tabs
- * ========================================================
- * Copyright 2012 Twitter, Inc.
- *
- * Licensed under the Apache License, Version 2.0 (the "License");
- * you may not use this file except in compliance with the License.
- * You may obtain a copy of the License at
- *
- * http://www.apache.org/licenses/LICENSE-2.0
- *
- * Unless required by applicable law or agreed to in writing, software
- * distributed under the License is distributed on an "AS IS" BASIS,
- * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
- * See the License for the specific language governing permissions and
- * limitations under the License.
- * ======================================================== */
-
-
-!function ($) {
-
-  "use strict"; // jshint ;_;
-
-
- /* TAB CLASS DEFINITION
-  * ==================== */
-
-  var Tab = function (element) {
-    this.element = $(element)
-  }
-
-  Tab.prototype = {
-
-    constructor: Tab
-
-  , show: function () {
-      var $this = this.element
-        , $ul = $this.closest('ul:not(.dropdown-menu)')
-        , selector = $this.attr('data-target')
-        , previous
-        , $target
-        , e
-
-      if (!selector) {
-        selector = $this.attr('href')
-        selector = selector && selector.replace(/.*(?=#[^\s]*$)/, '') //strip for ie7
-      }
-
-      if ( $this.parent('li').hasClass('active') ) return
-
-      previous = $ul.find('.active:last a')[0]
-
-      e = $.Event('show', {
-        relatedTarget: previous
-      })
-
-      $this.trigger(e)
-
-      if (e.isDefaultPrevented()) return
-
-      $target = $(selector)
-
-      this.activate($this.parent('li'), $ul)
-      this.activate($target, $target.parent(), function () {
-        $this.trigger({
-          type: 'shown'
-        , relatedTarget: previous
-        })
-      })
-    }
-
-  , activate: function ( element, container, callback) {
-      var $active = container.find('> .active')
-        , transition = callback
-            && $.support.transition
-            && $active.hasClass('fade')
-
-      function next() {
-        $active
-          .removeClass('active')
-          .find('> .dropdown-menu > .active')
-          .removeClass('active')
-
-        element.addClass('active')
-
-        if (transition) {
-          element[0].offsetWidth // reflow for transition
-          element.addClass('in')
-        } else {
-          element.removeClass('fade')
-        }
-
-        if ( element.parent('.dropdown-menu') ) {
-          element.closest('li.dropdown').addClass('active')
-        }
-
-        callback && callback()
-      }
-
-      transition ?
-        $active.one($.support.transition.end, next) :
-        next()
-
-      $active.removeClass('in')
-    }
-  }
-
-
- /* TAB PLUGIN DEFINITION
-  * ===================== */
-
-  var old = $.fn.tab
-
-  $.fn.tab = function ( option ) {
-    return this.each(function () {
-      var $this = $(this)
-        , data = $this.data('tab')
-      if (!data) $this.data('tab', (data = new Tab(this)))
-      if (typeof option == 'string') data[option]()
-    })
-  }
-
-  $.fn.tab.Constructor = Tab
-
-
- /* TAB NO CONFLICT
-  * =============== */
-
-  $.fn.tab.noConflict = function () {
-    $.fn.tab = old
-    return this
-  }
-
-
- /* TAB DATA-API
-  * ============ */
-
-  $(document).on('click.tab.data-api', '[data-toggle="tab"], [data-toggle="pill"]', function (e) {
-    e.preventDefault()
-    $(this).tab('show')
-  })
-
-}(window.jQuery);/* =============================================================
- * bootstrap-typeahead.js v2.2.2
- * http://twitter.github.com/bootstrap/javascript.html#typeahead
- * =============================================================
- * Copyright 2012 Twitter, Inc.
- *
- * Licensed under the Apache License, Version 2.0 (the "License");
- * you may not use this file except in compliance with the License.
- * You may obtain a copy of the License at
- *
- * http://www.apache.org/licenses/LICENSE-2.0
- *
- * Unless required by applicable law or agreed to in writing, software
- * distributed under the License is distributed on an "AS IS" BASIS,
- * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
- * See the License for the specific language governing permissions and
- * limitations under the License.
- * ============================================================ */
-
-
-!function($){
-
-  "use strict"; // jshint ;_;
-
-
- /* TYPEAHEAD PUBLIC CLASS DEFINITION
-  * ================================= */
-
-  var Typeahead = function (element, options) {
-    this.$element = $(element)
-    this.options = $.extend({}, $.fn.typeahead.defaults, options)
-    this.matcher = this.options.matcher || this.matcher
-    this.sorter = this.options.sorter || this.sorter
-    this.highlighter = this.options.highlighter || this.highlighter
-    this.updater = this.options.updater || this.updater
-    this.source = this.options.source
-    this.$menu = $(this.options.menu)
-    this.shown = false
-    this.listen()
-  }
-
-  Typeahead.prototype = {
-
-    constructor: Typeahead
-
-  , select: function () {
-      var val = this.$menu.find('.active').attr('data-value')
-      this.$element
-        .val(this.updater(val))
-        .change()
-      return this.hide()
-    }
-
-  , updater: function (item) {
-      return item
-    }
-
-  , show: function () {
-      var pos = $.extend({}, this.$element.position(), {
-        height: this.$element[0].offsetHeight
-      })
-
-      this.$menu
-        .insertAfter(this.$element)
-        .css({
-          top: pos.top + pos.height
-        , left: pos.left
-        })
-        .show()
-
-      this.shown = true
-      return this
-    }
-
-  , hide: function () {
-      this.$menu.hide()
-      this.shown = false
-      return this
-    }
-
-  , lookup: function (event) {
-      var items
-
-      this.query = this.$element.val()
-
-      if (!this.query || this.query.length < this.options.minLength) {
-        return this.shown ? this.hide() : this
-      }
-
-      items = $.isFunction(this.source) ? this.source(this.query, $.proxy(this.process, this)) : this.source
-
-      return items ? this.process(items) : this
-    }
-
-  , process: function (items) {
-      var that = this
-
-      items = $.grep(items, function (item) {
-        return that.matcher(item)
-      })
-
-      items = this.sorter(items)
-
-      if (!items.length) {
-        return this.shown ? this.hide() : this
-      }
-
-      return this.render(items.slice(0, this.options.items)).show()
-    }
-
-  , matcher: function (item) {
-      return ~item.toLowerCase().indexOf(this.query.toLowerCase())
-    }
-
-  , sorter: function (items) {
-      var beginswith = []
-        , caseSensitive = []
-        , caseInsensitive = []
-        , item
-
-      while (item = items.shift()) {
-        if (!item.toLowerCase().indexOf(this.query.toLowerCase())) beginswith.push(item)
-        else if (~item.indexOf(this.query)) caseSensitive.push(item)
-        else caseInsensitive.push(item)
-      }
-
-      return beginswith.concat(caseSensitive, caseInsensitive)
-    }
-
-  , highlighter: function (item) {
-      var query = this.query.replace(/[\-\[\]{}()*+?.,\\\^$|#\s]/g, '\\$&')
-      return item.replace(new RegExp('(' + query + ')', 'ig'), function ($1, match) {
-        return '<strong>' + match + '</strong>'
-      })
-    }
-
-  , render: function (items) {
-      var that = this
-
-      items = $(items).map(function (i, item) {
-        i = $(that.options.item).attr('data-value', item)
-        i.find('a').html(that.highlighter(item))
-        return i[0]
-      })
-
-      items.first().addClass('active')
-      this.$menu.html(items)
-      return this
-    }
-
-  , next: function (event) {
-      var active = this.$menu.find('.active').removeClass('active')
-        , next = active.next()
-
-      if (!next.length) {
-        next = $(this.$menu.find('li')[0])
-      }
-
-      next.addClass('active')
-    }
-
-  , prev: function (event) {
-      var active = this.$menu.find('.active').removeClass('active')
-        , prev = active.prev()
-
-      if (!prev.length) {
-        prev = this.$menu.find('li').last()
-      }
-
-      prev.addClass('active')
-    }
-
-  , listen: function () {
-      this.$element
-        .on('blur',     $.proxy(this.blur, this))
-        .on('keypress', $.proxy(this.keypress, this))
-        .on('keyup',    $.proxy(this.keyup, this))
-
-      if (this.eventSupported('keydown')) {
-        this.$element.on('keydown', $.proxy(this.keydown, this))
-      }
-
-      this.$menu
-        .on('click', $.proxy(this.click, this))
-        .on('mouseenter', 'li', $.proxy(this.mouseenter, this))
-    }
-
-  , eventSupported: function(eventName) {
-      var isSupported = eventName in this.$element
-      if (!isSupported) {
-        this.$element.setAttribute(eventName, 'return;')
-        isSupported = typeof this.$element[eventName] === 'function'
-      }
-      return isSupported
-    }
-
-  , move: function (e) {
-      if (!this.shown) return
-
-      switch(e.keyCode) {
-        case 9: // tab
-        case 13: // enter
-        case 27: // escape
-          e.preventDefault()
-          break
-
-        case 38: // up arrow
-          e.preventDefault()
-          this.prev()
-          break
-
-        case 40: // down arrow
-          e.preventDefault()
-          this.next()
-          break
-      }
-
-      e.stopPropagation()
-    }
-
-  , keydown: function (e) {
-      this.suppressKeyPressRepeat = ~$.inArray(e.keyCode, [40,38,9,13,27])
-      this.move(e)
-    }
-
-  , keypress: function (e) {
-      if (this.suppressKeyPressRepeat) return
-      this.move(e)
-    }
-
-  , keyup: function (e) {
-      switch(e.keyCode) {
-        case 40: // down arrow
-        case 38: // up arrow
-        case 16: // shift
-        case 17: // ctrl
-        case 18: // alt
-          break
-
-        case 9: // tab
-        case 13: // enter
-          if (!this.shown) return
-          this.select()
-          break
-
-        case 27: // escape
-          if (!this.shown) return
-          this.hide()
-          break
-
-        default:
-          this.lookup()
-      }
-
-      e.stopPropagation()
-      e.preventDefault()
-  }
-
-  , blur: function (e) {
-      var that = this
-      setTimeout(function () { that.hide() }, 150)
-    }
-
-  , click: function (e) {
-      e.stopPropagation()
-      e.preventDefault()
-      this.select()
-    }
-
-  , mouseenter: function (e) {
-      this.$menu.find('.active').removeClass('active')
-      $(e.currentTarget).addClass('active')
-    }
-
-  }
-
-
-  /* TYPEAHEAD PLUGIN DEFINITION
-   * =========================== */
-
-  var old = $.fn.typeahead
-
-  $.fn.typeahead = function (option) {
-    return this.each(function () {
-      var $this = $(this)
-        , data = $this.data('typeahead')
-        , options = typeof option == 'object' && option
-      if (!data) $this.data('typeahead', (data = new Typeahead(this, options)))
-      if (typeof option == 'string') data[option]()
-    })
-  }
-
-  $.fn.typeahead.defaults = {
-    source: []
-  , items: 8
-  , menu: '<ul class="typeahead dropdown-menu"></ul>'
-  , item: '<li><a href="#"></a></li>'
-  , minLength: 1
-  }
-
-  $.fn.typeahead.Constructor = Typeahead
-
-
- /* TYPEAHEAD NO CONFLICT
-  * =================== */
-
-  $.fn.typeahead.noConflict = function () {
-    $.fn.typeahead = old
-    return this
-  }
-
-
- /* TYPEAHEAD DATA-API
-  * ================== */
-
-  $(document).on('focus.typeahead.data-api', '[data-provide="typeahead"]', function (e) {
-    var $this = $(this)
-    if ($this.data('typeahead')) return
-    e.preventDefault()
-    $this.typeahead($this.data())
-  })
-
-}(window.jQuery);
-/* ==========================================================
- * bootstrap-affix.js v2.2.2
- * http://twitter.github.com/bootstrap/javascript.html#affix
- * ==========================================================
- * Copyright 2012 Twitter, Inc.
- *
- * Licensed under the Apache License, Version 2.0 (the "License");
- * you may not use this file except in compliance with the License.
- * You may obtain a copy of the License at
- *
- * http://www.apache.org/licenses/LICENSE-2.0
- *
- * Unless required by applicable law or agreed to in writing, software
- * distributed under the License is distributed on an "AS IS" BASIS,
- * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
- * See the License for the specific language governing permissions and
- * limitations under the License.
- * ========================================================== */
-
-
-!function ($) {
-
-  "use strict"; // jshint ;_;
-
-
- /* AFFIX CLASS DEFINITION
-  * ====================== */
-
-  var Affix = function (element, options) {
-    this.options = $.extend({}, $.fn.affix.defaults, options)
-    this.$window = $(window)
-      .on('scroll.affix.data-api', $.proxy(this.checkPosition, this))
-      .on('click.affix.data-api',  $.proxy(function () { setTimeout($.proxy(this.checkPosition, this), 1) }, this))
-    this.$element = $(element)
-    this.checkPosition()
-  }
-
-  Affix.prototype.checkPosition = function () {
-    if (!this.$element.is(':visible')) return
-
-    var scrollHeight = $(document).height()
-      , scrollTop = this.$window.scrollTop()
-      , position = this.$element.offset()
-      , offset = this.options.offset
-      , offsetBottom = offset.bottom
-      , offsetTop = offset.top
-      , reset = 'affix affix-top affix-bottom'
-      , affix
-
-    if (typeof offset != 'object') offsetBottom = offsetTop = offset
-    if (typeof offsetTop == 'function') offsetTop = offset.top()
-    if (typeof offsetBottom == 'function') offsetBottom = offset.bottom()
-
-    affix = this.unpin != null && (scrollTop + this.unpin <= position.top) ?
-      false    : offsetBottom != null && (position.top + this.$element.height() >= scrollHeight - offsetBottom) ?
-      'bottom' : offsetTop != null && scrollTop <= offsetTop ?
-      'top'    : false
-
-    if (this.affixed === affix) return
-
-    this.affixed = affix
-    this.unpin = affix == 'bottom' ? position.top - scrollTop : null
-
-    this.$element.removeClass(reset).addClass('affix' + (affix ? '-' + affix : ''))
-  }
-
-
- /* AFFIX PLUGIN DEFINITION
-  * ======================= */
-
-  var old = $.fn.affix
-
-  $.fn.affix = function (option) {
-    return this.each(function () {
-      var $this = $(this)
-        , data = $this.data('affix')
-        , options = typeof option == 'object' && option
-      if (!data) $this.data('affix', (data = new Affix(this, options)))
-      if (typeof option == 'string') data[option]()
-    })
-  }
-
-  $.fn.affix.Constructor = Affix
-
-  $.fn.affix.defaults = {
-    offset: 0
-  }
-
-
- /* AFFIX NO CONFLICT
-  * ================= */
-
-  $.fn.affix.noConflict = function () {
-    $.fn.affix = old
-    return this
-  }
-
-
- /* AFFIX DATA-API
-  * ============== */
-
-  $(window).on('load', function () {
-    $('[data-spy="affix"]').each(function () {
-      var $spy = $(this)
-        , data = $spy.data()
-
-      data.offset = data.offset || {}
-
-      data.offsetBottom && (data.offset.bottom = data.offsetBottom)
-      data.offsetTop && (data.offset.top = data.offsetTop)
-
-      $spy.affix(data)
-    })
-  })
-
-
-}(window.jQuery);
\ No newline@end of file
diff --git a/docs/js/bootstrap.min.js b/docs/js/bootstrap.min.js
index 6eeb15c..7c1561a 100644
--- a/docs/js/bootstrap.min.js
+++ b/docs/js/bootstrap.min.js
@@ -1,6 +1,6 @@
 /*!
-* Bootstrap.js by @fat & @mdo
-* Copyright 2012 Twitter, Inc.
-* http://www.apache.org/licenses/LICENSE-2.0.txt
-*/
-!function($){"use strict";$(function(){$.support.transition=function(){var transitionEnd=function(){var name,el=document.createElement("bootstrap"),transEndEventNames={WebkitTransition:"webkitTransitionEnd",MozTransition:"transitionend",OTransition:"oTransitionEnd otransitionend",transition:"transitionend"};for(name in transEndEventNames)if(void 0!==el.style[name])return transEndEventNames[name]}();return transitionEnd&&{end:transitionEnd}}()})}(window.jQuery),!function($){"use strict";var dismiss='[data-dismiss="alert"]',Alert=function(el){$(el).on("click",dismiss,this.close)};Alert.prototype.close=function(e){function removeElement(){$parent.trigger("closed").remove()}var $parent,$this=$(this),selector=$this.attr("data-target");selector||(selector=$this.attr("href"),selector=selector&&selector.replace(/.*(?=#[^\s]*$)/,"")),$parent=$(selector),e&&e.preventDefault(),$parent.length||($parent=$this.hasClass("alert")?$this:$this.parent()),$parent.trigger(e=$.Event("close")),e.i
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
+ * Bootstrap v3.2.0 (http://getbootstrap.com)
+ * Copyright 2011-2014 Twitter, Inc.
+ * Licensed under MIT (https://github.com/twbs/bootstrap/blob/master/LICENSE)
+ */
+if("undefined"==typeof jQuery)throw new Error("Bootstrap's JavaScript requires jQuery");+function(a){"use strict";function b(){var a=document.createElement("bootstrap"),b={WebkitTransition:"webkitTransitionEnd",MozTransition:"transitionend",OTransition:"oTransitionEnd otransitionend",transition:"transitionend"};for(var c in b)if(void 0!==a.style[c])return{end:b[c]};return!1}a.fn.emulateTransitionEnd=function(b){var c=!1,d=this;a(this).one("bsTransitionEnd",function(){c=!0});var e=function(){c||a(d).trigger(a.support.transition.end)};return setTimeout(e,b),this},a(function(){a.support.transition=b(),a.support.transition&&(a.event.special.bsTransitionEnd={bindType:a.support.transition.end,delegateType:a.support.transition.end,handle:function(b){return a(b.target).is(this)?b.handleObj.handler.apply(this,arguments):void 0}})})}(jQuery),+function(a){"use strict";function b(b){return this.each(function(){var c=a(this),e=c.data("bs.alert");e||c.data("bs.alert",e=new d(this)),"strin
 g"==typeof b&&e[b].call(c)})}var c='[data-dismiss="alert"]',d=function(b){a(b).on("click",c,this.close)};d.VERSION="3.2.0",d.prototype.close=function(b){function c(){f.detach().trigger("closed.bs.alert").remove()}var d=a(this),e=d.attr("data-target");e||(e=d.attr("href"),e=e&&e.replace(/.*(?=#[^\s]*$)/,""));var f=a(e);b&&b.preventDefault(),f.length||(f=d.hasClass("alert")?d:d.parent()),f.trigger(b=a.Event("close.bs.alert")),b.isDefaultPrevented()||(f.removeClass("in"),a.support.transition&&f.hasClass("fade")?f.one("bsTransitionEnd",c).emulateTransitionEnd(150):c())};var e=a.fn.alert;a.fn.alert=b,a.fn.alert.Constructor=d,a.fn.alert.noConflict=function(){return a.fn.alert=e,this},a(document).on("click.bs.alert.data-api",c,d.prototype.close)}(jQuery),+function(a){"use strict";function b(b){return this.each(function(){var d=a(this),e=d.data("bs.button"),f="object"==typeof b&&b;e||d.data("bs.button",e=new c(this,f)),"toggle"==b?e.toggle():b&&e.setState(b)})}var c=function(b,d){th
 is.$element=a(b),this.options=a.extend({},c.DEFAULTS,d),this.isLoading=!1};c.VERSION="3.2.0",c.DEFAULTS={loadingText:"loading..."},c.prototype.setState=function(b){var c="disabled",d=this.$element,e=d.is("input")?"val":"html",f=d.data();b+="Text",null==f.resetText&&d.data("resetText",d[e]()),d[e](null==f[b]?this.options[b]:f[b]),setTimeout(a.proxy(function(){"loadingText"==b?(this.isLoading=!0,d.addClass(c).attr(c,c)):this.isLoading&&(this.isLoading=!1,d.removeClass(c).removeAttr(c))},this),0)},c.prototype.toggle=function(){var a=!0,b=this.$element.closest('[data-toggle="buttons"]');if(b.length){var c=this.$element.find("input");"radio"==c.prop("type")&&(c.prop("checked")&&this.$element.hasClass("active")?a=!1:b.find(".active").removeClass("active")),a&&c.prop("checked",!this.$element.hasClass("active")).trigger("change")}a&&this.$element.toggleClass("active")};var d=a.fn.button;a.fn.button=b,a.fn.button.Constructor=c,a.fn.button.noConflict=function(){return a.fn.button=d,th
 is},a(document).on("click.bs.button.data-api",'[data-toggle^="button"]',function(c){var d=a(c.target);d.hasClass("btn")||(d=d.closest(".btn")),b.call(d,"toggle"),c.preventDefault()})}(jQuery),+function(a){"use strict";function b(b){return this.each(function(){var d=a(this),e=d.data("bs.carousel"),f=a.extend({},c.DEFAULTS,d.data(),"object"==typeof b&&b),g="string"==typeof b?b:f.slide;e||d.data("bs.carousel",e=new c(this,f)),"number"==typeof b?e.to(b):g?e[g]():f.interval&&e.pause().cycle()})}var c=function(b,c){this.$element=a(b).on("keydown.bs.carousel",a.proxy(this.keydown,this)),this.$indicators=this.$element.find(".carousel-indicators"),this.options=c,this.paused=this.sliding=this.interval=this.$active=this.$items=null,"hover"==this.options.pause&&this.$element.on("mouseenter.bs.carousel",a.proxy(this.pause,this)).on("mouseleave.bs.carousel",a.proxy(this.cycle,this))};c.VERSION="3.2.0",c.DEFAULTS={interval:5e3,pause:"hover",wrap:!0},c.prototype.keydown=function(a){switch(a
 .which){case 37:this.prev();break;case 39:this.next();break;default:return}a.preventDefault()},c.prototype.cycle=function(b){return b||(this.paused=!1),this.interval&&clearInterval(this.interval),this.options.interval&&!this.paused&&(this.interval=setInterval(a.proxy(this.next,this),this.options.interval)),this},c.prototype.getItemIndex=function(a){return this.$items=a.parent().children(".item"),this.$items.index(a||this.$active)},c.prototype.to=function(b){var c=this,d=this.getItemIndex(this.$active=this.$element.find(".item.active"));return b>this.$items.length-1||0>b?void 0:this.sliding?this.$element.one("slid.bs.carousel",function(){c.to(b)}):d==b?this.pause().cycle():this.slide(b>d?"next":"prev",a(this.$items[b]))},c.prototype.pause=function(b){return b||(this.paused=!0),this.$element.find(".next, .prev").length&&a.support.transition&&(this.$element.trigger(a.support.transition.end),this.cycle(!0)),this.interval=clearInterval(this.interval),this},c.prototype.next=functi
 on(){return this.sliding?void 0:this.slide("next")},c.prototype.prev=function(){return this.sliding?void 0:this.slide("prev")},c.prototype.slide=function(b,c){var d=this.$element.find(".item.active"),e=c||d[b](),f=this.interval,g="next"==b?"left":"right",h="next"==b?"first":"last",i=this;if(!e.length){if(!this.options.wrap)return;e=this.$element.find(".item")[h]()}if(e.hasClass("active"))return this.sliding=!1;var j=e[0],k=a.Event("slide.bs.carousel",{relatedTarget:j,direction:g});if(this.$element.trigger(k),!k.isDefaultPrevented()){if(this.sliding=!0,f&&this.pause(),this.$indicators.length){this.$indicators.find(".active").removeClass("active");var l=a(this.$indicators.children()[this.getItemIndex(e)]);l&&l.addClass("active")}var m=a.Event("slid.bs.carousel",{relatedTarget:j,direction:g});return a.support.transition&&this.$element.hasClass("slide")?(e.addClass(b),e[0].offsetWidth,d.addClass(g),e.addClass(g),d.one("bsTransitionEnd",function(){e.removeClass([b,g].join(" ")).a
 ddClass("active"),d.removeClass(["active",g].join(" ")),i.sliding=!1,setTimeout(function(){i.$element.trigger(m)},0)}).emulateTransitionEnd(1e3*d.css("transition-duration").slice(0,-1))):(d.removeClass("active"),e.addClass("active"),this.sliding=!1,this.$element.trigger(m)),f&&this.cycle(),this}};var d=a.fn.carousel;a.fn.carousel=b,a.fn.carousel.Constructor=c,a.fn.carousel.noConflict=function(){return a.fn.carousel=d,this},a(document).on("click.bs.carousel.data-api","[data-slide], [data-slide-to]",function(c){var d,e=a(this),f=a(e.attr("data-target")||(d=e.attr("href"))&&d.replace(/.*(?=#[^\s]+$)/,""));if(f.hasClass("carousel")){var g=a.extend({},f.data(),e.data()),h=e.attr("data-slide-to");h&&(g.interval=!1),b.call(f,g),h&&f.data("bs.carousel").to(h),c.preventDefault()}}),a(window).on("load",function(){a('[data-ride="carousel"]').each(function(){var c=a(this);b.call(c,c.data())})})}(jQuery),+function(a){"use strict";function b(b){return this.each(function(){var d=a(this),e=
 d.data("bs.collapse"),f=a.extend({},c.DEFAULTS,d.data(),"object"==typeof b&&b);!e&&f.toggle&&"show"==b&&(b=!b),e||d.data("bs.collapse",e=new c(this,f)),"string"==typeof b&&e[b]()})}var c=function(b,d){this.$element=a(b),this.options=a.extend({},c.DEFAULTS,d),this.transitioning=null,this.options.parent&&(this.$parent=a(this.options.parent)),this.options.toggle&&this.toggle()};c.VERSION="3.2.0",c.DEFAULTS={toggle:!0},c.prototype.dimension=function(){var a=this.$element.hasClass("width");return a?"width":"height"},c.prototype.show=function(){if(!this.transitioning&&!this.$element.hasClass("in")){var c=a.Event("show.bs.collapse");if(this.$element.trigger(c),!c.isDefaultPrevented()){var d=this.$parent&&this.$parent.find("> .panel > .in");if(d&&d.length){var e=d.data("bs.collapse");if(e&&e.transitioning)return;b.call(d,"hide"),e||d.data("bs.collapse",null)}var f=this.dimension();this.$element.removeClass("collapse").addClass("collapsing")[f](0),this.transitioning=1;var g=function(
 ){this.$element.removeClass("collapsing").addClass("collapse in")[f](""),this.transitioning=0,this.$element.trigger("shown.bs.collapse")};if(!a.support.transition)return g.call(this);var h=a.camelCase(["scroll",f].join("-"));this.$element.one("bsTransitionEnd",a.proxy(g,this)).emulateTransitionEnd(350)[f](this.$element[0][h])}}},c.prototype.hide=function(){if(!this.transitioning&&this.$element.hasClass("in")){var b=a.Event("hide.bs.collapse");if(this.$element.trigger(b),!b.isDefaultPrevented()){var c=this.dimension();this.$element[c](this.$element[c]())[0].offsetHeight,this.$element.addClass("collapsing").removeClass("collapse").removeClass("in"),this.transitioning=1;var d=function(){this.transitioning=0,this.$element.trigger("hidden.bs.collapse").removeClass("collapsing").addClass("collapse")};return a.support.transition?void this.$element[c](0).one("bsTransitionEnd",a.proxy(d,this)).emulateTransitionEnd(350):d.call(this)}}},c.prototype.toggle=function(){this[this.$element.
 hasClass("in")?"hide":"show"]()};var d=a.fn.collapse;a.fn.collapse=b,a.fn.collapse.Constructor=c,a.fn.collapse.noConflict=function(){return a.fn.collapse=d,this},a(document).on("click.bs.collapse.data-api",'[data-toggle="collapse"]',function(c){var d,e=a(this),f=e.attr("data-target")||c.preventDefault()||(d=e.attr("href"))&&d.replace(/.*(?=#[^\s]+$)/,""),g=a(f),h=g.data("bs.collapse"),i=h?"toggle":e.data(),j=e.attr("data-parent"),k=j&&a(j);h&&h.transitioning||(k&&k.find('[data-toggle="collapse"][data-parent="'+j+'"]').not(e).addClass("collapsed"),e[g.hasClass("in")?"addClass":"removeClass"]("collapsed")),b.call(g,i)})}(jQuery),+function(a){"use strict";function b(b){b&&3===b.which||(a(e).remove(),a(f).each(function(){var d=c(a(this)),e={relatedTarget:this};d.hasClass("open")&&(d.trigger(b=a.Event("hide.bs.dropdown",e)),b.isDefaultPrevented()||d.removeClass("open").trigger("hidden.bs.dropdown",e))}))}function c(b){var c=b.attr("data-target");c||(c=b.attr("href"),c=c&&/#[A-Za-
 z]/.test(c)&&c.replace(/.*(?=#[^\s]*$)/,""));var d=c&&a(c);return d&&d.length?d:b.parent()}function d(b){return this.each(function(){var c=a(this),d=c.data("bs.dropdown");d||c.data("bs.dropdown",d=new g(this)),"string"==typeof b&&d[b].call(c)})}var e=".dropdown-backdrop",f='[data-toggle="dropdown"]',g=function(b){a(b).on("click.bs.dropdown",this.toggle)};g.VERSION="3.2.0",g.prototype.toggle=function(d){var e=a(this);if(!e.is(".disabled, :disabled")){var f=c(e),g=f.hasClass("open");if(b(),!g){"ontouchstart"in document.documentElement&&!f.closest(".navbar-nav").length&&a('<div class="dropdown-backdrop"/>').insertAfter(a(this)).on("click",b);var h={relatedTarget:this};if(f.trigger(d=a.Event("show.bs.dropdown",h)),d.isDefaultPrevented())return;e.trigger("focus"),f.toggleClass("open").trigger("shown.bs.dropdown",h)}return!1}},g.prototype.keydown=function(b){if(/(38|40|27)/.test(b.keyCode)){var d=a(this);if(b.preventDefault(),b.stopPropagation(),!d.is(".disabled, :disabled")){var 
 e=c(d),g=e.hasClass("open");if(!g||g&&27==b.keyCode)return 27==b.which&&e.find(f).trigger("focus"),d.trigger("click");var h=" li:not(.divider):visible a",i=e.find('[role="menu"]'+h+', [role="listbox"]'+h);if(i.length){var j=i.index(i.filter(":focus"));38==b.keyCode&&j>0&&j--,40==b.keyCode&&j<i.length-1&&j++,~j||(j=0),i.eq(j).trigger("focus")}}}};var h=a.fn.dropdown;a.fn.dropdown=d,a.fn.dropdown.Constructor=g,a.fn.dropdown.noConflict=function(){return a.fn.dropdown=h,this},a(document).on("click.bs.dropdown.data-api",b).on("click.bs.dropdown.data-api",".dropdown form",function(a){a.stopPropagation()}).on("click.bs.dropdown.data-api",f,g.prototype.toggle).on("keydown.bs.dropdown.data-api",f+', [role="menu"], [role="listbox"]',g.prototype.keydown)}(jQuery),+function(a){"use strict";function b(b,d){return this.each(function(){var e=a(this),f=e.data("bs.modal"),g=a.extend({},c.DEFAULTS,e.data(),"object"==typeof b&&b);f||e.data("bs.modal",f=new c(this,g)),"string"==typeof b?f[b](d)
 :g.show&&f.show(d)})}var c=function(b,c){this.options=c,this.$body=a(document.body),this.$element=a(b),this.$backdrop=this.isShown=null,this.scrollbarWidth=0,this.options.remote&&this.$element.find(".modal-content").load(this.options.remote,a.proxy(function(){this.$element.trigger("loaded.bs.modal")},this))};c.VERSION="3.2.0",c.DEFAULTS={backdrop:!0,keyboard:!0,show:!0},c.prototype.toggle=function(a){return this.isShown?this.hide():this.show(a)},c.prototype.show=function(b){var c=this,d=a.Event("show.bs.modal",{relatedTarget:b});this.$element.trigger(d),this.isShown||d.isDefaultPrevented()||(this.isShown=!0,this.checkScrollbar(),this.$body.addClass("modal-open"),this.setScrollbar(),this.escape(),this.$element.on("click.dismiss.bs.modal",'[data-dismiss="modal"]',a.proxy(this.hide,this)),this.backdrop(function(){var d=a.support.transition&&c.$element.hasClass("fade");c.$element.parent().length||c.$element.appendTo(c.$body),c.$element.show().scrollTop(0),d&&c.$element[0].offset
 Width,c.$element.addClass("in").attr("aria-hidden",!1),c.enforceFocus();var e=a.Event("shown.bs.modal",{relatedTarget:b});d?c.$element.find(".modal-dialog").one("bsTransitionEnd",function(){c.$element.trigger("focus").trigger(e)}).emulateTransitionEnd(300):c.$element.trigger("focus").trigger(e)}))},c.prototype.hide=function(b){b&&b.preventDefault(),b=a.Event("hide.bs.modal"),this.$element.trigger(b),this.isShown&&!b.isDefaultPrevented()&&(this.isShown=!1,this.$body.removeClass("modal-open"),this.resetScrollbar(),this.escape(),a(document).off("focusin.bs.modal"),this.$element.removeClass("in").attr("aria-hidden",!0).off("click.dismiss.bs.modal"),a.support.transition&&this.$element.hasClass("fade")?this.$element.one("bsTransitionEnd",a.proxy(this.hideModal,this)).emulateTransitionEnd(300):this.hideModal())},c.prototype.enforceFocus=function(){a(document).off("focusin.bs.modal").on("focusin.bs.modal",a.proxy(function(a){this.$element[0]===a.target||this.$element.has(a.target).l
 ength||this.$element.trigger("focus")},this))},c.prototype.escape=function(){this.isShown&&this.options.keyboard?this.$element.on("keyup.dismiss.bs.modal",a.proxy(function(a){27==a.which&&this.hide()},this)):this.isShown||this.$element.off("keyup.dismiss.bs.modal")},c.prototype.hideModal=function(){var a=this;this.$element.hide(),this.backdrop(function(){a.$element.trigger("hidden.bs.modal")})},c.prototype.removeBackdrop=function(){this.$backdrop&&this.$backdrop.remove(),this.$backdrop=null},c.prototype.backdrop=function(b){var c=this,d=this.$element.hasClass("fade")?"fade":"";if(this.isShown&&this.options.backdrop){var e=a.support.transition&&d;if(this.$backdrop=a('<div class="modal-backdrop '+d+'" />').appendTo(this.$body),this.$element.on("click.dismiss.bs.modal",a.proxy(function(a){a.target===a.currentTarget&&("static"==this.options.backdrop?this.$element[0].focus.call(this.$element[0]):this.hide.call(this))},this)),e&&this.$backdrop[0].offsetWidth,this.$backdrop.addClas
 s("in"),!b)return;e?this.$backdrop.one("bsTransitionEnd",b).emulateTransitionEnd(150):b()}else if(!this.isShown&&this.$backdrop){this.$backdrop.removeClass("in");var f=function(){c.removeBackdrop(),b&&b()};a.support.transition&&this.$element.hasClass("fade")?this.$backdrop.one("bsTransitionEnd",f).emulateTransitionEnd(150):f()}else b&&b()},c.prototype.checkScrollbar=function(){document.body.clientWidth>=window.innerWidth||(this.scrollbarWidth=this.scrollbarWidth||this.measureScrollbar())},c.prototype.setScrollbar=function(){var a=parseInt(this.$body.css("padding-right")||0,10);this.scrollbarWidth&&this.$body.css("padding-right",a+this.scrollbarWidth)},c.prototype.resetScrollbar=function(){this.$body.css("padding-right","")},c.prototype.measureScrollbar=function(){var a=document.createElement("div");a.className="modal-scrollbar-measure",this.$body.append(a);var b=a.offsetWidth-a.clientWidth;return this.$body[0].removeChild(a),b};var d=a.fn.modal;a.fn.modal=b,a.fn.modal.Constr
 uctor=c,a.fn.modal.noConflict=function(){return a.fn.modal=d,this},a(document).on("click.bs.modal.data-api",'[data-toggle="modal"]',function(c){var d=a(this),e=d.attr("href"),f=a(d.attr("data-target")||e&&e.replace(/.*(?=#[^\s]+$)/,"")),g=f.data("bs.modal")?"toggle":a.extend({remote:!/#/.test(e)&&e},f.data(),d.data());d.is("a")&&c.preventDefault(),f.one("show.bs.modal",function(a){a.isDefaultPrevented()||f.one("hidden.bs.modal",function(){d.is(":visible")&&d.trigger("focus")})}),b.call(f,g,this)})}(jQuery),+function(a){"use strict";function b(b){return this.each(function(){var d=a(this),e=d.data("bs.tooltip"),f="object"==typeof b&&b;(e||"destroy"!=b)&&(e||d.data("bs.tooltip",e=new c(this,f)),"string"==typeof b&&e[b]())})}var c=function(a,b){this.type=this.options=this.enabled=this.timeout=this.hoverState=this.$element=null,this.init("tooltip",a,b)};c.VERSION="3.2.0",c.DEFAULTS={animation:!0,placement:"top",selector:!1,template:'<div class="tooltip" role="tooltip"><div class=
 "tooltip-arrow"></div><div class="tooltip-inner"></div></div>',trigger:"hover focus",title:"",delay:0,html:!1,container:!1,viewport:{selector:"body",padding:0}},c.prototype.init=function(b,c,d){this.enabled=!0,this.type=b,this.$element=a(c),this.options=this.getOptions(d),this.$viewport=this.options.viewport&&a(this.options.viewport.selector||this.options.viewport);for(var e=this.options.trigger.split(" "),f=e.length;f--;){var g=e[f];if("click"==g)this.$element.on("click."+this.type,this.options.selector,a.proxy(this.toggle,this));else if("manual"!=g){var h="hover"==g?"mouseenter":"focusin",i="hover"==g?"mouseleave":"focusout";this.$element.on(h+"."+this.type,this.options.selector,a.proxy(this.enter,this)),this.$element.on(i+"."+this.type,this.options.selector,a.proxy(this.leave,this))}}this.options.selector?this._options=a.extend({},this.options,{trigger:"manual",selector:""}):this.fixTitle()},c.prototype.getDefaults=function(){return c.DEFAULTS},c.prototype.getOptions=func
 tion(b){return b=a.extend({},this.getDefaults(),this.$element.data(),b),b.delay&&"number"==typeof b.delay&&(b.delay={show:b.delay,hide:b.delay}),b},c.prototype.getDelegateOptions=function(){var b={},c=this.getDefaults();return this._options&&a.each(this._options,function(a,d){c[a]!=d&&(b[a]=d)}),b},c.prototype.enter=function(b){var c=b instanceof this.constructor?b:a(b.currentTarget).data("bs."+this.type);return c||(c=new this.constructor(b.currentTarget,this.getDelegateOptions()),a(b.currentTarget).data("bs."+this.type,c)),clearTimeout(c.timeout),c.hoverState="in",c.options.delay&&c.options.delay.show?void(c.timeout=setTimeout(function(){"in"==c.hoverState&&c.show()},c.options.delay.show)):c.show()},c.prototype.leave=function(b){var c=b instanceof this.constructor?b:a(b.currentTarget).data("bs."+this.type);return c||(c=new this.constructor(b.currentTarget,this.getDelegateOptions()),a(b.currentTarget).data("bs."+this.type,c)),clearTimeout(c.timeout),c.hoverState="out",c.opti
 ons.delay&&c.options.delay.hide?void(c.timeout=setTimeout(function(){"out"==c.hoverState&&c.hide()},c.options.delay.hide)):c.hide()},c.prototype.show=function(){var b=a.Event("show.bs."+this.type);if(this.hasContent()&&this.enabled){this.$element.trigger(b);var c=a.contains(document.documentElement,this.$element[0]);if(b.isDefaultPrevented()||!c)return;var d=this,e=this.tip(),f=this.getUID(this.type);this.setContent(),e.attr("id",f),this.$element.attr("aria-describedby",f),this.options.animation&&e.addClass("fade");var g="function"==typeof this.options.placement?this.options.placement.call(this,e[0],this.$element[0]):this.options.placement,h=/\s?auto?\s?/i,i=h.test(g);i&&(g=g.replace(h,"")||"top"),e.detach().css({top:0,left:0,display:"block"}).addClass(g).data("bs."+this.type,this),this.options.container?e.appendTo(this.options.container):e.insertAfter(this.$element);var j=this.getPosition(),k=e[0].offsetWidth,l=e[0].offsetHeight;if(i){var m=g,n=this.$element.parent(),o=this
 .getPosition(n);g="bottom"==g&&j.top+j.height+l-o.scroll>o.height?"top":"top"==g&&j.top-o.scroll-l<0?"bottom":"right"==g&&j.right+k>o.width?"left":"left"==g&&j.left-k<o.left?"right":g,e.removeClass(m).addClass(g)}var p=this.getCalculatedOffset(g,j,k,l);this.applyPlacement(p,g);var q=function(){d.$element.trigger("shown.bs."+d.type),d.hoverState=null};a.support.transition&&this.$tip.hasClass("fade")?e.one("bsTransitionEnd",q).emulateTransitionEnd(150):q()}},c.prototype.applyPlacement=function(b,c){var d=this.tip(),e=d[0].offsetWidth,f=d[0].offsetHeight,g=parseInt(d.css("margin-top"),10),h=parseInt(d.css("margin-left"),10);isNaN(g)&&(g=0),isNaN(h)&&(h=0),b.top=b.top+g,b.left=b.left+h,a.offset.setOffset(d[0],a.extend({using:function(a){d.css({top:Math.round(a.top),left:Math.round(a.left)})}},b),0),d.addClass("in");var i=d[0].offsetWidth,j=d[0].offsetHeight;"top"==c&&j!=f&&(b.top=b.top+f-j);var k=this.getViewportAdjustedDelta(c,b,i,j);k.left?b.left+=k.left:b.top+=k.top;var l=k.l
 eft?2*k.left-e+i:2*k.top-f+j,m=k.left?"left":"top",n=k.left?"offsetWidth":"offsetHeight";d.offset(b),this.replaceArrow(l,d[0][n],m)},c.prototype.replaceArrow=function(a,b,c){this.arrow().css(c,a?50*(1-a/b)+"%":"")},c.prototype.setContent=function(){var a=this.tip(),b=this.getTitle();a.find(".tooltip-inner")[this.options.html?"html":"text"](b),a.removeClass("fade in top bottom left right")},c.prototype.hide=function(){function b(){"in"!=c.hoverState&&d.detach(),c.$element.trigger("hidden.bs."+c.type)}var c=this,d=this.tip(),e=a.Event("hide.bs."+this.type);return this.$element.removeAttr("aria-describedby"),this.$element.trigger(e),e.isDefaultPrevented()?void 0:(d.removeClass("in"),a.support.transition&&this.$tip.hasClass("fade")?d.one("bsTransitionEnd",b).emulateTransitionEnd(150):b(),this.hoverState=null,this)},c.prototype.fixTitle=function(){var a=this.$element;(a.attr("title")||"string"!=typeof a.attr("data-original-title"))&&a.attr("data-original-title",a.attr("title")||"
 ").attr("title","")},c.prototype.hasContent=function(){return this.getTitle()},c.prototype.getPosition=function(b){b=b||this.$element;var c=b[0],d="BODY"==c.tagName;return a.extend({},"function"==typeof c.getBoundingClientRect?c.getBoundingClientRect():null,{scroll:d?document.documentElement.scrollTop||document.body.scrollTop:b.scrollTop(),width:d?a(window).width():b.outerWidth(),height:d?a(window).height():b.outerHeight()},d?{top:0,left:0}:b.offset())},c.prototype.getCalculatedOffset=function(a,b,c,d){return"bottom"==a?{top:b.top+b.height,left:b.left+b.width/2-c/2}:"top"==a?{top:b.top-d,left:b.left+b.width/2-c/2}:"left"==a?{top:b.top+b.height/2-d/2,left:b.left-c}:{top:b.top+b.height/2-d/2,left:b.left+b.width}},c.prototype.getViewportAdjustedDelta=function(a,b,c,d){var e={top:0,left:0};if(!this.$viewport)return e;var f=this.options.viewport&&this.options.viewport.padding||0,g=this.getPosition(this.$viewport);if(/right|left/.test(a)){var h=b.top-f-g.scroll,i=b.top+f-g.scroll+
 d;h<g.top?e.top=g.top-h:i>g.top+g.height&&(e.top=g.top+g.height-i)}else{var j=b.left-f,k=b.left+f+c;j<g.left?e.left=g.left-j:k>g.width&&(e.left=g.left+g.width-k)}return e},c.prototype.getTitle=function(){var a,b=this.$element,c=this.options;return a=b.attr("data-original-title")||("function"==typeof c.title?c.title.call(b[0]):c.title)},c.prototype.getUID=function(a){do a+=~~(1e6*Math.random());while(document.getElementById(a));return a},c.prototype.tip=function(){return this.$tip=this.$tip||a(this.options.template)},c.prototype.arrow=function(){return this.$arrow=this.$arrow||this.tip().find(".tooltip-arrow")},c.prototype.validate=function(){this.$element[0].parentNode||(this.hide(),this.$element=null,this.options=null)},c.prototype.enable=function(){this.enabled=!0},c.prototype.disable=function(){this.enabled=!1},c.prototype.toggleEnabled=function(){this.enabled=!this.enabled},c.prototype.toggle=function(b){var c=this;b&&(c=a(b.currentTarget).data("bs."+this.type),c||(c=new
  this.constructor(b.currentTarget,this.getDelegateOptions()),a(b.currentTarget).data("bs."+this.type,c))),c.tip().hasClass("in")?c.leave(c):c.enter(c)},c.prototype.destroy=function(){clearTimeout(this.timeout),this.hide().$element.off("."+this.type).removeData("bs."+this.type)};var d=a.fn.tooltip;a.fn.tooltip=b,a.fn.tooltip.Constructor=c,a.fn.tooltip.noConflict=function(){return a.fn.tooltip=d,this}}(jQuery),+function(a){"use strict";function b(b){return this.each(function(){var d=a(this),e=d.data("bs.popover"),f="object"==typeof b&&b;(e||"destroy"!=b)&&(e||d.data("bs.popover",e=new c(this,f)),"string"==typeof b&&e[b]())})}var c=function(a,b){this.init("popover",a,b)};if(!a.fn.tooltip)throw new Error("Popover requires tooltip.js");c.VERSION="3.2.0",c.DEFAULTS=a.extend({},a.fn.tooltip.Constructor.DEFAULTS,{placement:"right",trigger:"click",content:"",template:'<div class="popover" role="tooltip"><div class="arrow"></div><h3 class="popover-title"></h3><div class="popover-conte
 nt"></div></div>'}),c.prototype=a.extend({},a.fn.tooltip.Constructor.prototype),c.prototype.constructor=c,c.prototype.getDefaults=function(){return c.DEFAULTS},c.prototype.setContent=function(){var a=this.tip(),b=this.getTitle(),c=this.getContent();a.find(".popover-title")[this.options.html?"html":"text"](b),a.find(".popover-content").empty()[this.options.html?"string"==typeof c?"html":"append":"text"](c),a.removeClass("fade top bottom left right in"),a.find(".popover-title").html()||a.find(".popover-title").hide()},c.prototype.hasContent=function(){return this.getTitle()||this.getContent()},c.prototype.getContent=function(){var a=this.$element,b=this.options;return a.attr("data-content")||("function"==typeof b.content?b.content.call(a[0]):b.content)},c.prototype.arrow=function(){return this.$arrow=this.$arrow||this.tip().find(".arrow")},c.prototype.tip=function(){return this.$tip||(this.$tip=a(this.options.template)),this.$tip};var d=a.fn.popover;a.fn.popover=b,a.fn.popover
 .Constructor=c,a.fn.popover.noConflict=function(){return a.fn.popover=d,this}}(jQuery),+function(a){"use strict";function b(c,d){var e=a.proxy(this.process,this);this.$body=a("body"),this.$scrollElement=a(a(c).is("body")?window:c),this.options=a.extend({},b.DEFAULTS,d),this.selector=(this.options.target||"")+" .nav li > a",this.offsets=[],this.targets=[],this.activeTarget=null,this.scrollHeight=0,this.$scrollElement.on("scroll.bs.scrollspy",e),this.refresh(),this.process()}function c(c){return this.each(function(){var d=a(this),e=d.data("bs.scrollspy"),f="object"==typeof c&&c;e||d.data("bs.scrollspy",e=new b(this,f)),"string"==typeof c&&e[c]()})}b.VERSION="3.2.0",b.DEFAULTS={offset:10},b.prototype.getScrollHeight=function(){return this.$scrollElement[0].scrollHeight||Math.max(this.$body[0].scrollHeight,document.documentElement.scrollHeight)},b.prototype.refresh=function(){var b="offset",c=0;a.isWindow(this.$scrollElement[0])||(b="position",c=this.$scrollElement.scrollTop()),
 this.offsets=[],this.targets=[],this.scrollHeight=this.getScrollHeight();var d=this;this.$body.find(this.selector).map(function(){var d=a(this),e=d.data("target")||d.attr("href"),f=/^#./.test(e)&&a(e);return f&&f.length&&f.is(":visible")&&[[f[b]().top+c,e]]||null}).sort(function(a,b){return a[0]-b[0]}).each(function(){d.offsets.push(this[0]),d.targets.push(this[1])})},b.prototype.process=function(){var a,b=this.$scrollElement.scrollTop()+this.options.offset,c=this.getScrollHeight(),d=this.options.offset+c-this.$scrollElement.height(),e=this.offsets,f=this.targets,g=this.activeTarget;if(this.scrollHeight!=c&&this.refresh(),b>=d)return g!=(a=f[f.length-1])&&this.activate(a);if(g&&b<=e[0])return g!=(a=f[0])&&this.activate(a);for(a=e.length;a--;)g!=f[a]&&b>=e[a]&&(!e[a+1]||b<=e[a+1])&&this.activate(f[a])},b.prototype.activate=function(b){this.activeTarget=b,a(this.selector).parentsUntil(this.options.target,".active").removeClass("active");var c=this.selector+'[data-target="'+b+'
 "],'+this.selector+'[href="'+b+'"]',d=a(c).parents("li").addClass("active");d.parent(".dropdown-menu").length&&(d=d.closest("li.dropdown").addClass("active")),d.trigger("activate.bs.scrollspy")};var d=a.fn.scrollspy;a.fn.scrollspy=c,a.fn.scrollspy.Constructor=b,a.fn.scrollspy.noConflict=function(){return a.fn.scrollspy=d,this},a(window).on("load.bs.scrollspy.data-api",function(){a('[data-spy="scroll"]').each(function(){var b=a(this);c.call(b,b.data())})})}(jQuery),+function(a){"use strict";function b(b){return this.each(function(){var d=a(this),e=d.data("bs.tab");e||d.data("bs.tab",e=new c(this)),"string"==typeof b&&e[b]()})}var c=function(b){this.element=a(b)};c.VERSION="3.2.0",c.prototype.show=function(){var b=this.element,c=b.closest("ul:not(.dropdown-menu)"),d=b.data("target");if(d||(d=b.attr("href"),d=d&&d.replace(/.*(?=#[^\s]*$)/,"")),!b.parent("li").hasClass("active")){var e=c.find(".active:last a")[0],f=a.Event("show.bs.tab",{relatedTarget:e});if(b.trigger(f),!f.isDe
 faultPrevented()){var g=a(d);this.activate(b.closest("li"),c),this.activate(g,g.parent(),function(){b.trigger({type:"shown.bs.tab",relatedTarget:e})})}}},c.prototype.activate=function(b,c,d){function e(){f.removeClass("active").find("> .dropdown-menu > .active").removeClass("active"),b.addClass("active"),g?(b[0].offsetWidth,b.addClass("in")):b.removeClass("fade"),b.parent(".dropdown-menu")&&b.closest("li.dropdown").addClass("active"),d&&d()}var f=c.find("> .active"),g=d&&a.support.transition&&f.hasClass("fade");g?f.one("bsTransitionEnd",e).emulateTransitionEnd(150):e(),f.removeClass("in")};var d=a.fn.tab;a.fn.tab=b,a.fn.tab.Constructor=c,a.fn.tab.noConflict=function(){return a.fn.tab=d,this},a(document).on("click.bs.tab.data-api",'[data-toggle="tab"], [data-toggle="pill"]',function(c){c.preventDefault(),b.call(a(this),"show")})}(jQuery),+function(a){"use strict";function b(b){return this.each(function(){var d=a(this),e=d.data("bs.affix"),f="object"==typeof b&&b;e||d.data("bs
 .affix",e=new c(this,f)),"string"==typeof b&&e[b]()})}var c=function(b,d){this.options=a.extend({},c.DEFAULTS,d),this.$target=a(this.options.target).on("scroll.bs.affix.data-api",a.proxy(this.checkPosition,this)).on("click.bs.affix.data-api",a.proxy(this.checkPositionWithEventLoop,this)),this.$element=a(b),this.affixed=this.unpin=this.pinnedOffset=null,this.checkPosition()};c.VERSION="3.2.0",c.RESET="affix affix-top affix-bottom",c.DEFAULTS={offset:0,target:window},c.prototype.getPinnedOffset=function(){if(this.pinnedOffset)return this.pinnedOffset;this.$element.removeClass(c.RESET).addClass("affix");var a=this.$target.scrollTop(),b=this.$element.offset();return this.pinnedOffset=b.top-a},c.prototype.checkPositionWithEventLoop=function(){setTimeout(a.proxy(this.checkPosition,this),1)},c.prototype.checkPosition=function(){if(this.$element.is(":visible")){var b=a(document).height(),d=this.$target.scrollTop(),e=this.$element.offset(),f=this.options.offset,g=f.top,h=f.bottom;"ob
 ject"!=typeof f&&(h=g=f),"function"==typeof g&&(g=f.top(this.$element)),"function"==typeof h&&(h=f.bottom(this.$element));var i=null!=this.unpin&&d+this.unpin<=e.top?!1:null!=h&&e.top+this.$element.height()>=b-h?"bottom":null!=g&&g>=d?"top":!1;if(this.affixed!==i){null!=this.unpin&&this.$element.css("top","");var j="affix"+(i?"-"+i:""),k=a.Event(j+".bs.affix");this.$element.trigger(k),k.isDefaultPrevented()||(this.affixed=i,this.unpin="bottom"==i?this.getPinnedOffset():null,this.$element.removeClass(c.RESET).addClass(j).trigger(a.Event(j.replace("affix","affixed"))),"bottom"==i&&this.$element.offset({top:b-this.$element.height()-h}))}}};var d=a.fn.affix;a.fn.affix=b,a.fn.affix.Constructor=c,a.fn.affix.noConflict=function(){return a.fn.affix=d,this},a(window).on("load",function(){a('[data-spy="affix"]').each(function(){var c=a(this),d=c.data();d.offset=d.offset||{},d.offsetBottom&&(d.offset.bottom=d.offsetBottom),d.offsetTop&&(d.offset.top=d.offsetTop),b.call(c,d)})})}(jQuery
 );
\ No newline at end of file
diff --git a/docs/js/jquery-1.10.2.min.js b/docs/js/jquery-1.10.2.min.js
deleted file mode 100644
index da41706..0000000
--- a/docs/js/jquery-1.10.2.min.js
+++ /dev/null
@@ -1,6 +0,0 @@
-/*! jQuery v1.10.2 | (c) 2005, 2013 jQuery Foundation, Inc. | jquery.org/license
-//@ sourceMappingURL=jquery-1.10.2.min.map
-*/
-(function(e,t){var n,r,i=typeof t,o=e.location,a=e.document,s=a.documentElement,l=e.jQuery,u=e.$,c={},p=[],f="1.10.2",d=p.concat,h=p.push,g=p.slice,m=p.indexOf,y=c.toString,v=c.hasOwnProperty,b=f.trim,x=function(e,t){return new x.fn.init(e,t,r)},w=/[+-]?(?:\d*\.|)\d+(?:[eE][+-]?\d+|)/.source,T=/\S+/g,C=/^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g,N=/^(?:\s*(<[\w\W]+>)[^>]*|#([\w-]*))$/,k=/^<(\w+)\s*\/?>(?:<\/\1>|)$/,E=/^[\],:{}\s]*$/,S=/(?:^|:|,)(?:\s*\[)+/g,A=/\\(?:["\\\/bfnrt]|u[\da-fA-F]{4})/g,j=/"[^"\\\r\n]*"|true|false|null|-?(?:\d+\.|)\d+(?:[eE][+-]?\d+|)/g,D=/^-ms-/,L=/-([\da-z])/gi,H=function(e,t){return t.toUpperCase()},q=function(e){(a.addEventListener||"load"===e.type||"complete"===a.readyState)&&(_(),x.ready())},_=function(){a.addEventListener?(a.removeEventListener("DOMContentLoaded",q,!1),e.removeEventListener("load",q,!1)):(a.detachEvent("onreadystatechange",q),e.detachEvent("onload",q))};x.fn=x.prototype={jquery:f,constructor:x,init:function(e,n,r){var i,o;if(!e)retu
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
-}({});var B=/(?:\{[\s\S]*\}|\[[\s\S]*\])$/,P=/([A-Z])/g;function R(e,n,r,i){if(x.acceptData(e)){var o,a,s=x.expando,l=e.nodeType,u=l?x.cache:e,c=l?e[s]:e[s]&&s;if(c&&u[c]&&(i||u[c].data)||r!==t||"string"!=typeof n)return c||(c=l?e[s]=p.pop()||x.guid++:s),u[c]||(u[c]=l?{}:{toJSON:x.noop}),("object"==typeof n||"function"==typeof n)&&(i?u[c]=x.extend(u[c],n):u[c].data=x.extend(u[c].data,n)),a=u[c],i||(a.data||(a.data={}),a=a.data),r!==t&&(a[x.camelCase(n)]=r),"string"==typeof n?(o=a[n],null==o&&(o=a[x.camelCase(n)])):o=a,o}}function W(e,t,n){if(x.acceptData(e)){var r,i,o=e.nodeType,a=o?x.cache:e,s=o?e[x.expando]:x.expando;if(a[s]){if(t&&(r=n?a[s]:a[s].data)){x.isArray(t)?t=t.concat(x.map(t,x.camelCase)):t in r?t=[t]:(t=x.camelCase(t),t=t in r?[t]:t.split(" ")),i=t.length;while(i--)delete r[t[i]];if(n?!I(r):!x.isEmptyObject(r))return}(n||(delete a[s].data,I(a[s])))&&(o?x.cleanData([e],!0):x.support.deleteExpando||a!=a.window?delete a[s]:a[s]=null)}}}x.extend({cache:{},noData:{ap
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
-u[o]&&(delete u[o],c?delete n[l]:typeof n.removeAttribute!==i?n.removeAttribute(l):n[l]=null,p.push(o))}},_evalUrl:function(e){return x.ajax({url:e,type:"GET",dataType:"script",async:!1,global:!1,"throws":!0})}}),x.fn.extend({wrapAll:function(e){if(x.isFunction(e))return this.each(function(t){x(this).wrapAll(e.call(this,t))});if(this[0]){var t=x(e,this[0].ownerDocument).eq(0).clone(!0);this[0].parentNode&&t.insertBefore(this[0]),t.map(function(){var e=this;while(e.firstChild&&1===e.firstChild.nodeType)e=e.firstChild;return e}).append(this)}return this},wrapInner:function(e){return x.isFunction(e)?this.each(function(t){x(this).wrapInner(e.call(this,t))}):this.each(function(){var t=x(this),n=t.contents();n.length?n.wrapAll(e):t.append(e)})},wrap:function(e){var t=x.isFunction(e);return this.each(function(n){x(this).wrapAll(t?e.call(this,n):e)})},unwrap:function(){return this.parent().each(function(){x.nodeName(this,"body")||x(this).replaceWith(this.childNodes)}).end()}});var P
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
diff --git a/docs/js/jquery-1.11.1.min.js b/docs/js/jquery-1.11.1.min.js
new file mode 100644
index 0000000..ab28a24
--- /dev/null
+++ b/docs/js/jquery-1.11.1.min.js
@@ -0,0 +1,4 @@
+/*! jQuery v1.11.1 | (c) 2005, 2014 jQuery Foundation, Inc. | jquery.org/license */
+!function(a,b){"object"==typeof module&&"object"==typeof module.exports?module.exports=a.document?b(a,!0):function(a){if(!a.document)throw new Error("jQuery requires a window with a document");return b(a)}:b(a)}("undefined"!=typeof window?window:this,function(a,b){var c=[],d=c.slice,e=c.concat,f=c.push,g=c.indexOf,h={},i=h.toString,j=h.hasOwnProperty,k={},l="1.11.1",m=function(a,b){return new m.fn.init(a,b)},n=/^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g,o=/^-ms-/,p=/-([\da-z])/gi,q=function(a,b){return b.toUpperCase()};m.fn=m.prototype={jquery:l,constructor:m,selector:"",length:0,toArray:function(){return d.call(this)},get:function(a){return null!=a?0>a?this[a+this.length]:this[a]:d.call(this)},pushStack:function(a){var b=m.merge(this.constructor(),a);return b.prevObject=this,b.context=this.context,b},each:function(a,b){return m.each(this,a,b)},map:function(a){return this.pushStack(m.map(this,function(b,c){return a.call(b,c,b)}))},slice:function(){return this.pushStack(d.apply(this
 ,arguments))},first:function(){return this.eq(0)},last:function(){return this.eq(-1)},eq:function(a){var b=this.length,c=+a+(0>a?b:0);return this.pushStack(c>=0&&b>c?[this[c]]:[])},end:function(){return this.prevObject||this.constructor(null)},push:f,sort:c.sort,splice:c.splice},m.extend=m.fn.extend=function(){var a,b,c,d,e,f,g=arguments[0]||{},h=1,i=arguments.length,j=!1;for("boolean"==typeof g&&(j=g,g=arguments[h]||{},h++),"object"==typeof g||m.isFunction(g)||(g={}),h===i&&(g=this,h--);i>h;h++)if(null!=(e=arguments[h]))for(d in e)a=g[d],c=e[d],g!==c&&(j&&c&&(m.isPlainObject(c)||(b=m.isArray(c)))?(b?(b=!1,f=a&&m.isArray(a)?a:[]):f=a&&m.isPlainObject(a)?a:{},g[d]=m.extend(j,f,c)):void 0!==c&&(g[d]=c));return g},m.extend({expando:"jQuery"+(l+Math.random()).replace(/\D/g,""),isReady:!0,error:function(a){throw new Error(a)},noop:function(){},isFunction:function(a){return"function"===m.type(a)},isArray:Array.isArray||function(a){return"array"===m.type(a)},isWindow:function(a){re
 turn null!=a&&a==a.window},isNumeric:function(a){return!m.isArray(a)&&a-parseFloat(a)>=0},isEmptyObject:function(a){var b;for(b in a)return!1;return!0},isPlainObject:function(a){var b;if(!a||"object"!==m.type(a)||a.nodeType||m.isWindow(a))return!1;try{if(a.constructor&&!j.call(a,"constructor")&&!j.call(a.constructor.prototype,"isPrototypeOf"))return!1}catch(c){return!1}if(k.ownLast)for(b in a)return j.call(a,b);for(b in a);return void 0===b||j.call(a,b)},type:function(a){return null==a?a+"":"object"==typeof a||"function"==typeof a?h[i.call(a)]||"object":typeof a},globalEval:function(b){b&&m.trim(b)&&(a.execScript||function(b){a.eval.call(a,b)})(b)},camelCase:function(a){return a.replace(o,"ms-").replace(p,q)},nodeName:function(a,b){return a.nodeName&&a.nodeName.toLowerCase()===b.toLowerCase()},each:function(a,b,c){var d,e=0,f=a.length,g=r(a);if(c){if(g){for(;f>e;e++)if(d=b.apply(a[e],c),d===!1)break}else for(e in a)if(d=b.apply(a[e],c),d===!1)break}else if(g){for(;f>e;e++)if
 (d=b.call(a[e],e,a[e]),d===!1)break}else for(e in a)if(d=b.call(a[e],e,a[e]),d===!1)break;return a},trim:function(a){return null==a?"":(a+"").replace(n,"")},makeArray:function(a,b){var c=b||[];return null!=a&&(r(Object(a))?m.merge(c,"string"==typeof a?[a]:a):f.call(c,a)),c},inArray:function(a,b,c){var d;if(b){if(g)return g.call(b,a,c);for(d=b.length,c=c?0>c?Math.max(0,d+c):c:0;d>c;c++)if(c in b&&b[c]===a)return c}return-1},merge:function(a,b){var c=+b.length,d=0,e=a.length;while(c>d)a[e++]=b[d++];if(c!==c)while(void 0!==b[d])a[e++]=b[d++];return a.length=e,a},grep:function(a,b,c){for(var d,e=[],f=0,g=a.length,h=!c;g>f;f++)d=!b(a[f],f),d!==h&&e.push(a[f]);return e},map:function(a,b,c){var d,f=0,g=a.length,h=r(a),i=[];if(h)for(;g>f;f++)d=b(a[f],f,c),null!=d&&i.push(d);else for(f in a)d=b(a[f],f,c),null!=d&&i.push(d);return e.apply([],i)},guid:1,proxy:function(a,b){var c,e,f;return"string"==typeof b&&(f=a[b],b=a,a=f),m.isFunction(a)?(c=d.call(arguments,2),e=function(){return a.
 apply(b||this,c.concat(d.call(arguments)))},e.guid=a.guid=a.guid||m.guid++,e):void 0},now:function(){return+new Date},support:k}),m.each("Boolean Number String Function Array Date RegExp Object Error".split(" "),function(a,b){h["[object "+b+"]"]=b.toLowerCase()});function r(a){var b=a.length,c=m.type(a);return"function"===c||m.isWindow(a)?!1:1===a.nodeType&&b?!0:"array"===c||0===b||"number"==typeof b&&b>0&&b-1 in a}var s=function(a){var b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u="sizzle"+-new Date,v=a.document,w=0,x=0,y=gb(),z=gb(),A=gb(),B=function(a,b){return a===b&&(l=!0),0},C="undefined",D=1<<31,E={}.hasOwnProperty,F=[],G=F.pop,H=F.push,I=F.push,J=F.slice,K=F.indexOf||function(a){for(var b=0,c=this.length;c>b;b++)if(this[b]===a)return b;return-1},L="checked|selected|async|autofocus|autoplay|controls|defer|disabled|hidden|ismap|loop|multiple|open|readonly|required|scoped",M="[\\x20\\t\\r\\n\\f]",N="(?:\\\\.|[\\w-]|[^\\x00-\\xa0])+",O=N.replace("w","w#"),P="\\["+M+"*("+N+")(?
 :"+M+"*([*^$|!~]?=)"+M+"*(?:'((?:\\\\.|[^\\\\'])*)'|\"((?:\\\\.|[^\\\\\"])*)\"|("+O+"))|)"+M+"*\\]",Q=":("+N+")(?:\\((('((?:\\\\.|[^\\\\'])*)'|\"((?:\\\\.|[^\\\\\"])*)\")|((?:\\\\.|[^\\\\()[\\]]|"+P+")*)|.*)\\)|)",R=new RegExp("^"+M+"+|((?:^|[^\\\\])(?:\\\\.)*)"+M+"+$","g"),S=new RegExp("^"+M+"*,"+M+"*"),T=new RegExp("^"+M+"*([>+~]|"+M+")"+M+"*"),U=new RegExp("="+M+"*([^\\]'\"]*?)"+M+"*\\]","g"),V=new RegExp(Q),W=new RegExp("^"+O+"$"),X={ID:new RegExp("^#("+N+")"),CLASS:new RegExp("^\\.("+N+")"),TAG:new RegExp("^("+N.replace("w","w*")+")"),ATTR:new RegExp("^"+P),PSEUDO:new RegExp("^"+Q),CHILD:new RegExp("^:(only|first|last|nth|nth-last)-(child|of-type)(?:\\("+M+"*(even|odd|(([+-]|)(\\d*)n|)"+M+"*(?:([+-]|)"+M+"*(\\d+)|))"+M+"*\\)|)","i"),bool:new RegExp("^(?:"+L+")$","i"),needsContext:new RegExp("^"+M+"*[>+~]|:(even|odd|eq|gt|lt|nth|first|last)(?:\\("+M+"*((?:-\\d)?\\d*)"+M+"*\\)|)(?=[^-]|$)","i")},Y=/^(?:input|select|textarea|button)$/i,Z=/^h\d$/i,$=/^[^{]+\{\s*\[native \w/
 ,_=/^(?:#([\w-]+)|(\w+)|\.([\w-]+))$/,ab=/[+~]/,bb=/'|\\/g,cb=new RegExp("\\\\([\\da-f]{1,6}"+M+"?|("+M+")|.)","ig"),db=function(a,b,c){var d="0x"+b-65536;return d!==d||c?b:0>d?String.fromCharCode(d+65536):String.fromCharCode(d>>10|55296,1023&d|56320)};try{I.apply(F=J.call(v.childNodes),v.childNodes),F[v.childNodes.length].nodeType}catch(eb){I={apply:F.length?function(a,b){H.apply(a,J.call(b))}:function(a,b){var c=a.length,d=0;while(a[c++]=b[d++]);a.length=c-1}}}function fb(a,b,d,e){var f,h,j,k,l,o,r,s,w,x;if((b?b.ownerDocument||b:v)!==n&&m(b),b=b||n,d=d||[],!a||"string"!=typeof a)return d;if(1!==(k=b.nodeType)&&9!==k)return[];if(p&&!e){if(f=_.exec(a))if(j=f[1]){if(9===k){if(h=b.getElementById(j),!h||!h.parentNode)return d;if(h.id===j)return d.push(h),d}else if(b.ownerDocument&&(h=b.ownerDocument.getElementById(j))&&t(b,h)&&h.id===j)return d.push(h),d}else{if(f[2])return I.apply(d,b.getElementsByTagName(a)),d;if((j=f[3])&&c.getElementsByClassName&&b.getElementsByClassName)re
 turn I.apply(d,b.getElementsByClassName(j)),d}if(c.qsa&&(!q||!q.test(a))){if(s=r=u,w=b,x=9===k&&a,1===k&&"object"!==b.nodeName.toLowerCase()){o=g(a),(r=b.getAttribute("id"))?s=r.replace(bb,"\\$&"):b.setAttribute("id",s),s="[id='"+s+"'] ",l=o.length;while(l--)o[l]=s+qb(o[l]);w=ab.test(a)&&ob(b.parentNode)||b,x=o.join(",")}if(x)try{return I.apply(d,w.querySelectorAll(x)),d}catch(y){}finally{r||b.removeAttribute("id")}}}return i(a.replace(R,"$1"),b,d,e)}function gb(){var a=[];function b(c,e){return a.push(c+" ")>d.cacheLength&&delete b[a.shift()],b[c+" "]=e}return b}function hb(a){return a[u]=!0,a}function ib(a){var b=n.createElement("div");try{return!!a(b)}catch(c){return!1}finally{b.parentNode&&b.parentNode.removeChild(b),b=null}}function jb(a,b){var c=a.split("|"),e=a.length;while(e--)d.attrHandle[c[e]]=b}function kb(a,b){var c=b&&a,d=c&&1===a.nodeType&&1===b.nodeType&&(~b.sourceIndex||D)-(~a.sourceIndex||D);if(d)return d;if(c)while(c=c.nextSibling)if(c===b)return-1;return a
 ?1:-1}function lb(a){return function(b){var c=b.nodeName.toLowerCase();return"input"===c&&b.type===a}}function mb(a){return function(b){var c=b.nodeName.toLowerCase();return("input"===c||"button"===c)&&b.type===a}}function nb(a){return hb(function(b){return b=+b,hb(function(c,d){var e,f=a([],c.length,b),g=f.length;while(g--)c[e=f[g]]&&(c[e]=!(d[e]=c[e]))})})}function ob(a){return a&&typeof a.getElementsByTagName!==C&&a}c=fb.support={},f=fb.isXML=function(a){var b=a&&(a.ownerDocument||a).documentElement;return b?"HTML"!==b.nodeName:!1},m=fb.setDocument=function(a){var b,e=a?a.ownerDocument||a:v,g=e.defaultView;return e!==n&&9===e.nodeType&&e.documentElement?(n=e,o=e.documentElement,p=!f(e),g&&g!==g.top&&(g.addEventListener?g.addEventListener("unload",function(){m()},!1):g.attachEvent&&g.attachEvent("onunload",function(){m()})),c.attributes=ib(function(a){return a.className="i",!a.getAttribute("className")}),c.getElementsByTagName=ib(function(a){return a.appendChild(e.createCo
 mment("")),!a.getElementsByTagName("*").length}),c.getElementsByClassName=$.test(e.getElementsByClassName)&&ib(function(a){return a.innerHTML="<div class='a'></div><div class='a i'></div>",a.firstChild.className="i",2===a.getElementsByClassName("i").length}),c.getById=ib(function(a){return o.appendChild(a).id=u,!e.getElementsByName||!e.getElementsByName(u).length}),c.getById?(d.find.ID=function(a,b){if(typeof b.getElementById!==C&&p){var c=b.getElementById(a);return c&&c.parentNode?[c]:[]}},d.filter.ID=function(a){var b=a.replace(cb,db);return function(a){return a.getAttribute("id")===b}}):(delete d.find.ID,d.filter.ID=function(a){var b=a.replace(cb,db);return function(a){var c=typeof a.getAttributeNode!==C&&a.getAttributeNode("id");return c&&c.value===b}}),d.find.TAG=c.getElementsByTagName?function(a,b){return typeof b.getElementsByTagName!==C?b.getElementsByTagName(a):void 0}:function(a,b){var c,d=[],e=0,f=b.getElementsByTagName(a);if("*"===a){while(c=f[e++])1===c.nodeType
 &&d.push(c);return d}return f},d.find.CLASS=c.getElementsByClassName&&function(a,b){return typeof b.getElementsByClassName!==C&&p?b.getElementsByClassName(a):void 0},r=[],q=[],(c.qsa=$.test(e.querySelectorAll))&&(ib(function(a){a.innerHTML="<select msallowclip=''><option selected=''></option></select>",a.querySelectorAll("[msallowclip^='']").length&&q.push("[*^$]="+M+"*(?:''|\"\")"),a.querySelectorAll("[selected]").length||q.push("\\["+M+"*(?:value|"+L+")"),a.querySelectorAll(":checked").length||q.push(":checked")}),ib(function(a){var b=e.createElement("input");b.setAttribute("type","hidden"),a.appendChild(b).setAttribute("name","D"),a.querySelectorAll("[name=d]").length&&q.push("name"+M+"*[*^$|!~]?="),a.querySelectorAll(":enabled").length||q.push(":enabled",":disabled"),a.querySelectorAll("*,:x"),q.push(",.*:")})),(c.matchesSelector=$.test(s=o.matches||o.webkitMatchesSelector||o.mozMatchesSelector||o.oMatchesSelector||o.msMatchesSelector))&&ib(function(a){c.disconnectedMatc
 h=s.call(a,"div"),s.call(a,"[s!='']:x"),r.push("!=",Q)}),q=q.length&&new RegExp(q.join("|")),r=r.length&&new RegExp(r.join("|")),b=$.test(o.compareDocumentPosition),t=b||$.test(o.contains)?function(a,b){var c=9===a.nodeType?a.documentElement:a,d=b&&b.parentNode;return a===d||!(!d||1!==d.nodeType||!(c.contains?c.contains(d):a.compareDocumentPosition&&16&a.compareDocumentPosition(d)))}:function(a,b){if(b)while(b=b.parentNode)if(b===a)return!0;return!1},B=b?function(a,b){if(a===b)return l=!0,0;var d=!a.compareDocumentPosition-!b.compareDocumentPosition;return d?d:(d=(a.ownerDocument||a)===(b.ownerDocument||b)?a.compareDocumentPosition(b):1,1&d||!c.sortDetached&&b.compareDocumentPosition(a)===d?a===e||a.ownerDocument===v&&t(v,a)?-1:b===e||b.ownerDocument===v&&t(v,b)?1:k?K.call(k,a)-K.call(k,b):0:4&d?-1:1)}:function(a,b){if(a===b)return l=!0,0;var c,d=0,f=a.parentNode,g=b.parentNode,h=[a],i=[b];if(!f||!g)return a===e?-1:b===e?1:f?-1:g?1:k?K.call(k,a)-K.call(k,b):0;if(f===g)return
  kb(a,b);c=a;while(c=c.parentNode)h.unshift(c);c=b;while(c=c.parentNode)i.unshift(c);while(h[d]===i[d])d++;return d?kb(h[d],i[d]):h[d]===v?-1:i[d]===v?1:0},e):n},fb.matches=function(a,b){return fb(a,null,null,b)},fb.matchesSelector=function(a,b){if((a.ownerDocument||a)!==n&&m(a),b=b.replace(U,"='$1']"),!(!c.matchesSelector||!p||r&&r.test(b)||q&&q.test(b)))try{var d=s.call(a,b);if(d||c.disconnectedMatch||a.document&&11!==a.document.nodeType)return d}catch(e){}return fb(b,n,null,[a]).length>0},fb.contains=function(a,b){return(a.ownerDocument||a)!==n&&m(a),t(a,b)},fb.attr=function(a,b){(a.ownerDocument||a)!==n&&m(a);var e=d.attrHandle[b.toLowerCase()],f=e&&E.call(d.attrHandle,b.toLowerCase())?e(a,b,!p):void 0;return void 0!==f?f:c.attributes||!p?a.getAttribute(b):(f=a.getAttributeNode(b))&&f.specified?f.value:null},fb.error=function(a){throw new Error("Syntax error, unrecognized expression: "+a)},fb.uniqueSort=function(a){var b,d=[],e=0,f=0;if(l=!c.detectDuplicates,k=!c.sortSta
 ble&&a.slice(0),a.sort(B),l){while(b=a[f++])b===a[f]&&(e=d.push(f));while(e--)a.splice(d[e],1)}return k=null,a},e=fb.getText=function(a){var b,c="",d=0,f=a.nodeType;if(f){if(1===f||9===f||11===f){if("string"==typeof a.textContent)return a.textContent;for(a=a.firstChild;a;a=a.nextSibling)c+=e(a)}else if(3===f||4===f)return a.nodeValue}else while(b=a[d++])c+=e(b);return c},d=fb.selectors={cacheLength:50,createPseudo:hb,match:X,attrHandle:{},find:{},relative:{">":{dir:"parentNode",first:!0}," ":{dir:"parentNode"},"+":{dir:"previousSibling",first:!0},"~":{dir:"previousSibling"}},preFilter:{ATTR:function(a){return a[1]=a[1].replace(cb,db),a[3]=(a[3]||a[4]||a[5]||"").replace(cb,db),"~="===a[2]&&(a[3]=" "+a[3]+" "),a.slice(0,4)},CHILD:function(a){return a[1]=a[1].toLowerCase(),"nth"===a[1].slice(0,3)?(a[3]||fb.error(a[0]),a[4]=+(a[4]?a[5]+(a[6]||1):2*("even"===a[3]||"odd"===a[3])),a[5]=+(a[7]+a[8]||"odd"===a[3])):a[3]&&fb.error(a[0]),a},PSEUDO:function(a){var b,c=!a[6]&&a[2];return
  X.CHILD.test(a[0])?null:(a[3]?a[2]=a[4]||a[5]||"":c&&V.test(c)&&(b=g(c,!0))&&(b=c.indexOf(")",c.length-b)-c.length)&&(a[0]=a[0].slice(0,b),a[2]=c.slice(0,b)),a.slice(0,3))}},filter:{TAG:function(a){var b=a.replace(cb,db).toLowerCase();return"*"===a?function(){return!0}:function(a){return a.nodeName&&a.nodeName.toLowerCase()===b}},CLASS:function(a){var b=y[a+" "];return b||(b=new RegExp("(^|"+M+")"+a+"("+M+"|$)"))&&y(a,function(a){return b.test("string"==typeof a.className&&a.className||typeof a.getAttribute!==C&&a.getAttribute("class")||"")})},ATTR:function(a,b,c){return function(d){var e=fb.attr(d,a);return null==e?"!="===b:b?(e+="","="===b?e===c:"!="===b?e!==c:"^="===b?c&&0===e.indexOf(c):"*="===b?c&&e.indexOf(c)>-1:"$="===b?c&&e.slice(-c.length)===c:"~="===b?(" "+e+" ").indexOf(c)>-1:"|="===b?e===c||e.slice(0,c.length+1)===c+"-":!1):!0}},CHILD:function(a,b,c,d,e){var f="nth"!==a.slice(0,3),g="last"!==a.slice(-4),h="of-type"===b;return 1===d&&0===e?function(a){return!!a.p
 arentNode}:function(b,c,i){var j,k,l,m,n,o,p=f!==g?"nextSibling":"previousSibling",q=b.parentNode,r=h&&b.nodeName.toLowerCase(),s=!i&&!h;if(q){if(f){while(p){l=b;while(l=l[p])if(h?l.nodeName.toLowerCase()===r:1===l.nodeType)return!1;o=p="only"===a&&!o&&"nextSibling"}return!0}if(o=[g?q.firstChild:q.lastChild],g&&s){k=q[u]||(q[u]={}),j=k[a]||[],n=j[0]===w&&j[1],m=j[0]===w&&j[2],l=n&&q.childNodes[n];while(l=++n&&l&&l[p]||(m=n=0)||o.pop())if(1===l.nodeType&&++m&&l===b){k[a]=[w,n,m];break}}else if(s&&(j=(b[u]||(b[u]={}))[a])&&j[0]===w)m=j[1];else while(l=++n&&l&&l[p]||(m=n=0)||o.pop())if((h?l.nodeName.toLowerCase()===r:1===l.nodeType)&&++m&&(s&&((l[u]||(l[u]={}))[a]=[w,m]),l===b))break;return m-=e,m===d||m%d===0&&m/d>=0}}},PSEUDO:function(a,b){var c,e=d.pseudos[a]||d.setFilters[a.toLowerCase()]||fb.error("unsupported pseudo: "+a);return e[u]?e(b):e.length>1?(c=[a,a,"",b],d.setFilters.hasOwnProperty(a.toLowerCase())?hb(function(a,c){var d,f=e(a,b),g=f.length;while(g--)d=K.call(a,f
 [g]),a[d]=!(c[d]=f[g])}):function(a){return e(a,0,c)}):e}},pseudos:{not:hb(function(a){var b=[],c=[],d=h(a.replace(R,"$1"));return d[u]?hb(function(a,b,c,e){var f,g=d(a,null,e,[]),h=a.length;while(h--)(f=g[h])&&(a[h]=!(b[h]=f))}):function(a,e,f){return b[0]=a,d(b,null,f,c),!c.pop()}}),has:hb(function(a){return function(b){return fb(a,b).length>0}}),contains:hb(function(a){return function(b){return(b.textContent||b.innerText||e(b)).indexOf(a)>-1}}),lang:hb(function(a){return W.test(a||"")||fb.error("unsupported lang: "+a),a=a.replace(cb,db).toLowerCase(),function(b){var c;do if(c=p?b.lang:b.getAttribute("xml:lang")||b.getAttribute("lang"))return c=c.toLowerCase(),c===a||0===c.indexOf(a+"-");while((b=b.parentNode)&&1===b.nodeType);return!1}}),target:function(b){var c=a.location&&a.location.hash;return c&&c.slice(1)===b.id},root:function(a){return a===o},focus:function(a){return a===n.activeElement&&(!n.hasFocus||n.hasFocus())&&!!(a.type||a.href||~a.tabIndex)},enabled:function(
 a){return a.disabled===!1},disabled:function(a){return a.disabled===!0},checked:function(a){var b=a.nodeName.toLowerCase();return"input"===b&&!!a.checked||"option"===b&&!!a.selected},selected:function(a){return a.parentNode&&a.parentNode.selectedIndex,a.selected===!0},empty:function(a){for(a=a.firstChild;a;a=a.nextSibling)if(a.nodeType<6)return!1;return!0},parent:function(a){return!d.pseudos.empty(a)},header:function(a){return Z.test(a.nodeName)},input:function(a){return Y.test(a.nodeName)},button:function(a){var b=a.nodeName.toLowerCase();return"input"===b&&"button"===a.type||"button"===b},text:function(a){var b;return"input"===a.nodeName.toLowerCase()&&"text"===a.type&&(null==(b=a.getAttribute("type"))||"text"===b.toLowerCase())},first:nb(function(){return[0]}),last:nb(function(a,b){return[b-1]}),eq:nb(function(a,b,c){return[0>c?c+b:c]}),even:nb(function(a,b){for(var c=0;b>c;c+=2)a.push(c);return a}),odd:nb(function(a,b){for(var c=1;b>c;c+=2)a.push(c);return a}),lt:nb(func
 tion(a,b,c){for(var d=0>c?c+b:c;--d>=0;)a.push(d);return a}),gt:nb(function(a,b,c){for(var d=0>c?c+b:c;++d<b;)a.push(d);return a})}},d.pseudos.nth=d.pseudos.eq;for(b in{radio:!0,checkbox:!0,file:!0,password:!0,image:!0})d.pseudos[b]=lb(b);for(b in{submit:!0,reset:!0})d.pseudos[b]=mb(b);function pb(){}pb.prototype=d.filters=d.pseudos,d.setFilters=new pb,g=fb.tokenize=function(a,b){var c,e,f,g,h,i,j,k=z[a+" "];if(k)return b?0:k.slice(0);h=a,i=[],j=d.preFilter;while(h){(!c||(e=S.exec(h)))&&(e&&(h=h.slice(e[0].length)||h),i.push(f=[])),c=!1,(e=T.exec(h))&&(c=e.shift(),f.push({value:c,type:e[0].replace(R," ")}),h=h.slice(c.length));for(g in d.filter)!(e=X[g].exec(h))||j[g]&&!(e=j[g](e))||(c=e.shift(),f.push({value:c,type:g,matches:e}),h=h.slice(c.length));if(!c)break}return b?h.length:h?fb.error(a):z(a,i).slice(0)};function qb(a){for(var b=0,c=a.length,d="";c>b;b++)d+=a[b].value;return d}function rb(a,b,c){var d=b.dir,e=c&&"parentNode"===d,f=x++;return b.first?function(b,c,f){whi
 le(b=b[d])if(1===b.nodeType||e)return a(b,c,f)}:function(b,c,g){var h,i,j=[w,f];if(g){while(b=b[d])if((1===b.nodeType||e)&&a(b,c,g))return!0}else while(b=b[d])if(1===b.nodeType||e){if(i=b[u]||(b[u]={}),(h=i[d])&&h[0]===w&&h[1]===f)return j[2]=h[2];if(i[d]=j,j[2]=a(b,c,g))return!0}}}function sb(a){return a.length>1?function(b,c,d){var e=a.length;while(e--)if(!a[e](b,c,d))return!1;return!0}:a[0]}function tb(a,b,c){for(var d=0,e=b.length;e>d;d++)fb(a,b[d],c);return c}function ub(a,b,c,d,e){for(var f,g=[],h=0,i=a.length,j=null!=b;i>h;h++)(f=a[h])&&(!c||c(f,d,e))&&(g.push(f),j&&b.push(h));return g}function vb(a,b,c,d,e,f){return d&&!d[u]&&(d=vb(d)),e&&!e[u]&&(e=vb(e,f)),hb(function(f,g,h,i){var j,k,l,m=[],n=[],o=g.length,p=f||tb(b||"*",h.nodeType?[h]:h,[]),q=!a||!f&&b?p:ub(p,m,a,h,i),r=c?e||(f?a:o||d)?[]:g:q;if(c&&c(q,r,h,i),d){j=ub(r,n),d(j,[],h,i),k=j.length;while(k--)(l=j[k])&&(r[n[k]]=!(q[n[k]]=l))}if(f){if(e||a){if(e){j=[],k=r.length;while(k--)(l=r[k])&&j.push(q[k]=l);e(null
 ,r=[],j,i)}k=r.length;while(k--)(l=r[k])&&(j=e?K.call(f,l):m[k])>-1&&(f[j]=!(g[j]=l))}}else r=ub(r===g?r.splice(o,r.length):r),e?e(null,g,r,i):I.apply(g,r)})}function wb(a){for(var b,c,e,f=a.length,g=d.relative[a[0].type],h=g||d.relative[" "],i=g?1:0,k=rb(function(a){return a===b},h,!0),l=rb(function(a){return K.call(b,a)>-1},h,!0),m=[function(a,c,d){return!g&&(d||c!==j)||((b=c).nodeType?k(a,c,d):l(a,c,d))}];f>i;i++)if(c=d.relative[a[i].type])m=[rb(sb(m),c)];else{if(c=d.filter[a[i].type].apply(null,a[i].matches),c[u]){for(e=++i;f>e;e++)if(d.relative[a[e].type])break;return vb(i>1&&sb(m),i>1&&qb(a.slice(0,i-1).concat({value:" "===a[i-2].type?"*":""})).replace(R,"$1"),c,e>i&&wb(a.slice(i,e)),f>e&&wb(a=a.slice(e)),f>e&&qb(a))}m.push(c)}return sb(m)}function xb(a,b){var c=b.length>0,e=a.length>0,f=function(f,g,h,i,k){var l,m,o,p=0,q="0",r=f&&[],s=[],t=j,u=f||e&&d.find.TAG("*",k),v=w+=null==t?1:Math.random()||.1,x=u.length;for(k&&(j=g!==n&&g);q!==x&&null!=(l=u[q]);q++){if(e&&l){m
 =0;while(o=a[m++])if(o(l,g,h)){i.push(l);break}k&&(w=v)}c&&((l=!o&&l)&&p--,f&&r.push(l))}if(p+=q,c&&q!==p){m=0;while(o=b[m++])o(r,s,g,h);if(f){if(p>0)while(q--)r[q]||s[q]||(s[q]=G.call(i));s=ub(s)}I.apply(i,s),k&&!f&&s.length>0&&p+b.length>1&&fb.uniqueSort(i)}return k&&(w=v,j=t),r};return c?hb(f):f}return h=fb.compile=function(a,b){var c,d=[],e=[],f=A[a+" "];if(!f){b||(b=g(a)),c=b.length;while(c--)f=wb(b[c]),f[u]?d.push(f):e.push(f);f=A(a,xb(e,d)),f.selector=a}return f},i=fb.select=function(a,b,e,f){var i,j,k,l,m,n="function"==typeof a&&a,o=!f&&g(a=n.selector||a);if(e=e||[],1===o.length){if(j=o[0]=o[0].slice(0),j.length>2&&"ID"===(k=j[0]).type&&c.getById&&9===b.nodeType&&p&&d.relative[j[1].type]){if(b=(d.find.ID(k.matches[0].replace(cb,db),b)||[])[0],!b)return e;n&&(b=b.parentNode),a=a.slice(j.shift().value.length)}i=X.needsContext.test(a)?0:j.length;while(i--){if(k=j[i],d.relative[l=k.type])break;if((m=d.find[l])&&(f=m(k.matches[0].replace(cb,db),ab.test(j[0].type)&&ob(b.pa
 rentNode)||b))){if(j.splice(i,1),a=f.length&&qb(j),!a)return I.apply(e,f),e;break}}}return(n||h(a,o))(f,b,!p,e,ab.test(a)&&ob(b.parentNode)||b),e},c.sortStable=u.split("").sort(B).join("")===u,c.detectDuplicates=!!l,m(),c.sortDetached=ib(function(a){return 1&a.compareDocumentPosition(n.createElement("div"))}),ib(function(a){return a.innerHTML="<a href='#'></a>","#"===a.firstChild.getAttribute("href")})||jb("type|href|height|width",function(a,b,c){return c?void 0:a.getAttribute(b,"type"===b.toLowerCase()?1:2)}),c.attributes&&ib(function(a){return a.innerHTML="<input/>",a.firstChild.setAttribute("value",""),""===a.firstChild.getAttribute("value")})||jb("value",function(a,b,c){return c||"input"!==a.nodeName.toLowerCase()?void 0:a.defaultValue}),ib(function(a){return null==a.getAttribute("disabled")})||jb(L,function(a,b,c){var d;return c?void 0:a[b]===!0?b.toLowerCase():(d=a.getAttributeNode(b))&&d.specified?d.value:null}),fb}(a);m.find=s,m.expr=s.selectors,m.expr[":"]=m.expr.ps
 eudos,m.unique=s.uniqueSort,m.text=s.getText,m.isXMLDoc=s.isXML,m.contains=s.contains;var t=m.expr.match.needsContext,u=/^<(\w+)\s*\/?>(?:<\/\1>|)$/,v=/^.[^:#\[\.,]*$/;function w(a,b,c){if(m.isFunction(b))return m.grep(a,function(a,d){return!!b.call(a,d,a)!==c});if(b.nodeType)return m.grep(a,function(a){return a===b!==c});if("string"==typeof b){if(v.test(b))return m.filter(b,a,c);b=m.filter(b,a)}return m.grep(a,function(a){return m.inArray(a,b)>=0!==c})}m.filter=function(a,b,c){var d=b[0];return c&&(a=":not("+a+")"),1===b.length&&1===d.nodeType?m.find.matchesSelector(d,a)?[d]:[]:m.find.matches(a,m.grep(b,function(a){return 1===a.nodeType}))},m.fn.extend({find:function(a){var b,c=[],d=this,e=d.length;if("string"!=typeof a)return this.pushStack(m(a).filter(function(){for(b=0;e>b;b++)if(m.contains(d[b],this))return!0}));for(b=0;e>b;b++)m.find(a,d[b],c);return c=this.pushStack(e>1?m.unique(c):c),c.selector=this.selector?this.selector+" "+a:a,c},filter:function(a){return this.pus
 hStack(w(this,a||[],!1))},not:function(a){return this.pushStack(w(this,a||[],!0))},is:function(a){return!!w(this,"string"==typeof a&&t.test(a)?m(a):a||[],!1).length}});var x,y=a.document,z=/^(?:\s*(<[\w\W]+>)[^>]*|#([\w-]*))$/,A=m.fn.init=function(a,b){var c,d;if(!a)return this;if("string"==typeof a){if(c="<"===a.charAt(0)&&">"===a.charAt(a.length-1)&&a.length>=3?[null,a,null]:z.exec(a),!c||!c[1]&&b)return!b||b.jquery?(b||x).find(a):this.constructor(b).find(a);if(c[1]){if(b=b instanceof m?b[0]:b,m.merge(this,m.parseHTML(c[1],b&&b.nodeType?b.ownerDocument||b:y,!0)),u.test(c[1])&&m.isPlainObject(b))for(c in b)m.isFunction(this[c])?this[c](b[c]):this.attr(c,b[c]);return this}if(d=y.getElementById(c[2]),d&&d.parentNode){if(d.id!==c[2])return x.find(a);this.length=1,this[0]=d}return this.context=y,this.selector=a,this}return a.nodeType?(this.context=this[0]=a,this.length=1,this):m.isFunction(a)?"undefined"!=typeof x.ready?x.ready(a):a(m):(void 0!==a.selector&&(this.selector=a.sel
 ector,this.context=a.context),m.makeArray(a,this))};A.prototype=m.fn,x=m(y);var B=/^(?:parents|prev(?:Until|All))/,C={children:!0,contents:!0,next:!0,prev:!0};m.extend({dir:function(a,b,c){var d=[],e=a[b];while(e&&9!==e.nodeType&&(void 0===c||1!==e.nodeType||!m(e).is(c)))1===e.nodeType&&d.push(e),e=e[b];return d},sibling:function(a,b){for(var c=[];a;a=a.nextSibling)1===a.nodeType&&a!==b&&c.push(a);return c}}),m.fn.extend({has:function(a){var b,c=m(a,this),d=c.length;return this.filter(function(){for(b=0;d>b;b++)if(m.contains(this,c[b]))return!0})},closest:function(a,b){for(var c,d=0,e=this.length,f=[],g=t.test(a)||"string"!=typeof a?m(a,b||this.context):0;e>d;d++)for(c=this[d];c&&c!==b;c=c.parentNode)if(c.nodeType<11&&(g?g.index(c)>-1:1===c.nodeType&&m.find.matchesSelector(c,a))){f.push(c);break}return this.pushStack(f.length>1?m.unique(f):f)},index:function(a){return a?"string"==typeof a?m.inArray(this[0],m(a)):m.inArray(a.jquery?a[0]:a,this):this[0]&&this[0].parentNode?thi
 s.first().prevAll().length:-1},add:function(a,b){return this.pushStack(m.unique(m.merge(this.get(),m(a,b))))},addBack:function(a){return this.add(null==a?this.prevObject:this.prevObject.filter(a))}});function D(a,b){do a=a[b];while(a&&1!==a.nodeType);return a}m.each({parent:function(a){var b=a.parentNode;return b&&11!==b.nodeType?b:null},parents:function(a){return m.dir(a,"parentNode")},parentsUntil:function(a,b,c){return m.dir(a,"parentNode",c)},next:function(a){return D(a,"nextSibling")},prev:function(a){return D(a,"previousSibling")},nextAll:function(a){return m.dir(a,"nextSibling")},prevAll:function(a){return m.dir(a,"previousSibling")},nextUntil:function(a,b,c){return m.dir(a,"nextSibling",c)},prevUntil:function(a,b,c){return m.dir(a,"previousSibling",c)},siblings:function(a){return m.sibling((a.parentNode||{}).firstChild,a)},children:function(a){return m.sibling(a.firstChild)},contents:function(a){return m.nodeName(a,"iframe")?a.contentDocument||a.contentWindow.documen
 t:m.merge([],a.childNodes)}},function(a,b){m.fn[a]=function(c,d){var e=m.map(this,b,c);return"Until"!==a.slice(-5)&&(d=c),d&&"string"==typeof d&&(e=m.filter(d,e)),this.length>1&&(C[a]||(e=m.unique(e)),B.test(a)&&(e=e.reverse())),this.pushStack(e)}});var E=/\S+/g,F={};function G(a){var b=F[a]={};return m.each(a.match(E)||[],function(a,c){b[c]=!0}),b}m.Callbacks=function(a){a="string"==typeof a?F[a]||G(a):m.extend({},a);var b,c,d,e,f,g,h=[],i=!a.once&&[],j=function(l){for(c=a.memory&&l,d=!0,f=g||0,g=0,e=h.length,b=!0;h&&e>f;f++)if(h[f].apply(l[0],l[1])===!1&&a.stopOnFalse){c=!1;break}b=!1,h&&(i?i.length&&j(i.shift()):c?h=[]:k.disable())},k={add:function(){if(h){var d=h.length;!function f(b){m.each(b,function(b,c){var d=m.type(c);"function"===d?a.unique&&k.has(c)||h.push(c):c&&c.length&&"string"!==d&&f(c)})}(arguments),b?e=h.length:c&&(g=d,j(c))}return this},remove:function(){return h&&m.each(arguments,function(a,c){var d;while((d=m.inArray(c,h,d))>-1)h.splice(d,1),b&&(e>=d&&e-
 -,f>=d&&f--)}),this},has:function(a){return a?m.inArray(a,h)>-1:!(!h||!h.length)},empty:function(){return h=[],e=0,this},disable:function(){return h=i=c=void 0,this},disabled:function(){return!h},lock:function(){return i=void 0,c||k.disable(),this},locked:function(){return!i},fireWith:function(a,c){return!h||d&&!i||(c=c||[],c=[a,c.slice?c.slice():c],b?i.push(c):j(c)),this},fire:function(){return k.fireWith(this,arguments),this},fired:function(){return!!d}};return k},m.extend({Deferred:function(a){var b=[["resolve","done",m.Callbacks("once memory"),"resolved"],["reject","fail",m.Callbacks("once memory"),"rejected"],["notify","progress",m.Callbacks("memory")]],c="pending",d={state:function(){return c},always:function(){return e.done(arguments).fail(arguments),this},then:function(){var a=arguments;return m.Deferred(function(c){m.each(b,function(b,f){var g=m.isFunction(a[b])&&a[b];e[f[1]](function(){var a=g&&g.apply(this,arguments);a&&m.isFunction(a.promise)?a.promise().done(c.r
 esolve).fail(c.reject).progress(c.notify):c[f[0]+"With"](this===d?c.promise():this,g?[a]:arguments)})}),a=null}).promise()},promise:function(a){return null!=a?m.extend(a,d):d}},e={};return d.pipe=d.then,m.each(b,function(a,f){var g=f[2],h=f[3];d[f[1]]=g.add,h&&g.add(function(){c=h},b[1^a][2].disable,b[2][2].lock),e[f[0]]=function(){return e[f[0]+"With"](this===e?d:this,arguments),this},e[f[0]+"With"]=g.fireWith}),d.promise(e),a&&a.call(e,e),e},when:function(a){var b=0,c=d.call(arguments),e=c.length,f=1!==e||a&&m.isFunction(a.promise)?e:0,g=1===f?a:m.Deferred(),h=function(a,b,c){return function(e){b[a]=this,c[a]=arguments.length>1?d.call(arguments):e,c===i?g.notifyWith(b,c):--f||g.resolveWith(b,c)}},i,j,k;if(e>1)for(i=new Array(e),j=new Array(e),k=new Array(e);e>b;b++)c[b]&&m.isFunction(c[b].promise)?c[b].promise().done(h(b,k,c)).fail(g.reject).progress(h(b,j,i)):--f;return f||g.resolveWith(k,c),g.promise()}});var H;m.fn.ready=function(a){return m.ready.promise().done(a),this
 },m.extend({isReady:!1,readyWait:1,holdReady:function(a){a?m.readyWait++:m.ready(!0)},ready:function(a){if(a===!0?!--m.readyWait:!m.isReady){if(!y.body)return setTimeout(m.ready);m.isReady=!0,a!==!0&&--m.readyWait>0||(H.resolveWith(y,[m]),m.fn.triggerHandler&&(m(y).triggerHandler("ready"),m(y).off("ready")))}}});function I(){y.addEventListener?(y.removeEventListener("DOMContentLoaded",J,!1),a.removeEventListener("load",J,!1)):(y.detachEvent("onreadystatechange",J),a.detachEvent("onload",J))}function J(){(y.addEventListener||"load"===event.type||"complete"===y.readyState)&&(I(),m.ready())}m.ready.promise=function(b){if(!H)if(H=m.Deferred(),"complete"===y.readyState)setTimeout(m.ready);else if(y.addEventListener)y.addEventListener("DOMContentLoaded",J,!1),a.addEventListener("load",J,!1);else{y.attachEvent("onreadystatechange",J),a.attachEvent("onload",J);var c=!1;try{c=null==a.frameElement&&y.documentElement}catch(d){}c&&c.doScroll&&!function e(){if(!m.isReady){try{c.doScroll(
 "left")}catch(a){return setTimeout(e,50)}I(),m.ready()}}()}return H.promise(b)};var K="undefined",L;for(L in m(k))break;k.ownLast="0"!==L,k.inlineBlockNeedsLayout=!1,m(function(){var a,b,c,d;c=y.getElementsByTagName("body")[0],c&&c.style&&(b=y.createElement("div"),d=y.createElement("div"),d.style.cssText="position:absolute;border:0;width:0;height:0;top:0;left:-9999px",c.appendChild(d).appendChild(b),typeof b.style.zoom!==K&&(b.style.cssText="display:inline;margin:0;border:0;padding:1px;width:1px;zoom:1",k.inlineBlockNeedsLayout=a=3===b.offsetWidth,a&&(c.style.zoom=1)),c.removeChild(d))}),function(){var a=y.createElement("div");if(null==k.deleteExpando){k.deleteExpando=!0;try{delete a.test}catch(b){k.deleteExpando=!1}}a=null}(),m.acceptData=function(a){var b=m.noData[(a.nodeName+" ").toLowerCase()],c=+a.nodeType||1;return 1!==c&&9!==c?!1:!b||b!==!0&&a.getAttribute("classid")===b};var M=/^(?:\{[\w\W]*\}|\[[\w\W]*\])$/,N=/([A-Z])/g;function O(a,b,c){if(void 0===c&&1===a.nodeTyp
 e){var d="data-"+b.replace(N,"-$1").toLowerCase();if(c=a.getAttribute(d),"string"==typeof c){try{c="true"===c?!0:"false"===c?!1:"null"===c?null:+c+""===c?+c:M.test(c)?m.parseJSON(c):c}catch(e){}m.data(a,b,c)}else c=void 0}return c}function P(a){var b;for(b in a)if(("data"!==b||!m.isEmptyObject(a[b]))&&"toJSON"!==b)return!1;return!0}function Q(a,b,d,e){if(m.acceptData(a)){var f,g,h=m.expando,i=a.nodeType,j=i?m.cache:a,k=i?a[h]:a[h]&&h;
+if(k&&j[k]&&(e||j[k].data)||void 0!==d||"string"!=typeof b)return k||(k=i?a[h]=c.pop()||m.guid++:h),j[k]||(j[k]=i?{}:{toJSON:m.noop}),("object"==typeof b||"function"==typeof b)&&(e?j[k]=m.extend(j[k],b):j[k].data=m.extend(j[k].data,b)),g=j[k],e||(g.data||(g.data={}),g=g.data),void 0!==d&&(g[m.camelCase(b)]=d),"string"==typeof b?(f=g[b],null==f&&(f=g[m.camelCase(b)])):f=g,f}}function R(a,b,c){if(m.acceptData(a)){var d,e,f=a.nodeType,g=f?m.cache:a,h=f?a[m.expando]:m.expando;if(g[h]){if(b&&(d=c?g[h]:g[h].data)){m.isArray(b)?b=b.concat(m.map(b,m.camelCase)):b in d?b=[b]:(b=m.camelCase(b),b=b in d?[b]:b.split(" ")),e=b.length;while(e--)delete d[b[e]];if(c?!P(d):!m.isEmptyObject(d))return}(c||(delete g[h].data,P(g[h])))&&(f?m.cleanData([a],!0):k.deleteExpando||g!=g.window?delete g[h]:g[h]=null)}}}m.extend({cache:{},noData:{"applet ":!0,"embed ":!0,"object ":"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"},hasData:function(a){return a=a.nodeType?m.cache[a[m.expando]]:a[m.expando],!!a&
 &!P(a)},data:function(a,b,c){return Q(a,b,c)},removeData:function(a,b){return R(a,b)},_data:function(a,b,c){return Q(a,b,c,!0)},_removeData:function(a,b){return R(a,b,!0)}}),m.fn.extend({data:function(a,b){var c,d,e,f=this[0],g=f&&f.attributes;if(void 0===a){if(this.length&&(e=m.data(f),1===f.nodeType&&!m._data(f,"parsedAttrs"))){c=g.length;while(c--)g[c]&&(d=g[c].name,0===d.indexOf("data-")&&(d=m.camelCase(d.slice(5)),O(f,d,e[d])));m._data(f,"parsedAttrs",!0)}return e}return"object"==typeof a?this.each(function(){m.data(this,a)}):arguments.length>1?this.each(function(){m.data(this,a,b)}):f?O(f,a,m.data(f,a)):void 0},removeData:function(a){return this.each(function(){m.removeData(this,a)})}}),m.extend({queue:function(a,b,c){var d;return a?(b=(b||"fx")+"queue",d=m._data(a,b),c&&(!d||m.isArray(c)?d=m._data(a,b,m.makeArray(c)):d.push(c)),d||[]):void 0},dequeue:function(a,b){b=b||"fx";var c=m.queue(a,b),d=c.length,e=c.shift(),f=m._queueHooks(a,b),g=function(){m.dequeue(a,b)};"in
 progress"===e&&(e=c.shift(),d--),e&&("fx"===b&&c.unshift("inprogress"),delete f.stop,e.call(a,g,f)),!d&&f&&f.empty.fire()},_queueHooks:function(a,b){var c=b+"queueHooks";return m._data(a,c)||m._data(a,c,{empty:m.Callbacks("once memory").add(function(){m._removeData(a,b+"queue"),m._removeData(a,c)})})}}),m.fn.extend({queue:function(a,b){var c=2;return"string"!=typeof a&&(b=a,a="fx",c--),arguments.length<c?m.queue(this[0],a):void 0===b?this:this.each(function(){var c=m.queue(this,a,b);m._queueHooks(this,a),"fx"===a&&"inprogress"!==c[0]&&m.dequeue(this,a)})},dequeue:function(a){return this.each(function(){m.dequeue(this,a)})},clearQueue:function(a){return this.queue(a||"fx",[])},promise:function(a,b){var c,d=1,e=m.Deferred(),f=this,g=this.length,h=function(){--d||e.resolveWith(f,[f])};"string"!=typeof a&&(b=a,a=void 0),a=a||"fx";while(g--)c=m._data(f[g],a+"queueHooks"),c&&c.empty&&(d++,c.empty.add(h));return h(),e.promise(b)}});var S=/[+-]?(?:\d*\.|)\d+(?:[eE][+-]?\d+|)/.source
 ,T=["Top","Right","Bottom","Left"],U=function(a,b){return a=b||a,"none"===m.css(a,"display")||!m.contains(a.ownerDocument,a)},V=m.access=function(a,b,c,d,e,f,g){var h=0,i=a.length,j=null==c;if("object"===m.type(c)){e=!0;for(h in c)m.access(a,b,h,c[h],!0,f,g)}else if(void 0!==d&&(e=!0,m.isFunction(d)||(g=!0),j&&(g?(b.call(a,d),b=null):(j=b,b=function(a,b,c){return j.call(m(a),c)})),b))for(;i>h;h++)b(a[h],c,g?d:d.call(a[h],h,b(a[h],c)));return e?a:j?b.call(a):i?b(a[0],c):f},W=/^(?:checkbox|radio)$/i;!function(){var a=y.createElement("input"),b=y.createElement("div"),c=y.createDocumentFragment();if(b.innerHTML="  <link/><table></table><a href='/a'>a</a><input type='checkbox'/>",k.leadingWhitespace=3===b.firstChild.nodeType,k.tbody=!b.getElementsByTagName("tbody").length,k.htmlSerialize=!!b.getElementsByTagName("link").length,k.html5Clone="<:nav></:nav>"!==y.createElement("nav").cloneNode(!0).outerHTML,a.type="checkbox",a.checked=!0,c.appendChild(a),k.appendChecked=a.checked,b.i
 nnerHTML="<textarea>x</textarea>",k.noCloneChecked=!!b.cloneNode(!0).lastChild.defaultValue,c.appendChild(b),b.innerHTML="<input type='radio' checked='checked' name='t'/>",k.checkClone=b.cloneNode(!0).cloneNode(!0).lastChild.checked,k.noCloneEvent=!0,b.attachEvent&&(b.attachEvent("onclick",function(){k.noCloneEvent=!1}),b.cloneNode(!0).click()),null==k.deleteExpando){k.deleteExpando=!0;try{delete b.test}catch(d){k.deleteExpando=!1}}}(),function(){var b,c,d=y.createElement("div");for(b in{submit:!0,change:!0,focusin:!0})c="on"+b,(k[b+"Bubbles"]=c in a)||(d.setAttribute(c,"t"),k[b+"Bubbles"]=d.attributes[c].expando===!1);d=null}();var X=/^(?:input|select|textarea)$/i,Y=/^key/,Z=/^(?:mouse|pointer|contextmenu)|click/,$=/^(?:focusinfocus|focusoutblur)$/,_=/^([^.]*)(?:\.(.+)|)$/;function ab(){return!0}function bb(){return!1}function cb(){try{return y.activeElement}catch(a){}}m.event={global:{},add:function(a,b,c,d,e){var f,g,h,i,j,k,l,n,o,p,q,r=m._data(a);if(r){c.handler&&(i=c,c=
 i.handler,e=i.selector),c.guid||(c.guid=m.guid++),(g=r.events)||(g=r.events={}),(k=r.handle)||(k=r.handle=function(a){return typeof m===K||a&&m.event.triggered===a.type?void 0:m.event.dispatch.apply(k.elem,arguments)},k.elem=a),b=(b||"").match(E)||[""],h=b.length;while(h--)f=_.exec(b[h])||[],o=q=f[1],p=(f[2]||"").split(".").sort(),o&&(j=m.event.special[o]||{},o=(e?j.delegateType:j.bindType)||o,j=m.event.special[o]||{},l=m.extend({type:o,origType:q,data:d,handler:c,guid:c.guid,selector:e,needsContext:e&&m.expr.match.needsContext.test(e),namespace:p.join(".")},i),(n=g[o])||(n=g[o]=[],n.delegateCount=0,j.setup&&j.setup.call(a,d,p,k)!==!1||(a.addEventListener?a.addEventListener(o,k,!1):a.attachEvent&&a.attachEvent("on"+o,k))),j.add&&(j.add.call(a,l),l.handler.guid||(l.handler.guid=c.guid)),e?n.splice(n.delegateCount++,0,l):n.push(l),m.event.global[o]=!0);a=null}},remove:function(a,b,c,d,e){var f,g,h,i,j,k,l,n,o,p,q,r=m.hasData(a)&&m._data(a);if(r&&(k=r.events)){b=(b||"").match(E
 )||[""],j=b.length;while(j--)if(h=_.exec(b[j])||[],o=q=h[1],p=(h[2]||"").split(".").sort(),o){l=m.event.special[o]||{},o=(d?l.delegateType:l.bindType)||o,n=k[o]||[],h=h[2]&&new RegExp("(^|\\.)"+p.join("\\.(?:.*\\.|)")+"(\\.|$)"),i=f=n.length;while(f--)g=n[f],!e&&q!==g.origType||c&&c.guid!==g.guid||h&&!h.test(g.namespace)||d&&d!==g.selector&&("**"!==d||!g.selector)||(n.splice(f,1),g.selector&&n.delegateCount--,l.remove&&l.remove.call(a,g));i&&!n.length&&(l.teardown&&l.teardown.call(a,p,r.handle)!==!1||m.removeEvent(a,o,r.handle),delete k[o])}else for(o in k)m.event.remove(a,o+b[j],c,d,!0);m.isEmptyObject(k)&&(delete r.handle,m._removeData(a,"events"))}},trigger:function(b,c,d,e){var f,g,h,i,k,l,n,o=[d||y],p=j.call(b,"type")?b.type:b,q=j.call(b,"namespace")?b.namespace.split("."):[];if(h=l=d=d||y,3!==d.nodeType&&8!==d.nodeType&&!$.test(p+m.event.triggered)&&(p.indexOf(".")>=0&&(q=p.split("."),p=q.shift(),q.sort()),g=p.indexOf(":")<0&&"on"+p,b=b[m.expando]?b:new m.Event(p,"obje
 ct"==typeof b&&b),b.isTrigger=e?2:3,b.namespace=q.join("."),b.namespace_re=b.namespace?new RegExp("(^|\\.)"+q.join("\\.(?:.*\\.|)")+"(\\.|$)"):null,b.result=void 0,b.target||(b.target=d),c=null==c?[b]:m.makeArray(c,[b]),k=m.event.special[p]||{},e||!k.trigger||k.trigger.apply(d,c)!==!1)){if(!e&&!k.noBubble&&!m.isWindow(d)){for(i=k.delegateType||p,$.test(i+p)||(h=h.parentNode);h;h=h.parentNode)o.push(h),l=h;l===(d.ownerDocument||y)&&o.push(l.defaultView||l.parentWindow||a)}n=0;while((h=o[n++])&&!b.isPropagationStopped())b.type=n>1?i:k.bindType||p,f=(m._data(h,"events")||{})[b.type]&&m._data(h,"handle"),f&&f.apply(h,c),f=g&&h[g],f&&f.apply&&m.acceptData(h)&&(b.result=f.apply(h,c),b.result===!1&&b.preventDefault());if(b.type=p,!e&&!b.isDefaultPrevented()&&(!k._default||k._default.apply(o.pop(),c)===!1)&&m.acceptData(d)&&g&&d[p]&&!m.isWindow(d)){l=d[g],l&&(d[g]=null),m.event.triggered=p;try{d[p]()}catch(r){}m.event.triggered=void 0,l&&(d[g]=l)}return b.result}},dispatch:function(
 a){a=m.event.fix(a);var b,c,e,f,g,h=[],i=d.call(arguments),j=(m._data(this,"events")||{})[a.type]||[],k=m.event.special[a.type]||{};if(i[0]=a,a.delegateTarget=this,!k.preDispatch||k.preDispatch.call(this,a)!==!1){h=m.event.handlers.call(this,a,j),b=0;while((f=h[b++])&&!a.isPropagationStopped()){a.currentTarget=f.elem,g=0;while((e=f.handlers[g++])&&!a.isImmediatePropagationStopped())(!a.namespace_re||a.namespace_re.test(e.namespace))&&(a.handleObj=e,a.data=e.data,c=((m.event.special[e.origType]||{}).handle||e.handler).apply(f.elem,i),void 0!==c&&(a.result=c)===!1&&(a.preventDefault(),a.stopPropagation()))}return k.postDispatch&&k.postDispatch.call(this,a),a.result}},handlers:function(a,b){var c,d,e,f,g=[],h=b.delegateCount,i=a.target;if(h&&i.nodeType&&(!a.button||"click"!==a.type))for(;i!=this;i=i.parentNode||this)if(1===i.nodeType&&(i.disabled!==!0||"click"!==a.type)){for(e=[],f=0;h>f;f++)d=b[f],c=d.selector+" ",void 0===e[c]&&(e[c]=d.needsContext?m(c,this).index(i)>=0:m.fin
 d(c,this,null,[i]).length),e[c]&&e.push(d);e.length&&g.push({elem:i,handlers:e})}return h<b.length&&g.push({elem:this,handlers:b.slice(h)}),g},fix:function(a){if(a[m.expando])return a;var b,c,d,e=a.type,f=a,g=this.fixHooks[e];g||(this.fixHooks[e]=g=Z.test(e)?this.mouseHooks:Y.test(e)?this.keyHooks:{}),d=g.props?this.props.concat(g.props):this.props,a=new m.Event(f),b=d.length;while(b--)c=d[b],a[c]=f[c];return a.target||(a.target=f.srcElement||y),3===a.target.nodeType&&(a.target=a.target.parentNode),a.metaKey=!!a.metaKey,g.filter?g.filter(a,f):a},props:"altKey bubbles cancelable ctrlKey currentTarget eventPhase metaKey relatedTarget shiftKey target timeStamp view which".split(" "),fixHooks:{},keyHooks:{props:"char charCode key keyCode".split(" "),filter:function(a,b){return null==a.which&&(a.which=null!=b.charCode?b.charCode:b.keyCode),a}},mouseHooks:{props:"button buttons clientX clientY fromElement offsetX offsetY pageX pageY screenX screenY toElement".split(" "),filter:fun
 ction(a,b){var c,d,e,f=b.button,g=b.fromElement;return null==a.pageX&&null!=b.clientX&&(d=a.target.ownerDocument||y,e=d.documentElement,c=d.body,a.pageX=b.clientX+(e&&e.scrollLeft||c&&c.scrollLeft||0)-(e&&e.clientLeft||c&&c.clientLeft||0),a.pageY=b.clientY+(e&&e.scrollTop||c&&c.scrollTop||0)-(e&&e.clientTop||c&&c.clientTop||0)),!a.relatedTarget&&g&&(a.relatedTarget=g===a.target?b.toElement:g),a.which||void 0===f||(a.which=1&f?1:2&f?3:4&f?2:0),a}},special:{load:{noBubble:!0},focus:{trigger:function(){if(this!==cb()&&this.focus)try{return this.focus(),!1}catch(a){}},delegateType:"focusin"},blur:{trigger:function(){return this===cb()&&this.blur?(this.blur(),!1):void 0},delegateType:"focusout"},click:{trigger:function(){return m.nodeName(this,"input")&&"checkbox"===this.type&&this.click?(this.click(),!1):void 0},_default:function(a){return m.nodeName(a.target,"a")}},beforeunload:{postDispatch:function(a){void 0!==a.result&&a.originalEvent&&(a.originalEvent.returnValue=a.result)}
 }},simulate:function(a,b,c,d){var e=m.extend(new m.Event,c,{type:a,isSimulated:!0,originalEvent:{}});d?m.event.trigger(e,null,b):m.event.dispatch.call(b,e),e.isDefaultPrevented()&&c.preventDefault()}},m.removeEvent=y.removeEventListener?function(a,b,c){a.removeEventListener&&a.removeEventListener(b,c,!1)}:function(a,b,c){var d="on"+b;a.detachEvent&&(typeof a[d]===K&&(a[d]=null),a.detachEvent(d,c))},m.Event=function(a,b){return this instanceof m.Event?(a&&a.type?(this.originalEvent=a,this.type=a.type,this.isDefaultPrevented=a.defaultPrevented||void 0===a.defaultPrevented&&a.returnValue===!1?ab:bb):this.type=a,b&&m.extend(this,b),this.timeStamp=a&&a.timeStamp||m.now(),void(this[m.expando]=!0)):new m.Event(a,b)},m.Event.prototype={isDefaultPrevented:bb,isPropagationStopped:bb,isImmediatePropagationStopped:bb,preventDefault:function(){var a=this.originalEvent;this.isDefaultPrevented=ab,a&&(a.preventDefault?a.preventDefault():a.returnValue=!1)},stopPropagation:function(){var a=th
 is.originalEvent;this.isPropagationStopped=ab,a&&(a.stopPropagation&&a.stopPropagation(),a.cancelBubble=!0)},stopImmediatePropagation:function(){var a=this.originalEvent;this.isImmediatePropagationStopped=ab,a&&a.stopImmediatePropagation&&a.stopImmediatePropagation(),this.stopPropagation()}},m.each({mouseenter:"mouseover",mouseleave:"mouseout",pointerenter:"pointerover",pointerleave:"pointerout"},function(a,b){m.event.special[a]={delegateType:b,bindType:b,handle:function(a){var c,d=this,e=a.relatedTarget,f=a.handleObj;return(!e||e!==d&&!m.contains(d,e))&&(a.type=f.origType,c=f.handler.apply(this,arguments),a.type=b),c}}}),k.submitBubbles||(m.event.special.submit={setup:function(){return m.nodeName(this,"form")?!1:void m.event.add(this,"click._submit keypress._submit",function(a){var b=a.target,c=m.nodeName(b,"input")||m.nodeName(b,"button")?b.form:void 0;c&&!m._data(c,"submitBubbles")&&(m.event.add(c,"submit._submit",function(a){a._submit_bubble=!0}),m._data(c,"submitBubbles
 ",!0))})},postDispatch:function(a){a._submit_bubble&&(delete a._submit_bubble,this.parentNode&&!a.isTrigger&&m.event.simulate("submit",this.parentNode,a,!0))},teardown:function(){return m.nodeName(this,"form")?!1:void m.event.remove(this,"._submit")}}),k.changeBubbles||(m.event.special.change={setup:function(){return X.test(this.nodeName)?(("checkbox"===this.type||"radio"===this.type)&&(m.event.add(this,"propertychange._change",function(a){"checked"===a.originalEvent.propertyName&&(this._just_changed=!0)}),m.event.add(this,"click._change",function(a){this._just_changed&&!a.isTrigger&&(this._just_changed=!1),m.event.simulate("change",this,a,!0)})),!1):void m.event.add(this,"beforeactivate._change",function(a){var b=a.target;X.test(b.nodeName)&&!m._data(b,"changeBubbles")&&(m.event.add(b,"change._change",function(a){!this.parentNode||a.isSimulated||a.isTrigger||m.event.simulate("change",this.parentNode,a,!0)}),m._data(b,"changeBubbles",!0))})},handle:function(a){var b=a.target
 ;return this!==b||a.isSimulated||a.isTrigger||"radio"!==b.type&&"checkbox"!==b.type?a.handleObj.handler.apply(this,arguments):void 0},teardown:function(){return m.event.remove(this,"._change"),!X.test(this.nodeName)}}),k.focusinBubbles||m.each({focus:"focusin",blur:"focusout"},function(a,b){var c=function(a){m.event.simulate(b,a.target,m.event.fix(a),!0)};m.event.special[b]={setup:function(){var d=this.ownerDocument||this,e=m._data(d,b);e||d.addEventListener(a,c,!0),m._data(d,b,(e||0)+1)},teardown:function(){var d=this.ownerDocument||this,e=m._data(d,b)-1;e?m._data(d,b,e):(d.removeEventListener(a,c,!0),m._removeData(d,b))}}}),m.fn.extend({on:function(a,b,c,d,e){var f,g;if("object"==typeof a){"string"!=typeof b&&(c=c||b,b=void 0);for(f in a)this.on(f,b,c,a[f],e);return this}if(null==c&&null==d?(d=b,c=b=void 0):null==d&&("string"==typeof b?(d=c,c=void 0):(d=c,c=b,b=void 0)),d===!1)d=bb;else if(!d)return this;return 1===e&&(g=d,d=function(a){return m().off(a),g.apply(this,argum
 ents)},d.guid=g.guid||(g.guid=m.guid++)),this.each(function(){m.event.add(this,a,d,c,b)})},one:function(a,b,c,d){return this.on(a,b,c,d,1)},off:function(a,b,c){var d,e;if(a&&a.preventDefault&&a.handleObj)return d=a.handleObj,m(a.delegateTarget).off(d.namespace?d.origType+"."+d.namespace:d.origType,d.selector,d.handler),this;if("object"==typeof a){for(e in a)this.off(e,b,a[e]);return this}return(b===!1||"function"==typeof b)&&(c=b,b=void 0),c===!1&&(c=bb),this.each(function(){m.event.remove(this,a,c,b)})},trigger:function(a,b){return this.each(function(){m.event.trigger(a,b,this)})},triggerHandler:function(a,b){var c=this[0];return c?m.event.trigger(a,b,c,!0):void 0}});function db(a){var b=eb.split("|"),c=a.createDocumentFragment();if(c.createElement)while(b.length)c.createElement(b.pop());return c}var eb="abbr|article|aside|audio|bdi|canvas|data|datalist|details|figcaption|figure|footer|header|hgroup|mark|meter|nav|output|progress|section|summary|time|video",fb=/ jQuery\d+="
 (?:null|\d+)"/g,gb=new RegExp("<(?:"+eb+")[\\s/>]","i"),hb=/^\s+/,ib=/<(?!area|br|col|embed|hr|img|input|link|meta|param)(([\w:]+)[^>]*)\/>/gi,jb=/<([\w:]+)/,kb=/<tbody/i,lb=/<|&#?\w+;/,mb=/<(?:script|style|link)/i,nb=/checked\s*(?:[^=]|=\s*.checked.)/i,ob=/^$|\/(?:java|ecma)script/i,pb=/^true\/(.*)/,qb=/^\s*<!(?:\[CDATA\[|--)|(?:\]\]|--)>\s*$/g,rb={option:[1,"<select multiple='multiple'>","</select>"],legend:[1,"<fieldset>","</fieldset>"],area:[1,"<map>","</map>"],param:[1,"<object>","</object>"],thead:[1,"<table>","</table>"],tr:[2,"<table><tbody>","</tbody></table>"],col:[2,"<table><tbody></tbody><colgroup>","</colgroup></table>"],td:[3,"<table><tbody><tr>","</tr></tbody></table>"],_default:k.htmlSerialize?[0,"",""]:[1,"X<div>","</div>"]},sb=db(y),tb=sb.appendChild(y.createElement("div"));rb.optgroup=rb.option,rb.tbody=rb.tfoot=rb.colgroup=rb.caption=rb.thead,rb.th=rb.td;function ub(a,b){var c,d,e=0,f=typeof a.getElementsByTagName!==K?a.getElementsByTagName(b||"*"):typeof
  a.querySelectorAll!==K?a.querySelectorAll(b||"*"):void 0;if(!f)for(f=[],c=a.childNodes||a;null!=(d=c[e]);e++)!b||m.nodeName(d,b)?f.push(d):m.merge(f,ub(d,b));return void 0===b||b&&m.nodeName(a,b)?m.merge([a],f):f}function vb(a){W.test(a.type)&&(a.defaultChecked=a.checked)}function wb(a,b){return m.nodeName(a,"table")&&m.nodeName(11!==b.nodeType?b:b.firstChild,"tr")?a.getElementsByTagName("tbody")[0]||a.appendChild(a.ownerDocument.createElement("tbody")):a}function xb(a){return a.type=(null!==m.find.attr(a,"type"))+"/"+a.type,a}function yb(a){var b=pb.exec(a.type);return b?a.type=b[1]:a.removeAttribute("type"),a}function zb(a,b){for(var c,d=0;null!=(c=a[d]);d++)m._data(c,"globalEval",!b||m._data(b[d],"globalEval"))}function Ab(a,b){if(1===b.nodeType&&m.hasData(a)){var c,d,e,f=m._data(a),g=m._data(b,f),h=f.events;if(h){delete g.handle,g.events={};for(c in h)for(d=0,e=h[c].length;e>d;d++)m.event.add(b,c,h[c][d])}g.data&&(g.data=m.extend({},g.data))}}function Bb(a,b){var c,d,e;
 if(1===b.nodeType){if(c=b.nodeName.toLowerCase(),!k.noCloneEvent&&b[m.expando]){e=m._data(b);for(d in e.events)m.removeEvent(b,d,e.handle);b.removeAttribute(m.expando)}"script"===c&&b.text!==a.text?(xb(b).text=a.text,yb(b)):"object"===c?(b.parentNode&&(b.outerHTML=a.outerHTML),k.html5Clone&&a.innerHTML&&!m.trim(b.innerHTML)&&(b.innerHTML=a.innerHTML)):"input"===c&&W.test(a.type)?(b.defaultChecked=b.checked=a.checked,b.value!==a.value&&(b.value=a.value)):"option"===c?b.defaultSelected=b.selected=a.defaultSelected:("input"===c||"textarea"===c)&&(b.defaultValue=a.defaultValue)}}m.extend({clone:function(a,b,c){var d,e,f,g,h,i=m.contains(a.ownerDocument,a);if(k.html5Clone||m.isXMLDoc(a)||!gb.test("<"+a.nodeName+">")?f=a.cloneNode(!0):(tb.innerHTML=a.outerHTML,tb.removeChild(f=tb.firstChild)),!(k.noCloneEvent&&k.noCloneChecked||1!==a.nodeType&&11!==a.nodeType||m.isXMLDoc(a)))for(d=ub(f),h=ub(a),g=0;null!=(e=h[g]);++g)d[g]&&Bb(e,d[g]);if(b)if(c)for(h=h||ub(a),d=d||ub(f),g=0;null!=(
 e=h[g]);g++)Ab(e,d[g]);else Ab(a,f);return d=ub(f,"script"),d.length>0&&zb(d,!i&&ub(a,"script")),d=h=e=null,f},buildFragment:function(a,b,c,d){for(var e,f,g,h,i,j,l,n=a.length,o=db(b),p=[],q=0;n>q;q++)if(f=a[q],f||0===f)if("object"===m.type(f))m.merge(p,f.nodeType?[f]:f);else if(lb.test(f)){h=h||o.appendChild(b.createElement("div")),i=(jb.exec(f)||["",""])[1].toLowerCase(),l=rb[i]||rb._default,h.innerHTML=l[1]+f.replace(ib,"<$1></$2>")+l[2],e=l[0];while(e--)h=h.lastChild;if(!k.leadingWhitespace&&hb.test(f)&&p.push(b.createTextNode(hb.exec(f)[0])),!k.tbody){f="table"!==i||kb.test(f)?"<table>"!==l[1]||kb.test(f)?0:h:h.firstChild,e=f&&f.childNodes.length;while(e--)m.nodeName(j=f.childNodes[e],"tbody")&&!j.childNodes.length&&f.removeChild(j)}m.merge(p,h.childNodes),h.textContent="";while(h.firstChild)h.removeChild(h.firstChild);h=o.lastChild}else p.push(b.createTextNode(f));h&&o.removeChild(h),k.appendChecked||m.grep(ub(p,"input"),vb),q=0;while(f=p[q++])if((!d||-1===m.inArray(f,
 d))&&(g=m.contains(f.ownerDocument,f),h=ub(o.appendChild(f),"script"),g&&zb(h),c)){e=0;while(f=h[e++])ob.test(f.type||"")&&c.push(f)}return h=null,o},cleanData:function(a,b){for(var d,e,f,g,h=0,i=m.expando,j=m.cache,l=k.deleteExpando,n=m.event.special;null!=(d=a[h]);h++)if((b||m.acceptData(d))&&(f=d[i],g=f&&j[f])){if(g.events)for(e in g.events)n[e]?m.event.remove(d,e):m.removeEvent(d,e,g.handle);j[f]&&(delete j[f],l?delete d[i]:typeof d.removeAttribute!==K?d.removeAttribute(i):d[i]=null,c.push(f))}}}),m.fn.extend({text:function(a){return V(this,function(a){return void 0===a?m.text(this):this.empty().append((this[0]&&this[0].ownerDocument||y).createTextNode(a))},null,a,arguments.length)},append:function(){return this.domManip(arguments,function(a){if(1===this.nodeType||11===this.nodeType||9===this.nodeType){var b=wb(this,a);b.appendChild(a)}})},prepend:function(){return this.domManip(arguments,function(a){if(1===this.nodeType||11===this.nodeType||9===this.nodeType){var b=wb(t
 his,a);b.insertBefore(a,b.firstChild)}})},before:function(){return this.domManip(arguments,function(a){this.parentNode&&this.parentNode.insertBefore(a,this)})},after:function(){return this.domManip(arguments,function(a){this.parentNode&&this.parentNode.insertBefore(a,this.nextSibling)})},remove:function(a,b){for(var c,d=a?m.filter(a,this):this,e=0;null!=(c=d[e]);e++)b||1!==c.nodeType||m.cleanData(ub(c)),c.parentNode&&(b&&m.contains(c.ownerDocument,c)&&zb(ub(c,"script")),c.parentNode.removeChild(c));return this},empty:function(){for(var a,b=0;null!=(a=this[b]);b++){1===a.nodeType&&m.cleanData(ub(a,!1));while(a.firstChild)a.removeChild(a.firstChild);a.options&&m.nodeName(a,"select")&&(a.options.length=0)}return this},clone:function(a,b){return a=null==a?!1:a,b=null==b?a:b,this.map(function(){return m.clone(this,a,b)})},html:function(a){return V(this,function(a){var b=this[0]||{},c=0,d=this.length;if(void 0===a)return 1===b.nodeType?b.innerHTML.replace(fb,""):void 0;if(!("strin
 g"!=typeof a||mb.test(a)||!k.htmlSerialize&&gb.test(a)||!k.leadingWhitespace&&hb.test(a)||rb[(jb.exec(a)||["",""])[1].toLowerCase()])){a=a.replace(ib,"<$1></$2>");try{for(;d>c;c++)b=this[c]||{},1===b.nodeType&&(m.cleanData(ub(b,!1)),b.innerHTML=a);b=0}catch(e){}}b&&this.empty().append(a)},null,a,arguments.length)},replaceWith:function(){var a=arguments[0];return this.domManip(arguments,function(b){a=this.parentNode,m.cleanData(ub(this)),a&&a.replaceChild(b,this)}),a&&(a.length||a.nodeType)?this:this.remove()},detach:function(a){return this.remove(a,!0)},domManip:function(a,b){a=e.apply([],a);var c,d,f,g,h,i,j=0,l=this.length,n=this,o=l-1,p=a[0],q=m.isFunction(p);if(q||l>1&&"string"==typeof p&&!k.checkClone&&nb.test(p))return this.each(function(c){var d=n.eq(c);q&&(a[0]=p.call(this,c,d.html())),d.domManip(a,b)});if(l&&(i=m.buildFragment(a,this[0].ownerDocument,!1,this),c=i.firstChild,1===i.childNodes.length&&(i=c),c)){for(g=m.map(ub(i,"script"),xb),f=g.length;l>j;j++)d=i,j!==
 o&&(d=m.clone(d,!0,!0),f&&m.merge(g,ub(d,"script"))),b.call(this[j],d,j);if(f)for(h=g[g.length-1].ownerDocument,m.map(g,yb),j=0;f>j;j++)d=g[j],ob.test(d.type||"")&&!m._data(d,"globalEval")&&m.contains(h,d)&&(d.src?m._evalUrl&&m._evalUrl(d.src):m.globalEval((d.text||d.textContent||d.innerHTML||"").replace(qb,"")));i=c=null}return this}}),m.each({appendTo:"append",prependTo:"prepend",insertBefore:"before",insertAfter:"after",replaceAll:"replaceWith"},function(a,b){m.fn[a]=function(a){for(var c,d=0,e=[],g=m(a),h=g.length-1;h>=d;d++)c=d===h?this:this.clone(!0),m(g[d])[b](c),f.apply(e,c.get());return this.pushStack(e)}});var Cb,Db={};function Eb(b,c){var d,e=m(c.createElement(b)).appendTo(c.body),f=a.getDefaultComputedStyle&&(d=a.getDefaultComputedStyle(e[0]))?d.display:m.css(e[0],"display");return e.detach(),f}function Fb(a){var b=y,c=Db[a];return c||(c=Eb(a,b),"none"!==c&&c||(Cb=(Cb||m("<iframe frameborder='0' width='0' height='0'/>")).appendTo(b.documentElement),b=(Cb[0].conte
 ntWindow||Cb[0].contentDocument).document,b.write(),b.close(),c=Eb(a,b),Cb.detach()),Db[a]=c),c}!function(){var a;k.shrinkWrapBlocks=function(){if(null!=a)return a;a=!1;var b,c,d;return c=y.getElementsByTagName("body")[0],c&&c.style?(b=y.createElement("div"),d=y.createElement("div"),d.style.cssText="position:absolute;border:0;width:0;height:0;top:0;left:-9999px",c.appendChild(d).appendChild(b),typeof b.style.zoom!==K&&(b.style.cssText="-webkit-box-sizing:content-box;-moz-box-sizing:content-box;box-sizing:content-box;display:block;margin:0;border:0;padding:1px;width:1px;zoom:1",b.appendChild(y.createElement("div")).style.width="5px",a=3!==b.offsetWidth),c.removeChild(d),a):void 0}}();var Gb=/^margin/,Hb=new RegExp("^("+S+")(?!px)[a-z%]+$","i"),Ib,Jb,Kb=/^(top|right|bottom|left)$/;a.getComputedStyle?(Ib=function(a){return a.ownerDocument.defaultView.getComputedStyle(a,null)},Jb=function(a,b,c){var d,e,f,g,h=a.style;return c=c||Ib(a),g=c?c.getPropertyValue(b)||c[b]:void 0,c&&("
 "!==g||m.contains(a.ownerDocument,a)||(g=m.style(a,b)),Hb.test(g)&&Gb.test(b)&&(d=h.width,e=h.minWidth,f=h.maxWidth,h.minWidth=h.maxWidth=h.width=g,g=c.width,h.width=d,h.minWidth=e,h.maxWidth=f)),void 0===g?g:g+""}):y.documentElement.currentStyle&&(Ib=function(a){return a.currentStyle},Jb=function(a,b,c){var d,e,f,g,h=a.style;return c=c||Ib(a),g=c?c[b]:void 0,null==g&&h&&h[b]&&(g=h[b]),Hb.test(g)&&!Kb.test(b)&&(d=h.left,e=a.runtimeStyle,f=e&&e.left,f&&(e.left=a.currentStyle.left),h.left="fontSize"===b?"1em":g,g=h.pixelLeft+"px",h.left=d,f&&(e.left=f)),void 0===g?g:g+""||"auto"});function Lb(a,b){return{get:function(){var c=a();if(null!=c)return c?void delete this.get:(this.get=b).apply(this,arguments)}}}!function(){var b,c,d,e,f,g,h;if(b=y.createElement("div"),b.innerHTML="  <link/><table></table><a href='/a'>a</a><input type='checkbox'/>",d=b.getElementsByTagName("a")[0],c=d&&d.style){c.cssText="float:left;opacity:.5",k.opacity="0.5"===c.opacity,k.cssFloat=!!c.cssFloat,b.st
 yle.backgroundClip="content-box",b.cloneNode(!0).style.backgroundClip="",k.clearCloneStyle="content-box"===b.style.backgroundClip,k.boxSizing=""===c.boxSizing||""===c.MozBoxSizing||""===c.WebkitBoxSizing,m.extend(k,{reliableHiddenOffsets:function(){return null==g&&i(),g},boxSizingReliable:function(){return null==f&&i(),f},pixelPosition:function(){return null==e&&i(),e},reliableMarginRight:function(){return null==h&&i(),h}});function i(){var b,c,d,i;c=y.getElementsByTagName("body")[0],c&&c.style&&(b=y.createElement("div"),d=y.createElement("div"),d.style.cssText="position:absolute;border:0;width:0;height:0;top:0;left:-9999px",c.appendChild(d).appendChild(b),b.style.cssText="-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;display:block;margin-top:1%;top:1%;border:1px;padding:1px;width:4px;position:absolute",e=f=!1,h=!0,a.getComputedStyle&&(e="1%"!==(a.getComputedStyle(b,null)||{}).top,f="4px"===(a.getComputedStyle(b,null)||{width:"4px"}).width,i=
 b.appendChild(y.createElement("div")),i.style.cssText=b.style.cssText="-webkit-box-sizing:content-box;-moz-box-sizing:content-box;box-sizing:content-box;display:block;margin:0;border:0;padding:0",i.style.marginRight=i.style.width="0",b.style.width="1px",h=!parseFloat((a.getComputedStyle(i,null)||{}).marginRight)),b.innerHTML="<table><tr><td></td><td>t</td></tr></table>",i=b.getElementsByTagName("td"),i[0].style.cssText="margin:0;border:0;padding:0;display:none",g=0===i[0].offsetHeight,g&&(i[0].style.display="",i[1].style.display="none",g=0===i[0].offsetHeight),c.removeChild(d))}}}(),m.swap=function(a,b,c,d){var e,f,g={};for(f in b)g[f]=a.style[f],a.style[f]=b[f];e=c.apply(a,d||[]);for(f in b)a.style[f]=g[f];return e};var Mb=/alpha\([^)]*\)/i,Nb=/opacity\s*=\s*([^)]*)/,Ob=/^(none|table(?!-c[ea]).+)/,Pb=new RegExp("^("+S+")(.*)$","i"),Qb=new RegExp("^([+-])=("+S+")","i"),Rb={position:"absolute",visibility:"hidden",display:"block"},Sb={letterSpacing:"0",fontWeight:"400"},Tb=["W
 ebkit","O","Moz","ms"];function Ub(a,b){if(b in a)return b;var c=b.charAt(0).toUpperCase()+b.slice(1),d=b,e=Tb.length;while(e--)if(b=Tb[e]+c,b in a)return b;return d}function Vb(a,b){for(var c,d,e,f=[],g=0,h=a.length;h>g;g++)d=a[g],d.style&&(f[g]=m._data(d,"olddisplay"),c=d.style.display,b?(f[g]||"none"!==c||(d.style.display=""),""===d.style.display&&U(d)&&(f[g]=m._data(d,"olddisplay",Fb(d.nodeName)))):(e=U(d),(c&&"none"!==c||!e)&&m._data(d,"olddisplay",e?c:m.css(d,"display"))));for(g=0;h>g;g++)d=a[g],d.style&&(b&&"none"!==d.style.display&&""!==d.style.display||(d.style.display=b?f[g]||"":"none"));return a}function Wb(a,b,c){var d=Pb.exec(b);return d?Math.max(0,d[1]-(c||0))+(d[2]||"px"):b}function Xb(a,b,c,d,e){for(var f=c===(d?"border":"content")?4:"width"===b?1:0,g=0;4>f;f+=2)"margin"===c&&(g+=m.css(a,c+T[f],!0,e)),d?("content"===c&&(g-=m.css(a,"padding"+T[f],!0,e)),"margin"!==c&&(g-=m.css(a,"border"+T[f]+"Width",!0,e))):(g+=m.css(a,"padding"+T[f],!0,e),"padding"!==c&&(g+=
 m.css(a,"border"+T[f]+"Width",!0,e)));return g}function Yb(a,b,c){var d=!0,e="width"===b?a.offsetWidth:a.offsetHeight,f=Ib(a),g=k.boxSizing&&"border-box"===m.css(a,"boxSizing",!1,f);if(0>=e||null==e){if(e=Jb(a,b,f),(0>e||null==e)&&(e=a.style[b]),Hb.test(e))return e;d=g&&(k.boxSizingReliable()||e===a.style[b]),e=parseFloat(e)||0}return e+Xb(a,b,c||(g?"border":"content"),d,f)+"px"}m.extend({cssHooks:{opacity:{get:function(a,b){if(b){var c=Jb(a,"opacity");return""===c?"1":c}}}},cssNumber:{columnCount:!0,fillOpacity:!0,flexGrow:!0,flexShrink:!0,fontWeight:!0,lineHeight:!0,opacity:!0,order:!0,orphans:!0,widows:!0,zIndex:!0,zoom:!0},cssProps:{"float":k.cssFloat?"cssFloat":"styleFloat"},style:function(a,b,c,d){if(a&&3!==a.nodeType&&8!==a.nodeType&&a.style){var e,f,g,h=m.camelCase(b),i=a.style;if(b=m.cssProps[h]||(m.cssProps[h]=Ub(i,h)),g=m.cssHooks[b]||m.cssHooks[h],void 0===c)return g&&"get"in g&&void 0!==(e=g.get(a,!1,d))?e:i[b];if(f=typeof c,"string"===f&&(e=Qb.exec(c))&&(c=(e[1
 ]+1)*e[2]+parseFloat(m.css(a,b)),f="number"),null!=c&&c===c&&("number"!==f||m.cssNumber[h]||(c+="px"),k.clearCloneStyle||""!==c||0!==b.indexOf("background")||(i[b]="inherit"),!(g&&"set"in g&&void 0===(c=g.set(a,c,d)))))try{i[b]=c}catch(j){}}},css:function(a,b,c,d){var e,f,g,h=m.camelCase(b);return b=m.cssProps[h]||(m.cssProps[h]=Ub(a.style,h)),g=m.cssHooks[b]||m.cssHooks[h],g&&"get"in g&&(f=g.get(a,!0,c)),void 0===f&&(f=Jb(a,b,d)),"normal"===f&&b in Sb&&(f=Sb[b]),""===c||c?(e=parseFloat(f),c===!0||m.isNumeric(e)?e||0:f):f}}),m.each(["height","width"],function(a,b){m.cssHooks[b]={get:function(a,c,d){return c?Ob.test(m.css(a,"display"))&&0===a.offsetWidth?m.swap(a,Rb,function(){return Yb(a,b,d)}):Yb(a,b,d):void 0},set:function(a,c,d){var e=d&&Ib(a);return Wb(a,c,d?Xb(a,b,d,k.boxSizing&&"border-box"===m.css(a,"boxSizing",!1,e),e):0)}}}),k.opacity||(m.cssHooks.opacity={get:function(a,b){return Nb.test((b&&a.currentStyle?a.currentStyle.filter:a.style.filter)||"")?.01*parseFloat(R
 egExp.$1)+"":b?"1":""},set:function(a,b){var c=a.style,d=a.currentStyle,e=m.isNumeric(b)?"alpha(opacity="+100*b+")":"",f=d&&d.filter||c.filter||"";c.zoom=1,(b>=1||""===b)&&""===m.trim(f.replace(Mb,""))&&c.removeAttribute&&(c.removeAttribute("filter"),""===b||d&&!d.filter)||(c.filter=Mb.test(f)?f.replace(Mb,e):f+" "+e)}}),m.cssHooks.marginRight=Lb(k.reliableMarginRight,function(a,b){return b?m.swap(a,{display:"inline-block"},Jb,[a,"marginRight"]):void 0}),m.each({margin:"",padding:"",border:"Width"},function(a,b){m.cssHooks[a+b]={expand:function(c){for(var d=0,e={},f="string"==typeof c?c.split(" "):[c];4>d;d++)e[a+T[d]+b]=f[d]||f[d-2]||f[0];return e}},Gb.test(a)||(m.cssHooks[a+b].set=Wb)}),m.fn.extend({css:function(a,b){return V(this,function(a,b,c){var d,e,f={},g=0;if(m.isArray(b)){for(d=Ib(a),e=b.length;e>g;g++)f[b[g]]=m.css(a,b[g],!1,d);return f}return void 0!==c?m.style(a,b,c):m.css(a,b)},a,b,arguments.length>1)},show:function(){return Vb(this,!0)},hide:function(){return 
 Vb(this)},toggle:function(a){return"boolean"==typeof a?a?this.show():this.hide():this.each(function(){U(this)?m(this).show():m(this).hide()})}});function Zb(a,b,c,d,e){return new Zb.prototype.init(a,b,c,d,e)}m.Tween=Zb,Zb.prototype={constructor:Zb,init:function(a,b,c,d,e,f){this.elem=a,this.prop=c,this.easing=e||"swing",this.options=b,this.start=this.now=this.cur(),this.end=d,this.unit=f||(m.cssNumber[c]?"":"px")
+},cur:function(){var a=Zb.propHooks[this.prop];return a&&a.get?a.get(this):Zb.propHooks._default.get(this)},run:function(a){var b,c=Zb.propHooks[this.prop];return this.pos=b=this.options.duration?m.easing[this.easing](a,this.options.duration*a,0,1,this.options.duration):a,this.now=(this.end-this.start)*b+this.start,this.options.step&&this.options.step.call(this.elem,this.now,this),c&&c.set?c.set(this):Zb.propHooks._default.set(this),this}},Zb.prototype.init.prototype=Zb.prototype,Zb.propHooks={_default:{get:function(a){var b;return null==a.elem[a.prop]||a.elem.style&&null!=a.elem.style[a.prop]?(b=m.css(a.elem,a.prop,""),b&&"auto"!==b?b:0):a.elem[a.prop]},set:function(a){m.fx.step[a.prop]?m.fx.step[a.prop](a):a.elem.style&&(null!=a.elem.style[m.cssProps[a.prop]]||m.cssHooks[a.prop])?m.style(a.elem,a.prop,a.now+a.unit):a.elem[a.prop]=a.now}}},Zb.propHooks.scrollTop=Zb.propHooks.scrollLeft={set:function(a){a.elem.nodeType&&a.elem.parentNode&&(a.elem[a.prop]=a.now)}},m.easing={l
 inear:function(a){return a},swing:function(a){return.5-Math.cos(a*Math.PI)/2}},m.fx=Zb.prototype.init,m.fx.step={};var $b,_b,ac=/^(?:toggle|show|hide)$/,bc=new RegExp("^(?:([+-])=|)("+S+")([a-z%]*)$","i"),cc=/queueHooks$/,dc=[ic],ec={"*":[function(a,b){var c=this.createTween(a,b),d=c.cur(),e=bc.exec(b),f=e&&e[3]||(m.cssNumber[a]?"":"px"),g=(m.cssNumber[a]||"px"!==f&&+d)&&bc.exec(m.css(c.elem,a)),h=1,i=20;if(g&&g[3]!==f){f=f||g[3],e=e||[],g=+d||1;do h=h||".5",g/=h,m.style(c.elem,a,g+f);while(h!==(h=c.cur()/d)&&1!==h&&--i)}return e&&(g=c.start=+g||+d||0,c.unit=f,c.end=e[1]?g+(e[1]+1)*e[2]:+e[2]),c}]};function fc(){return setTimeout(function(){$b=void 0}),$b=m.now()}function gc(a,b){var c,d={height:a},e=0;for(b=b?1:0;4>e;e+=2-b)c=T[e],d["margin"+c]=d["padding"+c]=a;return b&&(d.opacity=d.width=a),d}function hc(a,b,c){for(var d,e=(ec[b]||[]).concat(ec["*"]),f=0,g=e.length;g>f;f++)if(d=e[f].call(c,b,a))return d}function ic(a,b,c){var d,e,f,g,h,i,j,l,n=this,o={},p=a.style,q=a.node
 Type&&U(a),r=m._data(a,"fxshow");c.queue||(h=m._queueHooks(a,"fx"),null==h.unqueued&&(h.unqueued=0,i=h.empty.fire,h.empty.fire=function(){h.unqueued||i()}),h.unqueued++,n.always(function(){n.always(function(){h.unqueued--,m.queue(a,"fx").length||h.empty.fire()})})),1===a.nodeType&&("height"in b||"width"in b)&&(c.overflow=[p.overflow,p.overflowX,p.overflowY],j=m.css(a,"display"),l="none"===j?m._data(a,"olddisplay")||Fb(a.nodeName):j,"inline"===l&&"none"===m.css(a,"float")&&(k.inlineBlockNeedsLayout&&"inline"!==Fb(a.nodeName)?p.zoom=1:p.display="inline-block")),c.overflow&&(p.overflow="hidden",k.shrinkWrapBlocks()||n.always(function(){p.overflow=c.overflow[0],p.overflowX=c.overflow[1],p.overflowY=c.overflow[2]}));for(d in b)if(e=b[d],ac.exec(e)){if(delete b[d],f=f||"toggle"===e,e===(q?"hide":"show")){if("show"!==e||!r||void 0===r[d])continue;q=!0}o[d]=r&&r[d]||m.style(a,d)}else j=void 0;if(m.isEmptyObject(o))"inline"===("none"===j?Fb(a.nodeName):j)&&(p.display=j);else{r?"hidde
 n"in r&&(q=r.hidden):r=m._data(a,"fxshow",{}),f&&(r.hidden=!q),q?m(a).show():n.done(function(){m(a).hide()}),n.done(function(){var b;m._removeData(a,"fxshow");for(b in o)m.style(a,b,o[b])});for(d in o)g=hc(q?r[d]:0,d,n),d in r||(r[d]=g.start,q&&(g.end=g.start,g.start="width"===d||"height"===d?1:0))}}function jc(a,b){var c,d,e,f,g;for(c in a)if(d=m.camelCase(c),e=b[d],f=a[c],m.isArray(f)&&(e=f[1],f=a[c]=f[0]),c!==d&&(a[d]=f,delete a[c]),g=m.cssHooks[d],g&&"expand"in g){f=g.expand(f),delete a[d];for(c in f)c in a||(a[c]=f[c],b[c]=e)}else b[d]=e}function kc(a,b,c){var d,e,f=0,g=dc.length,h=m.Deferred().always(function(){delete i.elem}),i=function(){if(e)return!1;for(var b=$b||fc(),c=Math.max(0,j.startTime+j.duration-b),d=c/j.duration||0,f=1-d,g=0,i=j.tweens.length;i>g;g++)j.tweens[g].run(f);return h.notifyWith(a,[j,f,c]),1>f&&i?c:(h.resolveWith(a,[j]),!1)},j=h.promise({elem:a,props:m.extend({},b),opts:m.extend(!0,{specialEasing:{}},c),originalProperties:b,originalOptions:c,star
 tTime:$b||fc(),duration:c.duration,tweens:[],createTween:function(b,c){var d=m.Tween(a,j.opts,b,c,j.opts.specialEasing[b]||j.opts.easing);return j.tweens.push(d),d},stop:function(b){var c=0,d=b?j.tweens.length:0;if(e)return this;for(e=!0;d>c;c++)j.tweens[c].run(1);return b?h.resolveWith(a,[j,b]):h.rejectWith(a,[j,b]),this}}),k=j.props;for(jc(k,j.opts.specialEasing);g>f;f++)if(d=dc[f].call(j,a,k,j.opts))return d;return m.map(k,hc,j),m.isFunction(j.opts.start)&&j.opts.start.call(a,j),m.fx.timer(m.extend(i,{elem:a,anim:j,queue:j.opts.queue})),j.progress(j.opts.progress).done(j.opts.done,j.opts.complete).fail(j.opts.fail).always(j.opts.always)}m.Animation=m.extend(kc,{tweener:function(a,b){m.isFunction(a)?(b=a,a=["*"]):a=a.split(" ");for(var c,d=0,e=a.length;e>d;d++)c=a[d],ec[c]=ec[c]||[],ec[c].unshift(b)},prefilter:function(a,b){b?dc.unshift(a):dc.push(a)}}),m.speed=function(a,b,c){var d=a&&"object"==typeof a?m.extend({},a):{complete:c||!c&&b||m.isFunction(a)&&a,duration:a,easi
 ng:c&&b||b&&!m.isFunction(b)&&b};return d.duration=m.fx.off?0:"number"==typeof d.duration?d.duration:d.duration in m.fx.speeds?m.fx.speeds[d.duration]:m.fx.speeds._default,(null==d.queue||d.queue===!0)&&(d.queue="fx"),d.old=d.complete,d.complete=function(){m.isFunction(d.old)&&d.old.call(this),d.queue&&m.dequeue(this,d.queue)},d},m.fn.extend({fadeTo:function(a,b,c,d){return this.filter(U).css("opacity",0).show().end().animate({opacity:b},a,c,d)},animate:function(a,b,c,d){var e=m.isEmptyObject(a),f=m.speed(b,c,d),g=function(){var b=kc(this,m.extend({},a),f);(e||m._data(this,"finish"))&&b.stop(!0)};return g.finish=g,e||f.queue===!1?this.each(g):this.queue(f.queue,g)},stop:function(a,b,c){var d=function(a){var b=a.stop;delete a.stop,b(c)};return"string"!=typeof a&&(c=b,b=a,a=void 0),b&&a!==!1&&this.queue(a||"fx",[]),this.each(function(){var b=!0,e=null!=a&&a+"queueHooks",f=m.timers,g=m._data(this);if(e)g[e]&&g[e].stop&&d(g[e]);else for(e in g)g[e]&&g[e].stop&&cc.test(e)&&d(g[e]
 );for(e=f.length;e--;)f[e].elem!==this||null!=a&&f[e].queue!==a||(f[e].anim.stop(c),b=!1,f.splice(e,1));(b||!c)&&m.dequeue(this,a)})},finish:function(a){return a!==!1&&(a=a||"fx"),this.each(function(){var b,c=m._data(this),d=c[a+"queue"],e=c[a+"queueHooks"],f=m.timers,g=d?d.length:0;for(c.finish=!0,m.queue(this,a,[]),e&&e.stop&&e.stop.call(this,!0),b=f.length;b--;)f[b].elem===this&&f[b].queue===a&&(f[b].anim.stop(!0),f.splice(b,1));for(b=0;g>b;b++)d[b]&&d[b].finish&&d[b].finish.call(this);delete c.finish})}}),m.each(["toggle","show","hide"],function(a,b){var c=m.fn[b];m.fn[b]=function(a,d,e){return null==a||"boolean"==typeof a?c.apply(this,arguments):this.animate(gc(b,!0),a,d,e)}}),m.each({slideDown:gc("show"),slideUp:gc("hide"),slideToggle:gc("toggle"),fadeIn:{opacity:"show"},fadeOut:{opacity:"hide"},fadeToggle:{opacity:"toggle"}},function(a,b){m.fn[a]=function(a,c,d){return this.animate(b,a,c,d)}}),m.timers=[],m.fx.tick=function(){var a,b=m.timers,c=0;for($b=m.now();c<b.le
 ngth;c++)a=b[c],a()||b[c]!==a||b.splice(c--,1);b.length||m.fx.stop(),$b=void 0},m.fx.timer=function(a){m.timers.push(a),a()?m.fx.start():m.timers.pop()},m.fx.interval=13,m.fx.start=function(){_b||(_b=setInterval(m.fx.tick,m.fx.interval))},m.fx.stop=function(){clearInterval(_b),_b=null},m.fx.speeds={slow:600,fast:200,_default:400},m.fn.delay=function(a,b){return a=m.fx?m.fx.speeds[a]||a:a,b=b||"fx",this.queue(b,function(b,c){var d=setTimeout(b,a);c.stop=function(){clearTimeout(d)}})},function(){var a,b,c,d,e;b=y.createElement("div"),b.setAttribute("className","t"),b.innerHTML="  <link/><table></table><a href='/a'>a</a><input type='checkbox'/>",d=b.getElementsByTagName("a")[0],c=y.createElement("select"),e=c.appendChild(y.createElement("option")),a=b.getElementsByTagName("input")[0],d.style.cssText="top:1px",k.getSetAttribute="t"!==b.className,k.style=/top/.test(d.getAttribute("style")),k.hrefNormalized="/a"===d.getAttribute("href"),k.checkOn=!!a.value,k.optSelected=e.selected
 ,k.enctype=!!y.createElement("form").enctype,c.disabled=!0,k.optDisabled=!e.disabled,a=y.createElement("input"),a.setAttribute("value",""),k.input=""===a.getAttribute("value"),a.value="t",a.setAttribute("type","radio"),k.radioValue="t"===a.value}();var lc=/\r/g;m.fn.extend({val:function(a){var b,c,d,e=this[0];{if(arguments.length)return d=m.isFunction(a),this.each(function(c){var e;1===this.nodeType&&(e=d?a.call(this,c,m(this).val()):a,null==e?e="":"number"==typeof e?e+="":m.isArray(e)&&(e=m.map(e,function(a){return null==a?"":a+""})),b=m.valHooks[this.type]||m.valHooks[this.nodeName.toLowerCase()],b&&"set"in b&&void 0!==b.set(this,e,"value")||(this.value=e))});if(e)return b=m.valHooks[e.type]||m.valHooks[e.nodeName.toLowerCase()],b&&"get"in b&&void 0!==(c=b.get(e,"value"))?c:(c=e.value,"string"==typeof c?c.replace(lc,""):null==c?"":c)}}}),m.extend({valHooks:{option:{get:function(a){var b=m.find.attr(a,"value");return null!=b?b:m.trim(m.text(a))}},select:{get:function(a){for
 (var b,c,d=a.options,e=a.selectedIndex,f="select-one"===a.type||0>e,g=f?null:[],h=f?e+1:d.length,i=0>e?h:f?e:0;h>i;i++)if(c=d[i],!(!c.selected&&i!==e||(k.optDisabled?c.disabled:null!==c.getAttribute("disabled"))||c.parentNode.disabled&&m.nodeName(c.parentNode,"optgroup"))){if(b=m(c).val(),f)return b;g.push(b)}return g},set:function(a,b){var c,d,e=a.options,f=m.makeArray(b),g=e.length;while(g--)if(d=e[g],m.inArray(m.valHooks.option.get(d),f)>=0)try{d.selected=c=!0}catch(h){d.scrollHeight}else d.selected=!1;return c||(a.selectedIndex=-1),e}}}}),m.each(["radio","checkbox"],function(){m.valHooks[this]={set:function(a,b){return m.isArray(b)?a.checked=m.inArray(m(a).val(),b)>=0:void 0}},k.checkOn||(m.valHooks[this].get=function(a){return null===a.getAttribute("value")?"on":a.value})});var mc,nc,oc=m.expr.attrHandle,pc=/^(?:checked|selected)$/i,qc=k.getSetAttribute,rc=k.input;m.fn.extend({attr:function(a,b){return V(this,m.attr,a,b,arguments.length>1)},removeAttr:function(a){return
  this.each(function(){m.removeAttr(this,a)})}}),m.extend({attr:function(a,b,c){var d,e,f=a.nodeType;if(a&&3!==f&&8!==f&&2!==f)return typeof a.getAttribute===K?m.prop(a,b,c):(1===f&&m.isXMLDoc(a)||(b=b.toLowerCase(),d=m.attrHooks[b]||(m.expr.match.bool.test(b)?nc:mc)),void 0===c?d&&"get"in d&&null!==(e=d.get(a,b))?e:(e=m.find.attr(a,b),null==e?void 0:e):null!==c?d&&"set"in d&&void 0!==(e=d.set(a,c,b))?e:(a.setAttribute(b,c+""),c):void m.removeAttr(a,b))},removeAttr:function(a,b){var c,d,e=0,f=b&&b.match(E);if(f&&1===a.nodeType)while(c=f[e++])d=m.propFix[c]||c,m.expr.match.bool.test(c)?rc&&qc||!pc.test(c)?a[d]=!1:a[m.camelCase("default-"+c)]=a[d]=!1:m.attr(a,c,""),a.removeAttribute(qc?c:d)},attrHooks:{type:{set:function(a,b){if(!k.radioValue&&"radio"===b&&m.nodeName(a,"input")){var c=a.value;return a.setAttribute("type",b),c&&(a.value=c),b}}}}}),nc={set:function(a,b,c){return b===!1?m.removeAttr(a,c):rc&&qc||!pc.test(c)?a.setAttribute(!qc&&m.propFix[c]||c,c):a[m.camelCase("def
 ault-"+c)]=a[c]=!0,c}},m.each(m.expr.match.bool.source.match(/\w+/g),function(a,b){var c=oc[b]||m.find.attr;oc[b]=rc&&qc||!pc.test(b)?function(a,b,d){var e,f;return d||(f=oc[b],oc[b]=e,e=null!=c(a,b,d)?b.toLowerCase():null,oc[b]=f),e}:function(a,b,c){return c?void 0:a[m.camelCase("default-"+b)]?b.toLowerCase():null}}),rc&&qc||(m.attrHooks.value={set:function(a,b,c){return m.nodeName(a,"input")?void(a.defaultValue=b):mc&&mc.set(a,b,c)}}),qc||(mc={set:function(a,b,c){var d=a.getAttributeNode(c);return d||a.setAttributeNode(d=a.ownerDocument.createAttribute(c)),d.value=b+="","value"===c||b===a.getAttribute(c)?b:void 0}},oc.id=oc.name=oc.coords=function(a,b,c){var d;return c?void 0:(d=a.getAttributeNode(b))&&""!==d.value?d.value:null},m.valHooks.button={get:function(a,b){var c=a.getAttributeNode(b);return c&&c.specified?c.value:void 0},set:mc.set},m.attrHooks.contenteditable={set:function(a,b,c){mc.set(a,""===b?!1:b,c)}},m.each(["width","height"],function(a,b){m.attrHooks[b]={se
 t:function(a,c){return""===c?(a.setAttribute(b,"auto"),c):void 0}}})),k.style||(m.attrHooks.style={get:function(a){return a.style.cssText||void 0},set:function(a,b){return a.style.cssText=b+""}});var sc=/^(?:input|select|textarea|button|object)$/i,tc=/^(?:a|area)$/i;m.fn.extend({prop:function(a,b){return V(this,m.prop,a,b,arguments.length>1)},removeProp:function(a){return a=m.propFix[a]||a,this.each(function(){try{this[a]=void 0,delete this[a]}catch(b){}})}}),m.extend({propFix:{"for":"htmlFor","class":"className"},prop:function(a,b,c){var d,e,f,g=a.nodeType;if(a&&3!==g&&8!==g&&2!==g)return f=1!==g||!m.isXMLDoc(a),f&&(b=m.propFix[b]||b,e=m.propHooks[b]),void 0!==c?e&&"set"in e&&void 0!==(d=e.set(a,c,b))?d:a[b]=c:e&&"get"in e&&null!==(d=e.get(a,b))?d:a[b]},propHooks:{tabIndex:{get:function(a){var b=m.find.attr(a,"tabindex");return b?parseInt(b,10):sc.test(a.nodeName)||tc.test(a.nodeName)&&a.href?0:-1}}}}),k.hrefNormalized||m.each(["href","src"],function(a,b){m.propHooks[b]={ge
 t:function(a){return a.getAttribute(b,4)}}}),k.optSelected||(m.propHooks.selected={get:function(a){var b=a.parentNode;return b&&(b.selectedIndex,b.parentNode&&b.parentNode.selectedIndex),null}}),m.each(["tabIndex","readOnly","maxLength","cellSpacing","cellPadding","rowSpan","colSpan","useMap","frameBorder","contentEditable"],function(){m.propFix[this.toLowerCase()]=this}),k.enctype||(m.propFix.enctype="encoding");var uc=/[\t\r\n\f]/g;m.fn.extend({addClass:function(a){var b,c,d,e,f,g,h=0,i=this.length,j="string"==typeof a&&a;if(m.isFunction(a))return this.each(function(b){m(this).addClass(a.call(this,b,this.className))});if(j)for(b=(a||"").match(E)||[];i>h;h++)if(c=this[h],d=1===c.nodeType&&(c.className?(" "+c.className+" ").replace(uc," "):" ")){f=0;while(e=b[f++])d.indexOf(" "+e+" ")<0&&(d+=e+" ");g=m.trim(d),c.className!==g&&(c.className=g)}return this},removeClass:function(a){var b,c,d,e,f,g,h=0,i=this.length,j=0===arguments.length||"string"==typeof a&&a;if(m.isFunction(a
 ))return this.each(function(b){m(this).removeClass(a.call(this,b,this.className))});if(j)for(b=(a||"").match(E)||[];i>h;h++)if(c=this[h],d=1===c.nodeType&&(c.className?(" "+c.className+" ").replace(uc," "):"")){f=0;while(e=b[f++])while(d.indexOf(" "+e+" ")>=0)d=d.replace(" "+e+" "," ");g=a?m.trim(d):"",c.className!==g&&(c.className=g)}return this},toggleClass:function(a,b){var c=typeof a;return"boolean"==typeof b&&"string"===c?b?this.addClass(a):this.removeClass(a):this.each(m.isFunction(a)?function(c){m(this).toggleClass(a.call(this,c,this.className,b),b)}:function(){if("string"===c){var b,d=0,e=m(this),f=a.match(E)||[];while(b=f[d++])e.hasClass(b)?e.removeClass(b):e.addClass(b)}else(c===K||"boolean"===c)&&(this.className&&m._data(this,"__className__",this.className),this.className=this.className||a===!1?"":m._data(this,"__className__")||"")})},hasClass:function(a){for(var b=" "+a+" ",c=0,d=this.length;d>c;c++)if(1===this[c].nodeType&&(" "+this[c].className+" ").replace(uc,
 " ").indexOf(b)>=0)return!0;return!1}}),m.each("blur focus focusin focusout load resize scroll unload click dblclick mousedown mouseup mousemove mouseover mouseout mouseenter mouseleave change select submit keydown keypress keyup error contextmenu".split(" "),function(a,b){m.fn[b]=function(a,c){return arguments.length>0?this.on(b,null,a,c):this.trigger(b)}}),m.fn.extend({hover:function(a,b){return this.mouseenter(a).mouseleave(b||a)},bind:function(a,b,c){return this.on(a,null,b,c)},unbind:function(a,b){return this.off(a,null,b)},delegate:function(a,b,c,d){return this.on(b,a,c,d)},undelegate:function(a,b,c){return 1===arguments.length?this.off(a,"**"):this.off(b,a||"**",c)}});var vc=m.now(),wc=/\?/,xc=/(,)|(\[|{)|(}|])|"(?:[^"\\\r\n]|\\["\\\/bfnrt]|\\u[\da-fA-F]{4})*"\s*:?|true|false|null|-?(?!0\d)\d+(?:\.\d+|)(?:[eE][+-]?\d+|)/g;m.parseJSON=function(b){if(a.JSON&&a.JSON.parse)return a.JSON.parse(b+"");var c,d=null,e=m.trim(b+"");return e&&!m.trim(e.replace(xc,function(a,b,e,
 f){return c&&b&&(d=0),0===d?a:(c=e||b,d+=!f-!e,"")}))?Function("return "+e)():m.error("Invalid JSON: "+b)},m.parseXML=function(b){var c,d;if(!b||"string"!=typeof b)return null;try{a.DOMParser?(d=new DOMParser,c=d.parseFromString(b,"text/xml")):(c=new ActiveXObject("Microsoft.XMLDOM"),c.async="false",c.loadXML(b))}catch(e){c=void 0}return c&&c.documentElement&&!c.getElementsByTagName("parsererror").length||m.error("Invalid XML: "+b),c};var yc,zc,Ac=/#.*$/,Bc=/([?&])_=[^&]*/,Cc=/^(.*?):[ \t]*([^\r\n]*)\r?$/gm,Dc=/^(?:about|app|app-storage|.+-extension|file|res|widget):$/,Ec=/^(?:GET|HEAD)$/,Fc=/^\/\//,Gc=/^([\w.+-]+:)(?:\/\/(?:[^\/?#]*@|)([^\/?#:]*)(?::(\d+)|)|)/,Hc={},Ic={},Jc="*/".concat("*");try{zc=location.href}catch(Kc){zc=y.createElement("a"),zc.href="",zc=zc.href}yc=Gc.exec(zc.toLowerCase())||[];function Lc(a){return function(b,c){"string"!=typeof b&&(c=b,b="*");var d,e=0,f=b.toLowerCase().match(E)||[];if(m.isFunction(c))while(d=f[e++])"+"===d.charAt(0)?(d=d.slice(1)||"
 *",(a[d]=a[d]||[]).unshift(c)):(a[d]=a[d]||[]).push(c)}}function Mc(a,b,c,d){var e={},f=a===Ic;function g(h){var i;return e[h]=!0,m.each(a[h]||[],function(a,h){var j=h(b,c,d);return"string"!=typeof j||f||e[j]?f?!(i=j):void 0:(b.dataTypes.unshift(j),g(j),!1)}),i}return g(b.dataTypes[0])||!e["*"]&&g("*")}function Nc(a,b){var c,d,e=m.ajaxSettings.flatOptions||{};for(d in b)void 0!==b[d]&&((e[d]?a:c||(c={}))[d]=b[d]);return c&&m.extend(!0,a,c),a}function Oc(a,b,c){var d,e,f,g,h=a.contents,i=a.dataTypes;while("*"===i[0])i.shift(),void 0===e&&(e=a.mimeType||b.getResponseHeader("Content-Type"));if(e)for(g in h)if(h[g]&&h[g].test(e)){i.unshift(g);break}if(i[0]in c)f=i[0];else{for(g in c){if(!i[0]||a.converters[g+" "+i[0]]){f=g;break}d||(d=g)}f=f||d}return f?(f!==i[0]&&i.unshift(f),c[f]):void 0}function Pc(a,b,c,d){var e,f,g,h,i,j={},k=a.dataTypes.slice();if(k[1])for(g in a.converters)j[g.toLowerCase()]=a.converters[g];f=k.shift();while(f)if(a.responseFields[f]&&(c[a.responseFields[f
 ]]=b),!i&&d&&a.dataFilter&&(b=a.dataFilter(b,a.dataType)),i=f,f=k.shift())if("*"===f)f=i;else if("*"!==i&&i!==f){if(g=j[i+" "+f]||j["* "+f],!g)for(e in j)if(h=e.split(" "),h[1]===f&&(g=j[i+" "+h[0]]||j["* "+h[0]])){g===!0?g=j[e]:j[e]!==!0&&(f=h[0],k.unshift(h[1]));break}if(g!==!0)if(g&&a["throws"])b=g(b);else try{b=g(b)}catch(l){return{state:"parsererror",error:g?l:"No conversion from "+i+" to "+f}}}return{state:"success",data:b}}m.extend({active:0,lastModified:{},etag:{},ajaxSettings:{url:zc,type:"GET",isLocal:Dc.test(yc[1]),global:!0,processData:!0,async:!0,contentType:"application/x-www-form-urlencoded; charset=UTF-8",accepts:{"*":Jc,text:"text/plain",html:"text/html",xml:"application/xml, text/xml",json:"application/json, text/javascript"},contents:{xml:/xml/,html:/html/,json:/json/},responseFields:{xml:"responseXML",text:"responseText",json:"responseJSON"},converters:{"* text":String,"text html":!0,"text json":m.parseJSON,"text xml":m.parseXML},flatOptions:{url:!0,conte
 xt:!0}},ajaxSetup:function(a,b){return b?Nc(Nc(a,m.ajaxSettings),b):Nc(m.ajaxSettings,a)},ajaxPrefilter:Lc(Hc),ajaxTransport:Lc(Ic),ajax:function(a,b){"object"==typeof a&&(b=a,a=void 0),b=b||{};var c,d,e,f,g,h,i,j,k=m.ajaxSetup({},b),l=k.context||k,n=k.context&&(l.nodeType||l.jquery)?m(l):m.event,o=m.Deferred(),p=m.Callbacks("once memory"),q=k.statusCode||{},r={},s={},t=0,u="canceled",v={readyState:0,getResponseHeader:function(a){var b;if(2===t){if(!j){j={};while(b=Cc.exec(f))j[b[1].toLowerCase()]=b[2]}b=j[a.toLowerCase()]}return null==b?null:b},getAllResponseHeaders:function(){return 2===t?f:null},setRequestHeader:function(a,b){var c=a.toLowerCase();return t||(a=s[c]=s[c]||a,r[a]=b),this},overrideMimeType:function(a){return t||(k.mimeType=a),this},statusCode:function(a){var b;if(a)if(2>t)for(b in a)q[b]=[q[b],a[b]];else v.always(a[v.status]);return this},abort:function(a){var b=a||u;return i&&i.abort(b),x(0,b),this}};if(o.promise(v).complete=p.add,v.success=v.done,v.error=v
 .fail,k.url=((a||k.url||zc)+"").replace(Ac,"").replace(Fc,yc[1]+"//"),k.type=b.method||b.type||k.method||k.type,k.dataTypes=m.trim(k.dataType||"*").toLowerCase().match(E)||[""],null==k.crossDomain&&(c=Gc.exec(k.url.toLowerCase()),k.crossDomain=!(!c||c[1]===yc[1]&&c[2]===yc[2]&&(c[3]||("http:"===c[1]?"80":"443"))===(yc[3]||("http:"===yc[1]?"80":"443")))),k.data&&k.processData&&"string"!=typeof k.data&&(k.data=m.param(k.data,k.traditional)),Mc(Hc,k,b,v),2===t)return v;h=k.global,h&&0===m.active++&&m.event.trigger("ajaxStart"),k.type=k.type.toUpperCase(),k.hasContent=!Ec.test(k.type),e=k.url,k.hasContent||(k.data&&(e=k.url+=(wc.test(e)?"&":"?")+k.data,delete k.data),k.cache===!1&&(k.url=Bc.test(e)?e.replace(Bc,"$1_="+vc++):e+(wc.test(e)?"&":"?")+"_="+vc++)),k.ifModified&&(m.lastModified[e]&&v.setRequestHeader("If-Modified-Since",m.lastModified[e]),m.etag[e]&&v.setRequestHeader("If-None-Match",m.etag[e])),(k.data&&k.hasContent&&k.contentType!==!1||b.contentType)&&v.setRequestHea
 der("Content-Type",k.contentType),v.setRequestHeader("Accept",k.dataTypes[0]&&k.accepts[k.dataTypes[0]]?k.accepts[k.dataTypes[0]]+("*"!==k.dataTypes[0]?", "+Jc+"; q=0.01":""):k.accepts["*"]);for(d in k.headers)v.setRequestHeader(d,k.headers[d]);if(k.beforeSend&&(k.beforeSend.call(l,v,k)===!1||2===t))return v.abort();u="abort";for(d in{success:1,error:1,complete:1})v[d](k[d]);if(i=Mc(Ic,k,b,v)){v.readyState=1,h&&n.trigger("ajaxSend",[v,k]),k.async&&k.timeout>0&&(g=setTimeout(function(){v.abort("timeout")},k.timeout));try{t=1,i.send(r,x)}catch(w){if(!(2>t))throw w;x(-1,w)}}else x(-1,"No Transport");function x(a,b,c,d){var j,r,s,u,w,x=b;2!==t&&(t=2,g&&clearTimeout(g),i=void 0,f=d||"",v.readyState=a>0?4:0,j=a>=200&&300>a||304===a,c&&(u=Oc(k,v,c)),u=Pc(k,u,v,j),j?(k.ifModified&&(w=v.getResponseHeader("Last-Modified"),w&&(m.lastModified[e]=w),w=v.getResponseHeader("etag"),w&&(m.etag[e]=w)),204===a||"HEAD"===k.type?x="nocontent":304===a?x="notmodified":(x=u.state,r=u.data,s=u.error
 ,j=!s)):(s=x,(a||!x)&&(x="error",0>a&&(a=0))),v.status=a,v.statusText=(b||x)+"",j?o.resolveWith(l,[r,x,v]):o.rejectWith(l,[v,x,s]),v.statusCode(q),q=void 0,h&&n.trigger(j?"ajaxSuccess":"ajaxError",[v,k,j?r:s]),p.fireWith(l,[v,x]),h&&(n.trigger("ajaxComplete",[v,k]),--m.active||m.event.trigger("ajaxStop")))}return v},getJSON:function(a,b,c){return m.get(a,b,c,"json")},getScript:function(a,b){return m.get(a,void 0,b,"script")}}),m.each(["get","post"],function(a,b){m[b]=function(a,c,d,e){return m.isFunction(c)&&(e=e||d,d=c,c=void 0),m.ajax({url:a,type:b,dataType:e,data:c,success:d})}}),m.each(["ajaxStart","ajaxStop","ajaxComplete","ajaxError","ajaxSuccess","ajaxSend"],function(a,b){m.fn[b]=function(a){return this.on(b,a)}}),m._evalUrl=function(a){return m.ajax({url:a,type:"GET",dataType:"script",async:!1,global:!1,"throws":!0})},m.fn.extend({wrapAll:function(a){if(m.isFunction(a))return this.each(function(b){m(this).wrapAll(a.call(this,b))});if(this[0]){var b=m(a,this[0].ownerD
 ocument).eq(0).clone(!0);this[0].parentNode&&b.insertBefore(this[0]),b.map(function(){var a=this;while(a.firstChild&&1===a.firstChild.nodeType)a=a.firstChild;return a}).append(this)}return this},wrapInner:function(a){return this.each(m.isFunction(a)?function(b){m(this).wrapInner(a.call(this,b))}:function(){var b=m(this),c=b.contents();c.length?c.wrapAll(a):b.append(a)})},wrap:function(a){var b=m.isFunction(a);return this.each(function(c){m(this).wrapAll(b?a.call(this,c):a)})},unwrap:function(){return this.parent().each(function(){m.nodeName(this,"body")||m(this).replaceWith(this.childNodes)}).end()}}),m.expr.filters.hidden=function(a){return a.offsetWidth<=0&&a.offsetHeight<=0||!k.reliableHiddenOffsets()&&"none"===(a.style&&a.style.display||m.css(a,"display"))},m.expr.filters.visible=function(a){return!m.expr.filters.hidden(a)};var Qc=/%20/g,Rc=/\[\]$/,Sc=/\r?\n/g,Tc=/^(?:submit|button|image|reset|file)$/i,Uc=/^(?:input|select|textarea|keygen)/i;function Vc(a,b,c,d){var e;if
 (m.isArray(b))m.each(b,function(b,e){c||Rc.test(a)?d(a,e):Vc(a+"["+("object"==typeof e?b:"")+"]",e,c,d)});else if(c||"object"!==m.type(b))d(a,b);else for(e in b)Vc(a+"["+e+"]",b[e],c,d)}m.param=function(a,b){var c,d=[],e=function(a,b){b=m.isFunction(b)?b():null==b?"":b,d[d.length]=encodeURIComponent(a)+"="+encodeURIComponent(b)};if(void 0===b&&(b=m.ajaxSettings&&m.ajaxSettings.traditional),m.isArray(a)||a.jquery&&!m.isPlainObject(a))m.each(a,function(){e(this.name,this.value)});else for(c in a)Vc(c,a[c],b,e);return d.join("&").replace(Qc,"+")},m.fn.extend({serialize:function(){return m.param(this.serializeArray())},serializeArray:function(){return this.map(function(){var a=m.prop(this,"elements");return a?m.makeArray(a):this}).filter(function(){var a=this.type;return this.name&&!m(this).is(":disabled")&&Uc.test(this.nodeName)&&!Tc.test(a)&&(this.checked||!W.test(a))}).map(function(a,b){var c=m(this).val();return null==c?null:m.isArray(c)?m.map(c,function(a){return{name:b.nam
 e,value:a.replace(Sc,"\r\n")}}):{name:b.name,value:c.replace(Sc,"\r\n")}}).get()}}),m.ajaxSettings.xhr=void 0!==a.ActiveXObject?function(){return!this.isLocal&&/^(get|post|head|put|delete|options)$/i.test(this.type)&&Zc()||$c()}:Zc;var Wc=0,Xc={},Yc=m.ajaxSettings.xhr();a.ActiveXObject&&m(a).on("unload",function(){for(var a in Xc)Xc[a](void 0,!0)}),k.cors=!!Yc&&"withCredentials"in Yc,Yc=k.ajax=!!Yc,Yc&&m.ajaxTransport(function(a){if(!a.crossDomain||k.cors){var b;return{send:function(c,d){var e,f=a.xhr(),g=++Wc;if(f.open(a.type,a.url,a.async,a.username,a.password),a.xhrFields)for(e in a.xhrFields)f[e]=a.xhrFields[e];a.mimeType&&f.overrideMimeType&&f.overrideMimeType(a.mimeType),a.crossDomain||c["X-Requested-With"]||(c["X-Requested-With"]="XMLHttpRequest");for(e in c)void 0!==c[e]&&f.setRequestHeader(e,c[e]+"");f.send(a.hasContent&&a.data||null),b=function(c,e){var h,i,j;if(b&&(e||4===f.readyState))if(delete Xc[g],b=void 0,f.onreadystatechange=m.noop,e)4!==f.readyState&&f.abor
 t();else{j={},h=f.status,"string"==typeof f.responseText&&(j.text=f.responseText);try{i=f.statusText}catch(k){i=""}h||!a.isLocal||a.crossDomain?1223===h&&(h=204):h=j.text?200:404}j&&d(h,i,j,f.getAllResponseHeaders())},a.async?4===f.readyState?setTimeout(b):f.onreadystatechange=Xc[g]=b:b()},abort:function(){b&&b(void 0,!0)}}}});function Zc(){try{return new a.XMLHttpRequest}catch(b){}}function $c(){try{return new a.ActiveXObject("Microsoft.XMLHTTP")}catch(b){}}m.ajaxSetup({accepts:{script:"text/javascript, application/javascript, application/ecmascript, application/x-ecmascript"},contents:{script:/(?:java|ecma)script/},converters:{"text script":function(a){return m.globalEval(a),a}}}),m.ajaxPrefilter("script",function(a){void 0===a.cache&&(a.cache=!1),a.crossDomain&&(a.type="GET",a.global=!1)}),m.ajaxTransport("script",function(a){if(a.crossDomain){var b,c=y.head||m("head")[0]||y.documentElement;return{send:function(d,e){b=y.createElement("script"),b.async=!0,a.scriptCharset&&
 (b.charset=a.scriptCharset),b.src=a.url,b.onload=b.onreadystatechange=function(a,c){(c||!b.readyState||/loaded|complete/.test(b.readyState))&&(b.onload=b.onreadystatechange=null,b.parentNode&&b.parentNode.removeChild(b),b=null,c||e(200,"success"))},c.insertBefore(b,c.firstChild)},abort:function(){b&&b.onload(void 0,!0)}}}});var _c=[],ad=/(=)\?(?=&|$)|\?\?/;m.ajaxSetup({jsonp:"callback",jsonpCallback:function(){var a=_c.pop()||m.expando+"_"+vc++;return this[a]=!0,a}}),m.ajaxPrefilter("json jsonp",function(b,c,d){var e,f,g,h=b.jsonp!==!1&&(ad.test(b.url)?"url":"string"==typeof b.data&&!(b.contentType||"").indexOf("application/x-www-form-urlencoded")&&ad.test(b.data)&&"data");return h||"jsonp"===b.dataTypes[0]?(e=b.jsonpCallback=m.isFunction(b.jsonpCallback)?b.jsonpCallback():b.jsonpCallback,h?b[h]=b[h].replace(ad,"$1"+e):b.jsonp!==!1&&(b.url+=(wc.test(b.url)?"&":"?")+b.jsonp+"="+e),b.converters["script json"]=function(){return g||m.error(e+" was not called"),g[0]},b.dataTypes[
 0]="json",f=a[e],a[e]=function(){g=arguments},d.always(function(){a[e]=f,b[e]&&(b.jsonpCallback=c.jsonpCallback,_c.push(e)),g&&m.isFunction(f)&&f(g[0]),g=f=void 0}),"script"):void 0}),m.parseHTML=function(a,b,c){if(!a||"string"!=typeof a)return null;"boolean"==typeof b&&(c=b,b=!1),b=b||y;var d=u.exec(a),e=!c&&[];return d?[b.createElement(d[1])]:(d=m.buildFragment([a],b,e),e&&e.length&&m(e).remove(),m.merge([],d.childNodes))};var bd=m.fn.load;m.fn.load=function(a,b,c){if("string"!=typeof a&&bd)return bd.apply(this,arguments);var d,e,f,g=this,h=a.indexOf(" ");return h>=0&&(d=m.trim(a.slice(h,a.length)),a=a.slice(0,h)),m.isFunction(b)?(c=b,b=void 0):b&&"object"==typeof b&&(f="POST"),g.length>0&&m.ajax({url:a,type:f,dataType:"html",data:b}).done(function(a){e=arguments,g.html(d?m("<div>").append(m.parseHTML(a)).find(d):a)}).complete(c&&function(a,b){g.each(c,e||[a.responseText,b,a])}),this},m.expr.filters.animated=function(a){return m.grep(m.timers,function(b){return a===b.elem}
 ).length};var cd=a.document.documentElement;function dd(a){return m.isWindow(a)?a:9===a.nodeType?a.defaultView||a.parentWindow:!1}m.offset={setOffset:function(a,b,c){var d,e,f,g,h,i,j,k=m.css(a,"position"),l=m(a),n={};"static"===k&&(a.style.position="relative"),h=l.offset(),f=m.css(a,"top"),i=m.css(a,"left"),j=("absolute"===k||"fixed"===k)&&m.inArray("auto",[f,i])>-1,j?(d=l.position(),g=d.top,e=d.left):(g=parseFloat(f)||0,e=parseFloat(i)||0),m.isFunction(b)&&(b=b.call(a,c,h)),null!=b.top&&(n.top=b.top-h.top+g),null!=b.left&&(n.left=b.left-h.left+e),"using"in b?b.using.call(a,n):l.css(n)}},m.fn.extend({offset:function(a){if(arguments.length)return void 0===a?this:this.each(function(b){m.offset.setOffset(this,a,b)});var b,c,d={top:0,left:0},e=this[0],f=e&&e.ownerDocument;if(f)return b=f.documentElement,m.contains(b,e)?(typeof e.getBoundingClientRect!==K&&(d=e.getBoundingClientRect()),c=dd(f),{top:d.top+(c.pageYOffset||b.scrollTop)-(b.clientTop||0),left:d.left+(c.pageXOffset||b
 .scrollLeft)-(b.clientLeft||0)}):d},position:function(){if(this[0]){var a,b,c={top:0,left:0},d=this[0];return"fixed"===m.css(d,"position")?b=d.getBoundingClientRect():(a=this.offsetParent(),b=this.offset(),m.nodeName(a[0],"html")||(c=a.offset()),c.top+=m.css(a[0],"borderTopWidth",!0),c.left+=m.css(a[0],"borderLeftWidth",!0)),{top:b.top-c.top-m.css(d,"marginTop",!0),left:b.left-c.left-m.css(d,"marginLeft",!0)}}},offsetParent:function(){return this.map(function(){var a=this.offsetParent||cd;while(a&&!m.nodeName(a,"html")&&"static"===m.css(a,"position"))a=a.offsetParent;return a||cd})}}),m.each({scrollLeft:"pageXOffset",scrollTop:"pageYOffset"},function(a,b){var c=/Y/.test(b);m.fn[a]=function(d){return V(this,function(a,d,e){var f=dd(a);return void 0===e?f?b in f?f[b]:f.document.documentElement[d]:a[d]:void(f?f.scrollTo(c?m(f).scrollLeft():e,c?e:m(f).scrollTop()):a[d]=e)},a,d,arguments.length,null)}}),m.each(["top","left"],function(a,b){m.cssHooks[b]=Lb(k.pixelPosition,function
 (a,c){return c?(c=Jb(a,b),Hb.test(c)?m(a).position()[b]+"px":c):void 0})}),m.each({Height:"height",Width:"width"},function(a,b){m.each({padding:"inner"+a,content:b,"":"outer"+a},function(c,d){m.fn[d]=function(d,e){var f=arguments.length&&(c||"boolean"!=typeof d),g=c||(d===!0||e===!0?"margin":"border");return V(this,function(b,c,d){var e;return m.isWindow(b)?b.document.documentElement["client"+a]:9===b.nodeType?(e=b.documentElement,Math.max(b.body["scroll"+a],e["scroll"+a],b.body["offset"+a],e["offset"+a],e["client"+a])):void 0===d?m.css(b,c,g):m.style(b,c,d,g)},b,f?d:void 0,f,null)}})}),m.fn.size=function(){return this.length},m.fn.andSelf=m.fn.addBack,"function"==typeof define&&define.amd&&define("jquery",[],function(){return m});var ed=a.jQuery,fd=a.$;return m.noConflict=function(b){return a.$===m&&(a.$=fd),b&&a.jQuery===m&&(a.jQuery=ed),m},typeof b===K&&(a.jQuery=a.$=m),m});
-- 
2.1.1
