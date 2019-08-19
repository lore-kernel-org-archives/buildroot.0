From: Victor Huesca <victor.huesca@bootlin.com>
Date: Mon, 19 Aug 2019 11:00:37 +0200
Subject: [Buildroot] [PATCH buildroot-test v2 2/3] web/stylesheet.css: add
 styling for the request page
In-Reply-To: <20190819090038.28808-1-victor.huesca@bootlin.com>
References: <20190819090038.28808-1-victor.huesca@bootlin.com>
Message-ID: <20190819090038.28808-3-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The style follows the existing visual aspect of the stats page.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 web/stylesheet.css | 64 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/web/stylesheet.css b/web/stylesheet.css
index f2b5ac1..a81e12b 100644
--- a/web/stylesheet.css
+++ b/web/stylesheet.css
@@ -37,3 +37,67 @@ table tr.nok td {
 table tr.timeout td {
     background-color: #ffe79e;
 }
+
+
+
+/*****************/
+/*  request.php  */
+/*****************/
+
+form {
+	display: grid;
+	grid-template-columns: repeat(3, 1fr);
+	grid-column-gap: 4%;
+	margin: 20px auto;
+	width: 80%;
+}
+
+form input,
+form fieldset,
+form textarea {
+	border: 1px solid #00ccff;
+	box-shadow: 1px 1px 4px #cacada;
+	border-radius: 3px;
+	box-sizing: border-box;
+	margin: 0 auto 10px auto;
+}
+
+form input:focus,
+form fieldset:focus,
+form textarea:focus {
+	outline: none;
+	border: 1px solid #0088ff;
+}
+
+form input:not([type=radio]):not([type=button]):not([type=submit]) {
+	width: 100%;
+}
+
+form textarea {
+	min-width: 100%;
+	max-width: 100%;
+	height: 150px;
+}
+
+form fieldset {
+	margin-top: 10px;
+}
+
+form fieldset label {
+	margin-right: 5%;
+}
+
+form input[type=submit],
+form input[type=button] {
+	width: 90%;
+	margin: 10px auto;
+	padding: 8px 15px 8px 15px;
+	background: #00aaff;
+	color: #fff;
+	grid-column: 2;
+}
+
+form input[type=submit]:hover,
+form input[type=button]:hover {
+	background: #0088ff;
+}
-- 
2.21.0
