From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 13 Jun 2015 01:04:02 +0200
Subject: [Buildroot] [PATCH v5 2/3] lutok: new package
In-Reply-To: <20150612214509.08728a82@free-electrons.com>
References: <1434063093-14906-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>	<1434063093-14906-3-git-send-email-sebastien.bourdelin@savoirfairelinux.com>	<20150612213419.15566320@free-electrons.com>
 <20150612214509.08728a82@free-electrons.com>
Message-ID: <557B6562.4050204@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/12/15 21:45, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 12 Jun 2015 21:34:19 +0200, Thomas Petazzoni wrote:
> 
>> Both the lutok and kyua packages after --without-atf ? Why so ? You add
>> the atf package as the first patch, and then it isn't used in follow-up
>> patches ?
> 
> Ok, --without-atf is not about ATF support, but about build ATF-based
> tests. I've added a comment to explain this.
> 
>>> +# liblua uses dlopen when dynamically linked
>>> +ifneq ($(BR2_STATIC_LIBS),y)
>>
>> ifeq ($(BR2_STATIC_LIBS),)
> 
> Actually, I was able to build without adding -ldl, so I'm not sure why
> it is needed. We'll see what the autobuilders have to say, unless you
> have more details about the specific configuration that was causing
> problems.

 If you build --with-atf, then the linking of the tests will fail, because some
of them link with liblua and lua's .pc file forgets to add -ldl.

 See haserl.mk.

 Since now we build --without-atf, this package doesn't link anything anymore so
the -ldl is no longer needed - at least not here.

 Regards,
 Arnout

> 
> Thanks,
> 
> Thomas
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
