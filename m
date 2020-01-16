From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 16 Jan 2020 23:36:55 +0100
Subject: [Buildroot] [PATCH] infra: add the transient download mechanism
In-Reply-To: <CAOf5uwn=OEjLkbuu6tpAxYKbVVcaCiKW02EAOnX7KmMgNOTT0Q@mail.gmail.com>
References: <20200115203753.12110-1-yann.morin.1998@free.fr>
 <CAOf5uwn=OEjLkbuu6tpAxYKbVVcaCiKW02EAOnX7KmMgNOTT0Q@mail.gmail.com>
Message-ID: <01701af9-7250-080a-46fe-40aae2d0552d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15/01/2020 23:04, Michael Nazzareno Trimarchi wrote:
> Hi
> 
> On Wed, Jan 15, 2020 at 9:37 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>> NOTE: NOT TO BE COMMITTED!
>>
>> This patch is a proof of concept for the transient download mechanism,
>> that would help using branches as versions, and keep using the head of
>> the branch each time a build started.
>>
>> A package declares its download as transient with:
>>   FOO_DOWNLOAD_TRANSIENT = YES
>>
> Why we can not just have like
> PKG_TRANSIENT_OVERRIDE_FILE="ci.mk"

 You can use BR2_PACKAGE_OVERRIDE_FILE for this.

> 
> ci.mk
> 
> FOO_DOWNLOAD_TRANSIENT = YES
> FOO_REVISION="<TAG> e/o BRANCH"

 ... but not for this, unfortunately.

 There would be two ways to implement this after all:

1. implement the idea which has floated around already a couple of times to
delay evaluation of most of inner-generic-package (and other infras) until
later, and include the override file only after the package .mk files;

2. create new override options FOO_OVERRIDE_VERSION, ... and use those instead
of the package options - similar to OVERRIDE_SRCDIR.

 Both are totally orthogonal to the TRANSIENT idea, of course.

 Regards,
 Arnout
