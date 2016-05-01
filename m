From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Sun, 1 May 2016 17:00:05 +0200
Subject: [Buildroot] Qt5 and display
In-Reply-To: <87lh3usvx4.fsf@dell.be.48ers.dk>
References: <5724F1FF.7070408@gmail.com> <87lh3usvx4.fsf@dell.be.48ers.dk>
Message-ID: <572619F5.2060403@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I compiled Qt5 in Buildroot 2016.05-git-01124-g70fc85f-dirty with both 
X11 and eglfs support, because I would like to try both.
Console application runs fine, but when I launch a visual application 
(i.e. qml) I get:


> Could not open display

Currently I have no X server running so I'm launching my application 
with -platform eglfs

exporting QT_DEBUG_PLUGINS=1 leads to this output:

> QML debugging is enabled. Only use this in a safe environment.
> QFactoryLoader::QFactoryLoader() checking directory path 
> "/usr/lib/qt/plugins/platforms" ...
> QFactoryLoader::QFactoryLoader() looking at 
> "/usr/lib/qt/plugins/platforms/libqeglfs.so"
> Found metadata in lib /usr/lib/qt/plugins/platforms/libqeglfs.so, 
> metadata=
> {
>     "IID": 
> "org.qt-project.Qt.QPA.QPlatformIntegrationFactoryInterface.5.3",
>     "MetaData": {
>         "Keys": [
>             "eglfs"
>         ]
>     },
>     "className": "QEglFSIntegrationPlugin",
>     "debug": false,
>     "version": 329216
> }
>
>
> Got keys from plugin meta data ("eglfs")
> QFactoryLoader::QFactoryLoader() looking at 
> "/usr/lib/qt/plugins/platforms/libqminimal.so"
> Found metadata in lib /usr/lib/qt/plugins/platforms/libqminimal.so, 
> metadata=
> {
>     "IID": 
> "org.qt-project.Qt.QPA.QPlatformIntegrationFactoryInterface.5.3",
>     "MetaData": {
>         "Keys": [
>             "minimal"
>         ]
>     },
>     "className": "QMinimalIntegrationPlugin",
>     "debug": false,
>     "version": 329216
> }
>
>
> Got keys from plugin meta data ("minimal")
> QFactoryLoader::QFactoryLoader() looking at 
> "/usr/lib/qt/plugins/platforms/libqminimalegl.so"
> Found metadata in lib /usr/lib/qt/plugins/platforms/libqminimalegl.so, 
> metadata=
> {
>     "IID": 
> "org.qt-project.Qt.QPA.QPlatformIntegrationFactoryInterface.5.3",
>     "MetaData": {
>         "Keys": [
>             "minimalegl"
>         ]
>     },
>     "className": "QMinimalEglIntegrationPlugin",
>     "debug": false,
>     "version": 329216
> }
>
>
> Got keys from plugin meta data ("minimalegl")
> QFactoryLoader::QFactoryLoader() looking at 
> "/usr/lib/qt/plugins/platforms/libqoffscreen.so"
> Found metadata in lib /usr/lib/qt/plugins/platforms/libqoffscreen.so, 
> metadata=
> {
>     "IID": 
> "org.qt-project.Qt.QPA.QPlatformIntegrationFactoryInterface.5.3",
>     "MetaData": {
>         "Keys": [
>             "offscreen"
>         ]
>     },
>     "className": "QOffscreenIntegrationPlugin",
>     "debug": false,
>     "version": 329216
> }
>
>
> Got keys from plugin meta data ("offscreen")
> QFactoryLoader::QFactoryLoader() looking at 
> "/usr/lib/qt/plugins/platforms/libqxcb.so"
> Found metadata in lib /usr/lib/qt/plugins/platforms/libqxcb.so, metadata=
> {
>     "IID": 
> "org.qt-project.Qt.QPA.QPlatformIntegrationFactoryInterface.5.3",
>     "MetaData": {
>         "Keys": [
>             "xcb"
>         ]
>     },
>     "className": "QXcbIntegrationPlugin",
>     "debug": false,
>     "version": 329216
> }
>
>
> Got keys from plugin meta data ("xcb")
> QFactoryLoader::QFactoryLoader() checking directory path 
> "/opt/QmlTest/bin/platforms" ...
> loaded library "/usr/lib/qt/plugins/platforms/libqeglfs.so"
> QFactoryLoader::QFactoryLoader() checking directory path 
> "/usr/lib/qt/plugins/egldeviceintegrations" ...
> QFactoryLoader::QFactoryLoader() looking at 
> "/usr/lib/qt/plugins/egldeviceintegrations/libqeglfs-x11-integration.so"
> Found metadata in lib 
> /usr/lib/qt/plugins/egldeviceintegrations/libqeglfs-x11-integration.so, metadata=
> {
>     "IID": 
> "org.qt-project.qt.qpa.egl.QEGLDeviceIntegrationFactoryInterface.5.5",
>     "MetaData": {
>         "Keys": [
>             "eglfs_x11"
>         ]
>     },
>     "className": "QEglFSX11IntegrationPlugin",
>     "debug": false,
>     "version": 329216
> }
>
>
> Got keys from plugin meta data ("eglfs_x11")
> QFactoryLoader::QFactoryLoader() checking directory path 
> "/opt/QmlTest/bin/egldeviceintegrations" ...
> loaded library 
> "/usr/lib/qt/plugins/egldeviceintegrations/libqeglfs-x11-integration.so"
> Could not open display
> Aborted
> Application finished with exit code 134.

I never had this kind of problem with all previous Buildroot 
environments I compiled.
This is due to my configuration? I attach the .config file.


-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/xml
Size: 84242 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160501/07ad3c71/attachment-0001.wsdl>
