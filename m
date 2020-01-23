From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 23 Jan 2020 23:39:45 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-pyqt5: select
 BR2_PACKAGE_QT5BASE_GUI
In-Reply-To: <CAPi7W83tq1Lcfh6jsREDkS7dc7k8HKrp+50hwDCCZyQEbkq8Zg@mail.gmail.com>
References: <20191230214842.1485805-1-fontaine.fabrice@gmail.com>
 <20191230234259.5bfe6355@windsurf> <20200112230647.1fce0393@windsurf>
 <CAPi7W83tq1Lcfh6jsREDkS7dc7k8HKrp+50hwDCCZyQEbkq8Zg@mail.gmail.com>
Message-ID: <27821b18-b923-ff87-9da9-f56e65d78a45@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/01/2020 23:23, Fabrice Fontaine wrote:
> Le dim. 12 janv. 2020 ? 23:06, Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> a ?crit :
>>
>> Fabrice,
>>
>> Any comment on the below question ?
> This is indeed "strange" but configure.py is really passing -gui
> unconditionally for QtCore (as well as QtDbus, QtNetwork ...).

 I've added a bit of this explanation to the commit message and applied to
master, thanks!

 Regards,
 Arnout

> I didn't try to get in touch with upstream yet however I would assume
> that pyqt really expects that GUI is enabled on Qt.
> Here is an extract of their whitepaper
> (https://www.riverbankcomputing.com/static/Docs/PyQt4-whitepaper/pyqt-whitepaper-a4.pdf):
> PyQt, provides an ideal combination for rapidly creating powerful and
> flexible GUI applications.
>>
>> Thanks!
>>
>> Thomas
>>
>> On Mon, 30 Dec 2019 23:42:59 +0100
>> Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
>>
>>> On Mon, 30 Dec 2019 22:48:42 +0100
>>> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>>>
>>>> gui is a mandatory dependency of python-pyqt5 as "-gui" option is used
>>>> internally by the configure.py script
>>>>
>>>> Fixes:
>>>>  - http://autobuild.buildroot.org/results/ea0c8db44aacf1ce76f75e8288969fe5da6690d9
>>>>
>>>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>>>
>>> This seems weird. Are you sure? Could you talk with upstream about this?
>>>
>>> Thomas
>>
>>
>>
>> --
>> Thomas Petazzoni, CTO, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
> Best Regards,
> 
> Fabrice
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
