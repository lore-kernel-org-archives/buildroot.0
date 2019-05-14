From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 May 2019 23:08:51 +0200
Subject: [Buildroot] [PATCH 2/2] package/qt5multimedia: fix build with
 gstreamer 0.10
In-Reply-To: <CAPi7W82CASM+P1+zKHBWRBUa8LDyFfbi9vLU3vizTUVm3GR=EA@mail.gmail.com>
References: <20190512132627.18937-1-fontaine.fabrice@gmail.com>
 <20190512132627.18937-2-fontaine.fabrice@gmail.com>
 <c035d344-0dff-f375-04d2-10ae4c82b8b6@mind.be>
 <CAPi7W82CASM+P1+zKHBWRBUa8LDyFfbi9vLU3vizTUVm3GR=EA@mail.gmail.com>
Message-ID: <bd9ceef1-19d5-836f-568f-df5bcf85cea9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14/05/2019 22:27, Fabrice Fontaine wrote:
> Hi Arnout,
> 
> Le mar. 14 mai 2019 ? 21:50, Arnout Vandecappelle <arnout@mind.be> a ?crit :
>>
>>  Hi Fabrice,
>>
>> On 12/05/2019 15:26, Fabrice Fontaine wrote:
>>> Fixes:
>>>  - http://autobuild.buildroot.org/results/de26fd4f5ab130bd87ea9d7709d9568290362758
>>>
>>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>>> ---
>>>  ...-compile-failure-with-gstreamer-0-10.patch | 36 +++++++++++++++++++
>>>  1 file changed, 36 insertions(+)
>>>  create mode 100644 package/qt5/qt5multimedia/0001-Fix-compile-failure-with-gstreamer-0-10.patch
>>
>>  Does this patch apply both to 5.6 and 5.12?
> Patch does not apply on QT 5.6. It fixes a build failure added in 5.12.2.

 Indeed, this patch breaks the build.

$ make BR2_PACKAGE_QT5_VERSION_5_6=y BR2_PACKAGE_QT5_VERSION_LATEST=
qt5multimedia-patch
qtmultimedia-opensource-src-5.6.3.tar.xz: OK (sha256:
ae36039ea8037742342f1615687e0ca2188f3ed0d700627a5e5be546c15e1b46)
>>> qt5multimedia 5.6.3 Extracting
xzcat
/home/arnout/src/buildroot-dl/qt5multimedia/qtmultimedia-opensource-src-5.6.3.tar.xz
| tar --strip-components=1 -C
/home/arnout/src/buildroot/output/build/qt5multimedia-5.6.3   -xf -
>>> qt5multimedia 5.6.3 Patching

Applying 0001-Fix-compile-failure-with-gstreamer-0-10.patch using patch:
can't find file to patch at input line 22
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
...

 So I moved it to the 5.12.2 subdirectory and applied to master, thanks.

 Regards,
 Arnout


>>
>>  Note that we don't need a patch for 5.6, since it's excluded in qt5base. And
>> both Qt5.6 and gstreamer0.10 will be removed soonish, so there's no need to go
>> and re-enable it for 5.6. But I just want to avoid a build failure for 5.6
>> because the patch doesn't apply.
>>
>>  Regards,
>>  Arnout
> Regards,
> 
> Fabrice
> 
