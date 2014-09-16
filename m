From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 16 Sep 2014 08:27:34 +0200
Subject: [Buildroot] General questions
In-Reply-To: <541759B2.8050500@mind.be>
References: <CAK9TtU0uPXcqZNEcgxjrs_Gnm=jMECRPDAbKMAjoCTxC-Ycb2g@mail.gmail.com>
 <CAAXf6LXwNYVB6VzNT=FNt1DOA=uowhA6DEB-9-8JoAjoiO_m2Q@mail.gmail.com>
 <541759B2.8050500@mind.be>
Message-ID: <CAAXf6LXqsDxBHUx3Oz_bpm+LBig3AB6v+jemdOZev13a=9H+DA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Mon, Sep 15, 2014 at 11:27 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 09/09/14 12:04, Thomas De Schampheleire wrote:
>> Hi Sylvain,
>>
>> On Tue, Sep 9, 2014 at 11:20 AM, Sylvain LG <forum@sylvainlegourr.com> wrote:
>>> Hi,
>>>
>>> I develop some projects with Qt and run them on ARM embedded systems. OS is
>>> built by Buildroot.
>>>
>>> Since Qt 5.3.1 and QtCreator 3, GDB must support Python scripting.
>>>
>>> ?The selected build of GDB does not support Python scripting it cannot be
>>> used in Qt Creator?
>>>
>>>
>>> I have to recompile gdb with these options:
>>>
>>> ./configure --prefix /usr/local/gdb-python2 --with-python
>>>
>>> What is the right way to achieve this?
>>
>> In package/gdb/gdb.mk, you will have to update the HOST_GDB_CONF_OPT variable.
>> You shouldn't add --prefix, but only the --with-python flag.
>> Since not everyone will want this python dependency, you probably
>> should add an option for this. This is done in
>> package/gdb/Config.in.host
>>
>> I suggest to have a look at the recent TUI support that was added in
>> Buildroot for GDB, I think that the way to handle python support is
>> very similar, except that instead of host-ncurses as dependency,
>> you'll add host-python.
>
>  I'm not sure that we want our own-build host-python... You may want to use some
> of the system's python packages, for example. So I think it is better to drop
> the host-python dependency, and use the system python instead. (Note that python
> is a dependency of buildroot.)
>
>
>> Additionally, from the Config.in.host file, you'll have to select
>> BR2_PACKAGE_PYTHON. Due to this, you'll also need to propagate the
>
>  Huh? We are talking about the host-gdb here, so why do you need a target python?
>

Sorry, this is a mistake. I originally mistakenly wrote this mail with
target gdb/python in mind but forgot to fix this part.

Best regards,
Thomas
