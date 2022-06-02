Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DE1C43334
	for <buildroot@archiver.kernel.org>; Thu,  2 Jun 2022 16:05:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 437C54198D;
	Thu,  2 Jun 2022 16:05:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QmAHlV9FcktU; Thu,  2 Jun 2022 16:05:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C30394195F;
	Thu,  2 Jun 2022 16:05:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 392A91BF275
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 16:05:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35B414195F
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 16:05:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3TMa_gmpOil4 for <buildroot@lists.busybox.net>;
 Thu,  2 Jun 2022 16:04:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mailfo01.lmco.com (mailfo01.lmco.com [192.31.106.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C6AEA4190C
 for <buildroot@buildroot.org>; Thu,  2 Jun 2022 16:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmco.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=corpgw201202;
 bh=eoMJG6+h7QuauKebJpk/eNmaXCWn/j4hMYEf1+wvivU=;
 b=1BheMDV8Ttt9cDi5wgWI1x+TWXXL0A41Len3pDCn6gdiE5gsW1rNfAAf85qZOviZ7tAO
 PmC935hTFsgQrajkke/0eN7wZiIwaJ6R8vf3REah+IjYThakOmYvs1oesSgj8wRVuTC+
 u+vycFbJlpsNB6C+vJKQ51qVvMjO9MbpI879JHboCIOCvgzjhg5HmE2Wfzzw6D4WDtLR
 rvfZeaBtkt7UNwwI+su04T7iMgf7La7aZlT7cFC+/0FS+ESyOJJkQswqvyO61gbuO+QD
 bqkP2uAtyXiRvKCxijM0AbM3V/QfTBJEvaomqEjq8aOB+mOF4ZP0OuIdocX1o9NZByWz Mg== 
Received: from lmxpdend11w03.us.lmco.com (lmxpdend11w03.ems.lmco.com
 [172.23.20.74])
 by mailfo01.lmco.com (8.16.0.42/8.16.0.42) with ESMTP id 252G4siH206769
 for <buildroot@buildroot.org>; Thu, 2 Jun 2022 16:04:54 GMT
Received: from lmxpdend11w05.us.lmco.com (172.23.20.76) by
 lmxpdend11w03.us.lmco.com (172.23.20.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
 15.1.2308.27; Thu, 2 Jun 2022 10:04:53 -0600
Received: from lmxpdend11w05.us.lmco.com ([172.23.20.76]) by
 lmxpdend11w05.us.lmco.com ([172.23.20.76]) with mapi id 15.01.2308.021; Thu,
 2 Jun 2022 10:04:53 -0600
From: "Wood, Chris" <chris.wood@lmco.com>
To: "'buildroot@buildroot.org'" <buildroot@buildroot.org>
Thread-Topic: SHA Hashing of Licenses Causing Issues
Thread-Index: Adh2lrtS9NzgEfeuQVKe23f8sAJTWw==
Date: Thu, 2 Jun 2022 16:04:53 +0000
Message-ID: <26ef81b5fd6d4cf7ad2e0f1a8674ce7d@lmco.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.23.20.10]
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: zrGXf61VvAfkzQBdcfEFPDmHeOJWtvuD
X-Proofpoint-GUID: zrGXf61VvAfkzQBdcfEFPDmHeOJWtvuD
X-LM-Outbound: External 172.23.20.74 cntry=**
 g=zrGXf61VvAfkzQBdcfEFPDmHeOJWtvuD q=252G4siH206769 m=1
X-LM-OBSENDER: chris.wood@lmco.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-02_04:2022-06-02,
 2022-06-02 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=728
 suspectscore=0 adultscore=0 mlxscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206020066
Subject: [Buildroot] SHA Hashing of Licenses Causing Issues
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4565634335379460806=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4565634335379460806==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_26ef81b5fd6d4cf7ad2e0f1a8674ce7dlmcocom_"

--_000_26ef81b5fd6d4cf7ad2e0f1a8674ce7dlmcocom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello
I have encountered numerous issues with trying to run a software component =
licensing deep scanner on BR 2022 v02.1 source code.  I can see that you ar=
e trying to exercise comprehensive integrity on the component licensing for=
 which I greatly commend you.  However by removing all of the Copying and L=
icensing files from the source code and replacing them with SHA hashes the =
software licensing scanners are failing because they are looking for licens=
es in the form of SPDX, OSI and other license formats and there is no (to m=
y knowledge) Industry standard that pattern matches hashes to the licenses =
as they are represented by either name in a recognized "license name" field=
 or in the text content or format contained in the OSI, SPDX or other indus=
try recognized repositories.  I looked for the cross references in the BR d=
istribution but the subdirectories are not present.

Also the training materials are also confusing the scanners because there a=
re innumerable references to the word "license" and then an example file na=
me such as "FOO......" in the numerous examples and documents.



--_000_26ef81b5fd6d4cf7ad2e0f1a8674ce7dlmcocom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello<o:p></o:p></p>
<p class=3D"MsoNormal">I have encountered numerous issues with trying to ru=
n a software component licensing deep scanner on BR 2022 v02.1 source code.=
&nbsp; I can see that you are trying to exercise comprehensive integrity on=
 the component licensing for which I greatly
 commend you.&nbsp; However by removing all of the Copying and Licensing fi=
les from the source code and replacing them with SHA hashes the software li=
censing scanners are failing because they are looking for licenses in the f=
orm of SPDX, OSI and other license formats
 and there is no (to my knowledge) Industry standard that pattern matches h=
ashes to the licenses as they are represented by either name in a recognize=
d &#8220;license name&#8221; field or in the text content or format contain=
ed in the OSI, SPDX or other industry recognized
 repositories.&nbsp; I looked for the cross references in the BR distributi=
on but the subdirectories are not present.&nbsp;
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Also the training materials are also confusing the s=
canners because there are innumerable references to the word &#8220;license=
&#8221; and then an example file name such as &#8220;FOO&#8230;&#8230;&#822=
1; in the numerous examples and documents.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_26ef81b5fd6d4cf7ad2e0f1a8674ce7dlmcocom_--

--===============4565634335379460806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4565634335379460806==--
