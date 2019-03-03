From: James Grant <jamesg@zaltys.org>
Date: Sun, 3 Mar 2019 19:00:22 +1300
Subject: [Buildroot] No OpenSSL 1.1.x support in Qt 5.6.x.
In-Reply-To: <20190302211342.ww5xlkllobrccxxc@vkochan-ThinkPad-T470p>
References: <BL2P132MB00203E45B23E62E378ED9B02E5760@BL2P132MB0020.NAMP132.PROD.OUTLOOK.COM>
 <87imx3ufmy.fsf@dell.be.48ers.dk>
 <50637756-4e19-d116-b335-0a2149d25033@zaltys.org>
 <875zt1kona.fsf@dell.be.48ers.dk>
 <20190302211342.ww5xlkllobrccxxc@vkochan-ThinkPad-T470p>
Message-ID: <9c45638b-b2d6-ca0c-045c-1f93d2b16f8f@zaltys.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 3/03/2019 10:13, Vadim Kochan wrote:
> Hi All,
>
> On Sat, Mar 02, 2019 at 09:27:37PM +0100, Peter Korsgaard wrote:
>>>>>>> "James" == James Grant<jamesg@zaltys.org>  writes:
>>   > On 1/03/2019 22:07, Peter Korsgaard wrote:
>>   >>>>>>> "James" == James Grant<james.grant@jci.com>   writes:
>>   >> > Hi,
>>   >> > There is no OpenSSL 1.1.x support in Qt 5.6.x and no-one appears to have back-ported support.
>>   >>
>>   >> >https://development.qt-project.narkive.com/RW4wxYXY/openssl-1-1-x-support-on-qt-5-6-5-9
>>   >>
>>   >> > I'm suggesting that for upcoming 2019.02 release that no attempt
>>   >> > is made to build with SSL support for 5.6.
>>   >>
>>   >> > About to send patch to that effect.
>>   >>
>>   >> Yes. I was hoping that users of Qt 5.6 would step up and send patches,
>>   >> but given that hasn't happened and 2019.02 is overdue, that is probably
>>   >> the least bad solution.
>>   >>
>>   >> Looking forward to your patch.
>>
>>   > Earliest version of a OpenSSL 1.1 patch for Qt 5.x I can find is
>>   > against Qt 5.7 (LGPLv3). If you adapted / backported that for Qt 5.6
>>   > there is an argument you're contaminating LGPLv2 Qt5.6 with LGPLv3
>>   > code - defeating the whole point of keeping Qt 5.6 for many.
>>
>> Yes, agreed.
>>
>>   > I got Qt 5.6 compiling with LibreSSL (which is keeping a level of
>>   > OpenSSL 1.0 compatibility).? Currently Qt is set to dlopen() OpenSSL
>>   > at runtime (-openssl), changing this to shared linkage
>>   > (-openssl-linked), then compiling only the SSL module with
>>   > -fpermissive yields a working build. No actual code changes needed.
>>
>>   > Is there really any benefit to dlopen() OpenSSL on an embedded system
>>   > in any case?
>>
>> Not that I am aware of.
>>
>>
>>   > The -fpermissive flag is needed to workaround? 'const BIO_METHOD *'
>>   > vs. 'BIO_METHOD *' changes to BIO_new() and BIO_s_mem() function
>>   > signatures.
>>
>>   > 'download' example successfully downloaded a file from a https site for me.
>>
>>   > Should I put together a patch doing this? ... or is someone likely to
>>   > come forward with a more comprehensive LGPLv2 licensed fix?
>>
>> If it is a simple patch, then please post it. It may be interesting for
>> users on 5.6.
>>
> Just FYI, I found only this patch:
>
>      https://github.com/patch-exchange/openssl-1.1-transition/blob/master/qt5-qtbase/qtbase-5.7.0-openssl-1.1.patch

Also these, which look more complete:

https://src.fedoraproject.org/cgit/rpms/qt5-qtbase.git/plain/qt5-qtbase-5.9.1-openssl11.patch?h=f27
https://github.com/richmoore/qtbase/commits/openssl11
http://openssl.6102.n7.nabble.com/Porting-to-OpenSSL-1-1-td68712.html

But LGPLv3 vs. LGPLv2 licensing is a potential issue with all these.

Regards,
James Grant.
